
# tarea-04 ------------------------------


# 1. Instalación de paquetes ----------------------------------------------

pacman::p_load(tidyverse, #Universo de paquetes
               sjmisc, #Para explorar datos
               dplyr, #Para manipular datos
               haven, #cargar y exportar bases de datos en formatos .sav y .dta
               car) #Para recodificar manteniendo las etiquetas

# 2. Importar datos  -----------------------------------------------------

## 2.1 De la encuesta MOVID-IMPACT (2020) del módulo "Orientaciones del Trabajo" en formato.sav

MOVID_2020 <- haven::read_sav(file ="input/data/Astorga.sav")

# 3. Exploración de los datos -------------------------------------------------------

View(MOVID_2020) # se usa para visualizar la base de datos
names(MOVID_2020) # entrega los nombres de las variables que componen el dataset
head(MOVID_2020) # muestra las primeras filas presentes en el marco de datos

frq(MOVID_2020$f7_3)
frq(MOVID_2020$f6)
frq(MOVID_2020$g1)
frq(MOVID_2020$edad)



# 4. Selección de variables  -------------------------------------------

## Seleccionamos las siguientes variables:
# - `factor_expansion`: es el factor de expansión 
# - `f7_3`: Frecuencia última semana: Evitar reunirse con más de 10 personas en un espacio cerrado
# - `f6`: ¿Qué tan peligroso cree que es el coronavirus para usted y sus cercanos?
# - `g1`: Durante la semana pasada, ¿trabajó al menos una hora, sin considerar los quehaceres domésticos?
# - `edad`: Edad de los enrtrevistados

## 4.1 MOVID-IMPACT 2020

MOVID_proc <- select(MOVID_2020, cuidarse =f7_3, riesgo =f6, trabaja = g1, edad, factor_expansion) 

# 5. Transformación de las variables ------------------------------------------------

## 5.1 Recodificación y codificación como NA

MOVID_proc <- MOVID_proc %>%
  mutate(cuidarse = car::recode(.$cuidarse, recodes = c("c(8,9)=NA")),
         cuidarse_dummy = car::recode(.$cuidarse, recodes =, c("c(1,2)=0;c(3,4,5)=1;c(8,9)=NA"), as.factor =  T,
                                      levels = c(0, 1)),
         riesgo  = car::recode(.$riesgo, recodes =  c("c(8,9)=NA")),
         riesgo_factor = riesgo,
         edad = car::recode(.$edad, recodes = c("18:39='Joven';40:60='Adulto'; 61:hi='Adulto mayor'"),
                            as.factor = T, levels = c("Joven", "Adulto", "Adulto mayor"))) %>%
  mutate_at(vars(edad, trabaja, riesgo_factor), funs(forcats::as_factor(.)))#Transformo la variable edad, trabaja y riesgo_factor en un factor
#para que mi modelo se estime de manera correcta, conservando la etiqueta de la variable y poder así saber la cat. de referencia

# 6. Visualización el set de datos -------------------------------------------

head(MOVID_proc)#visualizamos el único set de datos elsoc_proc para revisar que todo esté en orden antes de guardar y expotar

# 7. Guardar y exportar los datos ----------------------------------------

saveRDS(MOVID_proc, file = "output/datos/datos_proc.rds") #Guardamos este único set de datos en datos_proc.rds con los datos procesados

