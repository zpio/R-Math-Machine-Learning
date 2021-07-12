# Operaciones con Vectores

# ------------------------------------------------------------------------
# 1. Grafica de un vector
# 2. Multiplicación de un vector con un escalar
# 3. Suma de vectores
# 4. Resta de vectores
# 5. Multiplicación con un escalar y suma de vectores juntos
# 6. Grafica de la suma de vectores
# ------------------------------------------------------------------------
# ------------------------------------------------------------------------

# ------------------------------------------------------------------------
# 1 . Grafica de vectores en 2-D y 3-D
# ------------------------------------------------------------------------

# Grafica de un vector en 2-D
vecplot_2d <- function(vector, xax, yax, color) {
  vec <- vector
  plot(vec[1], vec[2], type = 'p', col = color,
       xlim = xax, ylim = yax,
       xlab = "", ylab = "")
  arrows(x0 = 0, y0 = 0, x1 = vec[1], y1 = vec[2], lwd = 2, col = color)
  text(x = vec[1], y = vec[2], labels = paste('(', vec[1], ',', vec[2], ')', sep = ""), 
       pos = 3)
}

### Aplicando la funcion de grafico de un vector 2-D
vecplot_2d(vector = c(1,2), xax=c(0,5), yax=c(0,5), color = 'red')


# Grafica de un vector en 3-D
library(plot3D)
vecplot_3d <- function(vector, xax, yax, zax, color) {
  vec <- vector
  points3D(x = vec[1], y = vec[2], z = vec[3],
           xlim = xax, ylim = yax, zlim = zax,
           xlab = "x", ylab = "y", zlab = "z")
  text3D(x = vec[1]+0.5, y = vec[2], z = vec[3],
         labels = paste('(',vec[1],',',vec[2],',',vec[3],')', sep = ""), 
         add = TRUE)
  arrows3D(x0=0, y0=0, z0=0, x1=vec[1], y1=vec[2], z1=vec[3], lwd = 2, col = color, 
           add = TRUE)
}

### Aplicando la funcion de grafico de un vector 3-D
vecplot_3d(vector = c(2,3,4), xax = c(0,5), yax=c(0,5), zax=c(0,5), col = 'green')


# ------------------------------------------------------------------------
# 2. Multiplicación escalar
# ------------------------------------------------------------------------
v1 <- 1:5
#[1] 1 2 3 4 5

2 * v1
#[1]  2  4  6  8 10

# ------------------------------------------------------------------------
# 3. Suma de vectores
# ------------------------------------------------------------------------
v2 <- c(-1,-2,-3,-4,-5)
v1 + v2

#[1] 0 0 0 0 0

### Recuerde: los vectores DEBEN ser del mismo tamaño

v3 <- c(1,1,2)
#[1] 1 1 2

v4 <- rep(1, 6)
#[1] 1 1 1 1 1 1

v3 + v4
#[1] 2 2 3 2 2 3

# ------------------------------------------------------------------------
# 4. Resta de vectores
# ------------------------------------------------------------------------
v1 - v2
#[1]  2  4  6  8 10

v1 - (-1*v1)
#[1]  2  4  6  8 10

# ------------------------------------------------------------------------
# 5. Multiplicación y suma de vectores juntos
# ------------------------------------------------------------------------
v1 + 5*v2
#[1]  -4  -8 -12 -16 -20


# ------------------------------------------------------------------------
# 6. Grafica de la suma de vectores
# ------------------------------------------------------------------------

### Grafica de suma de vectores en 2-D
library(tidyverse)

vec.add.plot_2d <- function(vec1, vec2, xax, yax) {
  
  to.plot <- as.data.frame(rbind(vec1, vec2, vec1+vec2)) #Cols predet. V1, V2
  
  # graficar los puntos vec1 y vec1+vec2
  plot(to.plot[-2,]$V1, to.plot[-2,]$V2, type = 'p', col = 'red', lwd = 2,
       xlim = xax, ylim = yax)
  
  # poner las flechas
  arrows(x0 = 0, y0 = 0, x1 = to.plot[1,1], y1 = to.plot[1,2], col = 'blue', lwd = 2)
  arrows(x0 = to.plot[1,1], y0 = to.plot[1,2], x1 = to.plot[3,1], y1 = to.plot[3,2], 
         col = 'green', lwd = 2)
  arrows(x0 = 0, y0 = 0, x1 = to.plot[3,1], y1 = to.plot[3,2], col = 'red', lwd = 2)
  
  # poner las etiquetas de los puntos
  to.plot %>% 
    mutate(point = paste('(', V1, ',', V2, ')', sep = "")) -> to.plot
  with(to.plot[-2,], text(to.plot[-2,], labels = point, pos = 4))
}

# to.plot quedaria asi:
#   V1 V2 point
# 1  1  4 (1,4)
# 2  3  2 (3,2)
# 3  4  6 (4,6)

### Aplicando la funcion:
vec.add.plot_2d(vec1 = c(1,4), vec2 = c(3,2), xax=c(0,10), yax=c(0,10))


### Grafica de suma de vectores en 3-D (usar la libreria plot3D)
library(plot3D)

vec.add.plot_3d <- function(vec1, vec2, xax, yax, zax, phi, theta) {
  
  points3D(x = vec1[1], y = vec1[2], z = vec1[3], col = 'red',
           xlim = xax, ylim = yax, zlim = zax,
           xlab = "x", ylab = "y", zlab = "z",
           phi = phi,
           theta = theta)
  
  text3D(x = vec1[1], y = vec1[2], z = vec1[3]+0.25,
         labels = paste("(",vec1[1],",",vec1[2],",",vec1[3],")", sep=""), add = TRUE)
  
  arrows3D(x0=0, y0=0, z0=0, x1=vec1[1], y1=vec1[2], z1=vec1[3], lwd = 2, col = 'blue', 
           add = TRUE)
  
  points3D(x = vec1[1]+vec2[1], y = vec1[2]+vec2[2], z = vec1[3]+vec2[3], col = 'green',
           xlim = xax, ylim = yax, zlim = zax,
           xlab = "x", ylab = "y", zlab = "z",
           add = TRUE)
  
  arrows3D(x0=vec1[1], y0=vec1[2], z0=vec1[3], x1=vec1[1]+vec2[1], y1=vec1[2]+vec2[2], 
           z1=vec1[3]+vec2[3], lwd = 2, col = 'red', add = TRUE)
  
  vec3 <- vec1 + vec2
  
  points3D(x = vec3[1], y = vec3[2], z = vec3[3], col = 'red',
           xlim = xax, ylim = yax, zlim = zax,
           xlab = "x", ylab = "y", zlab = "z",
           add = TRUE)
  
  text3D(x = vec3[1], y = vec3[2], z = vec3[3],
         labels = paste("(",vec3[1],",",vec3[2],",",vec3[3],")", sep=""), add = TRUE)
  
  arrows3D(x0=0, y0=0, z0=0, x1=vec3[1], y1=vec3[2], z1=vec3[3], lwd = 2, col = 'green', 
           add = TRUE)
}

### Grafica de suma de vectores en 3-D
vec.add.plot_3d(vec1=c(1,2,3), vec2=c(4,5,4), xax=c(0,10), yax=c(0,10), zax=c(0,10),
                phi = 0, theta = 30)
                
                
                
                
                
