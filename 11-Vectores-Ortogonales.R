# Vectores Ortogonales e Independencia Lineal

# ---------------------------------------------------------
# 1. Prueba de ortogonalidad
# 2. Ejemplo con regresión lineal
# ---------------------------------------------------------

# Dos vectores son ortogonales si su producto interno es 0
# Los vectores ortogonales son análogos a las líneas perpendiculares
# Un conjunto de vectores se denomina conjunto ortogonal si cada par de vectores es ortogonal

# La independencia lineal significa que ningún vector puede escribirse como una combinación lineal de cualquiera de los otros vectores.
# Si dos vectores son ortogonales, también son linealmente independientes.

# Un conjunto de vectores ortogonales es linealmente independiente siempre que no exista un vector de ceros en el conjunto.

# En regresión lineal y otros modelos, use solo el número mínimo de variables de entrada requeridas para obtener un modelo apropiado.
# Si el conjunto de variables de entrada es un conjunto de vectores, X = {x1, x2,.., xp} , el supuesto en la regresión es que el conjunto es linealmente indepente
# Si un vector es una combinación lineal de otros, utilice ese vector en el modelo

# ---------------------------------------------------------
# 1. Prueba de ortogonalidad
# ---------------------------------------------------------
v1 <- c(0,1)
v2 <- c(-2,5)
v3 <- c(-1,2)

v1 %*% v2 ## 5
v1 %*% v3 ## 2
v2 %*% v3 ## 12
# Ninguna es cero, así que no ortogonal
# v2 = v1 + 2*v3

w1 <- c(1,3,2)
w2 <- c(3,-1,0)
w3 <- c(1,3,-5)

w1 %*% w2 ## 0
w1 %*% w3 ## 0
w2 %*% w3 ## 0
# Todos los pares son ortogonales


# ---------------------------------------------------------
# 2. Ejemplo con regresión lineal
# ---------------------------------------------------------

set.seed(123)
x1 <- rnorm(n = 100)
x2 <- rnorm(n = 100)
x3 <- 2*x1 + 3*x2   ## x3 es una combinación lineal de x1 y x2
y <- 4*x3  ## 4*x3 = 4(2*x1 + 3*x2) = 8*x1 + 12*x2

model.data <- as.data.frame(cbind(y,x1,x2,x3))

mod1 <- lm(y ~ ., data = model.data)
summary(mod1)

mod2 <- lm(y ~ x3, data = model.data)
summary(mod2)

x1 %*% x2
x1 %*% x3
x2 %*% x3
# Ninguno es cero, por lo que los datos son linealmente dependientes





