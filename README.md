# Posgrado_Estadistica_2025

Material del curso de Posgrado de Estadistica de investigacion cientifica DCMRN

##contenido del curso :sos:

**Semana 1 (07/08/2025)**: Inicio del curso :fire: 
  + crear repositorio :dart: 
  + sincronizar nube y computadora 
  + Credenciales Git
  + primer dia de clases 
  + 9:20 a 1:20 

Forma Sincoronizar nube y computadora
  + C:\Usuarios\Usuario>git config --global usuario.nombre "toryferrer"
  + C:\Usuarios\Usuario>git config --global usuario.email "toryferrer@live.com"

**Semana 2 (14/08/2025)** [Clase 02](https://github.com/toryferrer/Posgrado_Estadistica_2025/tree/TESIS_MEZQUITE/SCRIPTS/SEMANA%202)
  + Carga y exploración de datos (temperatura.csv; revisión de estructura, dimensiones y resumen estadístico).
  + Preparación de variables (renombrado de columnas y cálculo de la media anual a partir de los meses).
  + Visualización:
    + Boxplot general (2000–2021) con colores por estación.
    + Boxplot por periodo (2010–2020) para observar variación reciente.
  + Exportación de resultados (guardar archivo procesado como temp_final.csv).
 
 **Semana 3 (21/08/2025)**[Clase 03](https://github.com/toryferrer/Posgrado_Estadistica_2025/tree/TESIS_MEZQUITE/SCRIPTS/SEMANA%203)
  + Importación local: Lectura de Act_Inv_Movilizacion.csv dentro del proyecto en R.
  + Importación en línea: Conexión a un archivo CSV disponible en un servidor (senasica) mediante URL.
  + Exploración inicial: Visualización de la base con View(), head() y selección de columnas/filas para revisión preliminar.

**Semana 4 (28/08/25)** [Clase 04](https://github.com/toryferrer/Posgrado_Estadistica_2025/tree/TESIS_MEZQUITE/SCRIPTS/SEMANA%204)
  + Carga de datos: Importación de la base calidad_plantulas.csv en R.
  + Preparación de variables: Conversión de la columna Tratamiento a factor para facilitar los análisis estadísticos.
  + Estadísticos descriptivos: Cálculo de medias, desviaciones estándar y varianzas del Índice de Esbeltez (IE) por tratamiento.
  + Visualización gráfica: Elaboración de diagramas de caja (boxplots) para comparar el IE entre tratamientos y verificar diferencias visuales.
  + Evaluación de supuestos:
    + Pruebas de normalidad (Shapiro–Wilk) y gráficos QQ-plot para cada tratamiento.
    + Prueba de homogeneidad de varianzas (F-test).
  + Pruebas de hipótesis: Aplicación de pruebas t (Student y Welch) tanto de dos colas como de una cola, según la hipótesis planteada.
  + Medición del tamaño del efecto: Creación de una función en R para calcular el d de Cohen, con el fin de complementar el análisis de significancia estadística y cuantificar la magnitud de las diferencias observadas entre tratamientos.
  
**Semana 5 (04/09/2025)** [Clase 05](https://github.com/toryferrer/Posgrado_Estadistica_2025/tree/TESIS_MEZQUITE/SCRIPTS/SEMANA%205)
Tema: Media móvil y prueba t de muestras dependientes

+ Cálculo de la media móvil en la especie setosa (iris) para determinar el tamaño de muestra ideal.
+ Gráfica de la media móvil y comparación con la media poblacional.
+ Análisis de la producción de semilla (2012 vs 2013) con prueba t:

  + Boxplot comparativo y cálculo de medias.
  + Prueba t pareada para contrastar hipótesis.

Resultado: no hubo diferencias significativas entre los años evaluados.


**Semana 6 (11/09/25)**

  
**Semana 7 (18/09/25)** [Clase 07](https://github.com/toryferrer/Posgrado_Estadistica_2025/tree/TESIS_MEZQUITE/SCRIPTS/SEMANA%207)
+ Importación de la base crop.data.csv desde GitHub.
+ Preparación de datos: conversión de fertilizer, block y density a factores.
+ Visualización exploratoria:

  + Boxplot de rendimiento por fertilizante.
  + Violin plots (paquete vioplot) para comparar la distribución de la producción.
  + Gráfica avanzada en ggplot2 combinando violín, boxplot y puntos dispersos (jitter).

+ Cálculo de estadísticos descriptivos (media y varianza del rendimiento por fertilizante).
+ Verificación de supuestos del ANOVA:

  + Pruebas de normalidad (Shapiro–Wilk) por tratamiento.
  + Prueba de homogeneidad de varianzas (Bartlett).
  + Análisis de varianza de un factor (yield ~ fertilizer).

Comparaciones múltiples:

  + LSD (Least Significant Difference): cálculo del valor crítico y diferencias de medias.
  + Tukey HSD: aplicación y representación gráfica de resultados.
  + Interpretación de diferencias significativas en la productividad de cultivos según el fertilizante aplicado.
  
  
  
  
**Semana 8 (25/09/25)** [Clase 08](https://github.com/toryferrer/Posgrado_Estadistica_2025/tree/TESIS_MEZQUITE/SCRIPTS/SEMANA%208)
  
+ Construcción de la base de datos (variables trigo y harina).
+ Cálculo manual de parámetros por mínimos cuadrados (B0 y B1).
+ Ajuste del modelo de regresión lineal simple.
+ Evaluación del modelo mediante ANOVA y prueba de significancia.
+ Verificación de supuestos: análisis de residuos y prueba de homocedasticidad (Breusch–Pagan).
+ Cálculo de indicadores de ajuste: R², SSE, varianza y desviación estándar residual.
