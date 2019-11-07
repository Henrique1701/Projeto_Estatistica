install.packages("modes")
caminho <- file.path("C:", "Users", "jhfs", "Documents", "detalhes.csv")

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
for(i in 1:41){
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
match("TWICE", dfDetalhes$Artista)
dfDetalhes$Artista  %in% "TWICE"
match(dfDetalhes$Artista  %in% "TWICE", TRUE)
match(dfDetalhes$Artista, "TWICE")
print(dfDetalhes$Artista)
sd(dfDetalhes$Qnt..de.Albuns.Vendidos)
for(i in 1:41){
  for(j in 1:41){
    
  }
}

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
