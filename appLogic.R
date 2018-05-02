# application specific logic
# last update: 2017-06-11

# Code required for every app ========================
# initialization
session$userData$piaUrl <- ''
session$userData$appKey <- ''
session$userData$appSecret <- ''
session$userData$keyItems <- data.frame()
session$userData$initFlag <- TRUE
session$userData$openDialog <- ''

appServer <- function(input, output, session, tr, notif){
        appStart <- function(){
                # ns <- session$ns
                # app <- setupApp(session$userData$piaUrl,
                #                 session$userData$appKey,
                #                 session$userData$appSecret,
                #                 session$userData$keyItems)
                # repo_url <- itemsUrl(app$url, appRepoDefault)
                # items <- readItems(app, repo_url)
                # notif$readItemsNotification(items)
                # noteList(ns)
        }
        
        return(appStart)
}

# App specific code =======================================
observeEvent(input$createReport, {
        pia_url <- session$userData$piaUrl
        app_key <- session$userData$appKey
        app_secret <- session$userData$appSecret
        private_key <- as.character(session$userData$keyItems$key)
        if(as.character(private_key) != '' && !is.na(private_key)){
                shinyWidgets::sendSweetAlert(
                        session = session,
                        title = tr('createReportTitle'),
                        text = tr('createReportInfo'),
                        type = "success"
                )
                taskStr = paste0(
                        "docker run -i --rm ",
                        "--env-file <(env | grep MAIL) ",
                        "--env-file <(env | grep QUEUE) ",
                        "--link $DOCKER_LINK_MQ ",
                        "oydeu/srv-report /bin/run.sh '{",
                        '"pia_url":"', pia_url, '",',
                        '"app_key":"', app_key, '",',
                        '"app_secret":"', app_secret, '",',
                        '"private_key":"', private_key, '"}', "'")
                # oydLog(paste("task:", taskStr))
                # system(taskStr)
                
                # should write task into Tasks queue - but does not work yet!!!
                app <- oydapp::setupApp(pia_url, app_key, app_secret, '')
                oydapp::createTask(
                        app,
                        'oyd.report.tmp', # identifier
                        taskStr,           # command
                        'delete'           # schedule
                )
        } else {
                shinyWidgets::sendSweetAlert(
                        session = session,
                        title = tr('missingKey'),
                        text = tr('missingKeyInfo'),
                        type = "error"
                )
        }
})