#lets work

install.packages("devtools")
library("devtools")

install_github("leobarone/bRasilLegis")
library("bRasilLegis")


#lolz

# https://github.com/Labs-e-Oficinas/webscrapping-R/blob/master/UFSCar/ocdr_tutorial2.Rmd
# https://github.com/pablobarbera/data-science-workshop/blob/master/scraping/README.md


#teste com comentario de portal
link <- htmlParse("http://noticias.uol.com.br/cotidiano/ultimas-noticias/2016/02/05/policia-civil-faz-buscas-na-sede-da-samarco.htm")
listofnodes <- 
  getNodeSet(link, "/*/div/p[@class]")

url <- 'http://noticias.uol.com.br/cotidiano/ultimas-noticias/2016/02/05/policia-civil-faz-buscas-na-sede-da-samarco.htm'

doc <- readLines(url)
doc <- htmlParse(doc)

doc <- xmlRoot(doc)

nodes <- getNodeSet(doc, ".//h1[@class='pg-color10']")
res <- xmlSApply(nodes, xmlValue)

nodes <- xpathSApply(doc, "//h1[@class='pg-color10']", xmlValue)
