install.packages("dplyr")
library(dplyr)

data(mtcars)

#Select

#Seleccionar variables por posición, de la primera a la tercera y la quinta:
select(mtcars, 1:3, 5)
#Seleccionar variables mpg y hp:
select(mtcars, c(mpg, hp))
#Seleccionar variables excepto mpg y hp:
select(mtcars, -c(mpg, hp))
#Seleccionar variables cuyo nombre empiecen con c:
select(mtcars, starts_with("c"))
#Seleccionar variables cuyo nombre finalicen con p:
select(mtcars, ends_with("p"))
#Seleccionar variables pasadas por un vector:
vars <- c("mpg", "wt", "carb")
select(mtcars, one_of(vars))

#Filter

# Seleccionar filas según una expresión lógica:
filter(mtcars, cyl==4 & hp>100)
#Seleccionar filas con cyl exactamente igual a 4 o hp mayor a 100:
filter(mtcars, cyl==6 | hp>100)
#Seleccionar filas con mpg entre 15.43 y 22.8 ambos números inclusive:
filter(mtcars, mpg>=15.43 & mpg <= 22.8)
filter(mtcars, between(mpg, 15.43, 22.8))

#Arrange

#Ordenar de menor a mayor según los valores de mpg:
arrange(mtcars, mpg)
#Ordenar de mayor a menor según los valores de la variable mpg:
arrange(mtcars, desc(mpg))
#Ordenar las filas de menor a mayor según los valores mpg (primero) y si hay empates se resuelve con la variable hp:
arrange(mtcars, mpg, hp)

#Rename

#Cambiar el nombre de la variable hp por horse_power
rename(mtcars, horse_power = hp)

#Mutate

#Vamos a crear la variable hp estandarizada hp_est = (hp-mean(hp))/sd(hp):
mutate(mtcars, hp_est = (hp-mean(hp))/sd(hp))

#Group_by y Summarize

#Agrupa los datos por el número de cilindros ("cyl") en el conjunto de datos mtcars y calcula las medias de "mpg" y "hp", así como el número de observaciones para cada grupo de cilindros:
by_cyl <- group_by(mtcars, cyl)
summarise(by_cyl, mean(mpg), mean(hp), n())
