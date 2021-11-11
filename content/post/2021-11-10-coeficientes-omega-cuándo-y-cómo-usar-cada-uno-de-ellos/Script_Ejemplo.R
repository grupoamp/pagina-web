###############################################################################
##########                                                           ##########
##########            Coeficientes Omega: ¿Cuándo y cómo             ##########
##########                 usar cada uno de ellos?                   ##########
#######      GRUPO DE ESTUDIO AVANCES EN MEDICIÓN PSICOLÓGICA (AMP)     #######
#######                                                                 #######
#######      Adaptado de “Your coefficient alpha is probably wrong,     #######
#######               but which coefficient omega is right?             #######
#####    A tutorial on using R to obtain better reliability estimates”    #####
#######                     By David B. Flora (2020)                    #######
#######                                                                 #######
###############################################################################

# Instalar y cargar paquetes
pacman::p_load(lavaan, semTools, psych, MBESS)

##### Modelos Unidimensionales

### Datos continuos

# Cargar la base de datos (6 opciones de respuesta)
open <- read.csv("https://osf.io/53wdz/download")

# Especificar el modelo (1 factor)
mod1f <- 'open =~ O1 + O2+ O3 + O4 + O5'

# Estimar el modelo (1 factor)
fit1f <- cfa(mod1f, data=open, std.lv=T, missing='direct', estimator='MLR')

# Visualizar los resultados
summary(fit1f, fit.measures=T)

# Evaluar los resultados
# CFI=0.938, TLI=0.875, RMSEA=0.079 -> Ajuste no tan idóneo (TLI<0.90 y RMSEA
#                                      al límite)
# Cargas factoriales [0.361-0.794] -> Modelo no tau-equivalente (no usar alfa)

# Explorar índices de modificación
modificationIndices(object = fit1f, sort. = T, minimum.value = 3, 
                    maximum.number = 10)

# En este caso, vemos una sugerencia para correlacionar errores entre O2 y O5.
# Estos 2 ítems fueron invertidos, por lo que sería razonable liberar ese
# parámetro y así mejoraría el ajuste del modelo.
# Entonces vamos a re-especificar nuestro modelo inicial (siempre tener un
# sustento adicional a la sugerencia netamente del software)
# En otra situación con buen ajuste inicial, se podría pasar directo a "Estimar
# la fiabilidad"

# Re-especificar el modelo (con errores correlacionados)
mod1fR <- 'open =~ O1 + O2+ O3 + O4 + O5
                   O2 ~~ O5'

# Estimar el nuevo modelo y visualizar los resultados
fit1fR <- cfa(mod1fR, data=open, std.lv=T, missing='direct', estimator='MLR')
summary(fit1fR, fit.measures=T)

# Evaluar los resultados
# CFI=0.989, TLI=0.973, RMSEA=0.037 -> Gran mejora en los índices (Buen ajuste)

# Estimar la fiabilidad (ambos modelos)
reliability(fit1f)
reliability(fit1fR)

# Según los modelos analizados, la estimación de fiabilidad más precisa
# sería la del modelo re-especificado (mejor ajuste).
# Para la interpretación de los resultados obtenidos en "reliability" tener en
# cuenta lo siguiente:
# Omega: No considera errores correlacionados
# Omega2: Considera errores correlacionados
# Por lo tanto, para este caso, el valor de omega sería de 0.5593717.

# Precisar Intervalos de Confianza al 95% (con Bootstrapping)
ci.reliability(data=open, type = "omega", interval.type = "perc", B = 100)

# NOTA: Con este procedimiento, se calcula omega considerando un modelo
# ajustado perfectamente (sin errores correlacionados). Es por eso que 
# coincide con el modelo inicial, y no con el re-especificado.

### Datos categóricos

# Cargar la base de datos (4 opciones de respuesta)
psyctcsm <- read.csv("https://osf.io/atqc6/download")

# Especificar el modelo (1 factor)
mod1f_p <- 'psyctcsm =~ DDP1 + DDP2 + DDP3 + DDP4'

# Estimar el modelo y visualizar los resultados
fit1f_p <- cfa(mod1f_p, data=psyctcsm, std.lv=T, ordered = T,
               estimator='WLSMV')
summary(fit1f_p, fit.measures=T)

# Evaluar los resultados
# CFI=0.99, TLI=0.97, RMSEA=0.114 -> Ajuste "aceptable" (CFI-TLI: Buen ajuste
#                                                       RMSEA: Ajuste pobre)

