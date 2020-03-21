---
title: 'Arte con R: Especial de San Valentín'
type: post
date: 2020-02-17T04:03:03+00:00
slug: arte-con-r-especial-de-san-valentin
categories:
  - Gráficos
  - R
tags:
  - Gráficos
  - R
  - San Valentín
featured_image: /wp-content/uploads/2020/02/presentacion5.png
---

El software R es un lenguaje de programación con múltiples funcionalidades enfocado en el análisis estadístico y producción de gráficos. Sin embargo, existe muchas otras cosas que R puede hacer y que no es tan conocido por los usuarios noveles y/o que se encuentran iniciándose en el mundo del análisis de datos con R. Entre las múltiples cosas que puede hacer R, se encuentra la creación de artículos, documentos científicos y/o libros (paquete <a href="https://bookdown.org/" target="_blank" rel="noopener noreferrer">Bookdown</a>); creación de presentaciones tipo PowerPoint(paquete <a href="https://github.com/yihui/xaringan" target="_blank" rel="noopener noreferrer">Xaringan</a>); páginas web (paquete <a href="https://github.com/rstudio/blogdown" target="_blank" rel="noopener noreferrer">Blogdown</a>); animación de gráficos (paquete <a href="https://github.com/thomasp85/gganimate" target="_blank" rel="noopener noreferrer">gganimate</a>); etc.

En esta ocasión presentaremos una aplicación relativamente reciente de R entorno a los gráficos: arte con R. Mediante la creación de puntos aleatorios y/o dirigidos, se realizan creaciones en formas de líneas, curvas o círculos con diferentes colores, grosores e intensidades que permiten generar imágenes realmente espectaculares con la ayuda de <a href="https://ggplot2.tidyverse.org/" target="_blank" rel="noopener noreferrer">ggplot2</a> en la mayoría de casos. Por ejemplo en el <a href="https://github.com/marcusvolz/mathart" target="_blank" rel="noopener noreferrer">github de Marcus Volz</a> se pueden observar gráficos tridimensionales creados bajo esta descripción.

Desde hace unos meses Danielle Navarro, psicóloga especializada en _computational cognitive_, ha desarrollado un paquete llamado _<a href="https://github.com/djnavarro/jasmines" target="_blank" rel="noopener noreferrer">jasmines</a>_, que permite hacer este tipo de creaciones desde el enfoquet <a href="https://es.r4ds.hadley.nz/" target="_blank" rel="noopener noreferrer">tidyverse</a>. En esta publicación te enseñaremos como realizar la instalación de los paquetes, y el código de algunas imágenes con temática de San Valentín. Lo primero que tendremos que hacer, es instalar (en caso no lo tengas), el paquete <a href="https://github.com/r-lib/devtools" target="_blank" rel="noopener noreferrer"><em>devtools</em></a>.

```{r}
install.packages("devtools")
```

Una vez se tenga instalado, instalaremos los paquetes pertinentes para poder reproducir las imágenes mencionadas.

<pre class="EnlighterJSRAW" data-enlighter-language="generic">devtools::install_github('thomasp85/ambient')
remotes::install_github("djnavarro/jasmines")
remotes::install_github("djnavarro/rosemary")</pre>

Dependiendo del sistema operativo que utilices, durante el proceso de instalación se podría requerir la instalación de alguna dependencia. Sin embargo, con los códigos mostrados anteriormente, debería ser suficiente para la mayoría de las personas. A continuación presentaremos 9 gráficos realizados con estos paquetes inspirados en la lista de <a href="https://github.com/djnavarro/tweetart" target="_blank" rel="noopener noreferrer">Danielle</a>.

## 1. Primer gráfico

<pre class="EnlighterJSRAW" data-enlighter-language="null">library(dplyr)
library(jasmines)

# Creación de la imagen
plot1 &lt;- use_seed(4) %&gt;% 
  entity_heart(7000) %&gt;% 
  unfold_tempest(iterations = 5, scale = 0.1, 
                           scatter = TRUE) %&gt;% 
  style_ribbon(type = "curve", 
                         curvature = 1, size = 0.25,
                         alpha = c(0.2, 0.03), background = "black", 
                         palette = palette_manual("red")) %&gt;% 
  style_overlay(border = "#ffffff88", 
                          fill = "#22222288") 
