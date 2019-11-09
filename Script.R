# Igor Domingos da Rocha e Silva - idrs / José Henrique Fernandes Silva - jhfs
#(1)Baixar a planilha: 
#Baixamos a planiha utilizando o comando "read.csv()"
dados <- read.csv("C:\\Users\\jhfs\\Downloads\\Detalhes de Albuns - Página1.csv")
dframe <- data.frame(dados)

#(2) Calcular média, desvio padrão e moda da "Quantidade de Álbuns vendidos"

#Média
#Para calcular a média foi utilizada uma função pronta do Rstudio "mean()" que calcula a média.
media <- mean(dframe$Qnt..de.Albuns.Vendidos)
print(media)

#Desvio Padrao
#Para calcular o desvio padão foi utilizada uma função pronta do Rstudio "sd()" que calcula o desvio padrão.
desvio <- sd(dframe$Qnt..de.Albuns.Vendidos)
print(desvio)

#Moda
#Para calcular a moda foi implementada uma função que, usando o comando "table()", verifica a quantidade de vezes que
# determinado número aparece... caso a quantidade de vezes que cada número aparece for igual a 1, não existe moda, se
# a quantidade de vezes que um determinado número aparece for maior que a dos outros, este número será a moda.
quantVezes <- NULL;
QntAlbuns <- unique(dframe$Qnt..de.Albuns.Vendidos);
moda = 0;
x = 0
for(i in 1:length(QntAlbuns)){
  for (y in 1:41) {
    if (QntAlbuns[i] == (dframe$Qnt..de.Albuns.Vendidos[y])) {
      x = x + 1
    }
  }
  quantVezes[i] <- c(x)
  x = 0
}
aux = quantVezes[1]
moda = 0
mod = 0
for (i in 2:length(QntAlbuns)) {
  if (aux < quantVezes[i]) {
    moda = QntAlbuns[i]
    mod = 1
  }
}
if(mod == 1){ 
  print(moda)
} else {
  print("Não existe moda")
}

#(3) Artistas que lançaram álbuns nos dois anos
# Aqui foram feitos dois arrays: um com artistas que lançaram álbuns em 2019 e outro com os que lançaram álbuns em 2018. Ambos os arrays
# foram feitos com o comando "unique" para que não tivessem artistas repetidos. Depois, com dois "fors", fizemos uma "varredura" procurando
# e printando os artistas que estavam presentes nos dois arrays.
quest3 <- function(){
  vetor3 <- NULL
  artistas19 <- unique(dframe$Artista[26:41])
  artistas18 <- unique(dframe$Artista[1:25])
  pos = 1
  for(i in 1:length(artistas18)){
    if(artistas18[i] %in% artistas19){
      vetor3[pos] <- as.character(artistas18[i]) 
      pos = pos + 1
    }
  }
  return(vetor3)
}
print(quest3())

#(4) Artista com o menor desvio padrão com relação a quantidade de álbuns vendidos
# Aqui iniciamos um vetor "artistas4", com o auxílio do comando "unique", para que o vetor tivesse o nome de todos os artistas, mas sem
# repetições, criamos uma variável auxiliar e nos dois "fors" vamos artista por artista pegando o números de álbuns vendidos e colocando em
# um vetor, posteriormente, com o comando "sd" pegamos o desvio padrão desse vetor. Fazemos esse processo para cada artista e por fim pegamos
# o nome do artista que possuir o menor desvio padrão e printamos ele.

