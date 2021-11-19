
#  Examen: Proyecto final  ------------------------------


# 1. Instalación de paquetes ----------------------------------------------

pacman::p_load(tidyverse, #Universo de paquetes
               sjmisc, #Para explorar datos
               dplyr, #Para manipular datos
               sjlabelled, #Para trabajar con datos etiquetados
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

#Primero, recodificamos las variables y codificamos los casos perdidos como NA

movid_proc <- movid_proc %>%
  mutate(estado_sm = car::recode(.$estado_sm, recodes = c("1=0;c(2,3,4)=1; c(8,9)=NA"), as.factor = T, levels = c(0, 1)),
         sexo = car::recode(.$sexo, c("'Hombre' = 0; 'Mujer' = 1"), as.factor = T,  levels = c(0, 1)),
         edad = car::recode(.$edad, recodes = c("18:39='Joven';40:60='Adulto'; 61:hi='Adulto mayor'"),
                            as.factor = T, levels = c("Joven", "Adulto", "Adulto mayor")),
         variacion_td = car::recode(.$variacion_td, recodes = "c('Ha bajado. ¿Cuántas horas diarias ha bajado?','Se ha mantenido igual')=0; 'Ha subido. ¿Cuántas horas diarias ha subido?'=1; c('No sabe', 'No responde')= NA"),
         variacion_cuidados = car::recode(.$variacion_cuidados, recodes = "c('Ha bajado. ¿Cuántas horas diarias ha bajado?','Se ha mantenido igual')=0; 'Ha subido. ¿Cuántas horas diarias ha subido?'=1; c('No sabe', 'No responde')= NA"),
         ingresos = car::recode(.$ingresos, recodes = c("c(1,2,3)='Bajo';c(4,5) = 'Medio'; c(6,7,8) = 'Alto'; c(98,99)=NA"),  as.factor = T)) %>%
  mutate_at(vars(edad, estado_sm, sexo, variacion_td, ingresos, trabajo_productivo, variacion_cuidados), funs(forcats::as_factor(.)))#Transformo la variable edad, trabaja y riesgo_factor en un factor
#para que mi modelo se estime de manera correcta, conservando la etiqueta de la variable y poder así saber la cat. de referencia


#Luego, etiquetamos 
movid_proc <- movid_proc %>%
rename("variacion_cuidados”=  f2) %>%
 set_label(x = movid_proc$variacion_cuidados, label = Variacion trabajo de cuidados") %>% 
  set_labels(movid_proc$variacion_cuidados,
             labels=c( "Se mantuvo/disminuyó"=0,
                       "Aumentó"=1, as.numeric=T))
movid_proc <- movid_proc %>%
  rename("variacion_td"=  f1) %>% 
  set_label(x = movid_proc$variacion_td, label = "Variación del trabajo doméstico") %>% 
  set_labels(movid_proc$variacion_td,
             labels=c( "Se mantuvo/disminuyó"=0,
                       "Aumentó"=1, as.numeric=T))
# 6. Visualización el set de datos -------------------------------------------

head(movid_proc)#visualizamos el único set de datos movid_proc para revisar que todo esté en orden antes de guardar y expotar

# 7. Guardar y exportar los datos ----------------------------------------

saveRDS(MOVID_proc, file = "output/datos/datos_proc.rds") #Guardamos este único set de datos en datos_proc.rds con los datos procesados

