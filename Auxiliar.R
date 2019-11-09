install.packages("stringr")
#(1)Baixar a planilha: 
#Baixamos a planiha utilizando o comando "read.csv()"
dados <- read.csv("C:/Users/jhfs/Downloads/Detalhes de Albuns - Página1.csv")
dframe <- data.frame(dados)

#(2) Calcular média, desvio padrão e moda da "Quantidade de Álbuns vendidos"

#Média
#Para calcular a média foi utilizada uma função pronta do Rstudio "mean()" que calcula a média.
media <- mean(dframe$Qnt..de.Ã.lbuns.Vendidos)
print(media)

#Desvio Padrao
#Para calcular o desvio padão foi utilizada uma função pronta do Rstudio "sd()" que calcula o desvio padrão.
desvio <- sd(dframe$Qnt..de.Ã.lbuns.Vendidos)
print(desvio)

#Moda
#Para calcular a moda foi implementada uma função que, usando o comando "table()", verifica a quantidade de vezes que
# determinado número aparece... caso a quantidade de vezes que cada número aparece for igual a 1, não existe moda, se
# a quantidade de vezes que um determinado número aparece for maior que a dos outros, este número será a moda.
quantVezes = 0;
moda = 0;
for(i in 1:41){
  if(table(dframe$Qnt..de.Ã.lbuns.Vendidos[i]) > quantVezes){
    quantVezes <- table(dframe$Qnt..de.Ã.lbuns.Vendidos[i])
    moda <- dframe$Qnt..de.Ã.lbuns.Vendidos[i]
  }
}
print(moda)
if(moda == 1){
  print(moda)
} else {
  print("Não possui moda")
}

#(3) Artistas que lançaram álbuns nos dois anos
# Aqui foram feitos dois arrays: um com artistas que lançaram álbuns em 2019 e outro com os que lançaram álbuns em 2018. Ambos os arrays
# foram feitos com o comando "unique" para que não tivessem artistas repetidos. Depois, com dois "fors", fizemos uma "varredura" procurando
# e printando os artistas que estavam presentes nos dois arrays.
artistas19 <- unique(dframe$Artista[26:41])
artistas18 <- unique(dframe$Artista[1:25])
for(i in 1:length(artistas18)){
  if(artistas18[i] %in% artistas19){
    print(artistas18[i])
  }
}

#(4) Artista com o menor desvio padrão com relação a quantidade de álbuns vendidos
# Aqui iniciamos um vetor "artistas4", com o auxílio do comando "unique", para que o vetor tivesse o nome de todos os artistas, mas sem
# repetições, criamos uma variável auxiliar e nos dois "fors" vamos artista por artista pegando o números de álbuns vendidos e colocando em
# um vetor, posteriormente, com o comando "sd" pegamos o desvio padrão desse vetor. Fazemos esse processo para cada artista e por fim pegamos
# o nome do artista que possuir o menor desvio padrão e printamos ele.
artistas4 <- unique(dframe$Artista)
length(artistas4)
aux = 999999999999999
nome <- ""
vetor = NULL
for (i in 1:length(artistas4)) {
  pos = 1
  for (j in 1:41) {
    if (dframe$Artista[j] == artistas4[i]) {
      vetor[pos] <- c(dframe$Qnt..de.Ã.lbuns.Vendidos[j])
      pos = pos + 1
    }
  }
  if (pos > 2) {
    menorSD <- sd(vetor)
    if (menorSD < aux) {
      aux = menorSD
      nome <- artistas4[i]
    }
  }
  vetor = NULL
}
print(nome)

#(5) Álbum que mais vendeu e álbum que menos vendeu
# Inicialmente criamos duas variáveis: "maior" que, com o uso da função "max", pega o maior valor dentre a quantidade de álbuns vendidos e
# "menor" que, com o uso da função "min", pega o menor valor dentre a quantidade de álbuns vendidos.
maior <- max(dframe$Qnt..de.Ã.lbuns.Vendidos)
menor <- min(dframe$Qnt..de.Ã.lbuns.Vendidos)
for (i in 1:41) {
  if (maior == (dframe$Qnt..de.Ã.lbuns.Vendidos[i])) {
    pos1 = i
    print(pos1)
  }
  if (menor == (dframe$Qnt..de.Ã.lbuns.Vendidos[i])) {
    pos2 = i
  }
}
maior1 <- (dframe$Ã.lbum[pos1])
maior2 <- (dframe$Artista[pos1])
menor1 <- (dframe$Ã.lbum[pos2])
menor2 <- (dframe$Artista[pos2])
Álbum = c(maior1, menor1),
Artista = c(maior2, menor2)
DFAlbuns <- data.frame(as.character())
print(paste(dframe$Ã.lbum[pos1], maior2, sep = " - "))
print(paste(menor1, menor2, sep = " - "))

#(6)
qnt = 1
ListaNomes <- ""
for (i in 1:length(artistas4)) {
  pos = 1
  for (j in 1:41) {
    if (dframe$Artista[j] == artistas4[i]) {
      pos = pos + 1
    }
  }
  if (pos == 2) {
    nome <- artistas4[i]
    ListaNomes[qnt] <- as.character(nome)
    qnt = qnt + 1
  }
}
print(ListaNomes)

#(7)
Empresas0 <- unique(dframe$Empresa)
print(Empresas0)
QntArtistasEmp = NULL
x = 0
for (i in 1:length(Empresas)) {
  for (w in 1:(length(artistas4))) {
    if (Empresas0[i] == Empresas0[w]) {
      x = x + 1
      QntArtistasEmp[i] = x
    }
  }
  x = 0
}
print(QntArtistasEmp)
nome <- "oi"
for (i in 1:length(Empresas0)) {
  for (w in 1:(length(artistas4) - 1)) {
    if (QntArtistasEmp[w] > QntArtistasEmp[w+1]) {
      x = QntArtistasEmp[w]
      QntArtistasEmp[w] = QntArtistasEmp[w+1]
      QntArtistasEmp[w+1] = x
      nome <- Empresas0[w]
      Empresas0[w] = Empresas0[w + 1]
      Empresas0[w+1] <- nome
    }
  }
}
print(Empresas0)
print(QntArtistasEmp)
DFempresas <- data.frame(
  Empresas = Empresas0,
  Artistas = QntArtistasEmp
)

#(8)


#TESTE:
#Função para ordenar:
empresas <- c("E0", "E1", "E2")
quantArt <- c(10, 5, 7)
novoDF <- data.frame(empresas, quantArt)
ordem <- order(novoDF$quantArt, decreasing = TRUE)
for(i in 1:length(ordem)){
  print(novoDF$empresas[ordem[i]])
}
novoDF
