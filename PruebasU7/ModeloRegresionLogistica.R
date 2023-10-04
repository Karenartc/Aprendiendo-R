# Clase Regresión Logística

# Cargamos los datos 
df <- read.csv("NiniosCreativos.csv")

# miramos los primeros 6 registros
head(df)

# miramos los ultimos 6 registros
tail(df)

# miramos la estructura de los datos
str(df)

install.packages("inspectdf")
library(inspectdf)

inspect_types(df)

# verifica si hay datos faltantes por variable
inspect_na(df)

# eliminamos la primera variable
install.packages("dplyr")
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
install.packages("caret")
library(caret)
index <- createDataPartition(df$Buy, p=0.8, list=FALSE)

df_train<- df[index,]
df_test <- df[-index,]

str(df_train)

# Ajustamos el modelo
Modelo_full <- glm(Buy ~.,data = df_train, family = binomial)
Modelo_full

# .equivalente Income + IsFemale + ... + PrevParent
# Para todos menos una variables . -nombreVariable

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

