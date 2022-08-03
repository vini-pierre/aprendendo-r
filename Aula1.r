print(hello);
hello <- "Derico"
print(hello);

#variaveis
world = c(1,2,3,4)
numero = c("e", "s", "p", "m")
compara = numero == "m"
#tabela
dados = data.frame(numero,world)
#objetos não podem ser iniciados com número, não podem ter espaço no nome

compara

class(hello)
remove(hello)

#para salvar
setwd("/Users/viniciuspierre/Documents/GitHub/aprendendo-r")
#setwd deve ser utilizado para apontar o caminho de onde devem ser salvos os arquivos quanto para leitura
write.csv(dados,"dados.csv", row.names = FALSE)

##################################
gapMinder = read.delim(file = "https://www.stat.ubc.ca/~jenny/notOcto/STAT545A/examples/gapminder/data/gapminderDataFiveYear.txt", header = TRUE)

write.csv(gapMinder,"gapMinder.csv", row.names = FALSE)

#sempre que for usar tem que escrever essa linha
library(readxl)

remove(gapMinder)
#não deu certo
gapminder = read_excel("gapminder.xlsx")

#criar tabela com a quantidade de pais por continente
#obs dividir por 12 por que repete doze vezes cada um
tabela = table(gapMinder$continent)/12

#criar tabela de pizza
pie(tabela)

#criar tabela de barras
barplot(tabela, col = "#FA5FD8")

par(mfrow = c(1,2))
