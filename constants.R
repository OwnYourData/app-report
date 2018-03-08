# global constants available to the app
# last update: 2017-06-11

# required Libraries
library(shiny)
library(shinyjs)
library(shinyBS)
library(rintrojs)
library(sodium)
library(oydapp)
library(shinyAce)

# sources for user specific UI
source('uiBody.R')

# constants required for every app
appName <- 'report'
appTitle <- 'Report'
app_id <- 'oyd.report'
appRepoDefault <- 'oyd.settings'
helpUrl <- 'https://www.ownyourdata.eu/apps/report'

# console logging
oydLog <- function(msg)
        cat(paste(Sys.time(), msg, "\n"))
oydLog('App start')

# Version information
currVersion <- "0.3.0"
verHistory <- data.frame(rbind(
        c(version = "0.3.0",
          text    = "erstes Release")
))

# translations for app specific localizations
localization <- list(
        'ctrlTrnsl_appTitle' = list('de' = 'Notizen', 
                                    'en' = 'Notes'))
        