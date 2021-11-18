
#  Examen: Proyecto final  ------------------------------


# 1. Instalación de paquetes ----------------------------------------------

pacman::p_load(tidyverse, #Universo de paquetes
               sjmisc, #Para explorar datos
               dplyr, #Para manipular datos
               haven, #cargar y exportar bases de datos en formatos .sav y .dta
               car) #Para recodificar manteniendo las etiquetas

# 2. Importar datos  -----------------------------------------------------

## 2.1 De la encuesta MOVID-IMPACT (2020) desde url en formato.dta

MOVID_2020 <- read_dta(url("https://github.com/learn-R/examen-Rosario-Astorga/raw/main/input/data/MOVID-IMPACT.dta"))

# 3. Exploración de los datos -------------------------------------------------------

# Primero, exploramos la base de datos revisando los nombres de las variables que la componen

View(MOVID_2020) # se usa para visualizar la base de datos
names(MOVID_2020) # entrega los nombres de las variables que componen el dataset
head(MOVID_2020) # muestra las primeras filas presentes en el marco de datos

# Luego, revisamos cómo se distribuyen las variables que son de interés para la investigación

frq(MOVID_2020$c2_3)
frq(MOVID_2020$f2)
frq(MOVID_2020$g1)
frq(MOVID_2020$edad)
frq(MOVID_2020$sexo)
frq(MOVID_2020$g48)



# 4. Selección de variables  -------------------------------------------

## Seleccionamos las siguientes variables:
# - `factor_expansion`: Factor de expansión
# - `id_encuesta`: Identificador del hogar
# - `entrevistado`: Entrevistado seleccionado
# - `c2_3`: Últimas 2 semanas: Se ha sentido bajoneado, deprimido, irritable o desesperanzado
# - `f1`: Tiempo dedicado a las tareas domésticas en comparación a la situación previa al COVID-19
# - `f2`: Tiempo dedicado al cuidado de personas en comparación a la situación previa al COVID-19
# - `g48`: Tramo de ingreso total de su hogar el mes de noviembre de 2020
# - `g1`: Durante la semana pasada, ¿trabajó al menos una hora, sin considerar los quehaceres domésticos?
# - `edad`: Edad de los entrevistados
# - `sexo`: Sexo de los entrevistados

## 4.1 MOVID-IMPACT 2020

movid_proc <- select(MOVID_2020, factor_expansion, id_encuesta, entrevistado, estado_sm = c2_3, variacion_td = f2, variacion_cuidados = f2,  trabajo_productivo = g1, ingresos = g48, sexo, edad) 

# 5. Transformación de las variables ------------------------------------------------

## 5.1 Recodificación y codificación como NA


movid_proc <- movid_proc %>%
  mutate(cuidarse = car::recode(.$cuidarse, recodes = c("c(8,9)=NA")),
         cuidarse_dummy = car::recode(.$cuidarse, recodes =, c("c(1,2)=0;c(3,4,5)=1;c(8,9)=NA"), as.factor =  T,
                                      levels = c(0, 1)),
         estado_sm = car::recode(.$estado_sm, recodes = c("c(2,3,4)='Si se ha sentido deprimido';1 = 'No se ha sentido deprimido'; c(8,9)=NA")),
         sexo = car::recode(.$sexo, c('1="Hombre";2="Mujer"'), as.factor = T),
         edad = car::recode(.$edad, recodes = c("18:39='Joven';40:60='Adulto'; 61:hi='Adulto mayor'"),
                            as.factor = T, levels = c("Joven", "Adulto", "Adulto mayor"))) %>%
  mutate_at(vars(edad, trabaja, ), funs(forcats::as_factor(.)))#Transformo la variable edad, trabaja y riesgo_factor en un factor
#para que mi modelo se estime de manera correcta, conservando la etiqueta de la variable y poder así saber la cat. de referencia

# 6. Visualización el set de datos -------------------------------------------

head(movid_proc)#visualizamos el único set de datos movid_proc para revisar que todo esté en orden antes de guardar y expotar

# 7. Guardar y exportar los datos ----------------------------------------

saveRDS(MOVID_proc, file = "output/datos/datos_proc.rds") #Guardamos este único set de datos en datos_proc.rds con los datos procesados

