# Igor Domingos da Rocha e Silva - idrs / José Henrique Fernandes Silva - jhfs
#(1)Baixar a planilha: 
#Baixamos a planiha utilizando o comando "read.csv()"
dados <- read.csv("C:\\Users\\jhfs\\Downloads\\Detalhes de Albuns - Página1.csv")
dframe <- data.frame(dados)

#(2) Calcular média, desvio padrão e moda da "Quantidade de Álbuns vendidos"

#MÉDIA
#Para calcular a média foi utilizada uma função pronta do Rstudio "mean()" que calcula a média.
media <- mean(dframe$Qnt..de.Albuns.Vendidos)
print(media)

#DESVIO PADRÃO
#Para calcular o desvio padão foi utilizada uma função pronta do Rstudio "sd()" que calcula o desvio padrão.
desvio <- sd(dframe$Qnt..de.Albuns.Vendidos)
print(desvio)

#MODA
#Para calcular a moda foram feitos dois vetores: "QntAlbuns" que, com a utilização do comando "unique",
# pega todos os valores da coluna "Quantidade de Álbuns vendidos", mas sem repetição, e o vetor
# "quantVezes", utilizado para obter o número de vezes que cada número presente no vetor "QntAlbuns"
# aparece no data frame original. Com isso aquele que aparecer mais vezes será a moda e, caso todos
# apareçam o mesmo número de vezes, é imprimida a frase: "Não existe moda".
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
    aux = quantVezes[i]
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


#(5) Álbum que mais vendeu e álbum que menos vendeu, por ano
# Inicialmente criamos uma função que recebe como parâmetro um ano. Posteriormente fazemos um "if-else"
# para destinguir os anos e saber que intervalo analisar: os álbuns laçados em 2018 e os lançados em 2019.
# Depois, criamos duas variáveis: "maior" que, com o uso da função "max", pega o maior valor dentre a
# quantidade de álbuns vendidos e "menor" que, com o uso da função "min", pega o menor valor dentre a
# quantidade de álbuns vendidos. Depois usando um for procuramos no data frame posição do maior e do
# menor elemento e depois, com essas posições, conseguimos obter o nome dos álbuns e dos artistas
# printando um data frame com os seus nomes.
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


#(6) Lista com artistas que só aparecem uma vez na planiha
# Nesta questão iniciamos um vetor "ListaNomes" e com o auxílio do vetor "artistas4" da questão 4
# (que possui todos os artistas presentes na tabela, porém sem repetição) fazemos um for com o tamanho
# desse vetor de artistas (usando o comanod "length") e um outro for dentro desse último, com o
# equivalente ao das posições da tabela original. Neles contamos com uma variável "pos", quantas
# vezes determinado artista aparece na tabela original. Se ele aparecer apenas uma vez guardamos
# o artista no vetor "ListaNomes" e ao fim da função retornamos esse vetor para ser printado.
quest6 <- function(){
  qnt = 1
  ListaNomes <- " "
  for (i in 1:length(artistas4)) {
    pos = 0
    for (j in 1:41) {
      if (dframe$Artista[j] == artistas4[i]) {
        pos = pos + 1
      }
    }
    if (pos == 1) {
      nome <- artistas4[i]
      ListaNomes[qnt] <- as.character(nome)
      qnt = qnt + 1
    }
  }
  #  list(ListaNomes)
  return(list(ListaNomes))
}
print(quest6())


#(7) Fazer um dataframe com as colunas "EMPRESA" e "NÚMERO DE ARTISTAS", mostrando, em ordem crescente, quantos artistas cada empresa possui
# Aqui inicializamos um vetor "Empresas0", com o comando "unique", para obter o nome de todas as
# empresas, mas sem repetição. Depois dentro de dois "fors" e com o auxílio do vetor "artistas4" 
# (que possui o nome de todos os artistas presentes na tabela original, mas sem repetição), criamos
# e "ligamos" o nome de cada emrpesa com o seu respectivo artista, através da posição deles na
# tabela original e no vetor vetor "artistas4". Depois com dois "fors" e utilizando os vetores
# "Empresas0" e "Empresa1", calculamos quantas vezes as empresas presentes no vetor "Empresas0"
# (sem repetição) aparecem no vetor "Empresa1", o que acaba por nos dar o número de artistas de
# cada empresa. Posteriormente usamos um algoritmo "bouble sort" para ordenar as empresas em ordem
# crescente de acordo com o número de artistas. No fim, criamos e printamos um dataframe de empresas
# e artistas.
Empresas0 <- unique(dframe$Empresa)
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
for (w in 1:length(Empresas0)) {
  for (y in 1:length(Empresa1)) {
    if (Empresas0[w] == Empresa1[y]) {
      x = x + 1
    }
  }
  QntArtistasEmp[w] <- c(x)
  x = 0
}
#Ordenando:
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
DFEmpresas <- data.frame(EMPRESA = Empresas0, Qnt.ARTISTAS = QntArtistasEmp)
print(DFEmpresas)


