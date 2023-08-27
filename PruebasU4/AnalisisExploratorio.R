#Análisis exploratorio de Datos y de Correlaciones

#Definir área de trabajo
setwd("D:\\Data Science UAI\\LenguajeR\\PruebasU4")

#Cargar los datos del archivo de BankRevenue.cvs que se encuentra en la carpeta de trabajo a RStudio
df <- read.csv("BankRevenue.csv", header=T)

#Descargar y cargar ggplot2
install.packages("ggplot2")
library(ggplot2)

#Gráfico de los ingresos totales
g1 <- ggplot(df) + 
  geom_histogram(aes(Rev_Total), colour="black", fill="green") +
  labs(x="Ingresos Totales", y="Frecuencia", title="Distribución de los Ingresos Totales") +
  theme_bw()

#Gráficamos un boxplot y se guarda en el objeto g2
g2 <- ggplot(df, aes(x=Rev_Total, y='')) +
  geom_boxplot(fatten=2) +
  geom_jitter(alpha=1/10, width=0, height = 0.30) +
  theme_bw() +
  labs(title = "Boxplot + Jitter - Rev_Total") +
  theme(
    plot.margin = unit(c(1,0.4,0.4,2.4), "lines"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank()
  )
  
#Descargar y cargar gridExtra para aplicar gráficos
install.packages("gridExtra")
library(gridExtra)

grid.arrange(g1,g2,nrow=2,ncol=1)

#Sobreponer sobre el histograma una curva de densidad
ggplot(df, aes(x=Rev_Total)) +
  geom_histogram(aes(y=..density..), fill="green", alpha=0.5, bins=100) +
  geom_density(color="red") + xlab(expression(bold("Revenue"))) +
  theme_bw() +
  labs(title="Distribución de los Ingresos Totales",
       x= "Ingresos Totales",
       y = "Densidad")

#moments
install.packages("moments")
library(moments)

#Estadísticos de asimetría y curtosis
moments::skewness(df$Rev_Total)
moments::kurtosis(df$Rev_Total)

#Gráfico de los ingresos en escala logaritmica
g1 <- ggplot(df) +
  geom_histogram(aes(log(Rev_Total)), colour="black", fill="green") +
  labs(x="Log Ingresos Totales", y="Frecuencia",
       title = "Distribución del Log de los Ingresos Totales") +
  theme_bw()

g2 <- ggplot(df, aes(x=log(Rev_Total), y='')) +
  geom_boxplot(fatten=2) +
  geom_jitter(alpha = 1/10, width=0, height=0.30) +
  theme_bw() +
  labs(title = "Boxplot + Jitter de log(Rev_Total)") +
  theme(
    plot.margin = unit(c(1, 0.4, 0.4, 2.4), 'lines' ),
    axis.title.x = element_blank(),
    axis.text.y=element_blank(),
    axis.title.y=element_blank(),
    axis.ticks.y=element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank())

grid.arrange(g1, g2, nrow = 2, ncol=1)

#Estadísticos de asimetría y curtosis del log Rev_Total
moments::skewness(log(df$Rev_Total))
moments::kurtosis(log(df$Rev_Total))

#dplyr
install.packages("dplyr")
library(dplyr)



