# Script 4
# 28/08/2025
# Luis Miguel Toribio Ferrer


# Importar ----------------------------------------------------------------


calidad <- read.csv("calidad_plantula.csv", header = T)
View(calidad)
calidad$Tratamiento <- as.factor(calidad$Tratamiento)
class(calidad$Tratamiento)
summary(calidad)

mean(calidad$IE)

tapply(calidad$IE, calidad$Tratamiento, mean)
tapply(calidad$IE, calidad$Tratamiento, sd)
tapply(calidad$IE, calidad$Tratamiento, var)

colores <-c ("navajowhite", "salmon")

# Crear un boxplot calidad
boxplot (calidad$IE~ calidad$Tratamiento, col = colores,
         main = "Efecto de Fertilizante",
         xlab = "Tratamiento", 
         ylab = "Indice de esbeltez",
         ylim = c(0.4,1.2))

# Observar datos
# Aplicar subconjunto para cada tratamiento

df_ctrl <- subset(calidad, Tratamiento == "Ctrl")
df_fert <- subset(calidad, Tratamiento == "Fert")

par(mfrow=c(1,2))
qqnorm(df_ctrl$IE); qqline(df_ctrl$IE)
qqnorm(df_fert$IE); qqline(df_fert$IE)
par(mfrow=c(1,1))

# Prueba normalidad SHAPIRO.TEST
shapiro.test(df_ctrl$IE)
shapiro.test(df_fert$IE)

# Revisar homogeneidad
var.test(calidad$IE ~ calidad$Tratamiento)


# Prueba de T

t.test(calidad$IE ~ calidad$Tratamiento, alternative = "two.sided", var.equal = T)
t.test(calidad$IE ~ calidad$Tratamiento, alternative = "two.sided", var.equal = F)

# Error estadistico de como plantear la pregunta
t.test(calidad$IE ~ calidad$Tratamiento, alternative = "greater", var.equal = T)
t.test(calidad$IE ~ calidad$Tratamiento, alternative = "greater", var.equal = F)

# Medir el efecto del efecto

cohens_efecto <- function(x,y) {
  n1 <- length(x); n2 <- length(y)
  s1 <- sd(x); s2<-sd(y)
  sp <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))
  (mean (x) - mean (y)) / sp
}

d1_cal <- cohens_efecto(df_ctrl$IE, df_fert$IE)
d1_cal


# Reportar resultado
# Se realizó una prueba t para muestras independientes ( Ctrl vs Fert),asumiendo varianzas iguales. Se encontró una diferencia, t(40) = -2.981253, p =0.00487. El grupo Fert mostró una media mayot (0.9066667) que el grupo Ctrl (0.767619). La diferencia de medias fue de -0.139 y el IC 95% = [-0.23, -0.04]. El tamaño del efecto fue grande (d=-0.9200347) lo que indica que la fertilización tuvo un efecto sustancial sobre el índice de calidad.