# ===============================================================
# Laboratorio 1: Empezar con R y RStudio
# Trabajar con datos en R
# Semestre Agosto - Diciembre 2025
# (Instrucciones transcritas y resueltas en R)
# Fuente: Lab_Semana_1.pdf
# Alumno: Luis Miguel Toribio Ferrer
# Matricula: 2173385
# Materia: Estadistica en la Investigación Cientiica
# ===============================================================


# ---------------------------------------------------------------
# Parte 1. R y RStudio
# Primer contacto con la consola de R
# ---------------------------------------------------------------

# Instrucción:
# "Considere las facturas mensuales de una estudiante universitaria de la MCF:
#  celular $300, transporte $240, comestibles $1527, gimnasio $400,
#  alquiler $1500, otros $1833. Use R para encontrar los gastos totales."

# Gastos totales
300 + 240 + 1527 + 400 + 1500 + 1833

# Instrucción:
# "Cree objetos para cada gasto e inspecciónelos."

celular     <- 300
transporte  <- 240
comestibles <- 1527
gimnasio    <- 400
alquiler    <- 1500
otros       <- 1833

celular; transporte; comestibles; gimnasio; alquiler; otros

# Instrucción:
# "Cree un objeto total con la suma de los gastos."
total <- celular + transporte + comestibles + gimnasio + alquiler + otros
total

# Instrucción:
# "Suponiendo que la estudiante tiene los mismos gastos todos los meses,
#  ¿cuánto gastaría durante un semestre escolar? (5 meses)."
gasto_semestre <- total * 5
gasto_semestre

# Instrucción:
# "¿Cuánto gastaría durante un año escolar? (10 meses)."
gasto_anual <- total * 10
gasto_anual

# ---------------------------------------------------------------
# Nombre de los objetos (reglas)
# ---------------------------------------------------------------
# Comentarios demostrativos (no ejecutar asignaciones inválidas):
# 5variable <- 5      # inválido: no puede iniciar con número
# _invalid  <- 10     # inválido: no puede iniciar con guión bajo
# my,variable <- 3    # inválido: coma
# my variable <- 1    # inválido: espacio

# ---------------------------------------------------------------
# Funciones
# ---------------------------------------------------------------

# Valor absoluto
abs(10)
abs(-4)

# Raíz cuadrada
sqrt(9)

# Logaritmo natural
log(2)

# ---------------------------------------------------------------
# Comentarios en R (#)
# ---------------------------------------------------------------
# este es un comentario
2 * 9
4 + 5  # comentario al final de la línea

# ---------------------------------------------------------------
# R distingue mayúsculas y minúsculas
# ---------------------------------------------------------------
celular <- 300
Celular <- -300
CELULAR <- 8000

celular + Celular   # 300 + (-300) = 0
CELULAR - celular   # 8000 - 300 = 7700

# ---------------------------------------------------------------
# Obtener ayuda
# ---------------------------------------------------------------
# help(abs)
# ?abs
# help(mean)
# ?mean
# help.search("absolute")
# ??absolute

# ---------------------------------------------------------------
# Autoevaluación (gráficas y ordenamientos)
# ---------------------------------------------------------------

# "Toma los objetos creados y crea un vector 'gastos'"
gastos <- c(celular, transporte, comestibles, gimnasio, alquiler, otros)


# "Use barplot() para producir un diagrama de barras:"
barplot(gastos,
        main = "Gastos mensuales de la estudiante",
        ylab = "Monto ($)",
        names.arg = names(gastos))

# "Use sort() para ordenar en orden decreciente:"
gastos_ordenados <- sort(gastos, decreasing = TRUE)
gastos_ordenados
gastos_variables <- c('Otros', 'Comestibles', 'Alquiler', 'Gimnasio', 'Celular', 'Transporte')

# "Gráfico de barras en orden decreciente:"
barplot(gastos_ordenados,
        main = "Gastos ordenados (mayor a menor)",
        ylab = "Monto ($)",
        names.arg = gastos_variables)

# tambien se puede emplear 
barplot(sort(gastos, decreasing = TRUE), names.arg = gastos_variables)
# "Opcional: mostrar nombres de variables debajo de cada barra."  # Ya se hizo con names.arg

barplot(
  gastos_ordenados,
  main = "Gastos mensuales de la estudiante (orden decreciente)",
  ylab = "Monto ($)",
    names.arg = gastos_variables,
  col = heat.colors(length(gastos_ordenados)),
  las = 2,                # etiquetas verticales para que no se encimen
  ylim = c(0, max(gastos_ordenados) * 1.2) # espacio extra arriba
) -> bp

