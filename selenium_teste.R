install.packages("RSelenium")
library(RSelenium)

remDr <- remoteDriver(platform <- "Windows 7", browserName = 'firefox')
remDr$open()
remDr$navigate("http://somecoolsite")

#http://stackoverflow.com/questions/31948860/rselenium-in-mac

#https://addons.mozilla.org/pt-BR/firefox/addon/selenium-ide/?src=search

# -----

#http://www.computerworld.com/article/2971265/application-development/how-to-drive-a-web-browser-with-r-and-rselenium.html

startServer()
checkForServer()
startServer()
mybrowser <- remoteDriver()
mybrowser$open()

mybrowser$navigate("http://www.weather.gov")
mybrowser$findElement(using = 'css selector', "#inputstring")
wxbox <- mybrowser$findElement(using = 'css selector', "#inputstring")
wxbox$clickElement()
wxbox$sendKeysToElement(list("New York"))
wxbutton <- mybrowser$findElement(using = 'css selector', "#btnSearch")
wxbutton$clickElement()
mybrowser$goBack()
wxbox <- mybrowser$findElement(using = 'css selector', "#inputstring")
wxbox$sendKeysToElement(list("01701", "\uE007"))


# ------ Correio Popular

startServer()
checkForServer()
startServer()
mybrowser <- remoteDriver()
mybrowser$open()


busca <- "prefeito"

urlbase <- "http://correio.rac.com.br/busca_nova.php?cref=http%3A%2F%2Fcorreio.rac.com.br%2Fcse.xml&cof=FORID%3A11&q=BUSCA&sa=Search"

urlbase <- gsub("BUSCA", busca, urlbase)

mybrowser$navigate(urlbase)

d <- mybrowser$findElement(using = 'id', "cse-search-results")
mybrowser$switchToFrame(d$search-frame)


mybrowser$switchToFrame(mybrowser$googleSearchFrame)
mybrowser$findElement(using = 'xpath', value = "//div[@id='cse']")
wxbox <- mybrowser$findElement(using = 'css selector', "#inputstring")
wxbox$clickElement()
wxbox$sendKeysToElement(list("New York"))
wxbutton <- mybrowser$findElement(using = 'css selector', "#btnSearch")
wxbutton$clickElement()
mybrowser$goBack()
wxbox <- mybrowser$findElement(using = 'css selector', "#inputstring")
wxbox$sendKeysToElement(list("01701", "\uE007"))




wxbutton <- mybrowser$findElement(using = 'xpath', "//div[@class='gsc-cursor-page']")
wxbutton$clickElement()
