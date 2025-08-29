# Posgrado_Estadistica_2025

Material del curso de Posgrado de Estadistica de investigacion cientifica DCMRN

##contenido del curso :sos:

**semana 1** (07/08/2025): Inicio del curso :fire: 
  + crear repositorio :dart: 
  + sincronizar nube y computadora 
  + Credenciales Git
  + primer dia de clases 
  + 9:20 a 1:20 

Forma Sincoronizar nube y computadora

  + C:\Usuarios\Usuario>git config --global usuario.nombre "toryferrer"
  + C:\Usuarios\Usuario>git config --global usuario.email "toryferrer@live.com"

**Semana 2 (14/08/2025)** [Clase 02](https://github.com/toryferrer/Posgrado_Estadistica_2025/tree/TESIS_MEZQUITE/CLASES/SEMANA%202)
  + Carga y exploración de datos (temperatura.csv; revisión de estructura, dimensiones y resumen estadístico).
  + Preparación de variables (renombrado de columnas y cálculo de la media anual a partir de los meses).
  + Visualización:
    + Boxplot general (2000–2021) con colores por estación.
    + Boxplot por periodo (2010–2020) para observar variación reciente.
  + Exportación de resultados (guardar archivo procesado como temp_final.csv).
 
 **Semana 3 (21/08/2025)**[Clase 03](https://github.com/toryferrer/Posgrado_Estadistica_2025/tree/TESIS_MEZQUITE/CLASES/SEMANA%203)
  + Importación local: Lectura de Act_Inv_Movilizacion.csv dentro del proyecto en R.
  + Importación en línea: Conexión a un archivo CSV disponible en un servidor (senasica) mediante URL.
  + Exploración inicial: Visualización de la base con View(), head() y selección de columnas/filas para revisión preliminar.

**Semana 4 (28/08/25)** [Clase 04](https://github.com/toryferrer/Posgrado_Estadistica_2025/tree/TESIS_MEZQUITE/CLASES/SEMANA%204)
  + Carga de datos: Importación de la base calidad_plantulas.csv en R.
  + Preparación de variables: Conversión de la columna Tratamiento a factor para facilitar los análisis estadísticos.
  + Estadísticos descriptivos: Cálculo de medias, desviaciones estándar y varianzas del Índice de Esbeltez (IE) por tratamiento.
  + Visualización gráfica: Elaboración de diagramas de caja (boxplots) para comparar el IE entre tratamientos y verificar diferencias visuales.
  + Evaluación de supuestos:
    + Pruebas de normalidad (Shapiro–Wilk) y gráficos QQ-plot para cada tratamiento.
    + Prueba de homogeneidad de varianzas (F-test).
  + Pruebas de hipótesis: Aplicación de pruebas t (Student y Welch) tanto de dos colas como de una cola, según la hipótesis planteada.
  + Medición del tamaño del efecto: Creación de una función en R para calcular el d de Cohen, con el fin de complementar el análisis de significancia estadística y cuantificar la magnitud de las diferencias observadas entre tratamientos.
