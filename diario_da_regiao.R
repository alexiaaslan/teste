# diario da regiao

library(XML)
library(xlsx)

busca <- "baby"

urlbase <- "http://www.diariodaregiao.com.br/2.275?caderno=emtododiario&q=BUSCA&page="

urlbase <- gsub("BUSCA", busca, urlbase)

pag_um <- paste0(urlbase, "1")

pagina <- xmlRoot(htmlParse(readLines(pag_um)))

num_resultados <- xpathSApply(pagina, "//p[@class = 'resultado-busca']/small/strong/child::text()")

# num_resultados <- xpathSApply(pagina, "//p[@class = 'resultado-busca']/small/strong")
# 
# ultima = as.character(substr(num_resultados, nchar(num_resultados) - 18, nchar(num_resultados) -9))
# 
# 
# for (i in 1:ultima)
# link_proxima <- xpathSApply(pagina, "//li[@class = 'tx-pagebrowse-last']/a", xmlGetAttr, name = "href")
# ultima = as.numeric(substr(link_ultima, nchar(link_ultima) - 2, nchar(link_ultima) - 1))

pag_seg <- xpathSApply(pagina, "//li[@class = 'next']")

linksNoticias <- c()
for (i in 1:1000000){
  print(i)
  url <- paste0(urlbase, i)
  pagina <- xmlRoot(htmlParse(readLines(url)))
  link <- xpathSApply(pagina, "//h3/a[@href]", xmlGetAttr, name = "href")
  link_completo <- paste0("http://www.diariodaregiao.com.br", link)
  linksNoticias <- c(linksNoticias, link_completo)  
}

dados <- data.frame()
links.problema = c()
j = 1
for (link_completo in linksNoticias){
  print(j); j = j + 1
  erro <- try(pagina <- xmlRoot(htmlParse(readLines(link))), silent=TRUE)
  if ('try-error' %in% class(erro)){
    links.problema = c(links.problema, link)
  }
  else {
    # identificacao dos elementos da materia
    # titulo
    titulo <- xpathSApply(pagina, "//h2[@class = 'titulo']", xmlValue)
    # data e hora
    dataehora <- xpathSApply(pagina, "//div[@class = 'data']", xmlValue)
    # texto, podem acabar vindo junto legendas de fotos, subtitulos, etc
    texto <- xpathSApply(pagina, "//div[@class = 'noticia-texto']", xmlValue)
    
    # empilha o que foi coletado de cada materia um em baixo do anterior
    dados <- rbind(dados, data.frame(busca, link, titulo, dataehora, texto))
  }
}
return(dados)
}

# vetor de termos a serem pesquisados
busca <- c("vereador", "Prefeito Ze")
busca <- "siri"

# criar data frame de resultados
dados <- data.frame()

# loop de busca dos termos
for (b in busca){
  dados <- rbind(dados, tribuna_busca(b))
}