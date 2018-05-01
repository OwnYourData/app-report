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
library(shinyWidgets)

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
        cat(file=stderr(), paste(Sys.time(), msg, "\n"))
oydLog('App start')

# Version information
currVersion <- "0.3.0"
verHistory <- data.frame(rbind(
        c(version = "0.3.0",
          text    = "erstes Release")
))

# translations for app specific localizations
localization <- list(
        'ctrlTrnsl_appTitle' = list('de' = 'Datenzusammenfassung', 
                                    'en' = 'Insight Report'),
        'createReportTitle' = list('de' = 'Bericht wird erstellt...',
                                   'en' = 'Report processing...'),
        'createReportInfo' = list('de' = 'Im Hintergrund wird nun deine Datenzusammenfassung erstellt und du bekommst in den nächsten 10 Minuten ein Email.',
                                  'en' = 'Your insight report will now be compiled in the background and you will receive an email within the next 10 minutes.'),
        'missingKey' = list('de' = 'Fehlendes Passwort',
                            'en' = 'Missing Key'),
        'missingKeyInfo' = list('de' = 'Es fehlt das Passwort zum Entschlüsseln deiner Daten! Verwende das Menu "Einstellungen" rechts oben, um das Passwort einzugeben.',
                                'en' = 'The key to decrypt your data is missing! Use the settings menu in the upper right corner, to enter the key.'),
        'ctrlTrnsl_CreateReport' = list('de' = 'Bericht erstellen',
                                        'en' = 'Create Report'),
        'ctrlTrnsl_CreateReportInfo' = list(
                'de' = 'Klicke auf die Schaltfläche, um aus den Daten in deinem Datentresor einen Bericht mit aktuellen Zusammenhängen zu erstellen. Dieser Bericht wird dir als PDF an deine Emailadresse geschickt.',
                'en' = 'Click this button to collect the available information in your data-vault and compile a report with insight into your data. The report will be sent as PDF to your email address.')
)
        