plot1 # mostrará el gráfico generado dentro de R(rstudio)

# Exportar imagen
export_image(plot1, "plot1.png", xlim = c(.2,.9), ylim = c(.2,.9),
             dpi = 300) # se puede aumentar el dpi para más resolución</pre>

<img class="aligncenter wp-image-618 size-large" src="https://www.medicionpsicologica.com/wp-content/uploads/2020/02/arrival_montreal-1024x1024.png" alt="San Valentin con R" width="960" height="960" srcset="https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/arrival_montreal-1024x1024.png 1024w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/arrival_montreal-300x300.png 300w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/arrival_montreal-150x150.png 150w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/arrival_montreal-768x768.png 768w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/arrival_montreal-1536x1536.png 1536w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/arrival_montreal-2048x2048.png 2048w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/arrival_montreal-1140x1140.png 1140w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/arrival_montreal-75x75.png 75w" sizes="(max-width: 960px) 100vw, 960px" />

&nbsp;

## 2. Segundo gráfico

<pre class="EnlighterJSRAW" data-enlighter-language="generic">library(dplyr)
library(jasmines)

# Creación de la imagen
plot2 &lt;- use_seed(182) %&gt;%
  entity_heart(2000) %&gt;%
  unfold_tempest(20, scale = .01) %&gt;%
  unfold_inside() %&gt;%
  mutate(order = (inside&gt;0) * order) %&gt;%
  style_ribbon("oslo", background = "gray10")

# Exportar imagen
export_image(plot2, "plot2.png", xlim = c(.2,.9),
               ylim = c(.2,.9), dpi = 300) # se puede aumentar el dpi para más resolución</pre>

<img class="aligncenter wp-image-620 size-large" src="https://www.medicionpsicologica.com/wp-content/uploads/2020/02/art019-1024x1024.png" alt="San Valentín con R 2" width="960" height="960" srcset="https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art019-1024x1024.png 1024w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art019-300x300.png 300w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art019-150x150.png 150w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art019-768x768.png 768w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art019-1536x1536.png 1536w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art019-2048x2048.png 2048w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art019-1140x1140.png 1140w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art019-75x75.png 75w" sizes="(max-width: 960px) 100vw, 960px" />

&nbsp;

## 3. Tercer gráfico

<pre class="EnlighterJSRAW" data-enlighter-language="generic">library(dplyr) 
library(jasmines) 

# Creación de la imagen
plot3 &lt;- use_seed(26) %&gt;%
  entity_heart(5000, size = 2) %&gt;%
  unfold_tempest(100, .0075) %&gt;%
  unfold_worley(scatter = TRUE) %&gt;%
  unfold_inside() %&gt;%
  mutate(x = x*(inside&gt;0)) %&gt;%
  style_ribbon("bamako", alpha = c(.1,.01), background = "white") 

# Exportar la imagen
export_image(plot3, "plot3.png", xlim = c(.2,.95), ylim = c(.2,.95),
             dpi = 300) # se puede aumentar el dpi para más resolución</pre>

<img class="aligncenter wp-image-622 size-large" src="https://www.medicionpsicologica.com/wp-content/uploads/2020/02/art026-1024x1024.png" alt="San Valentín con R 3" width="960" height="960" srcset="https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art026-1024x1024.png 1024w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art026-300x300.png 300w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art026-150x150.png 150w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art026-768x768.png 768w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art026-1536x1536.png 1536w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art026-2048x2048.png 2048w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art026-1140x1140.png 1140w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art026-75x75.png 75w" sizes="(max-width: 960px) 100vw, 960px" />

&nbsp;

## 4. Cuarto gráfico

<pre class="EnlighterJSRAW" data-enlighter-language="generic">library(dplyr)
library(jasmines)

# Creación de la imagen
plot4 &lt;- use_seed(31) %&gt;%
  entity_heart(1000) %&gt;%
  unfold_meander() %&gt;%
  unfold_inside() %&gt;%
  mutate(y = (inside &gt; 0)*y) %&gt;%
  style_ribbon("lajolla", "ind", c(.3,.1), "wheat") 

