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


# Calcule la diferencia mínima signicativa con Tukey.

# 2) Diferencia mínima significativa (HSD)
HSD <- q_crit * sqrt(MSerror / n)
HSD


# Compare los resultados con la prueba LSD: ¾los mismos pares resultan signicativos?

pairs <- combn(names(medias), 2, simplify = FALSE)

# --- LSD ---
# Umbral LSD (puedes usar el que ya calculaste o recalcular aquí)
MSerror <- summary(modelo)[[1]]["Residuals","Mean Sq"]
glerror <- summary(modelo)[[1]]["Residuals","Df"]
n <- 6
tcrit <- qt(1-0.05/2, df = glerror)
LSD_thr <- as.numeric(tcrit * sqrt((2*MSerror)/n))

# --- Tukey ---
tuk <- TukeyHSD(modelo)$Sitio  # matriz con diff, lwr, upr, p adj

# Construir tabla comparativa
comp <- do.call(rbind, lapply(pairs, function(par){
  g1 <- par[1]; g2 <- par[2]
  # diferencia absoluta de medias
  d  <- abs(medias[g1] - medias[g2])
  
  # Significancia por LSD
  sig_LSD <- as.logical(d > LSD_thr)
  
  # Buscar fila correspondiente en la tabla de Tukey (orden "g1-g2" o "g2-g1")
  rn1 <- paste(g1, g2, sep="-")
  rn2 <- paste(g2, g1, sep="-")
  p_tuk <- if (rn1 %in% rownames(tuk)) tuk[rn1, "p adj"] else tuk[rn2, "p adj"]
  
  data.frame(
    Par = paste(g1, "vs", g2),
    Media_g1 = round(medias[g1], 3),
    Media_g2 = round(medias[g2], 3),
    Dif_abs  = round(as.numeric(d), 3),
    LSD_thr  = round(LSD_thr, 3),
    Sig_LSD  = ifelse(sig_LSD, "Sí", "No"),
    p_Tukey  = round(as.numeric(p_tuk), 4),
    Sig_Tukey = ifelse(p_tuk < 0.05, "Sí", "No"),
    Coinciden = ifelse(sig_LSD == (p_tuk < 0.05), "Sí", "No")
  )
}))

# Mostrar tabla completa
comp

# Pairs donde difieren los métodos (útil para el informe)
subset(comp, Coinciden == "No")



#Diferencia clave: la prueba LSD detectó significativa la diferencia entre Beaver Lake y Angler’s Cove (diferencia = 3.85, mayor que LSD = 3.72), mientras que la prueba Tukey HSD no la consideró significativa (p = 0.2376, HSD = 5.30).

#En conclusión, los pares no son exactamente los mismos: Tukey HSD es más conservadora que la prueba LSD y, por ello, reporta un número menor de diferencias significativas.


# Interpretacion ----------------------------------------------------------


#¿Qué cuerpo de agua presenta las concentraciones más altas?


# El análisis mostró que Rock River presentó las concentraciones medias de estroncio más elevadas (≈ 58.3 mg/ml), siendo significativamente superiores a las registradas en los demás cuerpos de agua.

# ¿Qué sitios no difieren entre sí?

# Los análisis post-hoc mostraron que Beaver Lake, Angler’s Cove y Appletree Lake no presentan diferencias significativas entre sí, ya que sus concentraciones medias de estroncio son estadísticamente similares.


# Desde el punto de vista ambiental, ¿qué implicaciones podrían tener estas diferencias en la calidad del agua?

# Desde el punto de vista ambiental, las diferencias encontradas en las concentraciones de estroncio implican que Rock River podría estar expuesto a mayores niveles de contaminación, lo que representa un riesgo potencial para la salud de los ecosistemas acuáticos y de las poblaciones humanas o animales que hagan uso de esta agua. Por el contrario, Grayson’s Pond, al mostrar los niveles más bajos, reflejaría condiciones más cercanas a la naturalidad o menor impacto antrópico. Los valores intermedios registrados en Beaver Lake, Angler’s Cove y Appletree Lake sugieren que estos cuerpos de agua se encuentran en un estado de calidad similar, posiblemente con presiones ambientales moderadas. Estas diferencias son relevantes porque permiten identificar sitios prioritarios para monitoreo y gestión ambiental, orientando acciones de control de contaminantes y conservación de la calidad del agua.
