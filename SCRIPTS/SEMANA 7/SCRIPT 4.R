# ===============================
# Análisis de varianza
# Productividad de cultivos
# 18/09/2025
# LUIS MIGUEL TORIBIO FERRER
# SEMANA 7
# ===============================

url <- "https://raw.githubusercontent.com/mgtagle/Posgrado_Estadistica_2025/refs/heads/main/crop.data.csv"
crop <- read.csv(url, header = T)
crop$density <- as.factor(crop$density)
crop$block <- as.factor(crop$block)
crop$fertilizer <- as.factor(crop$fertilizer)
summary(crop)


colores <- c("indianred", "skyblue", "navajowhite")
boxplot(crop$yield ~ crop$fertilizer,
        col = colores,
        xlab = "Fertilizantes",
        ylab = "Rendimiento (ton/ha)")

library(vioplot)
vioplot(crop$yield ~ crop$fertilizer,
        main = "Producción por fertilizante",
        col= c("red2","blue2", "green2"),
        ylab = "Producción",
        xlab = "Tipo de fertilizante",
        ylim = c(175, 179))


tapply(crop$yield, crop$fertilizer, mean)
tapply(crop$yield, crop$fertilizer, var)

# aplicar prueba de normalidad de datos para cada
# fertilizante combinando subset y shapiro

shapiro.test(subset(crop$yield, crop$fertilizer == "1"))
shapiro.test(subset(crop$yield, crop$fertilizer == "2"))
shapiro.test(subset(crop$yield, crop$fertilizer == "3"))

# Prueba de Bartlett
bartlett.test(crop$yield ~ crop$fertilizer)


# Prueba de ANOVA

crop.aov <- aov(crop$yield ~ crop$fertilizer)
summary(crop.aov)


# LSD determinar el valor

qt(0.975, 93)

sqrt((2*0.3859)/32) * qt(0.975, 93)
tapply(crop$yield, crop$fertilizer, mean)
# primer diferencia de medias F1 vs F2
176.757 - 176.9332

# primer diferencia de medias F2 vs F3
176.9332 - 177.3562

# # primer diferencia de medias F1 vs F3
176.757 - 177.3562

# Prueba de Tukey

sqrt((0.3859)/32) * qtukey(0.95, nmeans = 3, df = 93)

TukeyHSD(crop.aov, )
plot(TukeyHSD(crop.aov))

library(ggplot2)

ggplot(crop, aes(x=fertilizer, y = yield, fill = fertilizer))+
  geom_violin(alpha = 0.5)+
  geom_jitter(col = "indianred")+
  geom_boxplot(width = 0.1, col = "white", alpha = 0.5)+
  theme_light()+
  labs(x = "Fertilizante",
       y = "Rerndimiento (ton/ha)")