# Exportación de la imagen
export_image(plot4, "plot4.png", dpi = 300)</pre>

<img class="aligncenter wp-image-624 size-large" src="https://www.medicionpsicologica.com/wp-content/uploads/2020/02/art032-1024x1024.png" alt="San Valentín con R 4" width="960" height="960" srcset="https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art032-1024x1024.png 1024w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art032-300x300.png 300w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art032-150x150.png 150w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art032-768x768.png 768w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art032-1536x1536.png 1536w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art032-2048x2048.png 2048w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art032-1140x1140.png 1140w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art032-75x75.png 75w" sizes="(max-width: 960px) 100vw, 960px" />

## 5. Quinto gráfico

<pre class="EnlighterJSRAW" data-enlighter-language="generic">library(dplyr)
library(jasmines)

# Creación de la imagen
plot5 &lt;- use_seed(33) %&gt;%
  entity_heart(2000, size = 4) %&gt;%
  filter(ind %in% 200:1800) %&gt;%
  unfold_meander() %&gt;%
  style_ribbon("cork", "ind", c(.7, 0), "lavender", 50) 

# Exportación de la imagen
export_image(plot5, "plot5.png", xlim = c(.1,.9), ylim = c(.1,.9),
             dpi = 300)</pre>

<img class="aligncenter wp-image-625 size-large" src="https://www.medicionpsicologica.com/wp-content/uploads/2020/02/art033-1024x1024.png" alt="San Valentín con R 5" width="960" height="960" srcset="https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art033-1024x1024.png 1024w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art033-300x300.png 300w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art033-150x150.png 150w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art033-768x768.png 768w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art033-1536x1536.png 1536w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art033-2048x2048.png 2048w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art033-1140x1140.png 1140w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art033-75x75.png 75w" sizes="(max-width: 960px) 100vw, 960px" />

&nbsp;

## 6. Sexto gráfico

<pre class="EnlighterJSRAW" data-enlighter-language="generic">library(dplyr)
library(jasmines)

# Creación de la imagen
plot6 &lt;- use_seed(31) %&gt;%
  entity_heart(1000) %&gt;%
  unfold_slice() %&gt;%
  unfold_inside() %&gt;%
  mutate(y = (inside &gt; 0)*y) %&gt;%
  style_ribbon("grayC", "order", c(.3,.1)) 

# Exportación de la imagen
export_image(plot6, "plot6.png", xlim=c(.1,.9), ylim=c(.1,.9),
             dpi = 300)</pre>

<img class="aligncenter wp-image-626 size-large" src="https://www.medicionpsicologica.com/wp-content/uploads/2020/02/art036-1024x1024.png" alt="San Valentín con R 6" width="960" height="960" srcset="https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art036-1024x1024.png 1024w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art036-300x300.png 300w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art036-150x150.png 150w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art036-768x768.png 768w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art036-1536x1536.png 1536w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art036-2048x2048.png 2048w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art036-1140x1140.png 1140w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art036-75x75.png 75w" sizes="(max-width: 960px) 100vw, 960px" />

&nbsp;

## 7. Séptimo gráfico

<pre class="EnlighterJSRAW" data-enlighter-language="generic">library(dplyr)
library(jasmines)

# Creación de la imagen
plot7 &lt;- use_seed(2) %&gt;%
  scene_grid(1:3, 1:3, "heart", 1000, .5) %&gt;%
  unfold_slice(10) %&gt;%
  unfold_inside() %&gt;%
  mutate(id = id + inside) %&gt;% 
  style_ribbon("rainbow", "id", c(.3, .7)) %&gt;%
  style_overlay(fill = "#00000088")

# Exportación de la imagen
export_image(plot7, "plot7.png", xlim=c(.1,.9), ylim=c(.1,.9),
             dpi = 300) 
</pre>

<img class="aligncenter wp-image-627 size-large" src="https://www.medicionpsicologica.com/wp-content/uploads/2020/02/art045-1024x1024.png" alt="San Valentín con R 7" width="960" height="960" srcset="https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art045-1024x1024.png 1024w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art045-300x300.png 300w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art045-150x150.png 150w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art045-768x768.png 768w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art045-1536x1536.png 1536w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art045-2048x2048.png 2048w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art045-1140x1140.png 1140w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art045-75x75.png 75w" sizes="(max-width: 960px) 100vw, 960px" />

