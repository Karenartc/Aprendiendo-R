x <- 2
y <- 3
objects()
ls()
rm(x)
objects()
ls()
x <- 2
objects()
#borrar todos los objetos
rm(list=ls())
ls()
objects()

#Guardamos workspace
save.image("PruebaDirectorio.R")

#Cargar en un nuevo proyecto
load("PruebaDirectorio.R")

#Nota, debes encontrarte en el mismo directorio donde lo guardaste

#ver archivos
list.files()

#ver carpetas del directorio de trabajo
list.dirs()

#Coerción

as.integer(TRUE)
as.integer(FALSE)

as.numeric(2L)

as.character(10)
as.character("diez")

as.numeric("diez")
#El warning se entrega porque no se está cumpliendo el orden de coerción.
#No puedes convertir textos en números.

as.factor(10)
as.factor("diez")

#Verificar el tipo de un dato
class(12L)
class(12)
class("12")
class("doce")
class(TRUE)

#Verificar el tipo de un dato con is()
is.numeric(10L)
is.numeric(10)
is.integer(10)
is.integer(10L)
is.character(10)
is.character("10")
is.character("diez")

