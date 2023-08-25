# instalar paquete splitTools
install.packages("splitTools")

# cargar en memoria paquete splitTools
library(splitTools)

#Observar algunas instancias de la data a utilizar
head(mtcars, 15)

#Dividir datos entre particiones
set.seed(3451)
inds <- partition(mtcars$mpg, p= c(train=0.6, valid=0.2, test=0.2))

#Resumen de lo que contiene la variable
str(inds)

#Seleccionamos las muestras
train <- mtcars[inds$train, ]
valid <- mtcars[inds$valid, ]
test <- mtcars[inds$test, ] 


#Dividimos la data solo en muestras de entrenamiento y testing
set.seed(7812)
inds <- partition(mtcars$mpg, p = c(train = 0.8, test = 0.2))
train <- mtcars[inds$train, ]
test <- mtcars[inds$test, ] 