#(8)Função que retorna os três artistas que mais apareceram na planilha
#E por fim, cria um dataframe com o nome desses artistas e total de vendas de cada um
#A função é pega um array de artistas, sem repetição, e depois percorre o dataframe original,
#para verificar quantas vezes cada artista a pareceu no dataframe original e,
#armazena essa quantidade em uma variavel auxiliar, depois apenas comparamos se essa quantide é maior que a
#quantidade das variáveis principais, se for substituimos o valor da variável principal pela auxiliar
#A função retorna um array (com os nomes dos três artistas), para criar o dataframe verificamos o total de
#vendas de ca um e guardamos essas informações um array, por fim geramos o dataframe.
quest8 <- function(){
  primeiro = ""
  primeiroAux = 0
  segundo = ""
  segundoAux = 0
  terceiro = ""
  terceiroAux = 0
  artistasAux <- unique(dframe$Artista)
  for(i in 1:length(artistasAux)){
    auxQnt = 0
    for(j in 1:length(dframe$Artista)){
      if(artistasAux[i] == dframe$Artista[j]){
        auxQnt = auxQnt + 1
      }
    }
    if(auxQnt > primeiroAux){
      terceiro = segundo
      terceiroAux = segundoAux
      segundo = primeiro
      segundoAux = primeiroAux
      primeiro = dframe$Artista[i]
      primeiroAux = auxQnt
    } else if(auxQnt > segundoAux){
      terceiro = segundo
      terceiroAux = segundoAux
      segundo = dframe$Artista[i]
      segundoAux = auxQnt
    } else if(auxQnt > terceiroAux){
      terceiro = dframe$Artista[i]
      terceiroAux = auxQnt
    }
  }
  res <- c(as.character(primeiro), as.character(segundo), as.character(terceiro))
  return(res)
}

artistas8 <- quest8()
totalVendas <- rep(0, 3)
for(i in 1:3){
  auxVendas = 0
  for(j in 1:41){
    if(artistas8[i] == dframe$Artista[j]){
      auxVendas = auxVendas + dframe$Qnt..de.Albuns.Vendidos[j]
    }
  }
  totalVendas[i] = auxVendas
}

ARTISTA <- artistas8 
TOTAL_DE_VENDAS <- totalVendas
dframe8 <- data.frame(ARTISTA, TOTAL_DE_VENDAS)
print(dframe8)

#(9)
quest9 <- function(){
  Empresas0 <- unique(dframe$Empresa)
  MaiorAlbumEmp <- rep(0, length(Empresas0))
  
  AlbumEmp <- NULL
  for (i in 1:length(Empresas0)) {
    for (y in 1:41) {
      if (Empresas0[i] == (dframe$Empresa[y])) {
        if (MaiorAlbumEmp[i] < dframe$Qnt..de.Albuns.Vendidos[y]) {
          MaiorAlbumEmp[i] <- dframe$Qnt..de.Albuns.Vendidos[y]
          AlbumEmp[i] <- as.character(dframe$Album[y])
        }
      }
    }
  }
  return(AlbumEmp)
}

vetorAlbuns <- quest9()

Empresas0 <- unique(dframe$Empresa)
MaiorAlbumEmp <- rep(0, 18)
MaiorArtistaEmp <- " "
for(i in 1:length(vetorAlbuns)){
  for(j in 1:length(dframe$Album)){
    if(vetorAlbuns[i] == dframe$Album[j]){
      MaiorAlbumEmp[i] <- c(dframe$Qnt..de.Albuns.Vendidos[j])
      MaiorArtistaEmp[i] <- as.character(dframe$Artista[j])
    }
  }
}

DFEmpresaAlbum <- data.frame(
  EMPRESA = Empresas0 ,
  ARTISTA = MaiorArtistaEmp ,
  ALBUM = vetorAlbuns ,
  Vendas = MaiorAlbumEmp
)

Auxiliar <- DFEmpresaAlbum
ordem <- order(DFEmpresaAlbum$Vendas, decreasing = TRUE)
for (i in 1:length(ordem)) {
  Auxiliar$EMPRESA[i] <- DFEmpresaAlbum$EMPRESA[ordem[i]]
  Auxiliar$ARTISTA[i] <- DFEmpresaAlbum$ARTISTA[ordem[i]]
  Auxiliar$ALBUM[i] <- DFEmpresaAlbum$ALBUM[ordem[i]]
  Auxiliar$Vendas[i] <- DFEmpresaAlbum$Vendas[ordem[i]]
}
DFEmpresaAlbum <- Auxiliar

print(DFEmpresaAlbum)


#(10) Função que recebe um nome de uma empresa e retorna um histograma com a frenquência de lançamentos de álbuns
#Para construirmos o histograma usamos a função hist, o histograma mostra a frenquência de lançamendos de álbuns
#nos anos de 2018 e 2019, para isso passamos um como argumendo da função hist, um array com os anos em que a 
#empresa lançou algum álbum.
quest10 <- function(empresa){
  anos <- NULL
  pos <- 1
  for(i in 1:length(dframe$Empresa)){
    if(dframe$Empresa[i] == empresa){
      anos[pos] <- dframe$Ano[i]
      pos = pos + 1
    }
  }
  if(length(anos) >= 1){
    hist(anos, main = c("Empresa:", empresa), col = c("darkblue", "blue"), border = "black",xlim = c(2016,2021),breaks = 2, xlab = "Anos", ylab = "Frequência de álbuns lançados")  
  } else {
    print("Erro: Empresa inválida !")
  }
}
quest10("JYP")
