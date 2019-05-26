library(tidyr)
library(dplyr)

VADeaths

VADeaths %>%
    tbl_df() %>%
    mutate(age = row.names(VADeaths)) %>%
    gather(key, death_rate, -age) %>%
    separate(key, c("urban", "gender"), sep = " ") %>%
    mutate(age = factor(age), urban = factor(urban), gender = factor(gender))


teams <- read_csv("data/team_standings.csv", col_types = "cc")

logs <- read_csv("data/2016-07-19.csv.gz", n_max = 10)


install.packages("kernlab")
library(kernlab)
data(spam)
str(spam)
View(spam)

# Perform the subsampling
set.seed(3435)
trainIndicator = rbinom(4601,size=1,prob=0.5)
table(trainIndicator)
View(trainIndicator)
trainSpam <- spam[trainIndicator==1,]
testSpam <- spam[trainIndicator==0,]

names(trainSpam)
head(trainSpam)
table(trainSpam$type)

plot(trainSpam$capitalAve ~ trainSpam$type)
plot(log10(trainSpam$capitalAve + 1) ~ trainSpam$type)
plot(log10(trainSpam[,1:4]+1))

hCluster = hclust(dist(t(trainSpam[,1:57])))
plot(hCluster)

hClusterUpdated = hclust(dist(t(log10(trainSpam[,1:55]+1))))
plot(hClusterUpdated)


trainSpam$numType = as.numeric(trainSpam$type)-1
costFunction = function(x,y) sum(x!=(y > 0.5)) 
cvError = rep(NA,55)
library(boot)
for(i in 1:55){
    lmFormula = reformulate(names(trainSpam)[i], response = "numType")
    glmFit = glm(lmFormula,family="binomial",data=trainSpam)
    cvError[i] = cv.glm(trainSpam,glmFit,costFunction,2)$delta[2]
}

cvError

## Which predictor has minimum cross-validated error?
names(trainSpam)[which.min(cvError)]

## Use the best model from the group
predictionModel = glm(numType ~ charDollar,family="binomial",data=trainSpam)

## Get predictions on the test set
predictionTest = predict(predictionModel,testSpam)
predictedSpam = rep("nonspam",dim(testSpam)[1])

## Classify as `spam' for those with prob > 0.5
predictedSpam[predictionModel$fitted > 0.5] = "spam"

## Classification table
table(predictedSpam,testSpam$type)

## Error rate
(61+458)/(1346+458 + 61 + 449)

install.packages('ProjectTemplate')




ext_tracks_file <- paste0("http://rammb.cira.colostate.edu/research/",
                          "tropical_cyclones/tc_extended_best_track_dataset/",
                          "data/ebtrk_atlc_1988_2015.txt")


library(readr)

# Create a vector of the width of each column
ext_tracks_widths <- c(7, 10, 2, 2, 3, 5, 5, 6, 4, 5, 4, 4, 5, 3, 4, 3, 3, 3,
                       4, 3, 3, 3, 4, 3, 3, 3, 2, 6, 1)

# Create a vector of column names, based on the online documentation for this data
ext_tracks_colnames <- c("storm_id", "storm_name", "month", "day",
                         "hour", "year", "latitude", "longitude",
                         "max_wind", "min_pressure", "rad_max_wind",
                         "eye_diameter", "pressure_1", "pressure_2",
                         paste("radius_34", c("ne", "se", "sw", "nw"), sep = "_"),
                         paste("radius_50", c("ne", "se", "sw", "nw"), sep = "_"),
                         paste("radius_64", c("ne", "se", "sw", "nw"), sep = "_"),
                         "storm_type", "distance_to_land", "final")

# Read the file in from its url
ext_tracks <- read_fwf(ext_tracks_file, 
                       fwf_widths(ext_tracks_widths, ext_tracks_colnames),
                       na = "-99")
ext_tracks[1:3, 1:9]

sessionInfo()

str(ext_tracks)

library(dplyr)

ext_tracks %>%
    filter(storm_name == "KATRINA") %>%
    select(month, day, hour, max_wind, min_pressure, rad_max_wind) %>%
    sample_n(4)


zika_file <- paste0("https://raw.githubusercontent.com/cdcepi/zika/master/",
                    "Brazil/COES_Microcephaly/data/COES_Microcephaly-2016-06-25.csv")
zika_brazil <- read_csv(zika_file)

zika_brazil %>%
    select(location, value, unit)



