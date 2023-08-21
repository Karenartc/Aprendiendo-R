#Instalar el paquete ggplot2
install.packages("ggplot2")

#Cargar el paquete en memoria
library(ggplot2)

data(mtcars)

#Crear contenedor
ggplot(data=mtcars, aes(x=hp, y=mpg))

#Agregar puntos
ggplot(data=mtcars, aes(x=hp, y=mpg)) + geom_point()

#Agregar nombre a los ejes y título
ggplot(data=mtcars, aes(x=hp, y=mpg)) + geom_point() + labs(x="Caballos de fuerza", y="millas por galón") + ggtitle("Gráfico de Dispersión")

#Agregar curva de tendencia con banda de confianza
ggplot(data=mtcars, aes(x=hp, y=mpg)) + geom_point() + geom_smooth() + labs(x="Caballos de fuerza", y="millas por galón") + ggtitle("Gráfico de Dispersión")

#Agregar curva de tendencia sin banda de confianza
ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  labs(x = "Caballos de fuerza", y = "millas por galón") +
  ggtitle("Gráfico de Dispersión")

#Graficar algunos estadísticos con la variable cilindrada
ggplot(data = mtcars) + 
    stat_summary(
      mapping = aes(x = as.factor(cyl), y = mpg),
      fun.min = min,
      fun.max = max,
      fun = median
    ) +
    labs(x = "cilindrada", y = "millas pos galón")
