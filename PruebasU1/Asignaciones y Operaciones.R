#Creando, asignando vectores y artitmetica de vectores

#crea un vector con 5 componentes
x <- c(1,3, 2, 10, 5)
x

#crea un vector de enteros consecutivos
y <- 1:5
y

#se le suma 2 al vector y
y+2

#se le multiplica 2 al vector y
2*y

#elevamos al cuadrado el vector y
y^2

#Se puede observar que y no ha cambiado
y

#multiplicamos el vector y por 2 y lo asignamos al objeto y
y <- y*2

#ahora si ha sido cambiado y
y

#ojo al manipular objetos con el mismo nombre, guardará el último que haya sido cambiado


#Ahora se operará sobre dos vectores
x <- c(1,3, 2, 10, 5)
y <- 1:5

x+y
x*y
x/y
x^y
#para realizar estas operaciones ambos vectores deben tener la misma cantidad de datos

#suma de los elementos de x
sum(x)

#vector de suma acumulativa
cumsum(x)

#primera diferencia
diff(x)

#segunda diferencia
diff(x, 2)

#maximo
max(x)

#minimo
min(x)