# Explorar índices de modificación
modificationIndices(object = fit1f_p, sort. = T, minimum.value = 3, 
                    maximum.number = 10)

# Como sugerencias tenemos correlacionar errores entre DDP1 y DDP4, pero el 
# cambio no es mucho y además no tenemos un sustento adicional para llevar a 
# cabo la re-especificación. Entonces nos quedamos con el modelo inicial.

# Estimar la fiabilidad (Omega-categórico)
reliability(fit1f_p)

# Para calcular omega-categórico, se usa el enfoque de Green and Yang (2009),
# teniendo que Omega3, es el que utiliza la fórmula original. Por lo que se
# recomendaría interpretar esta fila, siendo el valor del omega-categórico
# en este caso: 0.7932682.

# Precisar Intervalos de Confianza al 95% (con Bootstrapping)
ci.reliability(data=psyctcsm, type = "categorical", interval.type = "perc",
               B = 100)


##### Modelos Multidimensionales

### Modelo Bifactor

# Cargar base de datos (6 opciones de respuesta)
pcs <- read.csv("https://osf.io/xd2tu/download")

# Especificar el modelo
modBf <- 'gen =~ TE1  + TE2  + TE3  + TE4  + TE5 + OE1 + OE2 + OE3 + OE4 +
                 LVA1 + LVA2 + LVA3 + LVA4 + EM1 + EM2 + EM3 + EM4 + EM5 + EM6
           s1 =~ TE1  + TE2  + TE3  + TE4  + TE5 
           s2 =~ OE1  + OE2  + OE3  + OE4
           s3 =~ LVA1 + LVA2 + LVA3 + LVA4
           s4 =~ EM1  + EM2  + EM3  + EM4  + EM5 + EM6'

# Estimar el modelo y visualizar los resultados
fitBf <- cfa(modBf, data=pcs, std.lv=T, estimator='MLR', orthogonal=T)
summary(fitBf, fit.measures=T)

# Evaluar los resultados
# CFI=0.978, TLI=0.972, RMSEA=0.053 -> Buen ajuste

# Estimar la fiabilidad (Omega-jerárquico)
reliability(fitBf)

# En este caso, tenemos resultados tanto del factor general (gen), como de los
# factores específicos (s1-s4). Para ello, tener en cuenta lo siguiente:
# Columna "gen": Fiabilidad para un puntaje total del constructo
# Columnas s1-s4: Fiabilidad para puntajes de subescalas
# Para todos los casos nos centraremos en la fila de "omega 3", siendo el valor
# de Omega-jerárquico: 0.9077636


### Modelo de Orden Superior (Higher-order)

# Se usa la misma base de datos

# Especificar el modelo
homod <- 'TE =~ TE1  + TE2  + TE3  + TE4 + TE5 
          OE =~ OE1  + OE2  + OE3  + OE4
          LV =~ LVA1 + LVA2 + LVA3 + LVA4
          EM =~ EM1  + EM2  + EM3  + EM4 + EM5 + EM6
        cost =~ TE   + OE   + LV   + EM'

# Estimar el modelo y visualizar los resultados
fitHo <- cfa(homod, data=pcs, std.lv=T, estimator='MLM')
summary(fitHo, fit.measures=T)

# Evaluar los resultados
# CFI=0.981, TLI=0.978, RMSEA=0.047 -> Buen ajuste

# Estimar la fiabilidad (Omega-higher-order)
reliabilityL2(fitHo, 'cost')

# Para la interpretación centrarse en omegaL1, siendo el valor del Omega de
# orden superior (Omega-higher-order): 0.9088176.

# Estimación de fiabilidad de las subescalas
reliability(fitHo)

# Estos resultados calculan la fiabilidad por cada uno de los factores de orden
# inferior, siendo esencialmente cálculos de omegas unidimensionales para cada
# subescala de manera independiente. Debido a ello, al igual que en esos casos,
# se consideraría las filas de "Omega" u "Omega2" para las interpretaciones;
# sin embargo, al saber que estas subescalas pertenecen a un modelo de orden
# superior, se debe tener en cuenta también los resultados de fiabilidad para 
# estas subescalas en un modelo bifactor, con el fin de precisar si estos
# resultados están más influenciados por la presencia un factor general o la
# subescala específica.

### Estimaciones exploratorias de Omega
omega(pcs, nfactors = 4, plot = F)

# En estos resultados se obtiene un Omega-jerárquico (0.85) derivado de un
# AFE que puede ser útil si no se cuenta con un modelo previo bien especificado
# o cuando este no consigue un buen ajuste.
