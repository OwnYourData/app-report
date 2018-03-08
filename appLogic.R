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
        oydLog('los gehts')
        oydLog(paste('PIA_URL:', session$userData$piaUrl))
        oydLog(paste('APP_KEY:', session$userData$appKey))
        oydLog(paste('APP_SECRET:', session$userData$appSecret))
        privateKey <- as.character(session$userData$keyItems)[3]
        oydLog(paste('PRIVATE_KEY:', privateKey))
        
        taskStr = paste0(
                "docker run -i --rm --link oydpia2_mq_1 oydeu/srv-report ",
                "/bin/run.sh '{",
                '"pia_url":"', session$userData$piaUrl, '",',
                '"app_key":"', session$userData$appKey, '",',
                '"app_secret":"', session$userData$appSecret, '",',
                '"private_key":"', privateKey, '"}', "'")
        oydLog(paste("task:", taskStr))
        system(taskStr)
})