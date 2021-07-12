# Eigenvectors y Eigenvalues


# --------------------------------------------------------------------
# 1. Encontrar la matriz de covarianza y la descomposición eigen
# 2. Comprensión de un eigenvalue igual a cero
# --------------------------------------------------------------------

# Eigenvectors y Eigenvalues

# Un eigenvector (vector propio) de una matriz Anxn es un vector v distinto de cero tal que Av = lambda v , donde es lambda un escalar.
# El escalar lambda se llama eigenvalue (valor propio) de A
# Decimos "v es un vector propio correspondiente a lambda".


# La matriz de varianza / covarianza

# Dado un conjunto de datos de múltiples variables, la matriz de covarianza es una matriz cuadrada 
# que contiene las varianzas y covarianzas para cada variable o par de variables.

# Descomposición eigen (propia) de la matriz de covarianza

# Los Eigenvectors y Eigenvalues de la matriz de covarianza se utilizan para determinar dónde ocurre la mayor cantidad de variación en los datos.
# Si la matriz de covarianza tiene un eigenvalue (valor propio) de 0, podría significar que existe una dependencia lineal en el conjunto de datos.
## ¡Lo contrario no es cierto! Si la matriz de covarianza no tiene un valor propio de 0, no significa que no haya una dependencia lineal en el conjunto de datos.
## Técnicamente, un valor propio de cero significa que no hay más variación en los datos. A menudo, esto se debe a una dependencia lineal.
# Este concepto se utiliza en las técnicas de reducción de dimensiones más comunes.


# --------------------------------------------------------------------
# 1. Encontrar la matriz de covarianza y la descomposición eigen
# --------------------------------------------------------------------
A <- matrix(c(1,2,-1,0,2,3,4,-2,1), nrow = 3, byrow = TRUE)
colnames(A) <- c('a1', 'a2', 'a3')

# Matriz de covarianza
round(cov(A), 2)

# Decomposition eigen() 
eigen(cov(A))


# --------------------------------------------------------------------
# 2. Comprensión de un eigenvalue igual a cero
# --------------------------------------------------------------------
set.seed(1234)
x1 <- rnorm(n = 50)
x2 <- rnorm(n = 50)
x3 <- 2*x1

B <- cbind(x1,x2,x3)
cov.B <- cov(B)
eigen.B <- eigen(cov.B)
eigen.B

eigen.B$vectors[,1] %*% eigen.B$vectors[,2] ## 
eigen.B$vectors[,1] %*% eigen.B$vectors[,3] ## 
eigen.B$vectors[,2] %*% eigen.B$vectors[,3] ## 

# Ninguno es cero, por lo que los datos son linealmente dependientes






