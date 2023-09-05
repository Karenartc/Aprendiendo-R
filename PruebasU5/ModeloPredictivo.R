#Análisis exploratorio de Datos

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

#Creamos la variable log(Rev_Total) en el data frame 'df'
df$logRev_Total <- log(df$Rev_Total)

#Grafico de variable Bal_Total
g1 <- ggplot(df, aes(x = Bal_Total)) +
  geom_histogram(aes(y = ..density..), fill = 'green', alpha = 0.5, bins = 50) +
  theme_bw() +
  labs(title = "Distribución del Bal_Total",
       x = "Bal_Total",
       y = "Densidad")

g2 <- ggplot(df, aes(x=Bal_Total, y='')) +
  geom_boxplot(fatten=2) +
  geom_jitter(alpha = 1/10, width=0, height=0.30) +
  theme_bw() +
  labs(title = "Boxplot + Jitter de Bal_Total") +
  theme(
    plot.margin = unit(c(1, 0.4, 0.4, 3.8), 'lines' ),
    axis.title.x = element_blank(),
    axis.text.y=element_blank(),
    axis.title.y=element_blank(),
    axis.ticks.y=element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank())

grid.arrange(g1, g2, nrow = 2, ncol=1)

#Asimetria y curtosis
moments::skewness(df$Bal_Total)
moments::kurtosis(df$Bal_Total)

# Bal_Total en Escala Logaritmica
g1 <- ggplot(df, aes(x = log(Bal_Total))) +
  geom_histogram(aes(y = ..density..), fill = 'green', alpha = 0.5, bins = 50) +
  geom_density(colour = 'blue') + xlab(expression(bold('Revenue'))) +
  theme_bw() +
  labs(title = "Distribución del Log(Bal_Total)",
       x = "Bal_Total",
       y = "Densidad")

g2 <- ggplot(df, aes(x=log(Bal_Total), y='')) +
  geom_boxplot(fatten=2) +
  geom_jitter(alpha = 1/10, width=0, height=0.30)+
  theme_bw()+
  labs(title = "Boxplot + Jitter del Log(Bal_Total)")+
  theme(
    plot.margin = unit(c(1, 0.4, 0.4, 2.8), 'lines' ),
    axis.title.x = element_blank(),
    axis.text.y=element_blank(),
    axis.title.y=element_blank(),
    axis.ticks.y=element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank())

grid.arrange(g1, g2, nrow = 2, ncol=1)

#Asimetria y Curtosis
moments::skewness(log(df$Bal_Total))
moments::kurtosis(log(df$Bal_Total))

# creamos la variable log(Bal_Total)
df$logBal_Total <- log(df$Bal_Total)

# Variables AGE y AccountAge

# Histograma AGE
g1 <- ggplot(df, aes(x=AGE)) +
  geom_histogram(aes(y = ..density..), bins=21, fill = 'green', alpha = 0.5) +
  geom_density(colour = 'blue') +
  ggtitle('Distribución de AGE') +
  theme_bw() +
  theme(
  axis.title.x = element_blank(),
  axis.text.y=element_blank(),
  axis.title.y=element_blank(),
  axis.ticks.y=element_blank(),
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(),
  panel.background = element_blank())

# Histograma AccountAge
g2 <- ggplot(df, aes(x=AccountAge)) +
  geom_histogram(aes(y = ..density..), bins=27, fill = 'green', alpha = 0.5) +
  geom_density(colour = 'blue') +
  ggtitle('Distribución de AccountAge')+
  theme_bw()+
  theme(
    axis.title.x = element_blank(),
    axis.text.y=element_blank(),
    axis.title.y=element_blank(),
    axis.ticks.y=element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank())

# Boxplot AGE
g3 <- ggplot(df, aes(x=AGE, y='')) +
  geom_boxplot(fatten=2) +
  geom_jitter(alpha = 1/20, width=0, height=0.25)+
  ggtitle('Boxplot + Jitter de AGE')+
  theme_bw()+
  theme(
    axis.title.x = element_blank(),
    axis.text.y=element_blank(),
    axis.title.y=element_blank(),
    axis.ticks.y=element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank())

# Boxplot AccountAge
g4 <- ggplot(df, aes(x=AccountAge, y='')) +
  geom_boxplot(fatten=2) +
  geom_jitter(alpha = 1/70, width=0, height=0.25)+
            ggtitle('Boxplot + Ji[er de AccountAge')+
            theme_bw()+
            theme(
              axis.title.x = element_blank(),
              axis.text.y=element_blank(),
              axis.title.y=element_blank(),
              axis.ticks.y=element_blank(),
              panel.grid.major = element_blank(),
              panel.grid.minor = element_blank(),
              panel.background = element_blank())