library(httr)
meso_url <- "https://mesonet.agron.iastate.edu/cgi-bin/request/asos.py/"
denver <- GET(url = meso_url,
              query = list(station = "DEN",
                           data = "sped",
                           year1 = "2016",
                           month1 = "6",
                           day1 = "1",
                           year2 = "2016",
                           month2 = "6",
                           day2 = "30",
                           tz = "America/Denver",
                           format = "comma")) %>%
    content() %>% 
    read_csv(skip = 5, na = "M") 

denver %>% slice(1:3)


# katrina <- filter(ext_tracks, storm_name == "KATRINA")
# katrina_reduced <- select(katrina, month, day, hour, max_wind)
# head(katrina_reduced, 3)
# 
# head(select(filter(ext_tracks, storm_name == "KATRINA"),
#             month, day, hour, max_wind), 3)


ext_tracks %>%
    filter(storm_name == "KATRINA") %>%
    select(month, day, hour, max_wind) %>%
    head(3)

ext_tracks %>%
    summarize(n_obs = n(),
              worst_wind = max(max_wind),
              worst_pressure = min(min_pressure))


knots_to_mph <- function(knots){
    mph <- 1.152 * knots
}

ext_tracks %>%
    summarize(n_obs = n(),
              worst_wind = knots_to_mph(max(max_wind)),
              worst_pressure = min(min_pressure))


ext_tracks %>%
    group_by(storm_name, year) %>%
    head()


ext_tracks %>%
    group_by(storm_name, year) %>%
    summarize(n_obs = n(),
              worst_wind = max(max_wind),
              worst_pressure = min(min_pressure))


library(ggplot2)
ext_tracks %>%
    group_by(storm_name) %>%
    summarize(worst_wind = max(max_wind)) %>%
    ggplot(aes(x = worst_wind)) + geom_histogram() 


ext_tracks %>%
    select(storm_name, month, day, hour, year, latitude, longitude, max_wind)

ext_tracks %>%
    select(storm_name, latitude, longitude, starts_with("radius_34"))

select(ext_tracks, ends_with("ne"))

select(ext_tracks, contains("34"))

select(ext_tracks, matches("_[0-9][0-9]_")) #column name includes two numbers between two underscores

filter(ext_tracks, storm_name == "KATRINA")

filter(ext_tracks, min_pressure != 0)

filter(ext_tracks, 	latitude > 25)

filter(ext_tracks, max_wind >= 160)

filter(ext_tracks, min_pressure < 900)

filter(ext_tracks, distance_to_land <= 0)

filter(ext_tracks, storm_name %in% c("KATRINA", "ANDREW")) #Included in

filter(ext_tracks, is.na(radius_34_ne))

filter(ext_tracks, !(storm_name %in% c("KATRINA", "ANDREW")))

filter(ext_tracks, !(is.na(radius_34_ne)))

head(ext_tracks$hour)
head(ext_tracks$hour == "00")

ext_tracks %>% 
    select(storm_name, hour, max_wind) %>%
    head(9)

ext_tracks %>%
    select(storm_name, hour, max_wind) %>%
    filter(!(hour == "00")) %>%
    head(3)

ext_tracks %>%
    group_by(storm_name, year) %>%
    summarize(worst_wind = max(max_wind)) %>%
    filter(worst_wind >= 160)


ext_tracks %>%
    select(storm_name, month, day, hour, latitude, longitude, max_wind) %>%
    filter(storm_name == "ANDREW" & max_wind >= 137) 


library(faraway)
data(worldcup)
str(worldcup)
View(worldcup)

worldcup <- worldcup %>%
    mutate(player_name = rownames(worldcup))

worldcup %>% slice(1:3)

str(worldcup)
View(worldcup)

# worldcup <- worldcup %>% 
#     group_by(Position) %>%
#     summarise(ave_shots = mean(Shots)) %>%
#     ungroup()



worldcup <- worldcup %>% 
    group_by(Position) %>%
    mutate(ave_shots = mean(Shots)) %>%
    ungroup()

worldcup %>% slice(1:3)

worldcup %>% 
    rename(Name = player_name) %>%
    slice(1:3)

data("VADeaths")
head(VADeaths)
library(tidyr)

# Move age from row names into a column
VADeaths  <- VADeaths %>%
    tbl_df() %>%
    mutate(age = row.names(VADeaths)) 
VADeaths

VADeaths %>%
    gather(key = key, value = death_rate, -age)





