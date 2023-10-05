# Resumen de la U7: Clase Regresión Logística

# Cargamos los datos 
df <- read.csv("NiniosCreativos.csv")

# miramos los primeros 6 registros
head(df)

# miramos los ultimos 6 registros
tail(df)

# miramos la estructura de los datos
str(df)

#install.packages("inspectdf")
library(inspectdf)

inspect_types(df)

# verifica si hay datos faltantes por variable
inspect_na(df)

# eliminamos la primera variable
library(dplyr)
df <- select(df, -ObsNo.)

## La variable Income es de una magnitud muy superior a las demás variables
## Para evitar problemas numéricos de caracter computacional, las dividimos por 1000
## y de esta manera quedan en miles.

df<- mutate(df, Income = Income/1000)

# densidad
library(ggplot2)
ggplot(df, aes(x=Income, fill=factor(Buy))) +
  geom_density(alpha=0.4)
theme_bw()


## Separamos los datos en entrenamiemto (80%) y testing (20%)
set.seed(543219)
#install.packages("caret")
library(caret)
index <- createDataPartition(df$Buy, p=0.8, list=FALSE)

df_train<- df[index,]
df_test <- df[-index,]

str(df_train)

# Ajustamos el modelo
Modelo_full <- glm(Buy ~.,data = df_train, family = binomial)
Modelo_full

# Poner . es equivalente Income + IsFemale + ... + PrevParent

# verificamos si hay variables significativas
summary(Modelo_full)

# Clase Regresión Logística

# Selección de variables

## Ajustemos el Modelo completo (full) y el modelo nulo ##

modelo_full <- glm(Buy ~ .,data = df_train,family = binomial)
modelo_full
modelo_nulo <- glm(Buy ~ 1,data = df_train,family = binomial)
modelo_nulo

### Método forward:
step(modelo_nulo, scope = list(lower = modelo_nulo, upper = modelo_full), direction = "forward")

### Método Backward:
step(modelo_full, data = df_train, direction = "backward")

## Método stepwise:
step(modelo_nulo, scope = list(upper = modelo_full), data = df_train, direction = "both")

# Modelo seleccionado
modelo_sel <- glm(Buy ~ Income + IsMarried + White + IsFemale + PrevChild + 
                    ResLength + Minors + House, family = binomial, data = df_train)

summary(modelo_sel)


# U8 a continuación


# Matriz de confusion, AUC, K-S

# Modelo seleccionado
modelo_sel <- glm(formula = Buy ~ Income + IsMarried + White + IsFemale + PrevChild + 
                    ResLength + Minors + House, family = binomial, data = df_train)

library(caret)
# vamos a calcular la matriz de confusion en la muestra de entrenamiento
prediccionesTrain <- predict(modelo_sel, df_train, type="response")
clase.predTrain <- ifelse(prediccionesTrain >= 0.5, 1, 0)

# resultados
caret::confusionMatrix(as.factor(clase.predTrain), as.factor(df_train$Buy),positive='1')

# vamos a calcular la matriz de confusión en la muestra de testing
prediccionesTest <- predict(modelo_sel, df_test, type="response")
clase.predTest <- ifelse(prediccionesTest >= 0.5, 1, 0)

# resultados
caret::confusionMatrix(as.factor(clase.predTest), as.factor(df_test$Buy),positive='1')

# Gráficos curvas ROC
install.packages("devtools")
devtools::install_github('JianhuaHuang/streamlineR')
library(streamlineR)

perf.auc(model = modelo_sel, df_train, df_test)

install.packages("Rtools")

# Estadistico K-S
install.packages("InformationValue")
library(InformationValue)
# Estadistico K-S en la muestra de entrenamiento
ks_stat(actuals=modelo_sel$y, predictedScores=fitted(modelo_sel))

# Estadistico K-S en la muestra de testing
ks_stat(actuals=df_test$Buy, 
        predictedScores=predict(modelo_sel,newdata=df_test,type="response"))

# test Hosmer-Lemeshow
install.packages("ResourceSelection")
library(ResourceSelection)
hoslem.test(modelo_sel$y,fitted(modelo_sel),g=10)

# grafico para verificar tasas pronosticadas vs tasas observadas
library(streamlineR)
pred.test <- predict(modelo_sel, newdata = df_train, type = 'response') 
perf.decile(actual <- df_train$Buy, pred = pred.test, add.legend = TRUE)

# Validación cruzada k-fold
set.seed(1974)
ctrl <- caret::trainControl(method = "cv" , number = 10)

mod_fit <- caret::train(factor(Buy) ~ Income + IsMarried + White + IsFemale + PrevChild + 
                          ResLength + Minors + House, data=df_train, method="glm", 
                        family="binomial",
                        trControl = ctrl)

mod_fit

set.seed(197423)
ctrl <- caret::trainControl(method = "repeatedcv",
                            number = 10, repeats = 100)

mod_fit <- caret::train(factor(Buy) ~ Income + IsMarried + White + IsFemale + PrevChild + 
                          ResLength + Minors + House, data=df_train, method="glm", 
                        family="binomial",
                        trControl = ctrl)

mod_fit 


# Curva de ganancia y lift chart

# Instalar paquete 'funModeling'
install.packages('funModeling')

# Cargar funModeling
library(funModeling)

head(df_test)

# Obtener los scores/probabilidades de cada fila
df_test$score <- predict(modelo_sel, newdata=df_test, type='response')

# Graficar la curva de ganancia y lift chart
gain_lift(data=df_test, score='score', target=1)









