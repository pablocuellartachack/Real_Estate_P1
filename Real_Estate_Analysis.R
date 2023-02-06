# set working directory

setwd("/Users/pc3/Desktop/Data_Projects_Repository/Real_Estate_Project/SQL_Scripts")

# read in the data

install.packages("RMySQL")
library(DBI)
connection = dbConnect(RMySQL::MySQL(),
                       dbname ="Real_Estate_P1",
                       host ="localhost",
                       port = 3306,
                       user = "root",
                       password = "Github_NA")
dbListTables(connection)
real_estate_p1 <- dbReadTable(connection, "raw_data")
print (real_estate_p1)

dbGetQuery(connection, "select town from raw_data where town < 5")
dbGetQuery(connection, "select * from raw_data where town < 5")

#Packages!

install.packages("dplyr")
install.packages("psych")
install.packages("pheatmap")
install.packages("apaTables")
install.packages("ggstatsplot")
install.packages("epiDisplay")
library(epiDisplay)
library(ggstatsplot)
library(apaTables)
library(dplyr)
library(psych)
library(readr)
library(ggplot2)
library(lessR)
library(pheatmap)


#Data frame p-values, CI, and correlation

descriptive_stats <- describe(real_estate_p1)

write.csv(descriptive_stats, "descriptive_summary_stats.csv")

hist(real_estate_p1$nox_concentration)

Plot(per_capita_crime, data=real_estate_p1)

cor(real_estate_p1, method = "pearson")

corr.test(real_estate_p1, method = "pearson")

cormatrix <- (corr.test(real_estate_p1, method = "pearson"))

print(cormatrix, short=FALSE)

write.csv(cormatrix$r, "correlation_1.csv")
write.csv(cormatrix$p, "p-values_1.csv")
write.csv(cormatrix$ci, "confidence_interval_1.csv")

apa.cor.table(real_estate_p1, "APA correlation table.doc")


#Number 1 - Per Capita Crime Rate V.s. Nitric Ocide Concentration

Plot(per_capita_crime, xlab = "Per Capita Crime Rate", data=real_estate_p1)

ScatterPlot(nox_concentration, per_capita_crime, data=real_estate_p1,
            ellipse=TRUE, xlab = "Nitric Ocide Concentration", 
            ylab = "Per Capita Crime Rate", color="blue")

Correlation(nox_concentration, per_capita_crime, data=real_estate_p1)

ggscatterstats(data = real_estate_p1, x= nox_concentration, y= per_capita_crime,
               type = "parametric", xlab = "Nitric Ocide Concentration", 
               ylab = "Per Capita Crime Rate")

?ggscatterstats


#Number 2 - Residential Land Zoned Over 25,000 sqft V.s. Nitric Ocide Concentration

Plot(rl_twentyfive_k_sqft, xlab = "Residential Land Zoned For Lots > 25k sqft", data=real_estate_p1)

ScatterPlot(nox_concentration, rl_twentyfive_k_sqft, data=real_estate_p1,
            ellipse=TRUE, xlab = "Nitric Ocide Concentration", 
            ylab = "Residential Land Zoned For Lots > 25k sqft", 
            ylim=c(0,100), color="blue")

Correlation(nox_concentration, rl_twentyfive_k_sqft, data=real_estate_p1)

ggscatterstats(data = real_estate_p1, x= nox_concentration, y= rl_twentyfive_k_sqft, 
               type = "parametric", xlab = "Nitric Ocide Concentration", 
               ylab = "Residential Land Zoned For Lots > 25k sqft")


#Number 3 - Non-Retail Business Acres V.s. Nitric Ocide Concentration

Plot(nonr_biz_acres, xlab = "Non-Retail Business Acres", data=real_estate_p1)

ScatterPlot(nox_concentration, nonr_biz_acres, data=real_estate_p1,
            ellipse=TRUE, xlab = "Nitric Ocide Concentration", 
            ylab = "Non-Retail Business Acres", color="blue")

Correlation(nox_concentration, nonr_biz_acres, data=real_estate_p1)

ggscatterstats(data = real_estate_p1, x= nox_concentration, y= nonr_biz_acres,
               type = "parametric", xlab = "Nitric Ocide Concentration", 
               ylab = "Non-Retail Business Acres")


#Number 4 - AVG Number Of Rooms Per Dwelling V.s. Nitric Ocide Concentration

Plot(avg_num_rooms, xlab = "AVG Number Of Rooms Per Dwelling", data=real_estate_p1)

ScatterPlot(nox_concentration, avg_num_rooms, data=real_estate_p1,
            ellipse=TRUE, xlab = "Nitric Ocide Concentration", 
            ylab = "AVG Number Of Rooms Per Dwelling", color="blue")

Correlation(nox_concentration, avg_num_rooms, data=real_estate_p1)

ggscatterstats(data = real_estate_p1, x= nox_concentration, y= avg_num_rooms,
               type = "parametric", xlab = "Nitric Ocide Concentration", 
               ylab = "AVG Number Of Rooms Per Dwelling")


#Number 5 - Owner Occupied And Built Pre 40s V.s. Nitric Ocide Concentration

Plot(owner_live_built_prefourties, xlab = "Owner Occupied And Built Pre 40s", data=real_estate_p1)

ScatterPlot(nox_concentration, owner_live_built_prefourties, data=real_estate_p1,
            ellipse=TRUE, xlab = "Nitric Ocide Concentration", 
            ylab = "Owner Occupied And Built Pre 40s", color="blue")

Correlation(nox_concentration, owner_live_built_prefourties, data=real_estate_p1)