quest4 <- function(){
  artistas4 <- unique(dframe$Artista)
  aux = Inf
  nome <- " "
  vetor = NULL
  for (i in 1:length(artistas4)) {
    pos = 1
    for (j in 1:41) {
      if (dframe$Artista[j] == artistas4[i]) {
        vetor[pos] <- c(dframe$Qnt..de.Albuns.Vendidos[j])
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
  return(nome)
}
print(quest4())

#(5) Álbum que mais vendeu e álbum que menos vendeu
# Inicialmente criamos duas variáveis: "maior" que, com o uso da função "max", pega o maior valor dentre a quantidade de álbuns vendidos e
# "menor" que, com o uso da função "min", pega o menor valor dentre a quantidade de álbuns vendidos.
quest5 <- function(ano){
  if (ano == 2018) {
    maior <- max(dframe$Qnt..de.Albuns.Vendidos[1:25])
    menor <- min(dframe$Qnt..de.Albuns.Vendidos[1:25])
    for (i in 1:41) {
      if (maior == (dframe$Qnt..de.Albuns.Vendidos[i])) {
        pos1 = i
        print(pos1)
      }
      if (menor == (dframe$Qnt..de.Albuns.Vendidos[i])) {
        pos2 = i
      }
    }
    maior1 <- (dframe$Album[pos1])
    maior2 <- (dframe$Artista[pos1])
    menor1 <- (dframe$Album[pos2])
    menor2 <- (dframe$Artista[pos2])
    Álbum[1] <- as.character(maior1)
    Álbum[2] <- as.character(menor1)
    Artista[1] <- as.character(maior2)
    Artista[2] <- as.character(menor2)
    DFAlbuns <- data.frame(
      Álbum ,
      Artista
    )
    return(DFAlbuns)
  } else {
    maior <- max(dframe$Qnt..de.Albuns.Vendidos[26:41])
    menor <- min(dframe$Qnt..de.Albuns.Vendidos[26:41])
    for (i in 1:41) {
      if (maior == (dframe$Qnt..de.Albuns.Vendidos[i])) {
        pos1 = i
      }
      if (menor == (dframe$Qnt..de.Albuns.Vendidos[i])) {
        pos2 = i
      }
    }
    maior1 <- (dframe$Album[pos1])
    maior2 <- (dframe$Artista[pos1])
    menor1 <- (dframe$Album[pos2])
    menor2 <- (dframe$Artista[pos2])
    Álbum[1] <- as.character(maior1)
    Álbum[2] <- as.character(menor1)
    Artista[1] <- as.character(maior2)
    Artista[2] <- as.character(menor2)
    DFAlbuns <- data.frame(
      Álbum ,
      Artista
    )
    return(DFAlbuns)
  }
}
print(quest5(scan()))

#(6)
quest6 <- function(){
  qnt = 1
  ListaNomes <- " "
  for (i in 1:length(artistas4)) {
    pos = 1
    for (j in 1:41) {
      if (dframe$Artista[j] == artistas4[i]) {
        #      vetor[pos] <- c(dframe$Qnt..de.Ã.lbuns.Vendidos[j])
        pos = pos + 1
      }
    }
    if (pos == 2) {
      nome <- artistas4[i]
      ListaNomes[qnt] <- as.character(nome)
      #    print(ListaNomes[qnt])
      #    print(nome)
      qnt = qnt + 1
    }
  }
  return(ListaNomes)
}
print(quest6())

#(7)
Empresas0 <- unique(dframe$Empresa)
print(Empresas0)
QntArtistasEmp = NULL
Empresa1 <- " "
x = 0
for (w in 1:(length(artistas4))) {
  for (y in 1:41) {
    if (artistas4[w] == (dframe$Artista[y])) {
      Empresa1[w] <- as.character(dframe$Empresa[y])
    }
  }
}
DFEmpresas <- data.frame(
  Empresa1 ,
  artistas4
)
for (w in 1:length(Empresas0)) {
  for (y in 1:length(Empresa1)) {
    if (Empresas0[w] == Empresa1[y]) {
      x = x + 1
    }
  }
  QntArtistasEmp[w] <- c(x)
  x = 0
}
DFOUTRO <- data.frame(Empresas0, QntArtistasEmp)
for (i in 1:length(Empresas0)) {
  for (w in 1:(length(QntArtistasEmp) - 1)) {
    if (QntArtistasEmp[w] > QntArtistasEmp[w+1]) {
      x <- QntArtistasEmp[w]
      QntArtistasEmp[w] <- c(QntArtistasEmp[w+1])
      QntArtistasEmp[w+1] <- c(x)
      nome <- as.character(Empresas0[w])
      Empresas0[w] <- as.character(Empresas0[w + 1])
      Empresas0[w+1] <- as.character(nome)
    }
  }
}
DFOUTRO <- data.frame(EMPRESA = Empresas0, Qnt.ARTISTAS = QntArtistasEmp)
print(DFOUTRO)

#(8)
quest8 <- function(){
  primeiro = ""
  primeiroAux = 0
  primeiroVendas = 0
  segundo = ""
  segundoAux = 0
  segundoVendas = 0
  terceiro = ""
  terceiroAux = 0
  terceiroVendas = 0
  artistasAux <- unique(dframe$Artista)
  for(i in 1:length(artistasAux)){
    auxQnt = 0
    auxVendas = 0
    for(j in 1:length(dframe$Artista)){
      if(artistasAux[i] == dframe$Artista[j]){
        auxQnt = auxQnt + 1
        auxVendas = auxVendas + dframe$Qnt..de.Albuns.Vendidos[j]
      }
    }
    if(auxQnt > primeiroAux){
      terceiro = segundo
      terceiroAux = segundoAux
      terceiroVendas = segundoVendas
      segundo = primeiro
      segundoAux = primeiroAux
      segundoVendas = primeiroVendas
      primeiro = dframe$Artista[i]
      primeiroAux = auxQnt
      primeiroVendas = auxVendas
    } else if(auxQnt > segundoAux){
      terceiro = segundo
      terceiroAux = segundoAux
      terceiroVendas = segundoVendas
      segundo = dframe$Artista[i]
      segundoAux = auxQnt
      segundoVendas = auxVendas
    } else if(auxQnt > terceiroAux){
      terceiro = dframe$Artista[i]
      terceiroAux = auxQnt
      terceiroVendas = auxVendas
    }
  }
  ARTISTA = c(as.character(primeiro), as.character(segundo), as.character(terceiro))
  TOTAL_DE_VENDAS = c(primeiroVendas, segundoVendas, terceiroVendas)
  dframe8 <- data.frame(ARTISTA, TOTAL_DE_VENDAS)
  return(dframe8)
}
print(quest8())

#(9)
quest9 <- function(){
  MaiorAlbumEmp <- rep(0, 18)
  MaiorArtistaEmp <- " "
  AlbumEmp <- " "
  for (i in 1:length(Empresas0)) {
    for (y in 1:41) {
      if (Empresas0[i] == (dframe$Empresa[y])) {
        if (MaiorAlbumEmp[i] < dframe$Qnt..de.Albuns.Vendidos[y]) {
          MaiorAlbumEmp[i] <- c(dframe$Qnt..de.Albuns.Vendidos[y])
          MaiorArtistaEmp[i] <- as.character(dframe$Artista[y])
          AlbumEmp[i] <- as.character(dframe$Album[y])
        }
      }
    }
  }
  DFEmpresaAlbum <- data.frame(
    EMPRESA = Empresas0 ,
    ARTISTA = MaiorArtistaEmp ,
    ALBUM = AlbumEmp ,
    Qnt.deVendas = MaiorAlbumEmp
  )
  Auxiliar <- DFEmpresaAlbum
  ordem <- order(DFEmpresaAlbum$Qnt.deVendas, decreasing = TRUE)
  for (i in 1:length(ordem)) {
    Auxiliar$EMPRESA[i] <- DFEmpresaAlbum$EMPRESA[ordem[i]]
    Auxiliar$ARTISTA[i] <- DFEmpresaAlbum$ARTISTA[ordem[i]]
    Auxiliar$ALBUM[i] <- DFEmpresaAlbum$ALBUM[ordem[i]]
    Auxiliar$Qnt.deVendas[i] <- DFEmpresaAlbum$Qnt.deVendas[ordem[i]]
  }
  return(Auxiliar)
}
print(quest9())


#(10)
QntEm2018 <- NULL
QntEm2019 <- NULL
x = 0
for (i in 1:length(Empresas0)) {
  for (y in 1:length(artistas18)) {
    if (Empresas0[i] == dframe$Empresa[y]) {
      x = x + 1
    }
  }
  QntEm2018[i] <- c(x)
  x = 0
}
x = 0
for (i in 1:length(Empresas0)) {
  for (y in 23:41) {
    if (Empresas0[i] == dframe$Empresa[y]) {
      x = x + 1
    }
  }
  QntEm2019[i] <- c(x)
  x = 0
}
DFEmpresaAno <- data.frame(
  EMPRESA = Empresas0 ,
  Ano2018 = QntEm2018 ,
  Ano2019 = QntEm2019
)
hist(DFEmpresaAno$Ano2018, main = "Álbuns lançados em 2018", col = "red")
hist(DFEmpresaAno$Ano2019, main = "Álbuns lançados em 2019", col = "blue")
