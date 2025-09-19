# lUIS MIGUEL TORIBIO FERRER
#**04/09/2025**
# Semana 5-Media Móvil
# Media móvil para determinar el n ideal rrespecto a la población

data("iris")
View(iris)

setosa <- subset(iris, Species == "setosa")
View(setosa)

# Sumatoria acumulada de la variable longitud

acum <- cumsum(setosa$Sepal.Length)
acum # Sumatoria acumulada
cont <- seq(1:length(setosa$Sepal.Length)) # Continuidad
cont

# Crear data.frame --------------------------------------------------------

set_mov <- data.frame(cont, acum)
View(set_mov)
set_mov$movil <- round(acum/cont,2)

plot(cont, set_mov$movil, type = "l",
     xlab = "Número de observaciones",
     ylab = "Media móvil")
abline(h=mean(setosa$Sepal.Length),
       col = "indianred")

mean(setosa$Sepal.Length)