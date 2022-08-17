## revisão 01 ##
Animais = c("Cachorro", "Gato", "Peixe", "Peixe", "Lagarto")
Alimentos = c("Pão", "Laranja", "Chocolate", "Cenoura", "Leite")

Animais_Alimentos = data.frame(Animais, Alimentos)
write.csv2(Animais_Alimentos, "animais_alimentos.csv", row.names = FALSE)

remove(Animais_Alimentos)
## aula 02 ##

setwd("/Users/viniciuspierre/Documents/GitHub/aprendendo-r")  
install.packages("tidyverse", dependencies = TRUE)
library("tidyverse")

## oi amigue lucas

cces = read_csv("cces_sample.csv")

cces = drop_na(cces) #apaga os componentes não respondidos

women = filter(cces, gender == 2 & educ == 6) #filtra as molieres pós-graduadas

base_menor = select(women, "educ", "race")
##piping
tudo_numa_so = cces %>% 
  drop_na() %>%
  filter(gender == 2 & marstat == 5 & educ >=4) %>%
  select("race", "educ")

tudo_numa_so = arrange(tudo_numa_so, desc(educ))

recodificada = recode(tudo_numa_so$educ,
                      '4' = "2-year",
                      '5' = "4-year",
                      '6' = "post-grad")

tudo_numa_so$educ = recodificada


agrupado = group_by(cces, race) #tabela dinâmica do excel

tabelaDin = summarise(agrupado, media = mean(faminc_new)) #mean = media

library(knitr)

kable(tabelaDin, caption = "Faixa Média Salarial Anual")

vignette("tidy-data") ## conceito de tidy data

# Análise, os nativos norte americanos, negros e de origem hispânica 
# são os que possuem menor média salarial

#### EXERCÍCIOS ####

#01
sub_cces = select(cces, "educ", "edloan", "employ", "CC18_308a")

#02
trump_approve_disapprove = recode(sub_cces$CC18_308a,
                                  '1' = 1,
                                  '2' = 1,
                                  '3' = 0,
                                  '4' = 0)
sub_cces = rename(sub_cces, "trump_approval" = "CC18_308a")
sub_cces$CC18_308a = trump_approve_disapprove
kable(sub_cces, caption = "Exercício 02")

#03
sub_cces3 = cces %>%
  drop_na() %>%
  filter(employ == 1 & marstat == 1) %>%
  select("pew_religimp")

sumario = summarise(sub_cces3, media = mean(pew_religimp), mediana = median(pew_religimp))
kable(sumario, caption = "Importancia da Religião para Casados/Trab Temp Int")


#download

install.packages("tinytex")
tinytex::install_tinytex()
