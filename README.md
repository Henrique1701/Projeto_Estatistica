PROJETO II
Atividade em R
Estatística para Computação 2019.2 - et586cc
1. Informações gerais: O segundo projeto de Estatística para Computação 2019.2 será realizado na plataforma R Studio, a qual foi abordada em sala de aula. O projeto vale 70% da 3ª nota da cadeira, sendo os outros 30% preenchidos pelo projeto I de seminários sobre a aplicação da estatística na computação.

2. O projeto: Deve ser feito em grupos de no máximo 3 alunos. Não aceitaremos projetos com mais integrantes. Será disponibilizada uma planilha onde deverá ser colocado o(s) nome(s) do(s) integrante(s) juntamente com seu(s) login(s).

O projeto consiste em elaborar um script que responda todas as questões pedidas a seguir referentes a planilha de “Detalhes de Álbuns”. A planilha deve ser baixada como arquivo .csv para ser carregada no R. A nota do projeto será proporcional a quantidade de questões solucionadas corretamente.

É importante:

Colocar o nome dos integrantes no início do script na forma de comentário.

 	Ex: # Rebeca Oliveira Silva (ros4) ----------------------------

Comentar antes que questão será resolvida no script, para facilitar a correção. Também é válido explicar seu raciocínio através de comentários.

Ex: # início da questão (1) ---------------------------------
      # nessa questão, o problema da média foi resolvido da seguinte forma (...)

É necessário imprimir a resposta encontrada a cada questão resolvida. Se a questão pede a média de uma certa amostra, após realizar a função, você deve imprimir o resultado dessa função.
Pode utilizar as funções prontas do R (média, desvio padrão etc).
Não é permitido copiar totalmente ou parcialmente a resolução de outras equipes. Caso ocorra, ambas serão penalizadas.




3. As questões:  A seguir as questões que devem ser resolvidas:

Descarregue o arquivo .csv da planilha e imprima o dataframe obtido exatamente do jeito que ele se encontra.
Encontre a média, o desvio padrão e a moda das vendas do total de álbuns.
Faça uma função que retorna os nomes dos artistas que lançaram álbuns nos dois anos (ou seja, o mesmo artista lançou um ou mais álbuns em 2018 e em 2019).
Faça uma função que retorne qual artista possui o menor desvio padrão nas vendas.
Faça uma função que retorne o nome do álbum que mais vendeu e o que menos vendeu ao dar um ano de lançamento (retorne também o nome dos artistas correspondentes a cada álbum).
Faça uma função que retorne uma lista com os artistas que só apareceram uma vez na planilha, indicando também o ano que cada um aparece.
Faça um dataframe com as colunas EMPRESA, NÚMERO DE ARTISTAS que mostra quantos artistas cada empresa possui (lembrando que um mesmo artista pode aparecer mais de uma vez na planilha). Coloque em ordem crescente do número de artistas.
Elabore uma função que retorna os 3 artistas que mais aparecem na planilha, para em seguida fazer um dataframe desses artistas com as colunas ARTISTA, TOTAL DE VENDAS onde a última coluna deve ser a soma de todas as vendas do artista. Faça por ordem decrescente de vendas.
Elabore uma função que retorna o nome do álbum que mais vendeu de cada empresa. Por fim, faça um dataframe com as colunas EMPRESA, ARTISTA, ÁLBUM, VENDAS que mostra o álbum mais vendido de cada empresa, por ordem decrescente de vendas.
Faça uma função que ao receber o nome de uma empresa, cria um histograma onde mostra a frequência de álbuns lançados pela empresa de acordo com o ano. Não esqueça de dar um título e fazer ele de forma colorida, facilitando a visualização.

4. A entrega: A apresentação do projeto será feita nos dias 11 e 13 de Novembro. Cada grupo terá seu dia de apresentar, não precisando ir no outro dia (por exemplo, se você apresentar dia 13 não precisa aparecer no dia 11). As datas de apresentação de cada grupo ficarão disponíveis na planilha, mas TODOS os arquivos(.R) dos projetos de todos os grupos devem ser enviados até às 8h do dia 11 de Novembro por email com o assunto [PROJETO 2 ESTATÍSTICA]  para o email ros4@cin.ufpe.br. A apresentação será feita para um monitor que esteja disponível. Entregas e apresentações depois dessas datas irão valer menos. Qualquer dúvida entre em contato com os monitores.