# Agregar etiquetas con los montos encima de cada barra
text(
  x = bp,
  y = gastos_ordenados,
  labels = paste0("$", gastos_ordenados),
  pos = 3,                # encima de la barra
  cex = 0.9,
  font = 2
)




# PARTE II ----------------------------------------------------------------


# ===============================================================
# Parte II. Variables
# ===============================================================

#**Problema 1:**
# Identifique el tipo de variable (cualitativa o cuantitativa) para la lista de preguntas de una encuesta aplicada a estudiantes universitarios en una clase de estadística:

resp_p1 <- list(
  "Nombre de estudiante"                                  = "Cualitativa",
  "Fecha de nacimiento (p.ej., 21/10/1995)"               = "Cualitativa",
  "Edad (años)"                                           = "Cuantitativa",
  "Dirección de casa"                                     = "Cualitativa",
  "Número de teléfono"                                    = "Cualitativa",
  "Área principal de estudio"                             = "Cualitativa",
  "Grado de año universitario (1°,2°,3°,4°)"              = "Cualitativa",
  "Puntaje en la prueba (0–100)"                          = "Cuantitativa",
  "Calificación general: A, B, C, D, F"                   = "Cualitativa",
  "Tiempo para completar la prueba (minutos)"             = "Cuantitativa",
  "Número de hermanos"                                    = "Cuantitativa"
)


#**Problema 2:**
# Elija un objeto (cualquier objeto, por ejemplo, animales, plantas, países, instituciones, etc.) y obtenga una lista de 14 variables: 7 cuantitativas y 7 categóricas.

# 7 cualitativas (categoricas)
especie      <- c("Perro","Gato","Caballo","Vaca","Elefante")
habitat      <- c("Doméstico","Doméstico","Rural","Rural","Sabana")
color        <- c("Negro","Blanco","Café","Manchado","Gris")
alimentacion <- c("Carnívoro","Carnívoro","Herbívoro","Herbívoro","Herbívoro")
region       <- c("América","Europa","Asia","África","África")
sexo         <- c("Macho","Hembra","Macho","Hembra","Macho")
estatus      <- c("Doméstico","Doméstico","Ganadero","Ganadero","Silvestre")

# 7 cuantitativas 
peso_kg            <- c(35, 5, 450, 600, 4000)
altura_cm          <- c(60, 25, 160, 140, 300)
edad_años         <- c(5, 3, 10, 6, 25)
velocidad_kmh      <- c(45, 48, 55, 40, 25)
n_crias            <- c(0, 0, 1, 1, 1)
temperatura_c      <- c(38.3, 38.6, 37.8, 38.5, 36.6)
longevidad_años   <- c(13, 15, 30, 20, 60)

#**Problema 3:**
# Considere una variable con valores numéricos que describen formas electrónicas de expresar opiniones personales: 1 = Twitter; 2 = correo electrónico; 3 = mensaje de texto; 4 = Facebook; 5 = blog. ¿Es esta una variable cuantitativa o cualitativa? Explique.

#Respuesta: Es CUALITATIVA 
# Explicación: Los números son etiquetas de categorías, no magnitudes. No tienen orden ni distancia significativos.

#**Problema 4:**
#Para cada pregunta de investigación, (1) identifique a los individuos de interés (el grupo o grupos que se están estudiando), (2) identifique la (s) variable (s) (la característica sobre la que recopilaríamos datos) y (3) determine si cada variable es categórico o cuantitativo.


# ¿Horas promedio que los estudiantes de universidades públicas trabajan por semana?

# Individuos: Estudiantes de universidades públicas.
# Variable: Horas trabajadas por semana.
#Tipo: Cuantitativa.

# ¿Proporción de estudiantes universitarios de México inscritos en universidad pública?

# Individuos: Estudiantes universitarios de México.
# Variable: Tipo de universidad (pública/privada).
# Tipo: Cualitativa.

# En universidades públicas, ¿las estudiantes femeninas tienen promedio CENEVAL más alto que varones? 

# Individuos: Estudiantes de universidades públicas.
# Variables: Puntaje CENEVAL 
# Tipo: Cualitativa.

# ¿Es más probable que los atletas universitarios reciban asesoría académica que los no atletas?

# Individuos: Estudiantes universitarios.
# Variables: Condición (atleta/no), Asesoría académica (sí/no).
# Tipo: Ambas cualitativas nominales.

#Si reuniéramos datos para responder a las preguntas de la investigación anterior, ¿qué datos podrían analizarse mediante un histograma? ¿Cómo lo sabes?.

#respuesta: Con los datos de esta investigación no podemos usar histogramas, porque no hay variables numéricas continuas o discretas que justifiquen intervalos.

#El histograma solo se aplica a variables cuantitativas (números medibles) porque requiere intervalos de clase para mostrar frecuencias.

    