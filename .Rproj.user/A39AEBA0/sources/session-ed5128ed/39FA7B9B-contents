# EJERCICIO 1

temperatura <- read.csv("C:/Users/Tory Ferrer/OneDrive/CHINO (TORY)/ING. LUIS MIGUEL TORIBIO FERRER/DOCTORADO/CLASES/ESTADISTICAS EN LA INVESTIGACION CIENTIFICA/Posgrado_Estadistica_2025/temperatura.csv")
temperatura

temp <- temperatura

View(temp)
head(temp) #primeras 6 filas
dim(temp) #numero de filas y columnas
names(temp) #nombre de las columnas
str(temp) #ver estructura del dataframe 21 obs. of  13 variables

summary(temp) #resumen estadistico
names(temp) <- c("Anual", "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic")

temp$media_anual <- rowMeans(temp[,2:13]) 
#la coma para columnas es antes de los numeros, la coma despues de los numeros son para seleccionar filas
#seleccionar temp[,2:13] y en consola aparece las columnas seleccionadas

head(temp)