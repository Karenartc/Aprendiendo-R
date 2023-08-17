#Cargar el data frame que viene con R
#que contine datos sobre automóviles
data(mtcars)

#Tipo de datos de contiene el Data Frame
str(mtcars)

#Mostrar los primeros 15 registros de Data Frame
head(mtcars, 15)

#Otra forma de ver los primeros 5 registros del Data Frame
mtcars[1:5, ]

#Ver los registros del 2 al 4 en el Data Frame
mtcars[2:4, ]

#Ver los pimeros 5 registros y las columnas 1 (mpg) y 5(drat)
mtcars[1:5, c(1,5)]

#Ver los pimeros 5 registros y las columnas 4, 5 y 8
mtcars[1:5, c(4, 5, 8)]

#Ver los registros del 10 al 15 y las columnas del 6 al 9
mtcars[10:15, 6:9]

#Ver todas las columnas excepto la 1 y la 5
head(mtcars[, -c(1, 5)])

#Ver todas las columnas excepto las del 1 al 5
head(mtcars[, -1:-5])

#Convertirla variable hp (Horse Power) a cv (caballos de vapor)
mtcars$cv <- mtcars$hp * 0.9863
head(mtcars)

#Seleccionar aquellos autos que tiene un hp (Horse Power) superior a 150 hp
mtcars[mtcars$hp>150,]

#Seleccionar aquellos autos que tiene un hp (Horse Power) superior a 100 hp
#y con número de cilindros exactamente igual a 4
mtcars[mtcars$hp>100 & mtcars$cyl==4, ]
