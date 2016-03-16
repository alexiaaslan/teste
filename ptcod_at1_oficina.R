texto1 <- "batata"
texto2 <- "quero substituir essa palavra"


texto_final <- gsub("palavra", texto1, texto2)

print(texto_final)


onde_quero_substituir <- "quero substituir essa palavra"
o_que_procuro_para_susbtituir <- "palavra"
O_que_quero_substituir_por <- "batata"

texto_final <- gsub(o_que_procuro_para_susbtituir, O_que_quero_substituir_por, onde_quero_substituir)

print(texto_final)

url_base <- "http://www.al.sp.gov.br/alesp/pesquisa-proposicoes/?direction=inicio&lastPage=0&currentPage=FRANGO&act=detalhe&idDocumento=&rowsPerPage=10&currentPageDetalhe=1&tpDocumento=&method=search&text=merenda&natureId=&legislativeNumber=&legislativeYear=&natureIdMainDoc=&anoDeExercicio=&legislativeNumberMainDoc=&legislativeYearMainDoc=&strInitialDate=&strFinalDate=&author=&supporter=&politicalPartyId=&tipoDocumento=&stageId=&strVotedInitialDate=&strVotedFinalDate=#"
i = 6
url <- gsub("FRANGO", i, url_base)
print(url)


url_base <- "http://www.al.sp.gov.br/alesp/pesquisa-proposicoes/?direction=inicio&lastPage=0&currentPage=FRANGO&act=detalhe&idDocumento=&rowsPerPage=10&currentPageDetalhe=1&tpDocumento=&method=search&text=merenda&natureId=&legislativeNumber=&legislativeYear=&natureIdMainDoc=&anoDeExercicio=&legislativeNumberMainDoc=&legislativeYearMainDoc=&strInitialDate=&strFinalDate=&author=&supporter=&politicalPartyId=&tipoDocumento=&stageId=&strVotedInitialDate=&strVotedFinalDate=#"
for( i in 1:5){
  url <- gsub("FRANGO", i, url_base)
  print(url)
}

library(XML)

url_base <- "http://www.al.sp.gov.br/alesp/pesquisa-proposicoes/?direction=inicio&lastPage=0&currentPage=FRANGO&act=detalhe&idDocumento=&rowsPerPage=10&currentPageDetalhe=1&tpDocumento=&method=search&text=merenda&natureId=&legislativeNumber=&legislativeYear=&natureIdMainDoc=&anoDeExercicio=&legislativeNumberMainDoc=&legislativeYearMainDoc=&strInitialDate=&strFinalDate=&author=&supporter=&politicalPartyId=&tipoDocumento=&stageId=&strVotedInitialDate=&strVotedFinalDate=#"
i <- 1
url <- gsub("FRANGO", i, url_base)
tabela <- readHTMLTable(url)
print(tabela)
}

# Objetos variados
matriz <- matrix(c(1:6), nrow=2)
vetor.inteiros <- c(42:1)
vetor.texto <- c("a", "b", "c", "d", "e")
vetor.logico <- c(T, F, T, T, T, T, T, T, F)
texto <- "meu querido texto"
resposta <- 42

# Lista
minha.lista <- list(matriz, vetor.inteiros, vetor.texto, vetor.logico, texto, resposta)
print(minha.lista)

print(minha.lista[1:3])
class(minha.lista[1:3])
print(minha.lista[4])
class(minha.lista[4])

url_base <- "http://www.al.sp.gov.br/alesp/pesquisa-proposicoes/?direction=inicio&lastPage=0&currentPage=FRANGO&act=detalhe&idDocumento=&rowsPerPage=10&currentPageDetalhe=1&tpDocumento=&method=search&text=merenda&natureId=&legislativeNumber=&legislativeYear=&natureIdMainDoc=&anoDeExercicio=&legislativeNumberMainDoc=&legislativeYearMainDoc=&strInitialDate=&strFinalDate=&author=&supporter=&politicalPartyId=&tipoDocumento=&stageId=&strVotedInitialDate=&strVotedFinalDate=#"
i <- 1
url <- gsub("FRANGO", i, url_base)
lista.tabelas <- readHTMLTable(url)
tabela <- lista.tabelas[[1]]
print(tabela)
class(tabela)


