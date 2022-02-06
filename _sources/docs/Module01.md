# Introduction to Reading Data in R

This module introduces you to basic operations in R, starting with reading data in from various formats. The latest version of [R](https://cloud.r-project.org) can be found here. If you are looking to install RStudio, you should click [here](https://www.rstudio.com/products/rstudio/download/) to access the current version. 

## Installing packages 

Although R comes bundled with a lot of operations, you will most certainly want to lean on some <code>__packages__</code> authored by __`#rstats`__ users. These packages ease the learning burden even as they extend R's functionality by allowing you to gather Census data, for example, or to rely on an API to access CDC data, create maps that show the distribution of some measure at the tract-level (for example, population density or the proportion of the population lacking health insurance). There are packages designed to visualize data, generate dashboards, build applications, create interactive graphics and even animated graphics, create a website, a blogsite, a presentation slide-deck, and much more! The simplest way that I can describe a package is to speak of it as a collection of specific functions built ot achieve very specific objectives. How do we instal packages then?

You can install a single package by typing at the console prompt the following <code>__install.packages('tidyverse')__</code> and then hitting enter. If you want to install multiple packages at the same time you can list them but as follows:

__`install.packages('devtools', 'remotes', 'lubridate', 'gapminder', 'leaflet', 'data.table', 'htmltools', 'scales', 'ggridges', 'here', 'knitr',
'kableExtra', 'haven', 'readxl', 'namer', 'foreign', 'tidycensus', 'tidylog', 'hrbrthemes', 'ggthemes', 'plotly', 'highcharter', 'gganimate')`__

#### A few tips about packages ...
- Packages often have dependencies so do not be surprised if during installation you see or are asked for permission to also install one or more other packages.
- Packages are no always self-contained and in fact one package will often rely on one or more other packages. 
- Packages are often udpated and so you should check and update packages as needed via __`update.packages()`__ 
- When you update, be aware that if the package depends on other packages and these other packages have not been updated, then the update may not work. In such cases you can always install the older version of the package via, for example, __`remotes::install_version("ggplot2", version = "0.9.1", repos = "http://cran.us.r-project.org")`__
- Some packages are also available only from the author(s)' website. In these cases you will often find the instructions for package installation on the author(s)' website. In the case of __`aws.s3`__ for example, you would have to do run the following command __`remotes::install_github("cloudyr/aws.s3")`__

## Reading data

We assume that you have the data-sets sent to you via `Slack` or `Teams` in the **data** sub-folder. If you don't then the commands that follow will not work. 

We start by reading a simple `comma-separated variable` format file and then a `tab-delimited variable` format file. 


```R
read.csv(
    "data/ImportDataCSV.csv",
    sep = ",",
    header = TRUE
    ) -> df.csv 
```


```R
read.csv(
  "data/ImportDataTAB.txt",
  sep = "\t",
  header = TRUE
  ) -> df.tab
```

The `sep = ","` switch says the individual variables are separated by a comma, and `header = TRUE` switch indicates that the first row includes variable names. The tab-delimited file needs `sep = "\t"`. If both files were read then `Environment` should show objects called `df.csv` and `df.tab`. If you don't see these, check the following: 

- Make sure you have the files in your **data** folder 
- Make sure the folder has been correctly named (no blank spaces before or after, all lowercase, etc)  


```R
names(df.csv) 

head(df.csv)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'x'</li><li>'y'</li><li>'z'</li></ol>




<table class="dataframe">
<caption>A data.frame: 6 × 3</caption>
<thead>
	<tr><th></th><th scope=col>x</th><th scope=col>y</th><th scope=col>z</th></tr>
	<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td> 1</td><td> 2</td><td> 3</td></tr>
	<tr><th scope=row>2</th><td> 4</td><td> 5</td><td> 6</td></tr>
	<tr><th scope=row>3</th><td> 7</td><td> 8</td><td> 9</td></tr>
	<tr><th scope=row>4</th><td>10</td><td>11</td><td>12</td></tr>
	<tr><th scope=row>5</th><td>13</td><td>14</td><td>15</td></tr>
	<tr><th scope=row>6</th><td>16</td><td>17</td><td>18</td></tr>
</tbody>
</table>



And now we repeat the preceding commands for the df.tab file


```R
names(df.tab)

head(df.tab)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'x'</li><li>'y'</li><li>'z'</li></ol>




<table class="dataframe">
<caption>A data.frame: 6 × 3</caption>
<thead>
	<tr><th></th><th scope=col>x</th><th scope=col>y</th><th scope=col>z</th></tr>
	<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td> 1</td><td> 2</td><td> 3</td></tr>
	<tr><th scope=row>2</th><td> 4</td><td> 5</td><td> 6</td></tr>
	<tr><th scope=row>3</th><td> 7</td><td> 8</td><td> 9</td></tr>
	<tr><th scope=row>4</th><td>10</td><td>11</td><td>12</td></tr>
	<tr><th scope=row>5</th><td>13</td><td>14</td><td>15</td></tr>
	<tr><th scope=row>6</th><td>16</td><td>17</td><td>18</td></tr>
</tbody>
</table>



**Excel** files can be read via the `{readxl}` package


```R
library(readxl)
library(here)

read_excel(
  here(
    "data", 
    "ImportDataXLS.xls"
    )
  ) -> df.xls

read_excel(
  here(
    "data", 
    "ImportDataXLSX.xlsx"
    )
  ) -> df.xlsx
```


```R
head(df.xlsx)
```


<table class="dataframe">
<caption>A tibble: 6 × 3</caption>
<thead>
	<tr><th scope=col>x</th><th scope=col>y</th><th scope=col>z</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 1</td><td> 2</td><td> 3</td></tr>
	<tr><td> 4</td><td> 5</td><td> 6</td></tr>
	<tr><td> 7</td><td> 8</td><td> 9</td></tr>
	<tr><td>10</td><td>11</td><td>12</td></tr>
	<tr><td>13</td><td>14</td><td>15</td></tr>
	<tr><td>16</td><td>17</td><td>18</td></tr>
</tbody>
</table>




```R
head(df.xlsx)
```


<table class="dataframe">
<caption>A tibble: 6 × 3</caption>
<thead>
	<tr><th scope=col>x</th><th scope=col>y</th><th scope=col>z</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 1</td><td> 2</td><td> 3</td></tr>
	<tr><td> 4</td><td> 5</td><td> 6</td></tr>
	<tr><td> 7</td><td> 8</td><td> 9</td></tr>
	<tr><td>10</td><td>11</td><td>12</td></tr>
	<tr><td>13</td><td>14</td><td>15</td></tr>
	<tr><td>16</td><td>17</td><td>18</td></tr>
</tbody>
</table>



**SPSS, Stata, SAS** files can be read via the `{haven}` package


```R
library(haven)

read_stata(
  here(
    "data", 
    "ImportDataStata.dta"
    )
  ) -> df.stata 

read_sas(
  here(
    "data", 
    "ImportDataSAS.sas7bdat"
    )
  ) -> df.sas

read_sav(
  here(
    "data", 
    "ImportDataSPSS.sav"
    )
  ) -> df.spss
```


```R
head(df.spss)
```


<table class="dataframe">
<caption>A tibble: 6 × 3</caption>
<thead>
	<tr><th scope=col>x</th><th scope=col>y</th><th scope=col>z</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 1</td><td> 2</td><td> 3</td></tr>
	<tr><td> 4</td><td> 5</td><td> 6</td></tr>
	<tr><td> 7</td><td> 8</td><td> 9</td></tr>
	<tr><td>10</td><td>11</td><td>12</td></tr>
	<tr><td>13</td><td>14</td><td>15</td></tr>
	<tr><td>16</td><td>17</td><td>18</td></tr>
</tbody>
</table>



It is also common to encounter **fixed-width** files where the raw data are stored without any gaps between successive variables. However, these files will come with documentation that will tell you where each variable starts and ends, along with other details about each variable. The example shown below is courtesy of [Oracle](https://www.oracle.com/webfolder/technetwork/data-quality/edqhelp/Content/resources/Images/director/fixedwidthfilenonewlines.png)

![An example of a fixed-width file](https://www.oracle.com/webfolder/technetwork/data-quality/edqhelp/Content/resources/Images/director/fixedwidthfilenonewlines.png)


```R
read.fwf(
  here(
    "data", 
    "fwfdata.txt"
    ),
  widths = c(4, 9, 2, 4),
  header = FALSE,
  col.names = c("Name", "Month", "Day", "Year")
  ) -> df.fw
```


```R
head(df.fw)
```


<table class="dataframe">
<caption>A data.frame: 2 × 4</caption>
<thead>
	<tr><th></th><th scope=col>Name</th><th scope=col>Month</th><th scope=col>Day</th><th scope=col>Year</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>Amy </td><td> December</td><td> 1</td><td>2017</td></tr>
	<tr><th scope=row>2</th><td>Abby</td><td> December</td><td>11</td><td>2017</td></tr>
</tbody>
</table>



Note: we need `widths = c()` to indicate how many slots each variable takes and then `col.names = c()` to label the columns since the data file does not have variable names. The documentation (not shown here) has Name spanning the first 4 characters, Month spans the next 9 characters, Day spans the next two, and then Year spans the next 4 characters. 

## Reading Files from the Web

Files need not all be locally stored and can be read off the web by specifying the full web-path for the file when reading it. This is often useful when updated the data tend to be updated by the source (for example, a health department that updates the CSV file containing the previous day's COVID-19 cases, hospitalizatins, and deaths.) One such file is available [here](https://coronavirus.ohio.gov/static/dashboards/COVIDDeathData_CountyOfResidence.csv)


```R
read.table(
  "http://data.princeton.edu/wws509/datasets/effort.dat"
  ) -> fpe

fpe
```


<table class="dataframe">
<caption>A data.frame: 20 × 3</caption>
<thead>
	<tr><th></th><th scope=col>setting</th><th scope=col>effort</th><th scope=col>change</th></tr>
	<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>Bolivia</th><td>46</td><td> 0</td><td> 1</td></tr>
	<tr><th scope=row>Brazil</th><td>74</td><td> 0</td><td>10</td></tr>
	<tr><th scope=row>Chile</th><td>89</td><td>16</td><td>29</td></tr>
	<tr><th scope=row>Colombia</th><td>77</td><td>16</td><td>25</td></tr>
	<tr><th scope=row>CostaRica</th><td>84</td><td>21</td><td>29</td></tr>
	<tr><th scope=row>Cuba</th><td>89</td><td>15</td><td>40</td></tr>
	<tr><th scope=row>DominicanRep</th><td>68</td><td>14</td><td>21</td></tr>
	<tr><th scope=row>Ecuador</th><td>70</td><td> 6</td><td> 0</td></tr>
	<tr><th scope=row>ElSalvador</th><td>60</td><td>13</td><td>13</td></tr>
	<tr><th scope=row>Guatemala</th><td>55</td><td> 9</td><td> 4</td></tr>
	<tr><th scope=row>Haiti</th><td>35</td><td> 3</td><td> 0</td></tr>
	<tr><th scope=row>Honduras</th><td>51</td><td> 7</td><td> 7</td></tr>
	<tr><th scope=row>Jamaica</th><td>87</td><td>23</td><td>21</td></tr>
	<tr><th scope=row>Mexico</th><td>83</td><td> 4</td><td> 9</td></tr>
	<tr><th scope=row>Nicaragua</th><td>68</td><td> 0</td><td> 7</td></tr>
	<tr><th scope=row>Panama</th><td>84</td><td>19</td><td>22</td></tr>
	<tr><th scope=row>Paraguay</th><td>74</td><td> 3</td><td> 6</td></tr>
	<tr><th scope=row>Peru</th><td>73</td><td> 0</td><td> 2</td></tr>
	<tr><th scope=row>TrinidadTobago</th><td>84</td><td>15</td><td>29</td></tr>
	<tr><th scope=row>Venezuela</th><td>91</td><td> 7</td><td>11</td></tr>
</tbody>
</table>



Note that calling something we created and saved with a name, such as this dataframe `fpe`, will show us the contents 


```R
read.table(
  "https://stats.idre.ucla.edu/stat/data/test.txt",
  header = TRUE
  ) -> test.txt 

read.csv(
  "https://stats.idre.ucla.edu/stat/data/test.csv",
  header = TRUE
  ) -> test.csv

read.csv(
  'https://coronavirus.ohio.gov/static/dashboards/COVIDDeathData_CountyOfResidence.csv',
  header = TRUE
  ) -> ohcovid19

library(foreign)

read.spss(
  "https://stats.idre.ucla.edu/stat/data/hsb2.sav"
  ) -> hsb2.spss

as.data.frame(hsb2.spss) -> df.hsb2.spss
```

Note that `hsb2.spss` was read with the `{foreign}`, an alternative package to `{haven}` 

- `{foreign}` calls `read.spss` 
- `{haven}` calls `read_spss`

You should also check out another package for data import\export -- `{rio}` documented [here](https://github.com/leeper/rio)


```R
library(haven)

read_spss(
  "https://stats.idre.ucla.edu/stat/data/hsb2.sav"
  ) -> hsb2.spss.haven
```

The `{foreign}` package will also read Stata and other formats and was the  one I used a lot before defaulting to `haven` now. There are other packages for reading SAS, SPSS,  etc. data files -- `{sas7bdat}`, `{data.table}`, `{xlsx}`, `{XLConnect}`, `{gdata}`, etc. 

Excel files cannot be read off the web in the same manner as we did *.csv, *.txt, etc. The code sequence is a little more convoluted, as shown below.


```R
library(readxl)

download.file(
  "https://stats.idre.ucla.edu/stat/data/hsb2.xls", 
  "hsb2.xls", 
  mode = "wb"
  )

read_excel("hsb2.xls") -> hsb2
```

You could also do the following with the {rio} package but remember to install the `{rio}` package (if missing) and to run __`rio::install_formats()`__ before executing the code below.


```R
library(rio)

"https://stats.idre.ucla.edu/stat/data/hsb2.xls" -> url

import(url) -> my_data
```

## Reading compressed files 
Large files may sit in compressed archives on the web and R has a neat way of allowing you to download the file, unzip it, and read it. Why is this useful? Because if these files tend to be update periodicially, this ability lets you use the same piece of R code to download/unzip/read the updated file. The tedious way would be to manually download, unzip, place in the appropriate data folder, and then read it.


```R
temp <- tempfile()

download.file(
  "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/nvss/bridged_race/pcen_v2018_y1018.sas7bdat.zip",
  temp, 
  mode = "wb"
  )

haven::read_sas(
  unzip(
    temp,
    "pcen_v2018_y1018.sas7bdat/pcen_v2018_y1018.sas7bdat"
    )
  ) -> oursasdata 

unlink(temp)
```

Note that in the code above I didn't run 


```R
library(haven)

read_sas(
  unzip(
    temp, 
    "pcen_v2018_y1018.sas7bdat/pcen_v2018_y1018.sas7bdat"
    )
  ) -> oursasdata
```

This is because you can skip the `library()` command before using some function from the package by directly invoking the package as in `haven::`. 

You can save your data in a format that R will recognize, giving it the **RData** or **rdata** extension 


```R
save(
  oursasdata, 
  file = here(
    "data", 
    "oursasdata.RData"
    )
  )

save(
  oursasdata, 
  file = here(
    "data", 
    "oursasdata.rdata"
    )
  )
```

Check your **data** directory to confirm both files are present 

## Minimal example of data processing

Working with the **hsb2** data: 200 students from the High school and Beyond study 

| Variable | Description |
| :- | :- |
| `female`  | (0 = Male 1 = Female) |
| `race` | (1=Hispanic 2=Asian 3=African-American 4=White) |
| `ses`  | socioeconomic status (1=Low 2=Middle 3=High) |
| `schtyp` |  type of school (1=Public 2=Private) |
| `prog`   | type of program (1=General 2=Academic 3=Vocational) |
| `read`  |  standardized reading score |
| `write`  | standardized writing score |
| `math`   | standardized math score |
| `science` | standardized science score |
| `socst` | standardized social studies score |


```R
read.table(
  'https://stats.idre.ucla.edu/stat/data/hsb2.csv',
  header = TRUE,
  sep = ","
  ) -> hsb2

head(hsb2)
```


<table class="dataframe">
<caption>A data.frame: 6 × 11</caption>
<thead>
	<tr><th></th><th scope=col>id</th><th scope=col>female</th><th scope=col>race</th><th scope=col>ses</th><th scope=col>schtyp</th><th scope=col>prog</th><th scope=col>read</th><th scope=col>write</th><th scope=col>math</th><th scope=col>science</th><th scope=col>socst</th></tr>
	<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td> 70</td><td>0</td><td>4</td><td>1</td><td>1</td><td>1</td><td>57</td><td>52</td><td>41</td><td>47</td><td>57</td></tr>
	<tr><th scope=row>2</th><td>121</td><td>1</td><td>4</td><td>2</td><td>1</td><td>3</td><td>68</td><td>59</td><td>53</td><td>63</td><td>61</td></tr>
	<tr><th scope=row>3</th><td> 86</td><td>0</td><td>4</td><td>3</td><td>1</td><td>1</td><td>44</td><td>33</td><td>54</td><td>58</td><td>31</td></tr>
	<tr><th scope=row>4</th><td>141</td><td>0</td><td>4</td><td>3</td><td>1</td><td>3</td><td>63</td><td>44</td><td>47</td><td>53</td><td>56</td></tr>
	<tr><th scope=row>5</th><td>172</td><td>0</td><td>4</td><td>2</td><td>1</td><td>2</td><td>47</td><td>52</td><td>57</td><td>53</td><td>61</td></tr>
	<tr><th scope=row>6</th><td>113</td><td>0</td><td>4</td><td>2</td><td>1</td><td>2</td><td>44</td><td>52</td><td>51</td><td>63</td><td>61</td></tr>
</tbody>
</table>



There are no value labels for the various qualitative/categorical variables (female, race, ses, schtyp, and prog) so we next create these. 


```R
factor(
  hsb2$female,
  levels = c(0, 1),
  labels=c("Male", "Female")
  ) -> hsb2$female 

factor(
  hsb2$race,
  levels = c(1:4),
  labels=c("Hispanic", "Asian", "African American", "White")
  ) -> hsb2$race

factor(
  hsb2$ses, 
  levels = c(1:3),
  labels=c("Low", "Middle", "High")
  ) -> hsb2$ses

factor(
  hsb2$schtyp,
  levels = c(1:2),
  labels=c("Public", "Private")
  ) -> hsb2$schtyp

factor(
  hsb2$prog,
  levels = c(1:3), 
  labels=c("General", "Academic", "Vocational")
  ) -> hsb2$prog
```

I am overwriting each variable, indicating to R that variable `x` will show up as numeric with values 0 and 1, and that a 0 should be treated as male and a 1 as female, and so on. There are are four values for race, 3 for ses, 2 for schtyp, and 3 for prog, so the mapping has to reflect this. 

If you wanted to preserve the original variables you would have to use unique names when saving each `factor()` as in, for example, <code>-> hsb2$female.f </code> and so on.  

Note that this is just a quick run through with creating value labels; we will cover this in greater detail in a later module. 

**save your work!!**

Having added labels to the factors in __hsb2__ we can now save the data for later use. 


```R
save(
  hsb2, 
  file = here(
    "data", 
    "hsb2.RData"
    )
  ) 
```

Let us test if this R Markdown file will knit to html. If all is good then we can `Close Project`, and when we do so, RStudio will close the project and reopen in a vanilla session.  

## Data in packages 

Almost all R packages come bundled with data-sets, too many of them to walk you through but 

- [see here for standard ones](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html) 
- [here are some more](https://vincentarelbundock.github.io/Rdatasets/datasets.html) 
- [and some more](http://www.public.iastate.edu/~hofmann/data_in_r_sortable.html) 

To load data from a package, if you know the data-set's name, run 


```R
library(HistData)

data("Galton")

names(Galton)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'parent'</li><li>'child'</li></ol>



or you can run 


```R
data(
  "GaltonFamilies", 
  package = "HistData"
  )

names(GaltonFamilies)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'family'</li><li>'father'</li><li>'mother'</li><li>'midparentHeight'</li><li>'children'</li><li>'childNum'</li><li>'gender'</li><li>'childHeight'</li></ol>



## Saving data and workspaces 
You can save your data via 

  - `save(dataname, file = "filepath/filename.RData")` or 
  - `save(dataname, file = "filepath/filename.rdata")`


```R
data(mtcars)

save(
  mtcars, 
  file = here(
    "data", 
    "mtcars.RData"
    )
  )

rm(list = ls()) # To clear the Environment

load(
  here(
    "data", 
    "mtcars.RData"
    )
  )
```

You can also save multiple data files as follows: 


```R
data(mtcars)

library(ggplot2)

data(diamonds)

save(
  mtcars, 
  diamonds, 
  file = here(
    "data", 
    "mydata.RData"
    )
  )

rm(list = ls()) # To clear the Environment

load(
  here(
    "data", 
    "mydata.RData"
    )
  )
```

If you want to save just a single `object` from the environment and then load it in a later session, maybe with a different name, then you should use `saveRDS()` and `readRDS()` 


```R
data(mtcars)


saveRDS(
  mtcars, 
  file = here(
    "data", 
    "mydata.RDS"
    )
  )

rm(list = ls()) # To clear the Environment

readRDS(
  here(
    "data", 
    "mydata.RDS"
    )
  ) -> ourdata 
```

If instead you did the following, the file will be read with the name it had when you saved it. 


```R
data(mtcars)

save(
  mtcars, 
  file = here(
    "data", 
    "mtcars.RData"
    )
  )

rm(list = ls())  # To clear the Environment

load(
  here(
    "data", 
    "mtcars.RData"
    )
  ) -> ourdata # Note ourdata is listed as "mtcars" 
```

If you want to `save everything` you have done in the work session you can via `save.image()` 


```R
save.image(
  file = here(
    "data", 
    "mywork_jan182018.RData"
    )
  )
```

Images are useful if you have a lot of R code you have written and various objects generated that individually take time to build and you do not want to start from scratch the next time around. 

--------------

## Exercises for practice 

### Ex. 1: Creating and knitting a new RMarkdown file

Open a fresh session by launching RStudio and then running `File -> Open Project...`  

Give it a title, your name as the author, and then save it with the following name:  `m1ex1.Rmd`  

Delete all content starting with `line 12`. 

Add this level 1 heading `The Starwars Data` and then insert your first code chunk *exactly as shown below* 


```R
library(dplyr)

data(starwars)

str(starwars)
```

Add this level 2 heading `Character  Heights and Weights` and then your second code chunk 


```R
plot(starwars$height, plot$mass)
```

Now knit this file to **html** 

### Ex. 2: Lorem Ipsum paragraphs and graphs 

Go to [this website](https://loremipsumgenerator.com/generator/?n=2&t=p) and generate five Lorem Ipsum placeholder text paragraphs. Insert these five paragraphs in a new RMarkdown file.  

  - para 1: must have level 1 heading 
  - para 2: must have level 2 heading 
  - para 3: must have level 3 heading 
  - para 4: must have level 4 heading 
  - para 5: must have level 5 heading 

Using the `starwars` data, create five code chunks, one after each paragraph 

  - Each code chunk will have the same R code (see below)


```R
plot(starwars$height, starwars$mass)
```

Now knit this file to **html** 

### Ex. 3: Reading in three data files 

Create a new `RMarkdown` file.  

Insert a code chunk that reads in both these files found on the web 

- `http://www.stata.com/data/jwooldridge/eacsap/mroz.dta` 
- `http://calcnet.mth.cmich.edu/org/spss/V16_materials/DataSets_v16/airline_passengers.sav` 

In a follow-up code chunk, run the `summary()` command on each data-set 

In a separate code chunk, read in [this dataset](https://s3.amazonaws.com/tripdata/201502-citibike-tripdata.zip) after you download it and save the unzipped file in your **data** folder. 

- The variable `gender` has the following codes: `Zero = unknown; 1 = male; 2 = female` 
- Use this coding scheme to convert `gender` into a `factor` with these value labels 

In a follow-up chunk run both the following commands on this data-set 

- `names()` 
- `str()` 
- `summary()` 

In a final chunk, run the commands necessary to save each of the three data-sets as separate `RData` files. Make sure you save them in your **data** folder. 

Now knit the complete `Rmd` file to **html** 

### Ex. 4: Knitting with `prettydoc` 

I'd like you to use a specific R Markdown format because the  resulting html files are very readable 

Install `prettydoc` package. Now create a prettydoc Rmd file via `New File -> RMarkdown... -> From Template -> Lightweight and Pretty Document (HTML)` 

Now take all the text and code chunk you created in Ex. 3 and insert it in this file. Make sure you add a title, etc in the `YAML` and then knit the file to `html` 

You can play with the `theme:` and `highlight:` fields, choosing from the options [displayed here](https://github.com/yixuan/prettydoc/)
 
You should consider using either the `prettydoc` format or the default RMarkdown templates baked into RStudio. You can explore those [here](http://www.datadreaming.org/post/r-markdown-theme-gallery/) and find the settings that can be tweaked via experimentation. 

<center>Visitors</center>
<center>
<div id="sfcgz9jyj612nqn8gw3ds33zd44pw6mc3fg"></div>
<script type="text/javascript" src="https://counter7.stat.ovh/private/counter.js?c=gz9jyj612nqn8gw3ds33zd44pw6mc3fg&down=async" async></script><br><a href="https://www.freecounterstat.com">website counter</a><noscript><a href="https://www.freecounterstat.com" title="website counter"><img src="https://counter7.stat.ovh/private/freecounterstat.php?c=gz9jyj612nqn8gw3ds33zd44pw6mc3fg" border="0" title="website counter" alt="website counter"></a>
</noscript>
</center>

