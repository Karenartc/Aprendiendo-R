#Importar Datos

#Descargar archivos desde internet
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/statlog/german/german.data-numeric"
download.file(url = url, destfile = "german.data")

#Leer archivos del internet
german_credit <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/statlog/german/german.data-numeric")
head(german_credit)

#Descargar archivo y utilizar la función read.table
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/statlog/german/german.data-numeric"
prueba <- read.table(url)
head(prueba)

#Información sobre la estructura del Data Frame
str(german_credit)

#Leer archivos de otras fuentes

#csv
my.frame <- read.csv(file="csv.csv", header=FALSE, sep=",")
head(my.frame)

#xlsx
install.packages("readxl")
library(readxl)
df_excel <- read_excel (path= "archivo_xlsx.xlsx", sheet = 1)
head(df_excel)

#Exportar datos

#archivo txt
write.table(x=german_credit, file="datoexportado.txt", sep= ",", row.names=FALSE, col.names=TRUE)

#archivo csv
write.csv(x=german_credit, file="datoexportado.csv", row.names=FALSE)
