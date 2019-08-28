#' CRANdllogger
#' @title cran.download.log
#' @description Takes start date, end date of download log registry and package name to return log resistry of package download history for the specified dates.
#' @param start.date Starting date is the date since user want to extract the package download history log.
#' @param end.date End date is the date till the user want to extract the package download history log.
#' @param package.name The name of the package.
#' @return Registry of downloading history of the package for the specified dates
#' @usage cran.download.log(start.date,end.date, package.name)
#' @import stats
#' @import utils
#' @examples{
#' cran.download.log("2018-05-17", "2018-05-18", "uCAREChemSuiteCLI")
#' }
#' @export

cran.download.log <- function(start.date,end.date, package.name)
{
# Clearing the screen
cat("\014")

start.date <- as.Date(start.date)
end.date <- as.Date(end.date)


all_days <- seq(start.date, end.date, by = 'day')

# Preparting the date wise downloading URLs
year <- as.POSIXlt(all_days)$year + 1900
urls <- paste0('http://cran-logs.rstudio.com/', year, '/', all_days, '.csv.gz')

# Only downloading the missing files form CRANlogs:
missing_days <- setdiff(as.character(all_days), tools::file_path_sans_ext(dir("CRANlogs"), TRUE))

# Downloading the missing files and creating a CRAN daily download logs
if(!dir.exists("CRANlogs"))
dir.create("CRANlogs")
if(length(missing_days) != 0)
{
  for (i in 1:length(missing_days)) {
    print(paste0(i, "/", length(missing_days)))
    download.file(urls[i], paste0('CRANlogs/', missing_days[i], '.csv.gz'))
  }

}

# Creating the downloadable log registry

## Reading the CRANlogs folder
file_list <- list.files("CRANlogs", full.names=TRUE)

# Take 2
## Reading all the downloaded CRAN download registry
## and extracting uCAREChemSuiteCLI's registry
tmp.logs<- list()
final.db<-list()
for(i in 1:length(file_list))
{
  print(paste("Reading", file_list[i], "..."))
  file.db<- read.table(file_list[i], header = TRUE, sep = ",",
             dec = ".", fill = TRUE, comment.char = "", as.is=TRUE)
  tmp.logs<- subset(file.db, file.db$package %in% package.name)
  final.db<- rbind(final.db, tmp.logs)
  rm(file.db,tmp.logs)
}

## Creating the output directory and writing output file in that directory
print(paste("Creating csv file: Total.package.download.csv in output.csv directory..."))
final.db<- as.data.frame(final.db)
if(!dir.exists("output.csv"))
dir.create("output.csv")
write.table(final.db, file="output.csv/Total.package.download.csv", sep = ",", row.names = FALSE)

rm(i)
}
