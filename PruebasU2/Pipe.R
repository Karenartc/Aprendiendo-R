install.packages("dplyr")
library(dplyr)

#Operación anidada, con operaciones básicas de R
X <- c(1, 5, 9, 10)
round(mean(sqrt(log(X))),2)
 
#Operación secuencial, con Pipe
X %>% log() %>% sqrt() %>% mean() %>% round(2)

#Usando el dataframe mtcars, si queremos tomar el promedio de
#mpg y hp para vehículos de 6 y 8 cilindros (cyl)
#y peso (wt) superior a 3000 lbs.

data(mtcars)

#Operación con R
mtcars_aux <- select(mtcars, mpg, hp, cyl, wt)
mtcars_aux <- filter(mtcars_aux, cyl != 4 & wt > 3.000)
mtcars_aux <- group_by(mtcars_aux, cyl)
mtcars_aux <- summarize(mtcars_aux, mean(hp), mean(mpg))
mtcars_aux

#Operación con Pipe
mtcars %>%
  select(mpg, hp, cyl, wt) %>%
  filter(cyl != 4 & wt > 3.000) %>%
  group_by(cyl) %>%
  summarize(mean(hp), mean(mpg))