url_base <- "http://www.al.sp.gov.br/alesp/pesquisa-proposicoes/?direction=inicio&lastPage=0&currentPage=NUM_PAG&act=detalhe&idDocumento=&rowsPerPage=10&currentPageDetalhe=1&tpDocumento=&method=search&text=merenda&natureId=&legislativeNumber=&legislativeYear=&natureIdMainDoc=&anoDeExercicio=&legislativeNumberMainDoc=&legislativeYearMainDoc=&strInitialDate=&strFinalDate=&author=&supporter=&politicalPartyId=&tipoDocumento=&stageId=&strVotedInitialDate=&strVotedFinalDate=#"
for (i in 0:4) {
  url <- gsub("NUM_PAG", i, url_base)
  lista.tabelas <- readHTMLTable(url)
  tabela <- lista.tabelas[[1]]
  print(head(tabela))
}

# Criando 2 data frames separados
meus.dados1 <- data.frame("id" = 1:10, "Experimento" = rep(c("Tratamento"), 5))
print(meus.dados1)
meus.dados2 <- data.frame("id" = 11:20, "Experimento" = rep(c("Controle"), 5))
print(meus.dados2)

# Combinando os dois data.frames
meus.dados.completos <- rbind(meus.dados1, meus.dados2)
print(meus.dados.completos)

url_base <- "http://www.al.sp.gov.br/alesp/pesquisa-proposicoes/?direction=inicio&lastPage=0&currentPage=NUM_PAG&act=detalhe&idDocumento=&rowsPerPage=10&currentPageDetalhe=1&tpDocumento=&method=search&text=merenda&natureId=&legislativeNumber=&legislativeYear=&natureIdMainDoc=&anoDeExercicio=&legislativeNumberMainDoc=&legislativeYearMainDoc=&strInitialDate=&strFinalDate=&author=&supporter=&politicalPartyId=&tipoDocumento=&stageId=&strVotedInitialDate=&strVotedFinalDate=#"
dados <- data.frame()
for (i in 0:4) {
  print(i)
  url <- gsub("NUM_PAG", i, url_base)
  lista.tabelas <- readHTMLTable(url, stringsAsFactors = FALSE)
  tabela <- lista.tabelas[[1]]
  dados <- rbind(dados, tabela)
}

url_base <- "http://www.al.sp.gov.br/alesp/pesquisa-proposicoes/?direction=inicio&lastPage=0&currentPage=NUM_PAG&act=detalhe&idDocumento=&rowsPerPage=10&currentPageDetalhe=1&tpDocumento=&method=search&text=merenda&natureId=&legislativeNumber=&legislativeYear=&natureIdMainDoc=&anoDeExercicio=&legislativeNumberMainDoc=&legislativeYearMainDoc=&strInitialDate=&strFinalDate=&author=&supporter=&politicalPartyId=&tipoDocumento=&stageId=&strVotedInitialDate=&strVotedFinalDate=#"
dados <- data.frame()
for (i in 0:4) {
  print(i)
  url <- gsub("NUM_PAG", i, url_base)
  lista.tabelas <- readHTMLTable(url, stringsAsFactors = FALSE)
  tabela <- lista.tabelas[[1]]
  dados <- rbind(dados, tabela)
}

url_base <- "http://www.al.sp.gov.br/alesp/pesquisa-proposicoes/?direction=inicio&lastPage=0&currentPage=FRANGO&act=detalhe&idDocumento=&rowsPerPage=10&currentPageDetalhe=1&tpDocumento=&method=search&text=%E1gua&natureId=&legislativeNumber=&legislativeYear=&natureIdMainDoc=&anoDeExercicio=&legislativeNumberMainDoc=&legislativeYearMainDoc=&strInitialDate=&strFinalDate=&author=&supporter=&politicalPartyId=&tipoDocumento=&stageId=&strVotedInitialDate=&strVotedFinalDate="

dados <- data.frame()
for (i in 0:4){
  print(i)
  url <- gsub("FRANGO", i, url_base)
  tabela <- readHTMLTable(url)[[1]]
  dados <- rbind(dados, tabela)
}

----
  
  url_base <- "http://www.al.sp.gov.br/alesp/pesquisa-proposicoes/?direction=acima&lastPage=75&currentPage=NUMPAG&act=detalhe&idDocumento=&rowsPerPage=10&currentPageDetalhe=1&tpDocumento=&method=search&text=merenda&natureId=&legislativeNumber=&legislativeYear=&natureIdMainDoc=&anoDeExercicio=&legislativeNumberMainDoc=&legislativeYearMainDoc=&strInitialDate=&strFinalDate=&author=&supporter=&politicalPartyId=&tipoDocumento=&stageId=&strVotedInitialDate=&strVotedFinalDate="