&nbsp;

## 8. Octavo gráfico

<pre class="EnlighterJSRAW" data-enlighter-language="generic">library(dplyr)
library(jasmines)

# Creación de la imagen
plot8 &lt;- use_seed(1) %&gt;%
  entity_heart(1000) %&gt;%
  unfold_tempest(100, .01) %&gt;%
  style_ribbon(palette_manual("white","black","black","red","orange"),"time") %&gt;%
  style_overlay(fill = "#00000088")

# Exportación de la imagen
export_image(plot8, "plot8.png", xlim = c(.2,.8), ylim = c(.2,.8),
             dpi = 300)</pre>

<img class="aligncenter wp-image-628 size-large" src="https://www.medicionpsicologica.com/wp-content/uploads/2020/02/art049-1024x1024.png" alt="San Valentín con R 8" width="960" height="960" srcset="https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art049-1024x1024.png 1024w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art049-300x300.png 300w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art049-150x150.png 150w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art049-768x768.png 768w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art049-1536x1536.png 1536w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art049-2048x2048.png 2048w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art049-1140x1140.png 1140w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art049-75x75.png 75w" sizes="(max-width: 960px) 100vw, 960px" />

&nbsp;

## 9. Noveno gráfico

<pre class="EnlighterJSRAW" data-enlighter-language="generic">library(dplyr)
library(jasmines)

# Creación de la imagen
plot9 &lt;- use_seed(1) %&gt;%
  scene_grid(1:5, 1:5, "heart", 500, .4) %&gt;%
  unfold_tempest(100, .01) %&gt;%
  style_ribbon(palette_manual("white","black","black","red","orange"),"time", c(.3,.05)) %&gt;%
  style_overlay(fill = "white") 

# Exportación de la imagen
export_image(plot9, "plot9.png", xlim = c(.1,.9), ylim = c(.1,.9),
             dpi = 300)
</pre>

<img class="aligncenter wp-image-629 size-large" src="https://www.medicionpsicologica.com/wp-content/uploads/2020/02/art050-1024x1024.png" alt="San Valentín con R 8" width="960" height="960" srcset="https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art050-1024x1024.png 1024w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art050-300x300.png 300w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art050-150x150.png 150w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art050-768x768.png 768w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art050-1536x1536.png 1536w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art050-2048x2048.png 2048w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art050-1140x1140.png 1140w, https://grupoamp3.000webhostapp.com/wp-content/uploads/2020/02/art050-75x75.png 75w" sizes="(max-width: 960px) 100vw, 960px" />

&nbsp;

&nbsp;

&nbsp;

<div id="s3gt_translate_tooltip_mini" class="s3gt_translate_tooltip_mini_box" style="background: initial !important; border: initial !important; border-radius: initial !important; border-spacing: initial !important; border-collapse: initial !important; direction: ltr !important; flex-direction: initial !important; font-weight: initial !important; height: initial !important; letter-spacing: initial !important; min-width: initial !important; max-width: initial !important; min-height: initial !important; max-height: initial !important; margin: auto !important; outline: initial !important; padding: initial !important; position: absolute; table-layout: initial !important; text-align: initial !important; text-shadow: initial !important; width: initial !important; word-break: initial !important; word-spacing: initial !important; overflow-wrap: initial !important; box-sizing: initial !important; display: initial !important; color: inherit !important; font-size: 13px !important; font-family: X-LocaleSpecific, sans-serif, Tahoma, Helvetica !important; line-height: 13px !important; vertical-align: top !important; white-space: inherit !important; left: 140px; top: 186px; opacity: 0.5;">
  <div id="s3gt_translate_tooltip_mini_logo" class="s3gt_translate_tooltip_mini" title="Traducir texto seleccionado">
  </div>
  
  <div id="s3gt_translate_tooltip_mini_sound" class="s3gt_translate_tooltip_mini" title="Escuchar">
  </div>
  
  <div id="s3gt_translate_tooltip_mini_copy" class="s3gt_translate_tooltip_mini" title="Copiar texto al Portapapeles">
  </div>
</div>