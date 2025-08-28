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

**Semana 2 (14/08/2025)**

  + Laboratorio 1
  + Conocer la inferaz de RStudio
  + Analisis temperatura
  
 **Semana 3 (21/08/2025)**

Continuamos con el Laboratorio 1, en el cual analizamos una base de datos de temperatura. Para ello, importamos los datos directamente desde una URL.


**Semana 4 (28/08/25)**

  + Carga de datos: Importación de la base calidad_plantulas.csv en R.
  + Preparación de variables: Conversión de la columna Tratamiento a factor para facilitar los análisis estadísticos.
  + Estadísticos descriptivos: Cálculo de medias, desviaciones estándar y varianzas del Índice de Esbeltez (IE) por tratamiento.
  + Visualización gráfica: Elaboración de diagramas de caja (boxplots) para comparar el IE entre tratamientos y verificar diferencias visuales.
  + Evaluación de supuestos:

    + Pruebas de normalidad (Shapiro–Wilk) y gráficos QQ-plot para cada tratamiento.
    + Prueba de homogeneidad de varianzas (F-test).
  + Pruebas de hipótesis: Aplicación de pruebas t (Student y Welch) tanto de dos colas como de una cola, según la hipótesis planteada.
  + Medición del tamaño del efecto: Creación de una función en R para calcular el d de Cohen, con el fin de complementar el análisis de significancia estadística y cuantificar la magnitud de las diferencias observadas entre tratamientos.
