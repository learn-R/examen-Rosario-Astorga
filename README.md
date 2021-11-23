# Un análisis con perspectiva de género a los factores determinantes de la salud mental durante la pandemia en Chile

Repositorio que contiene el Proyecto de investigación final del curso de Análisis de Datos en R. Su objetivo es evaluar los conocimientos y aprendizajes obtenidos en el curso de manera integra.

-   Autora: Rosario Astorga Pinto

-   Profesora: Valentina Andrade de la Horra

-   Ayudantes: Dafne Jaime Vargas y Nicolás Godoy Márquez

### Abstract

El COVID-19 ha dejado en evidencia la importancia de la salud mental en momentos de mayor crisis en los que se agudizan e invisibilizan múltiples problemáticas sociales. Una de ellas se origina en la desigual distribución de la carga tanto física como mental entre hombres y mujeres dentro del hogar, según la OIT (2020) un 70% del total de mujeres, enfrentan debido a la pandemia una triple carga: trabajo doméstico, de cuidado y cognitivo no remunerado, el que se ha visto aumentado de forma considerable. La siguiente investigación busca analizar los factores que influyen en la salud mental durante la pandemia en Chile, considerando el sexo, edad, trabajo productivo, trabajo doméstico y trabajo de cuidados. Para efectos de esta investigación, se utilizó la base de datos MOVID-IMPACT (2020) y mediante un análisis de regresión logística binaria se concluye que existe una relación significativa entre el ser mujer y no trabajar con sentirse deprimida o desesperanzada.

**Palabras claves:** salud mental, pandemia, trabajo de cuidados, trabajo doméstico.

### Base de datos

La base a utilizar para este proyecto de investigación final corresponde a los datos de la encuesta **MOVID-IMPACT (2020)**. El objetivo de esta encuesta transversal combinado es analizar el impacto en salud, social y económico de la pandemia por COVID-19 en Chile. En otras palabras, se busca evaluar la respuesta del sistema de salud y la política social a la pandemia COVID-19 para retroalimentar futuros abordajes ante agentes con potencial epidémico. Antes de procesar los datos, habían 168 variables y 3569 observacione pero luego de seleccionar y recodificar, la cantidad de variables disminuyó a 8 y la cantidad de observaciones a 1261. La unidad de análisis son los individuos y la población objetivo son hombres y mujeres mayores de 18 alis que residen en zonas urbanas de Chile. El **diseño muestral** es **probabilístico** y **estratificado** según área geográfica y tamaño poblacional. Utiliza un marco muestral actualizado de direcciones de viviendas particulares representativo de la población nacional. Y, finalmente, la fecha de realización de las encuestas telefónicas fue entre el 4 y el 22 de diciembre 2020 y se reportaron 1261 casos.

### Selección de variables

Las variables seleccionadas para la investigación corresponden a factor_expansion, entrevistado, c2_3 = estado salud mental, f2 = trabajo de cuidados, f1 = trabajo doméstico, g1 = trabajo productivo, edad y sexo. De las cuales, la variable c2_3 = estado salud, vendría siendo la variable dependiente y las otras las variables independientes o predictoras. Luego, se crea el objeto o set de datos llamado movid_proc.

### Vinculación con Sociología del Género

El análisis de regresión logística realizado en este trabajo de investigación será utilizado para la presentación de resultados de un análisis empírico en el marco del curso de Sociología del Género, con la profesora Julieta Palma y ayudante Teresa Barrera, donde se presentará una ponencia titulada **"Hacia la corresponsabilidad social en los cuidados: Un análisis desde la perspectiva de género a los factores que inciden en el aumento de la carga de trabajos de cuidado en la pandemia en Chile"** dentro de un panel titulado "Crisis de cuidados en el contexto del COVID-19: diagnósticos, perspectivas y proyecciones en Chile".
