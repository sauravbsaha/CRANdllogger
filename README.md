<h1><p align="center">
Manual: CRANdllogger
</p></h1>

-   [Introduction](#introduction)
-   [Requirements](#requirements)
-   [Imports](#imports)
-   [Installation](#installation)
-   [Usage](#usage)
-   [Help](#help)
-   [Bugs](#bugs)
-   [License](#license)

Introduction
============
<p>CRANdllogger is a R package which enables the R package developer to download CRAN downloading history in csv file format. The package downloads the complete downloading history for the duration specified as input, when triggered for the first time. Once the complete database is downloaded, the tool can work as standalone package, without the need of internet. The output file can be procured from the output.csv directory in the current working directory..</p>

Requirements
============
-   R (tested in version 3.5.2)

Imports
============
-	devtools (tested in version 2.1.0)
-   stats (tested in version 3.5.2)
-   utils (tested in version 3.5.2)

Installation of Pre-requisite packages
============
Pre-requisite packages for installation are devtools, stats and utils which are usually packed in the base R bundle. If not present, the package can be installed by following commands:

```R
## usethis Installation
 install.packages("devtools")
```

```R
## stats Installation
 install.packages("stats")
```

```R
## utils Installation
 install.packages("utils")
```

Installation
============
The package can be installed from [GitHub] https://github.com/sauravbsaha/CRANdllogger (recommended). 

```R
## CMD Installation
 library("devtools")
 install_github("sauravbsaha/CRANdllogger")
```

Usage
=====
Run the algorithm using the provided examples with the following command:

```R
# Loading libraries
 library("CRANdllogger")
 cran.download.log("2018-05-18", "2018-05-19", "uCAREChemSuiteCLI")
```
 
Help
============
All functions are well documented. You can find additional information such as input arguments and function abstract using R help function. eg. `??cran.download.log()`

Bugs
===========
Please report any issues or bugs you find while installing/running **CRANdllogger** to:
-   Saurav Bhaskar Saha [<saurav.saha@shiats.edu.in>] :)

License
============
CRANdllogger is under MIT License.
