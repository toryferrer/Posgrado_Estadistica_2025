# Script 4
# 28/08/2025
# Luis Miguel Toribio Ferrer


# Importar ----------------------------------------------------------------

calidad <- read.csv("Calidad_plantula.csv", header = T)
calidad$Tratamiento <- as.factor(calidad$Tratamiento)
class(calidad$Tratamiento)
summary(calidad)

mean(calidad$IE)

tapply(calidad$IE, calidad$Tratamiento, mean)
tapply(calidad$IE, calidad$Tratamiento, sd)
tapply(calidad$IE, calidad$Tratamiento, var)

colores <- c("navajowhite", "skyblue")

boxplot(calidad$IE~ calidad$Tratamiento, 
        col = colores,
        xlab = "Tratamientos",
        ylab = "Índice de calidad",
        ylim = c(0.4,1.2),
        main = "Vivero Forestal")

# Aplicar un subconjunto para cada tratamiento

df_ctrl <- subset(calidad, Tratamiento == "Ctrl")
df_fert <- subset(calidad, Tratamiento != "Ctrl")

par(mfrow=c(1,2))
qqnorm(df_ctrl$IE); qqline(df_ctrl$IE)
qqnorm(df_fert$IE); qqline(df_fert$IE)
par(mfrow=c(1,1))

# Crear una función para medir el efecto de Cohen
cohens_efecto <- function(x, y) {
  n1 <- length(x); n2 <- length(y)
  s1 <- sd(x);     s2 <- sd(y)
  sp <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))
  (mean(x) - mean(y)) / sp
}

d1_cal <- cohens_efecto(df_ctrl$IE,df_fert$IE)
round(d1_cal,2)