for(i in 0:5){
  url <- gsub("NUMPAG", i, url_base)
  print(url)
}

url_base <- "http://www.al.sp.gov.br/alesp/pesquisa-proposicoes/?direction=acima&lastPage=75&currentPage=NUMPAG&act=detalhe&idDocumento=&rowsPerPage=10&currentPageDetalhe=1&tpDocumento=&method=search&text=merenda&natureId=&legislativeNumber=&legislativeYear=&natureIdMainDoc=&anoDeExercicio=&legislativeNumberMainDoc=&legislativeYearMainDoc=&strInitialDate=&strFinalDate=&author=&supporter=&politicalPartyId=&tipoDocumento=&stageId=&strVotedInitialDate=&strVotedFinalDate="
  i <- 1
url <- gsub("NUM_PAG", i, url_base)
tabela <- readHTMLTable(url)
print(tabela)
}

# Objetos variados
matriz <- matrix(c(1:6), nrow=2)
vetor.inteiros <- c(42:1)
vetor.texto <- c("a", "b", "c", "d", "e")
vetor.logico <- c(T, F, T, T, T, T, T, T, F)
texto <- "meu querido texto"
resposta <- 42

# Lista
minha.lista <- list(matriz, vetor.inteiros, vetor.texto, vetor.logico, texto, resposta)
print(minha.lista)

url_base <- "http://www.al.sp.gov.br/alesp/pesquisa-proposicoes/?direction=acima&lastPage=75&currentPage=NUMPAG&act=detalhe&idDocumento=&rowsPerPage=10&currentPageDetalhe=1&tpDocumento=&method=search&text=merenda&natureId=&legislativeNumber=&legislativeYear=&natureIdMainDoc=&anoDeExercicio=&legislativeNumberMainDoc=&legislativeYearMainDoc=&strInitialDate=&strFinalDate=&author=&supporter=&politicalPartyId=&tipoDocumento=&stageId=&strVotedInitialDate=&strVotedFinalDate="
i <- 1
url <- gsub("NUMPAG", i, url_base)
lista.tabelas <- readHTMLTable(url)
tabela <- lista.tabelas[[1]]
print(tabela)
class(tabela)


url_base <- "http://www.al.sp.gov.br/alesp/pesquisa-proposicoes/?direction=acima&lastPage=75&currentPage=NUMPAG&act=detalhe&idDocumento=&rowsPerPage=10&currentPageDetalhe=1&tpDocumento=&method=search&text=merenda&natureId=&legislativeNumber=&legislativeYear=&natureIdMainDoc=&anoDeExercicio=&legislativeNumberMainDoc=&legislativeYearMainDoc=&strInitialDate=&strFinalDate=&author=&supporter=&politicalPartyId=&tipoDocumento=&stageId=&strVotedInitialDate=&strVotedFinalDate="
for (i in 0:4) {
  url <- gsub("NUMPAG", i, url_base)
  lista.tabelas <- readHTMLTable(url)
  tabela <- lista.tabelas[[1]]
  print(head(tabela))
}

# Criando 2 data frames separados
meus.dados1 <- data.frame("id" = 1:10, "Experimento" = rep(c("Tratamento"), 5))
print(meus.dados1)
meus.dados2 <- data.frame("id" = 11:20, "Experimento" = rep(c("Controle"), 5))
print(meus.dados2)

# Combinando os dois data.frames
meus.dados.completos <- rbind(meus.dados1, meus.dados2)
print(meus.dados.completos)

url_base <- "http://www.al.sp.gov.br/alesp/pesquisa-proposicoes/?direction=acima&lastPage=75&currentPage=NUMPAG&act=detalhe&idDocumento=&rowsPerPage=10&currentPageDetalhe=1&tpDocumento=&method=search&text=merenda&natureId=&legislativeNumber=&legislativeYear=&natureIdMainDoc=&anoDeExercicio=&legislativeNumberMainDoc=&legislativeYearMainDoc=&strInitialDate=&strFinalDate=&author=&supporter=&politicalPartyId=&tipoDocumento=&stageId=&strVotedInitialDate=&strVotedFinalDate="
dados <- data.frame()
for (i in 0:4) {
  print(i)
  url <- gsub("NUMPAG", i, url_base)
  lista.tabelas <- readHTMLTable(url, stringsAsFactors = FALSE)
  tabela <- lista.tabelas[[1]]
  dados <- rbind(dados, tabela)
}

# Estrutura do data frame
str(dados)

# 6 priemiras observações
head(dados)

# 6 últimas observações
tail(dados)