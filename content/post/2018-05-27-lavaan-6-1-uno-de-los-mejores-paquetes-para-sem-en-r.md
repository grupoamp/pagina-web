---
title: 'Lavaan 6.1 : Uno de los mejores paquetes para SEM en R'
type: post
date: 2018-05-27T17:54:07+00:00
url: /2018/05/lavaan-6-1-uno-de-los-mejores-paquetes-para-sem-en-r
featured_image: /wp-content/uploads/2018/05/Lavaan.png

---
Se actualiza oficialmente el paquete Lavaan de R desarrollado principalmente por Yves Rosseel a la versión 6.1. Lavann es uno de los software más populares y potentes para el modelamiento de ecuaciones estructurales (SEM, incluye análisis factorial confirmatorio), con ventaja de trabajar con variables categóricas y estimadores robustos (mayormente los heredados de Mplus).Entre las novedades de esta nueva versión se encuentra:

  * Soporte inicial de dos niveles SEM con interceptos aleatorios.
  * Soporte inicial para pesos muestreales (muestras complejas) para datos no agrupados por ahora. Aunque «[lavaa.survey][1]» no deja de ser una buena opción.
  * Optimización del código para el cálculo de los estadísticos y errores estándar.
  * El estimador «PML» trabaja ahora con datos mixtos (continuos y ordinales).
  * Cambios al comparar modelos anidados en covarianza y por parámetros que han sido estimados mediante MLM o WLSMV. Hasta el momento se usaba lavTestLRT(, method = «satorra2000») por defecto.
  * Se deja de mostrar la advertencia de celdas vacías en variables categóricas (uso de matrices tetracóricas/policóricas).

<!--more-->

Mayor detalles sobre las novedades puedes encontrarlo en el siguiente enlace: <http://lavaan.ugent.be/history/dot6.html>
  
Así mismo, para mayor información sobre SEM mulinivel, Lavaan proporciona un apartado en su tutorial: <http://lavaan.ugent.be/tutorial/multilevel.html>

Advertencia: Aún se muestran algunos fallos que se van reportando en github.

Si descubres algún problema que pueda estar funcionando mal en lavaan, no dudes en reportarlo (asegurate que realmente sea un problema) en su github: <https://github.com/yrosseel/lavaan/issues>

En caso que no estés seguro o tengas duda sobre su funcionamiento siempre puedes consultar los fotos en internet sobre ello, siendo el más consultado el google groups sobre lavaan: <https://groups.google.com/forum/#!forum/lavaan>

Como siempre, si tienes dudas o algo nuevo que contarnos, puedes dejar tu comentario aquí o por nuestras [redes sociales][2].

 [1]: https://cran.r-project.org/web/packages/lavaan.survey/lavaan.survey.pdf
 [2]: http://grupoamp.tk/contactanos/