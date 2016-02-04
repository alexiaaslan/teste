#bibliotecas

library(XML)
library(RCurl)
library(RJSONIO)

#cap 1

#ex 1

url <- getURL("https://en.wikipedia.org/wiki/World_human_population")

a <- getNodeSet(htmlParse(url))
d <- readHTMLTable(url)

f <- readHTMLList(url)

#ex 2

#esse é um caso de que nao ha atributos dentro dos nodulos para recuperar. apenas os elementos de top-level do xml sao de interesse

#cod dos autores
doc = xmlParse("http://www.rxmlwebtech.org/Data/Kiva/lenders/1.xml")


kivaList = xmlToList(doc, addAttributes = FALSE)


lendersNode = xmlRoot(doc)[["lenders"]]


lenders = xmlToDataFrame(xmlChildren(lendersNode))


names(lenders)

#fim cod dos autores

d <- xmlParse("http://www.rxmlwebtech.org/Data/Kiva/lenders/1.xml")

list <- xmlToList(d, addAttributes = FALSE)

lista <- xmlToDataFrame(d)

lennod <- xmlRoot(d) [["lenders"]]

xmlRoot(d) [[2]]

lenders <- xmlToDataFrame(xmlChildren(lennod))

#ex 3

#codigo dos autores
doc=xmlParse("https://www.govtrack.us/data/congress/111/bills/hr/hr1/data.xml")
root = xmlRoot(doc)
actions = root[["actions"]]
rBills = getNodeSet(actions, "/bill//bill")

# xmlAttrs = tras todas as informacoes dentro daquele nodulo, tudo que foi especificado dentro de um conjunto de <>
# especifica-se de qual posicao voce quer pegar todas as informacoes
xmlAttrs(rBills[[1]])

do.call(rbind, lapply(rBills, xmlAttrs))

# xmlGetAttr = tras a informacao de um unico determinado atributo explicitado 
# tambem deve especificar a posicao de interesse e tambem que atributo do nodulo quer recuperar
xmlGetAttr(rBills[[1]], "number", NA, as.integer)


as.integer(sapply(rBills, xmlGetAttr, name = "number")) 
#fim cod dos autores

# So jogar a URL NAO FUNCIONA
url = xmlParse("https://www.govtrack.us/data/congress/111/bills/hr/hr1/data.xml")

# precisa fazer isso:
fileURL <- "https://www.govtrack.us/data/congress/111/bills/hr/hr1/data.xml"
xData <- getURL(fileURL)
doc <- xmlParse(xData)

# para depois ir ao codigo

a = xmlRoot(doc) 

b = a[["actions"]]

c = getNodeSet(b, "/bill//bill")

d <- xmlAttrs(c[[1]])

#ex 4
#

kiva = fromJSON("kivs.json")


names(kiva)


kiva$lenders[[1]]
#

fileURL <- "http://www.rxmlwebtech.org/Data/Kiva/lenders/1.json"
xData <- getURL(fileURL)

kiva <- fromJSON(xData)

names(kiva)

# cap 3

#ex 1

doc <- xmlParse(getURL("www.rxmlwebtech.org/Data/Kiva/lenders/1.xml"))

lendersNode <- xmlRoot(doc) [["lenders"]]

occ <- sapply(xmlChildren(lendersNode), function (node) xmlValue(node[["occupation"]]))

x <- unique(occ)

#ex2

doc <- xmlParse("merged_catalog.xml.gz")

root <- xmlRoot(doc)

xmlName(root)

xmlSize(root)

length(xmlChildren(root))

e1 <- root[["event"]][2]

root[1:7]
root[ -(1:7)]

evs <- root["event"]

length(evs)

xmlSize(evs)
xmlSize(evs[[1]])

names(e1)
names(evs)

#ex 3

xmlSize(lendersNode)

lendersNode[[1]] [c("name", "occupation", "image")]

# c <- data.matrix()
# 
# for (i in 1:xmlSize(lendersNode)){
#   
#   a <- lendersNode[[i]] [c("name", "occupation", "image")]  
# 
#   d <- rbind(d, a)
#   }

w <- sapply(xmlChildren(lendersNode[[1]]), xmlSize) > 1

lendersNode[[1]] [w]

tem_id <- sapply(xmlChildren(lendersNode), function(x) xmlValue(x[["image"]][["template_id"]]))

#ex 3.3 (p.60)
#objetivo é pegar a magnitude (ou seja, o decimo child node) de cada evento
#para isso, primeiro retorna o momento do evento (dentro do event node)
#depois, selecionam-se todos os decimos elementos de cada um dos eventos
#do decimo elemento de cada um dos eventos, extrai-se o atributo value

timests <- xmlSApply(root, xmlGetAttr, "time-stamp")

root[[1]][[10]]

child10 <- xmlSApply(root, "[[", 10)
mags <- as.numeric(sapply(child10, xmlGetAttr, "value"))

head(mags)

mags2 <- as.numeric(xmlSApply(root, function(node) xmlGetAttr(node[[10]], "value")))

#mas como nao se sabe se o que se esta procurando esta realmente no child node de numero 10 todas as vezes, 
#ha um outro approach mais adequado, usando o nome do parametro e nao sua posicao

xmlSApply(root, function(evNode){
  parNames <- xmlSApply(evNode, xmlGetAttr, "name")
  i <- which(parNames == 'magnitude')
  xmlGetAttr(evNode[[i]], "value")
  })

#opcao de fazer via xpath ou seja, pedir todos os atributos de value das tags de parametro que tem o nome de magnitude
#ou inves de ficar indo rodando uma a uma, pegando primeiro o evento, depois o valor, ele busca tudo que se encaixa no endereco

getNodeSet(root, "/merge/event/param[@name='magnitude']/@value")
