stat545a-2013-hw06_liao_wei
============================================================================
<p></p>
## -How to replicate my analysis

   * (1) Download the following files into an empty directory D:

    - Scripts: [`00_package_installer.R`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/00_package_installer.R)  ,  [`01_data_preparation.R`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/01_data_preparation.R)  ,  [`02_data_process.R`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/02_data_process.R)

    - Makefile-like script: [`Makefile.R`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/MakeFile.R)  
  
   * (2) Start an R Console, set the working directory as the above directory D
  
   * (3) if you didn't install ggplot2/plyr/lattice, you should uncomment this line of code: #source("00_package_installer.R") in [`Makefile.R`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/MakeFile.R) that installs necessary packages
  
   * (4) Run MakeFile.R by using source command:source("MakeFile.R",echo = TRUE) 
  
   * (5) After running you will get two new folders holding results for tables data and figure 

    - [`results_data(folder)`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/tree/master/results_data) This folder holds two table-style file
-   -  -  -  - [`gapminderData_orderContinent.tsv`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/results_data/gapminderData_orderContinent.tsv) This file is for holding the RE-ORDER data that comes from [`01_data_preparation.R`] and will be used as the dataset for [`02_data_process.R`]
-   -  -  -  - [`best_countries_linear_model.tsv`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/results_data/best_countries_linear_model.tsv) This file records the linear model for thoses best countries
<p></p>
<p></p>
    - [`results_figure(folder)`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/tree/master/results_figure) This folder holds 10 figure files, 8 of them are pngs and 2 of them are pdfs. The filename or title of each figure file describe what it is. I will display them in their generation order
-   -  -  -  - [`trend_of_life_expenctancy.png`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/results_figure/trend_of_life_expenctancy.png)
-   -  -  -  - [`trend_of_gdp_per_capata.png`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/results_figure/trend_of_gdp_per_capata.png)
-   -  -  -  - [`trend_of_total_population.png`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/results_figure/trend_of_total_population.png)
-   -  -  -  - [`trend_of_life_expenctancy_with_detail.pdf`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/results_figure/trend_of_life_expenctancy_with_detail.pdf)
-   -  -  -  - [`trend_of_gdp_per_capata_with_detail.pdf`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/results_figure/trend_of_gdp_per_capata_with_detail.pdf)
-   -  -  -  - [`Scatterplot_extrecountry_Africa.png`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/results_figure/Scatterplot_extrecountry_Africa.png)
-   -  -  -  - [`Scatterplot_extrecountry_Americas.png`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/results_figure/Scatterplot_extrecountry_Americas.png)
-   -  -  -  - [`Scatterplot_extrecountry_Asia.png`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/results_figure/Scatterplot_extrecountry_Asia.png)
-   -  -  -  - [`Scatterplot_extrecountry_Europe.png`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/results_figure/Scatterplot_extrecountry_Europe.png)
-   -  -  -  - [`Scatterplot_extrecountry_Oceania.png`](https://github.com/feiba/stat545a-2013-hw06_liao_wei/blob/master/results_figure/Scatterplot_extrecountry_Oceania.png)

   
