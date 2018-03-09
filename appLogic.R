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
        private_key <- as.character(session$userData$keyItems)[3]
        
        taskStr = paste0(
                "docker run -i --rm --link oydpia2_mq_1 oydeu/srv-report ",
                "/bin/run.sh '{",
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
                'oyd.report.temp', # identifier
                taskStr,           # command
                'delete'           # schedule
        )
})