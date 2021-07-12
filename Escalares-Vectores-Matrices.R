# Escalares, Vectores, y Matrices

# 1. Definiendo un vector [c(), :, seq(), rep()]
# 2. Definiendo una matrix [matrix(), rbind(), cbind()]
# 3. Graficas de vectores en 2-D y 3-D 

# ---------------------------------------------
# 1. Definiendo un vector [c(), :, seq(), rep()]
# ---------------------------------------------

# Usando la función 'c()'
v1 <- c(2,3,4,5)
str(v1)
# num [1:4] 2 3 4 5

# Usando el operator ':' 
v2 <- 2:5
str(v2)
# int [1:4] 2 3 4 5

# Usando la función seq() - secuencia
v3 <- seq(from = 2, to = 5, by = 1)
str(v3)
# num [1:4] 2 3 4 5

v3 <- seq(2, 5, 1)
str(v3)
# num [1:4] 2 3 4 5

# Usando la función 'rep()' - repetición
v4 <- rep(37, 5)
str(v4)
# num [1:5] 37 37 37 37 37


# --------------------------------------------------
# 2. Definiendo una matrix [matrix(), rbind(), cbind()]
# --------------------------------------------------
# Una matrix es una colección de vectores que tienen dimensiones (filas y columnas)

# Usando la función matrix() 
m1 <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = TRUE)

m1
#       [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6

dim(m1) # obtener la dimensiones
# [1] 2 3

m1 <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = FALSE)
#       [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6


# Usando las función rbind()
m2 <- rbind(c(1,2,3), c(4,5,6))

m2
#       [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6

# Usando las función cbind()
m3 <- cbind(c(1,4), c(2,5), c(3,6))

m3
#       [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6



# ---------------------------------------------
# 3. Graficas de vectores en 2-D y 3-D
# ---------------------------------------------
# Graficando un Vector en 2-D
u1 <- c(2,4)

plot(u1[1], u1[2], type = 'p', col = 'red',
     xlim = c(0,5), ylim = c(0,5),
     xlab = "", ylab = "")

arrows(x0 = 0, y0 = 0, x1 = u1[1], y1=u1[2], lwd = 2)

# Graficando dos vectores
v1 <- c(1,4)
v2 <- c(5,8)

plot(x=v1[1], y=v1[2], xlim = c(0,10), ylim = c(0,10))
arrows(x0=0, y0=0, x1=v1[1], y1=v1[2])
points(x=v2[1], y=v2[2], col = 'blue')
arrows(x0=0, y0=0, x1=v2[1], y1=v2[2], col = 'blue')

# Graficando un Vector en 3-D
library(plot3D)

u2 <- c(2,3,4)

points3D(x=u2[1], y=u2[2], z=u2[3], col = 'red',
         xlim = c(0,5), ylim = c(0,5), zlim = c(0,5),
         phi = 0)

arrows3D(x0 = 0, y0 = 0, z0 = 0, 
         x1 = u2[1], y1 = u2[2], z1 = u2[3], 
         lwd = 2, add = TRUE)





