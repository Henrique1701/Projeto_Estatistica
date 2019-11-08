install.packages("modes")
caminho <- file.path("E:", "Users", "jhfs", "Documents", "detalhes.csv")

#(1)
dados <- read.csv(caminho)
dfDetalhes <- data.frame(dados)
dfDetalhes

#(2)
#Media
media <- mean(dfDetalhes$Qnt..de.Albuns.Vendidos)
print(media)
#Desvio padrao
desvio <- sd(dfDetalhes$Qnt..de.Albuns.Vendidos)
print(desvio)
#Moda
quantVezes = 0;
moda = 0;
t <- table(dfDetalhes$Qnt..de.Albuns.Vendidos[1])
t(1)
for(i in 1:41){
  print(table(dfDetalhes$Qnt..de.Albuns.Vendidos[i]))
  if(table(dfDetalhes$Qnt..de.Albuns.Vendidos[i]) > quantVezes){
    quantVezes <- table(dfDetalhes$Qnt..de.Albuns.Vendidos[i])
    moda <- dfDetalhes$Qnt..de.Albuns.Vendidos[i]
  }
}
if(moda == 1){
  print(moda)
} else {
  print("Não possui moda")
}


#(3)
artistas19 <- unique(dfDetalhes$Artista[26:41])
artistas18 <- unique(dfDetalhes$Artista[1:25])
for(i in 1:length(artistas18)){
  if(artistas18[i] %in% artistas19){
    print(artistas18[i])
  }
}

#(4)
menorSD = 0
artistaAux = ""
vetorAux = NULL
primeiroAux = 1
vetorArtistas <- unique(dfDetalhes$Artista)
for(i in 1:length(vetorArtistas)){
  pos = 1
  for(j in 1:41){
    if(vetorArtistas[i] == dfDetalhes$Artista[j]){
      vetorAux[pos] <- c(dfDetalhes$Qnt..de.Albuns.Vendidos[j])
      pos = pos+1
    }
  }
  print(vetorAux)
  #print(length(vetorAux))
  
  if(length(vetorAux) > 1){
    #print(vetorArtistas[i])
    #print(sd(vetorAux))
    if(primeiroAux == 1){
      primeiroAux = 0
      menorSD <- sd(vetorAux)
      artistaAux <- dfDetalhes$Artista[i]
    } else if (sd(vetorAux) < menorSD){
      menorSD <- sd(vetorAux)
      artistaAux <- dfDetalhes$Artista[i]
    }
  }
  vetorAux = NULL
}
print(artistaAux)

#Testes:
help("data.frame")
plot(dfDetalhes$Artista, dfDetalhes$Album)
artistas19 <- unique(dfDetalhes$Artista[26:41])
artistas18 <- unique(dfDetalhes$Artista[1:25])
#match("Henrique", artistas19)
artistas <- c(artistas18, artistas19)
aaaaaaaa <- c(artistas18, artistas19)
print(aaaaaaaa)
print(artistas18)
print(dfDetalhes)
