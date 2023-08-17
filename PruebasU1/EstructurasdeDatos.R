#Creación de vectores

#vector numérico
c(1, 20, 13, 25, 22, 7)

#vector cadena de texto
c("paga", "fuga", "deudor")

#vector lógico
c(FALSE, FALSE, TRUE, FALSE, TRUE)

#los vectores deben ser del mismo tipo
#veamos que sucede si no sucede
c(1, 4, 8, 10, "fuga")

#Creación de matrices

matrix(c(2, 4, 6, 8), nrow=2, ncol=2)

matrix(c(2, 4, 6, 8, 3), nrow=2, ncol=2)

matrix(c(2, 4, 6, 8), byrow=T, ncol=2)

matrix(c(2, 4, 6, 8, 3), byrow=T, ncol=2)

matrix(c(2, 4, 6, 8, 3, 5), nrow = 3, ncol = 2)

#Creación de arrays

array(1:12, c(2,3,2))

x<-array(c(51, 32, 25, 45, 175, 168, 38, 59, 58, 46, 172, 161), c(2, 3, 2))
x

#Colocarle nombre a los elementos del array
y<-array(c(51, 32, 25, 45, 175, 168, 38, 59, 58, 46, 172, 161), c(2, 3, 2))
dimnames(y)<-list(c("hombres", "mujeres"), c("edad", "peso", "altura"), c("poblacionA", "poblacionB"))
y

#Creación de Data Frames

df <- data.frame(
  "entero" = 1:4,
  "factor" = c("a", "b", "c", "d"),
  "numero" = c(1.2, 3.4, 4.5, 5.6),
  "cadena" = as.character(c("a", "b", "c", "d"))
)
df

#Otro ejemplo de DF

#creamos un vector para cada variable
edad<-c(22, 34, 29, 25, 30, 33, 31, 27, 25, 25)
tiempo<-c(14.21, 10.36, 11.89, 13.81, 12.03, 10.99, 12.48, 13.37, 12.29, 11.92)
sexo<-c("M", "H", "H", "M", "M", "H", "M", "M", "H", "H")

#creamos el data frame
misDatos <- data.frame(edad, tiempo, sexo)
misDatos

#para cambiar los números que cuenta la cantidad de filas
rownames(misDatos) <- c("Maria", "Jose", "Roberto", "Linda", "Sofia", "Juan", "Lila", "Rosa", "Lucas", "Jorge")
misDatos

#Creación de Listas

mi.lista <- list("un_vector" = 1:10,
                 "una_matriz" = matrix(1:14, nrow = 2),
                 "un_df" = data.frame("num" = 1:3, "let" = c("a", "b", "c")))
mi.lista

mi.lista$un_df
mi.lista$un_vector
mi.lista$una_matriz