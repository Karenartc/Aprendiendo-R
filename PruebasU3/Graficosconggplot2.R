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

#Graficar con un barplot para variables categóricas
ggplot(data=mtcars, aes(x=gear, fill=as.factor(gear))) +
    geom_bar() +
    labs(x="Número de marchas", y="Frecuencia", fill="# de marchas")+
    ggtitle("Gráfico de Barras")

#Cambiamos el fondo
ggplot(data=mtcars, aes(x=gear, fill=as.factor(gear))) +
  geom_bar() +
  labs(x="Número de marchas", y="Frecuencia", fill="# de marchas")+
  ggtitle("Gráfico de Barras") +
  theme_minimal()

#Graficar Histograma
ggplot(data = mtcars) +
  geom_histogram(aes(x=mpg)) +
  labs(x="Millas por galón", y="Frecuencia") +
  theme_minimal()

#Graficar un boxplot
ggplot(data=mtcars) +
  geom_boxplot(aes(y=mpg)) +
  labs(y="Millas por galón") +
  ggtitle("Boxplot") +
  theme_minimal()

#Graficamos un boxplot para cada nivel de cilindrada
ggplot(data = mtcars) +
  geom_boxplot(aes(x = as.factor(cyl), y = mpg)) +
  labs(y = "Millas por galón", x="Número de cilindros") +
  ggtitle("Boxplot") +
  theme_minimal()

#Graficamos un boxplot para cada nivel de cilindrada, con leyenda
ggplot(data = mtcars) +
  geom_boxplot(aes(x = as.factor(cyl), y = mpg,
                   fill = as.factor(cyl))) +
  labs(y = "Millas por galón", x="Número de cilindros",
       fill = "# cilindros") +
  ggtitle("Boxplot") +
  theme_minimal()

#Graficamos usando facet
ggplot(mtcars, aes(x=disp, y=mpg, color=as.factor(cyl))) +
  geom_point(alpha=0.8) +
  geom_smooth(method="lm",colour="red") +
  labs(y = "millas por galón",
       x = "Cilindrada del motor en cm^3",
       color="# cilindros") +
  facet_grid(.~am,margins = TRUE)
