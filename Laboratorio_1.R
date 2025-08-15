# LABORATORIO 1 - (14/08/2025)

# Sumas

300+240+1527+400+1500+1833

# Crear objetos

celular <- 300
celular
transporte <- 240
comestibles <- 1527
gimnasio <- 400
alquiler <- 1500
otro <- 1833

celular + transporte + comestibles + gimnasio + alquiler + otro

gastomes <- (celular + transporte + comestibles + gimnasio + alquiler + otro)
gastomes
gastomes*5
gastomes*2

# Reglas de nombre objetos

"yo_uso_guion_bajo
otras.personas.usan.punto
OtrosUsanMayusculas"

# Funciones

abs(10)
abs(-4)
sqrt(9)
log(2)

# Comentarios

# Simbolo hashtag #

# Este es un comentario 

# Este es otro comentario

4 + 5 # Esta es una suma, el resutlado es = 9

celular <- 300
Celular <- -300
CELULAR <- 1000

celular + Celular
Celular + CELULAR
Celular * CELULAR / celular

# Buscar ayuda

help(abs)

abs(celular)
abs(CELULAR)
sqrt(celular)
sqrt(CELULAR)
CELULAR * 5

help(mean)
?mean
help.search("absolute")

# AUTOEVALUACION

gastos <- c(celular, transporte, comestibles, gimnasio, alquiler, otro) 
# c() PARA CREAR CONJUNTOS DE DATOS
gastos

barplot(gastos)
?barplot
plot(gastos)
plot(UKDriverDeaths)

sort(gastos) # Sort() acomoda los datos de manera creciente
gastosordenados <- sort(gastos)
barplot(gastosordenados, 
        main="Gastos ordenados",
        col= "red",
        border = "white")

help(sort)

gastosordenados2 <- sort(gastos, decreasing = TRUE) 
# funcion decreasing = true para que sea acomode decreciente

barplot(gastosordenados2, 
        main="Gastos ordenados",
        col= "cyan",
        border = "black")

# Descubrir como poner el nombre de las variables

help(barplot)

names(gastosordenados2) <- c("Otro", "Comestibles", "Transporte", "Gimnasio", "Celular", "Transporte")

help(barplot)

names(gastosordenados2) <- c("Otro", "Comestibles", "Transporte", "Gimnasio", "Celular", "Transporte")

barplot(gastosordenados2, 
        main="Gastos mensuales",
        col= heat.colors(6),
        border = "blue",
        names.arg = names(gastosordenados2))