grid.arrange(g1, g2, g3, g4, nrow = 2, ncol=2)


#Gráfico de Correlaciones


#dplyr
install.packages("dplyr")
library(dplyr)

#Del data frame df eliminamos las variables "Rev_Total" y "Bal_Total"
df <- select(df, -c("Rev_Total","Bal_Total"))

#Variables Categóricas
par(mfrow=c(2,6))

barplot(table(df$CHQ), ylim=c(0,7000), main = 'CHQ', cex.names=1.7, cex.main = 1.5)
barplot(table(df$CARD), ylim=c(0,7000), main = 'CARD', cex.names=1.7, cex.main = 1.5)
barplot(table(df$Check), ylim=c(0,7000), main = 'Check', cex.names=1.7, cex.main = 1.5)
barplot(table(df$SAV1), ylim=c(0,7000), main = 'SAV1', cex.names=1.7, cex.main = 1.5)
barplot(table(df$LOAN), ylim=c(0,7000), main = 'LOAN', cex.names=1.7, cex.main = 1.5)
barplot(table(df$CD), ylim=c(0,7000), main = 'CD', cex.names=1.7, cex.main = 1.5)
barplot(table(df$Offer), ylim=c(0,7000), main = 'Offer', cex.names=1.7, cex.main = 1.5)
barplot(table(df$PENS), ylim=c(0,7000), main = 'PENS', cex.names=1.7, cex.main = 1.5)
barplot(table(df$MORT), ylim=c(0,7000), main = 'MORT', cex.names=1.7, cex.main = 1.5)
barplot(table(df$INSUR), ylim=c(0,7000), main = 'INSUR', cex.names=1.7, cex.main = 1.5)
barplot(table(df$MM), ylim=c(0,7000), main = 'MM', cex.names=1.7, cex.main = 1.5)
barplot(table(df$Savings), ylim=c(0,7000), main = 'Savings', cex.names=1.7, cex.main = 1.5)

# Tabla 2 x 2
table(df$CD, df$LOAN)
table(df$Savings, df$MM)

#Corrplot
install.packages("corrplot")
library(corrplot)

#grafico de correlaciones
corrplot(cor(df),type="upper")

#grafico de dispersión con linea de tendencia
ggplot(data=df, aes(x=AGE, y=logRev_Total)) + geom_point() + geom_smooth() +
  theme_bw() +
  labs(title = "Gráfico Dispersión AGE vs Log_Rev_Total",
       x = "AGE",
       y = "Log Rev_Total")

ggplot(data=df, aes(x=logBal_Total, y=logRev_Total)) + geom_point() +
  geom_smooth() + theme_bw() +
  labs(title = "Gráfico Dispersión Log Bal_Total vs Log Rev_Total",
       x = "Log Bal_Total",
       y = "Log Rev_Total")

ggplot(data=df, aes(x=AccountAge, y=logRev_Total)) + geom_point() +
  geom_smooth() + theme_bw() +
  labs(title = "Gráfico Dispersión AccountAge vs Log Rev_Total",
       x = "AccountAge",
       y = "Log Rev_Total")

# Correlación: gráfica entre logRev_Total y Offer
ggplot(df, aes(x = logRev_Total, y = as.factor(Offer))) +
  geom_boxplot(fill = "indianred1") +
  theme_bw() +
  theme(text = element_text(size = 12),
        axis.text.x = element_text(size = 11),
        panel.grid.minor = element_blank()) +
  coord_flip() +
  labs(Ktle = "Correlación Log_Rev_Total vs Offer",
       x = "Log Rev_Total",
       y = "Offer")

#Estadístico de Cohen
(mean(df$logRev_Total[df$Offer == 0])- mean(df$logRev_Total[df$Offer == 1]))/sd(df$logRev_Total)

#Lo visto en la U4
#De aqui en adelante continuaremos el ejercicio, esto constituye la U5

#Muestras de entrenamiento y Testing
set.seed(3456)
indices <- sample(1:nrow(df),size=floor(0.8 * nrow(df)))
train <- df[indices,]
test <- df[-indices,]

#Ajustamos el modelo a la data de entrenamiento
modelo <- lm(logRev_Total~.,data=train)
modelo 

summary(modelo)

#Ajustamos el modelo a la data de entrenamiento sin las variables CD, MM y Savings
modelo <- lm(logRev_Total ~ . - CD - MM - Savings, data = train)

summary(modelo)

