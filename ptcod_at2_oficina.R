library(XML)
url <- "http://www.al.sp.gov.br/alesp/busca/?q=merenda&page=2"
pagina <- readLines(url)

class(pagina)
pagina <- htmlParse(pagina)
pagina <- xmlRoot(pagina)

nodes_link <- getNodeSet(pagina, "//ul[@class='lista_navegacao']/li/a")
print(nodes_link)
print(nodes_link[[1]])

conteudo_1 <- xmlValue(nodes_link[[1]])
print(conteudo_1)

atributo_1 <- xmlGetAttr(nodes_link[[1]], name = "href")
print(atributo_1)

conteudo_1 <- xmlValue(nodes_link[[1]])
conteudo_2 <- xmlValue(nodes_link[[2]])
conteudo_3 <- xmlValue(nodes_link[[3]])
conteudo_4 <- xmlValue(nodes_link[[4]])
conteudo_5 <- xmlValue(nodes_link[[5]])
conteudo_6 <- xmlValue(nodes_link[[6]])
conteudo_7 <- xmlValue(nodes_link[[7]])
conteudo_8 <- xmlValue(nodes_link[[8]])
conteudo_9 <- xmlValue(nodes_link[[9]])
conteudo_10 <- xmlValue(nodes_link[[10]])

conteudos <- c(conteudo_1, conteudo_2, conteudo_3, conteudo_4, conteudo_5, conteudo_6, conteudo_7, conteudo_8, conteudo_9, conteudo_10)

atributo_1 <- xmlGetAttr(nodes_link[[1]], name = "href")
atributo_2 <- xmlGetAttr(nodes_link[[2]], name = "href")
atributo_3 <- xmlGetAttr(nodes_link[[3]], name = "href")
atributo_4 <- xmlGetAttr(nodes_link[[4]], name = "href")
atributo_5 <- xmlGetAttr(nodes_link[[5]], name = "href")
atributo_6 <- xmlGetAttr(nodes_link[[6]], name = "href")
atributo_7 <- xmlGetAttr(nodes_link[[7]], name = "href")
atributo_8 <- xmlGetAttr(nodes_link[[8]], name = "href")
atributo_9 <- xmlGetAttr(nodes_link[[9]], name = "href")
atributo_10 <- xmlGetAttr(nodes_link[[10]], name = "href")

atributos <- c(atributo_1, atributo_2, atributo_3, atributo_4, atributo_5, atributo_6, atributo_7, atributo_8, atributo_9, atributo_10)

dados <- data.frame(conteudos, atributos)
head(dados)

conteudos <- c()
atributos <- c()
for (i in 1:10){
  
  conteudo_i <- xmlValue(nodes_link[[1]])
  conteudos <- c(conteudos, conteudo_i)
  
  atributo_i <- xmlGetAttr(nodes_link[[1]], name = "href")
  atributos <- c(atributos, atributo_i)
}

dados <- data.frame(conteudos, atributos)
head(dados)

conteudos <- xpathSApply(pagina, "//ul[@class='lista_navegacao']/li/a", xmlValue)
print(conteudos)

atributos <- xpathSApply(pagina, "//ul[@class='lista_navegacao']/li/a", xmlGetAttr, name = "href")
print(atributos)

dados <- data.frame(conteudos, atributos)
head(dados)

---
  
library(XML)
urlbase <- "http://www.al.sp.gov.br/alesp/busca/?q=merenda&page="

pagina <- readLines(urlbase)
pagina <- htmlParse(pagina)
pagina <- xmlRoot(pagina)

ultima <- getNodeSet(pagina, "//div[@id='lista_resultado']/p")
#http://stackoverflow.com/questions/11455590/parse-an-xml-file-and-return-an-r-character-vector
d <- sapply(ultima, xmlValue)

class(ult_pag)

ult_pag <- substr(d, (nchar(d)-2), (nchar(d)))

dados <- data.frame()
for (i in 1:as.numeric(ult_pag)){
  
  for (i in 1:10){
  
  conteudos <- xpathSApply(pagina, "//ul[@class='lista_navegacao']/li/a", xmlValue)
  print(conteudos)
  
  atributos <- xpathSApply(pagina, "//ul[@class='lista_navegacao']/li/a", xmlGetAttr, name = "href")
  print(atributos)
  
  dados <- rbind(dados, conteudos)
  
  
  }
}
------
library(XML)
urlbase <- "http://www.al.sp.gov.br/alesp/busca/?q=merenda&page="

dados <- data.frame()

for (i in 1:5){
    print(i)
    url <- paste(urlbase, i, sep = "")
  
    pagina <- readLines(url)
    pagina <- htmlParse(pagina)
    pagina <- xmlRoot(pagina)
    
    conteudos <- xpathSApply(pagina, "//ul[@class='lista_navegacao']/li/a", xmlValue)
    
    atributos <- xpathSApply(pagina, "//ul[@class='lista_navegacao']/li/a", xmlGetAttr, name = "href")
    
    dados <- rbind(dados, data.frame(conteudos, atributos))
    
}
