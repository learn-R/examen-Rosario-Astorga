# Hacia la corresponsabilidad social en los cuidados: Un análisis desde la perspectiva de género a los factores que inciden en la percepción de la carga de trabajos de cuidado en la pandemia en Chile

Repositorio que contiene el Proyecto de investigación final del curso de Análisis de Datos en R. Su objetivo es evaluar los conocimientos y aprendizajes obtenidos en el curso de manera integra. 

Autora: Rosario Astorga Pinto
Profesora: Valentina Andrade de la Horra
Ayudantes: Dafne Jaime Vargas y Nicolás Godoy Márquez


### 1. Abstract -------------------------------------------

::: {style="text-align: justify"}
La pandemia del COVID-19 ha demostrado que tanto las economías globales formales del mundo como nuestros hogares, se construyen sobre el trabajo doméstico y de cuidado, no reconocido ni remunerado que realizan mayoritariamente las mujeres y niñas, quienes en estos tiempos se han visto mayormente afectadas por la carga que significa la doble o triple jornada. La siguiente investigación se propone analizar los factores que influyen en la percepción de la variación de la carga de trabajos de cuidado en la pandemia en Chile, considerando el sexo, la edad, el trabajar, los ingresos, las labores domésticas y el estado de salud mental. Para efectos de este trabajo, se utilizó la base de datos MOVID-IMPACT (n =674) y mediante un análisis de regresión logística se concluye que……..Tal relación puede ser explicada por o También fue posible determinar que

**Palabras claves:** trabajo de cuidados, labores domésticas, pandemia, 
:::

### 2. Base de datos -------------------------------------------

La base a utilizar para este proyecto de investigación final corresponde a los datos de la encuesta **MOVID-IMPACT (2020)**. El objetivo de esta encuesta transversal combinado es analizar el impacto en salud, social y económico de la pandemia por COVID-19 en Chile. En otras palabras, se busca evaluar la respuesta del sistema de salud y la política social a la pandemia COVID-19 para retroalimentar futuros abordajes ante agentes con potencial epidémico. Antes de procesar los datos, habían 168 variables pero luego de seleccionar y recodificar la cantidad de variables disminuyó a 10 de las cuales 5 servirán para el análisis. La unidad de análisis son los individuos y la población objetivo son hombres y mujeres mayores de 18 alis que residen en zonas urbanas de Chile. El **diseño muestral** es **probabilístico** y **estratificado** según área geográfica y tamaño poblacional. Utiliza un marco muestral actualizado de direcciones de viviendas particulares representativo de la población nacional. Y, finalmente, la fecha de realización de las encuestas telefónicas fue entre el 4 y el 22 de diciembre 2020 y se reportaron 1261 casos.


### 3. Selección de variables -------------------------------------------

Las variables seleccionadas para la investigación corresponden a id_encuesta, factor_expansion, entrevistado, c2_3 = estado salud mental, f2 = trabajo de cuidados, f1 = labores domésticas, g48 = tramo de ingreso, g1 = trabaja, edad y sexo. De las cuales, la variable f2: tiempo dedicado al cuidado de personas en comparación a la situación previa al COVID-19, vendría siendo la variable dependiente y las otras las variables independientes o predictoras. Luego, se crea el objeto o set de datos llamado movid_proc.


### 4. Vinculación con Sociología del Género ----------------------------------------

El análisis de regresión logística realizado en este trabajo de investigación será utilizado para la presentación de resultados de un análisis empírico en el marco del curso de Sociología del Género, con la profesora Julieta Palma y ayudante Teresa Barrera, donde se presentará una ponencia titulada **Hacia la corresponsabilidad social en los cuidados: Un análisis desde la perspectiva de género a los factores que inciden en el aumento de la carga de trabajos de cuidado en la pandemia en Chile** dentro de un panel titulado "Crisis de cuidados en el contexto del COVID-19: diagnósticos, perspectivas y proyecciones en Chile". 