ggscatterstats(data = real_estate_p1, x= nox_concentration, y= owner_live_built_prefourties,
               type = "parametric", xlab = "Nitric Ocide Concentration", 
               ylab = "Owner Occupied And Built Pre 40s")


# Number 6 - Weighted Distance To 5 Employment Centers V.s. Nitric Ocide Concentration

Plot(dis_five_employ_center, xlab = "Weighted Distance To 5 Employment Centers", data=real_estate_p1)

ScatterPlot(nox_concentration, dis_five_employ_center, data=real_estate_p1,
            ellipse=TRUE, xlab = "Nitric Ocide Concentration", 
            ylab = "Weighted Distance To 5 Employment Centers", color="blue")

Correlation(nox_concentration, dis_five_employ_center, data=real_estate_p1)

ggscatterstats(data = real_estate_p1, x= nox_concentration, y= dis_five_employ_center, 
               type = "parametric", xlab = "Nitric Ocide Concentration", 
               ylab = "Weighted Distance To 5 Employment Centers")


# Number 7 - Accessibility To Radial Highways Index V.s. Nitric Ocide Concentration

Plot(index_accesibility_hway, xlab = "Accessibility To Radial Highways Index", data=real_estate_p1)

ScatterPlot(nox_concentration, index_accesibility_hway, data=real_estate_p1,
            ellipse=TRUE, xlab = "Nitric Ocide Concentration", 
            ylab = "Accessibility To Radial Highways Index", color="blue")

Correlation(nox_concentration, index_accesibility_hway, data=real_estate_p1)

ggscatterstats(data = real_estate_p1, x= nox_concentration, y= index_accesibility_hway,
               type = "parametric", xlab = "Nitric Ocide Concentration", 
               ylab = "Accessibility To Radial Highways Index")


# Number 8 - Property Tax Rate Per $10k V.s. Nitric Ocide Concentration

Plot(prop_tax_per_ten_k, xlab = "Property Tax Rate Per $10k", data=real_estate_p1)

ScatterPlot(nox_concentration, prop_tax_per_ten_k, data=real_estate_p1,
            ellipse=TRUE, xlab = "Nitric Ocide Concentration", 
            ylab = "Property Tax Rate Per $10k", color="blue")

Correlation(nox_concentration, prop_tax_per_ten_k, data=real_estate_p1)

ggscatterstats(data = real_estate_p1, x= nox_concentration, y= prop_tax_per_ten_k,
               type = "parametric", xlab = "Nitric Ocide Concentration", 
               ylab = "Property Tax Rate Per $10k")


# Number 9 - Student To Teacher Ratio V.s. Nitric Ocide Concentration

Plot(stu_teach_ratio, xlab = "Student To Teacher Ratio", data=real_estate_p1)

ScatterPlot(nox_concentration, stu_teach_ratio, data=real_estate_p1,
            ellipse=TRUE, xlab = "Nitric Ocide Concentration", 
            ylab = "Student To Teacher Ratio", color="blue")

Correlation(nox_concentration, stu_teach_ratio, data=real_estate_p1)

ggscatterstats(data = real_estate_p1, x= nox_concentration, y= stu_teach_ratio,
               type = "parametric", xlab = "Nitric Ocide Concentration", 
               ylab = "Student To Teacher Ratio")


# Number 10 - Lower Status Percent Of Population V.s. Nitric Ocide Concentration

Plot(lower_stat_percent, xlab = "Lower Status Percent Of Population", data=real_estate_p1)

ScatterPlot(nox_concentration, lower_stat_percent, data=real_estate_p1,
            ellipse=TRUE, xlab = "Nitric Ocide Concentration", 
            ylab = "Lower Status Percent Of Population", color="blue")

Correlation(nox_concentration, lower_stat_percent, data=real_estate_p1)

ggscatterstats(data = real_estate_p1, x= nox_concentration, y= lower_stat_percent, 
               type = "parametric", xlab = "Nitric Ocide Concentration", 
               ylab = "Lower Status Percent Of Population")


# Number 11 - Median Value Of Owner Occupied Homes ($1000s) V.s. Nitric Ocide Concentration

Plot(median_val_owner_occupied_thousands, xlab = "Median Value Of Owner Occupied Homes ($1000s)",
     data=real_estate_p1)

ScatterPlot(nox_concentration, median_val_owner_occupied_thousands, data=real_estate_p1,
            ellipse=TRUE, xlab = "Nitric Ocide Concentration", 
            ylab = "Median Value Of Owner Occupied Homes ($1000s)", color="blue")

Correlation(nox_concentration, median_val_owner_occupied_thousands, data=real_estate_p1)

ggscatterstats(data = real_estate_p1, x= nox_concentration, y= median_val_owner_occupied_thousands,
               type = "parametric", xlab = "Nitric Ocide Concentration", 
               ylab = "Median Value Of Owner Occupied Homes ($1000s)")


#Other Misc Test

count(real_estate_p1, town, index_accesibility_hway)

xtabs(~ town + per_capita_crime, data=real_estate_p1)

hist(real_estate_p1$per_capita_crime)

geom_histogram(real_estate_p1)

tab1(real_estate_p1$nonr_biz_acres, sort.group = "decreasing", 
     cum.percent = TRUE)

Histogram(nonr_biz_acres, data=real_estate_p1)

tab1(real_estate_p1$index_accesibility_hway, sort.group = "decreasing", 
     cum.percent = TRUE)

Histogram(index_accesibility_hway, data=real_estate_p1)
