## set working directory
d <- getwd()
if (!is.null(d)) setwd(d)

## remove result folder which holds results to make sure we don't have any result from previous experiment
unlink("results_figure", recursive = TRUE)
unlink("results_data", recursive = TRUE)

## remove variable in the workspace
rm(list=ls())

## re-create the results directory
dir.create(file.path("results_figure"), showWarnings = FALSE)
dir.create(file.path("results_data"), showWarnings = FALSE)

## run my scripts
#source("00_package_installer.R")  # only need to run once for installation 
source("01_data_preparation.R",echo = TRUE)  # data import and preprocessing
source("02_data_process.R",echo = TRUE)   # new data import and processing