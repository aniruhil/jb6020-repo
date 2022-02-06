read.csv(
    "data/ImportDataCSV.csv",
    sep = ",",
    header = TRUE
    ) -> df.csv 

read.csv(
  "data/ImportDataTAB.txt",
  sep = "\t",
  header = TRUE
  ) -> df.tab

names(df.csv) 

head(df.csv)

names(df.tab)

head(df.tab)

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

head(df.xlsx)

head(df.xlsx)

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

head(df.spss)

read.fwf(
  here(
    "data", 
    "fwfdata.txt"
    ),
  widths = c(4, 9, 2, 4),
  header = FALSE,
  col.names = c("Name", "Month", "Day", "Year")
  ) -> df.fw

head(df.fw)

read.table(
  "http://data.princeton.edu/wws509/datasets/effort.dat"
  ) -> fpe

fpe

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

library(haven)

read_spss(
  "https://stats.idre.ucla.edu/stat/data/hsb2.sav"
  ) -> hsb2.spss.haven

library(readxl)

download.file(
  "https://stats.idre.ucla.edu/stat/data/hsb2.xls", 
  "hsb2.xls", 
  mode = "wb"
  )

read_excel("hsb2.xls") -> hsb2

library(rio)

"https://stats.idre.ucla.edu/stat/data/hsb2.xls" -> url

import(url) -> my_data

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

library(haven)

read_sas(
  unzip(
    temp, 
    "pcen_v2018_y1018.sas7bdat/pcen_v2018_y1018.sas7bdat"
    )
  ) -> oursasdata

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

read.table(
  'https://stats.idre.ucla.edu/stat/data/hsb2.csv',
  header = TRUE,
  sep = ","
  ) -> hsb2

head(hsb2)

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

save(
  hsb2, 
  file = here(
    "data", 
    "hsb2.RData"
    )
  ) 

library(HistData)

data("Galton")

names(Galton)

data(
  "GaltonFamilies", 
  package = "HistData"
  )

names(GaltonFamilies)

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

save.image(
  file = here(
    "data", 
    "mywork_jan182018.RData"
    )
  )

library(dplyr)

data(starwars)

str(starwars)

plot(starwars$height, plot$mass)

plot(starwars$height, starwars$mass)
