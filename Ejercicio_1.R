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


# SEMANA 3 ----------------------------------------------------------------

# SEMANA 3

# Graficar con Boxplot

boxplot(temp) # no funciona asi

temp1 <- temp[ ,2:13] # dejamos solo las columnas de los meses desde ene-dic

colores <- c("steelblue3", "steelblue3", "steelblue3",   # azul
             "springgreen3", "springgreen3", "springgreen3", # verde
             "goldenrod2", "goldenrod2", "goldenrod2",   # dorado/amarillo
             "tomato2", "tomato2", "tomato2")            # rojo-anaranjado


boxplot(temp1,
        main= "Comportamiento Temperatura (2000-2021)",
        xlab ="Mes",
        ylab ="Temperatura (°C)",
        col= colores,
        border = "black")

temp10 <- temp[11:20 ,2:13]

boxplot(temp10,
        main= "Comportamiento Temperatura (2010-2020)",
        xlab ="Mes",
        ylab ="Temperatura (°C)",
        col= terrain.colors(12),
        border = "black")

write.csv(temp, "temp_final.csv")

# 21/08/2025

# Importar datos ----------------------------------------------------------

# Shift+Ctrl+R para agregar una seccion

# Si el csv esta en mi carpeta de proyecto, solo se ocupa leer el nombre del archivo
datos <- read.csv("inspeccionmovilizacion.csv")
View(datos)

# Para abrir una BD desde un link 
url <- "https://repodatos.atdt.gob.mx/api_update/senasica/actividades_inspeccion_movilizacion/29_actividades-inspeccion-movilizacion.csv" 
senasica <- read.csv(url, header = T)
# Header = True para que la primera fila la tome como las variables

head(senasica[1:6,2:12])
