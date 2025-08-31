# Tarea 2: Asignación 3: Contraste de medias
# 28/08/2025
# Semestre Agosto - Diciembre 2025
# Fuente: HW02.pdf
# Alumno: Luis Miguel Toribio Ferrer
# Matricula: 2173385
# Materia: Estadistica en la Investigación Cientiica


# Base de datos Iris ------------------------------------------------------


# Objetivo
# El objetivo de esta práctica es que el estudiante se familiarice con el entorno de R y RStudio, explorando una de las bases de datos más utilizadas en estadística (iris), con el fin de:
# + Describir y comprender la estructura de un conjunto de datos reales.
# + Aplicar pruebas estadísticas básicas (prueba t de dos muestras) para contrastar hipótesis sobre medias poblacionales.
# + Interpretar los resultados tanto en términos estadísticos (valores de p, intervalos de confianza, tamaño del efecto) como en términos biológicos (diferencias entre especies de iris).
# + Desarrollar habilidades prácticas en la escritura de código reproducible en R y en la presentación de resultados mediante reportes en formato PDF

# Base de datos Iris

data(iris)                      # cargar base
head(iris)                      # primeras filas
summary(iris)                   # resumen estadístico


# Datos a trabajar --------------------------------------------------------

# A partir de la base de datos iris disponible en R, realice lo siguiente:

# 1.- Selección de especies: elija las especies versicolor y virginica de la base y enfoque su análisis en la variable Petal.Length.

data_sub <- subset(iris, Species %in% c("versicolor", "virginica"))
table(data_sub$Species)


# Instrucción de la tarea -------------------------------------------------

# Primer contacto con R:
# Explorar la base de datos iris usando funciones como head(), summary().

head(data_sub)

summary(data_sub)
# Identificar las variables Petal.Length y determina las estadísticas descriptivas

tapply(data_sub$Petal.Length, data_sub$Species, summary)

#Prueba estadística:


# Defina una pregunta de investigación sobre la variable Petal.Length.


# ¿El largo del pétalo (Petal.Length) difiere significativamente entre Iris versicolor y Iris virginica?


# Plantee formalmente las hipótesis estadísticas para una prueba t de dos muestras independientes (two.sided).


# H0 (hipótesis nula): μ_versicolor = μ_virginica (La media de la longitud del pétalo (Petal.Length) en Iris versicolor es igual a la media de la longitud del pétalo en Iris virginica.)

# H1 (hipótesis alterna): μ_versicolor ≠ μ_virginica (La media de la longitud del pétalo (Petal.Length) en Iris versicolor es diferente a la media de la longitud del pétalo en Iris virginica)

# Ejecute la prueba en R justificando el tipo de prueba (Welch cuando las varianzas son diferentes o clásica, cuando las varainzas son iguales).

var.test(Petal.Length ~ Species, data = data_sub)

# Dado que el valor p = 0.2637 (> 0.05), se concluye que no existen diferencias significativas entre las varianzas de ambas especies. Por tanto, se cumple el supuesto de homocedasticidad y la prueba t clásica es apropiada.


# Prueba t clásica (como las varianzas resultaron homogéneas)
t.test(Petal.Length ~ Species, data = data_sub, var.equal = TRUE)

#Dado que el p-valor es mucho menor que 0.05, se rechaza la hipótesis nula (H0) y se concluye que el largo del pétalo (Petal.Length) difiere significativamente entre Iris versicolor y Iris virginica.


# Calcule e interprete el tamaño del efecto (Cohen’s d).


data_sub$Species <- droplevels(data_sub$Species)

library(effsize)
cohen.d(Petal.Length ~ Species, data = data_sub)

#El tamaño del efecto de Cohen’s d = –2.52 indica una diferencia extremadamente grande en el largo de los pétalos, lo que confirma tanto la significancia estadística como la relevancia práctica y biológica de este rasgo.


# Según los criterios de Cohen (1988):
  
# d ≈ 0.2 → efecto pequeño
# d ≈ 0.5 → efecto mediano
# d ≈ 0.8 → efecto grande

# Visualización:

#Genere una gráfica comparativa (boxplot, violinplot, etc.) que muestre las diferencias entre especies.

#Boxplot clásico en R base 

boxplot(Petal.Length ~ Species,
        data = data_sub,
        main = "Largo del pétalo en Iris versicolor y virginica",
        ylab = "Petal.Length (cm)",
        col = c("lightblue", "lightgreen"))

# Boxplot con ggplot2

library(ggplot2)

ggplot(data_sub, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Distribución del largo de pétalo por especie",
       x = "Especie", y = "Largo de pétalo (cm)") +
  theme_minimal()

# Grafica de Violin
ggplot(data_sub, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.1, fill = "white") +
  labs(title = "Distribución del largo de pétalo por especie",
       x = "Especie", y = "Largo de pétalo (cm)") +
  theme_minimal()

# Informe escrito:
  
# Redacte una síntesis (máx. 1 cuartilla) que incluya:
# • Planteamiento del problema y de las hipótesis.
# • Resultados numéricos y gráficos.
# • Interpretación estadística y biológica.

# Planteamiento del problema e hipótesis
# El objetivo de este ejercicio fue evaluar si existían diferencias en el largo del pétalo (Petal.Length) entre dos especies de iris: Iris versicolor e Iris virginica.

# La pregunta de investigación planteada fue:
#  ¿El largo del pétalo difiere significativamente entre I. versicolor y I. virginica?
  
#  Para responderla se establecieron las siguientes hipótesis estadísticas:
#  H0 (hipótesis nula): μ_versicolor = μ_virginica
# (las medias de la longitud de pétalo son iguales en ambas especies).
# H1 (hipótesis alterna): μ_versicolor ≠ μ_virginica
# (las medias de la longitud de pétalo son diferentes entre las especies).

# Resultados numéricos
# El análisis descriptivo mostró:
# I. versicolor: media = 4.26 cm, DE = 0.47 cm
# I. virginica: media = 5.55 cm, DE = 0.55 cm
# La prueba de igualdad de varianzas (F = 0.72, p = 0.2637) indicó que las varianzas eran estadísticamente iguales. Por lo tanto, se aplicó la prueba t clásica para dos muestras independientes.

# Los resultados fueron:
  #  t = –12.604, gl = 98, p < 0.001

# Diferencia de medias = –1.29 cm
# IC 95%: [–1.495, –1.089]
# El cálculo del tamaño del efecto (Cohen’s d = –2.52; IC 95% [–3.05, –1.99]) evidenció una diferencia extremadamente grande entre ambas especies.

# Resultados gráficos
# Los boxplots y violin plots mostraron una clara separación en la distribución de Petal.Length entre las dos especies, con muy poco solapamiento. I. virginica presentó consistentemente pétalos más largos que I. versicolor.

# Interpretación estadística y biológica
# Desde un punto de vista estadístico, se rechazó la hipótesis nula y se concluyó que existen diferencias significativas en el largo del pétalo entre I. versicolor y I. virginica. El valor de Cohen’s d confirma que la magnitud de la diferencia es muy grande, lo que implica que esta característica tiene un poder discriminante fuerte entre ambas especies.
# En términos biológicos, la longitud del pétalo representa un rasgo morfológico clave que distingue a estas especies, lo cual coincide con su clasificación taxonómica. Esto demuestra cómo el análisis estadístico puede respaldar la identificación y diferenciación de especies en estudios botánico






