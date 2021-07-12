#Operaciones con matrices - Matrices transpuestas, inversas e identidad


# ---------------------------------------------
# 1. Matriz Transpuesta
# 2. Matriz inversa
# 3. Matriz identidad
# ---------------------------------------------

# ---------------------------------------------
# 1. Matriz Transpuesta
# ---------------------------------------------
A <- matrix(1:12, nrow = 3, ncol = 2, byrow = TRUE)
#       [,1] [,2]
# [1,]    1    2
# [2,]    3    4
# [3,]    5    6

A.t <- t(A)
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

v1 <- matrix(1:4, nrow = 1)
#       [,1] [,2] [,3] [,4]
# [1,]    1    2    3    4

t(v1)
#       [,1]
# [1,]    1
# [2,]    2
# [3,]    3
# [4,]    4

# Siempre use t() un objeto de matriz
v2 <- 1:4
t(v2)
#      [,1] [,2] [,3] [,4]
# [1,]    1    2    3    4

# ---------------------------------------------
# 2. Matriz inversa
# ---------------------------------------------
A <- matrix(1:4, nrow = 2, byrow = TRUE)
#       [,1] [,2]
# [1,]    1    2
# [2,]    3    4

# La forma A^-1 no devuelve una inversa; devuelve reciprocidad por elemento
A^-1
#           [,1] [,2]
# [1,] 1.0000000 0.50
# [2,] 0.3333333 0.25

# La funcion solve devuelve la inversa
solve(A)
#       [,1] [,2]
# [1,] -2.0  1.0
# [2,]  1.5 -0.5

### solo las matrices cuadradas son invertibles
B <- matrix(1:6, nrow = 2)
#       [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

solve(B)
# Error in solve.default(B) : 'a' (2 x 3) must be square

### la matriz no puede tener una fila o columna de ceros
C <- matrix(c(1,2,0,0), nrow = 2)
#       [,1] [,2]
# [1,]    1    0
# [2,]    2    0

solve(C)
# Error in solve.default(C) : 
#   Lapack routine dgesv: system is exactly singular: U[2,2] = 0



# ---------------------------------------------
# 3. Matriz identidad
# ---------------------------------------------
### Una matriz multiplicada por su inversa da la Matriz identidad
round(A %*% solve(A))
#      [,1] [,2]
# [1,]    1    0
# [2,]    0    1

### Para obtener una Matriz identidad usar diag()
I2 <- diag(2)
#      [,1] [,2]
# [1,]    1    0
# [2,]    0    1

I3 <- diag(3)
#      [,1] [,2] [,3]
# [1,]    1    0    0
# [2,]    0    1    0
# [3,]    0    0    1

I5 <- diag(5)
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    0    0    0    0
# [2,]    0    1    0    0    0
# [3,]    0    0    1    0    0
# [4,]    0    0    0    1    0
# [5,]    0    0    0    0    1

### Una matriz multiplicada por la identidad da como resultado la matriz nuevamente
A %*% I2
#       [,1] [,2]
# [1,]    1    2
# [2,]    3    4






