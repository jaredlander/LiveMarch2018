<!-- README.md is generated from README.Rmd. Please edit that file -->
Live Training
=============

This is an empty repo for [Jared Lander's](https://www.jaredlander.com) Advanced Live Training.

Clone this Repo
===============

If you use git please clone this repo then open it as an [RStudio Project](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects).

``` sh
# if using SSH
git clone git@github.com:jaredlander/LiveMarch2018.git

# if using https
git clone https://github.com/jaredlander/LiveMarch2018.git
```

If you don't use git, then please recreate this folder structure, and download `prep/DownloadData.r`, into the folder and open the `LiveMarch2018.Rproj` file using RStudio.

Packages
========

To get started run the following code to install the latest version of the necessary packages.

``` r
packages <- c('coefplot', 'data.world', 'DBI', 'doParallel', 'foreach', 
              'ggthemes', 'jsonlite', 'rprojroot', 'RSQLite', 'tidyverse', 
              'UsingR')
install.packages(packages)
```

Data
====

Data for the class is kept at [data.world](https://data.world/landeranalytics/training).

They can be downloaded automatically using the following code. This script requires that you are using an [RStudio Project](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects).

``` r
source('prep/DownloadData.r')
```

If you would like to download them manually you can create a free account at \[data.world\](<https://www.data.wold>\].
