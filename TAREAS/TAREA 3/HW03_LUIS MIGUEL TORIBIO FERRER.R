# title: Ejercicio: Comparación de concentraciones de estroncio en cuerpos de agua
# author: LUIS MIGUEL TORIBIO FERRER
# date: 19/09/2025
# output: pdf_document


# DESCRIPCION -------------------------------------------------------------

#Un investigador midió la concentración de estroncio (mg/ml) en cinco cuerpos de agua para evaluar
#si existen diferencias signicativas entre ellos. Cada sitio tuvo 6 réplicas (n=6).

# Datos en formato data.frame
# Crear el data.frame exactamente igual a la tabla
datos <- data.frame(
  Muestra   = 1:6,
  Graysons_Pond  = c(28.2, 33.2, 36.4, 34.6, 29.1, 31.0),
  Beaver_Lake   = c(39.6, 40.8, 37.9, 37.1, 43.6, 42.4),
  Anglers_cove    = c(46.3, 42.1, 43.5, 48.8, 43.7, 40.1),
  Appletree_Lake = c(41.0, 44.1, 46.4, 40.2, 38.6, 36.3),
  Rock_River      = c(56.3, 54.1, 59.4, 62.7, 60.0, 57.3)
)

# Visualizar en formato tabla
datos



# Planteamiento del problema ----------------------------------------------

# La Figura 1 muestra las concentraciones de estroncio (mg/ml) registradas en cinco cuerpos de agua: Grayson’s Pond, Beaver Lake, Angler’s Cove, Appletree Lake y Rock River. Cada sitio contó con seis repeticiones independientes. Se observa que Rock River presentó las concentraciones más elevadas, con valores consistentemente superiores al resto de los sitios. En contraste, Grayson’s Pond mostró los niveles más bajos, mientras que Beaver Lake, Angler’s Cove y Appletree Lake presentaron valores intermedios y relativamente cercanos entre sí. 

# Este patrón sugirió la existencia de diferencias significativas entre sitios, lo que motivó la aplicación de un ANOVA de una vía seguido de pruebas post-hoc (LSD y Tukey HSD) para identificar con precisión qué grupos difirieron estadísticamente en sus medias.


# Preguntas ---------------------------------------------------------------


# Hipótesis del ANOVA: Plantee las hipótesis nula y alternativa para este análisis.

# Hipótesis del ANOVA
# H0: Las medias de concentración de estroncio son iguales en todos los sitios
# H1: Al menos una media difiere entre los sitios


#Cálculo del ANOVA: Con los datos proporcionados, realice el análisis de varianza (ANOVA de una vía) y reporte la tabla de anova.

library(tidyr)
datos_long <- pivot_longer(datos, cols = -Muestra,
                           names_to = "Sitio", values_to = "Estroncio")

modelo <- aov(Estroncio ~ Sitio, data = datos_long)
summary(modelo)


# El p-valor es 3.95e-12 < 0.05, por lo que se rechaza H₀ y se concluye que existen diferencias significativas en las concentraciones de estroncio entre los sitios.

#Preuba LSD

library(agricolae)

lsd_res <- LSD.test(modelo, "Sitio", p.adj = "none")
lsd_res


library(ggplot2)

# Definir orden de los sitios
datos_long$Sitio <- factor(datos_long$Sitio,
                           levels = c("Graysons_Pond", "Beaver_Lake",
                                      "Anglers_cove", "Appletree_Lake",
                                      "Rock_River"))

# Graficar
ggplot(datos_long, aes(x = Sitio, y = Estroncio, fill = Sitio)) +
  geom_violin(trim = FALSE, alpha = 0.7) +       # violín
  geom_boxplot(width = 0.15, fill = "white") +   # boxplot
  theme_minimal(base_size = 14) +
  labs(title = "Concentraciones de estroncio en cuerpos de agua",
       x = "Lagos", y = "Concentration (mg/ml)") +
  theme(legend.position = "right")


#Calcule el valor de LSD con α = 0.05.

# Extraer parámetros del modelo
MSerror <- summary(modelo)[[1]]["Residuals","Mean Sq"]
glerror <- summary(modelo)[[1]]["Residuals","Df"]
n <- 6  # réplicas por sitio

# Valor crítico de t
t_crit <- qt(1 - 0.05/2, df = glerror)

# Calcular LSD
LSD <- t_crit * sqrt((2 * MSerror) / n)
LSD


#Comparar las diferencias entre medias de los sitios

lsd_res$means   # muestra las medias, desviaciones y límites de confianza

# Diferencias entre medias (todas las comparaciones posibles)
pairwise.differences <- combn(levels(datos_long$Sitio), 2, function(par){
  diff <- mean(datos_long$Estroncio[datos_long$Sitio == par[1]]) -
    mean(datos_long$Estroncio[datos_long$Sitio == par[2]])
  data.frame(Par = paste(par[1], "vs", par[2]),
             Diferencia = diff)
}, simplify = FALSE)

do.call(rbind, pairwise.differences)


# 1) Calcular la media por sitio
medias <- tapply(datos_long$Estroncio, datos_long$Sitio, mean)
medias



# Determine cuáles pares son signicativamente diferentes.

# EL valor entre las medias, debe ser mayor que el LSD para que sean diferentes


# 2) Generar todas las combinaciones de pares
combinaciones <- combn(names(medias), 2, simplify = FALSE)

# 3) Calcular diferencias absolutas y verificar si superan el LSD
LSD <- 3.72
tabla_dif <- data.frame(
  Comparacion = sapply(combinaciones, paste, collapse = " vs "),
  Diferencia = sapply(combinaciones, function(par) {
    abs(medias[par[1]] - medias[par[2]])
  })
)

tabla_dif$Significativo <- ifelse(tabla_dif$Diferencia > LSD, "Sí", "No")
tabla_dif


#Prueba de Tukey HSD


#Obtenga el valor crítico

# Número de grupos
k <- length(unique(datos_long$Sitio))

# Grados de libertad del error
glerror <- summary(modelo)[[1]]["Residuals","Df"]

# MSerror
MSerror <- summary(modelo)[[1]]["Residuals","Mean Sq"]

# Réplicas por grupo
n <- 6  

# 1) Valor crítico de Tukey (q)

q_crit <- qtukey(0.95, nmeans = k, df = glerror)
q_crit


# alcule la diferencia mínima signicativa con Tukey.

# 2) Diferencia mínima significativa (HSD)
HSD <- q_crit * sqrt(MSerror / n)
HSD




