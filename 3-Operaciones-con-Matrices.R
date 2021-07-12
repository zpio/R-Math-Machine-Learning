# Operaciones con Matrices: Suma, Resta y Multiplicación

# ---------------------------------------------
# 1. Multiplicación escalar de matrices
# 2. Suma y resta de matrices
# 3. Multiplicación de matrices
# ---------------------------------------------

# ---------------------------------------------
# 1. Multiplicación escalar de matrices
# ---------------------------------------------
A <- matrix(c(-1,2,7,0), nrow = 2, ncol = 2, byrow = TRUE)
2 * A

#       [,1] [,2]
# [1,]   -2    4
# [2,]   14    0

# ---------------------------------------------
# 2. Suma y Resta de matrices
# ---------------------------------------------
A <- matrix(c(0,1,2,3), nrow = 2, byrow = TRUE)
#       [,1] [,2]
# [1,]    0    1
# [2,]    2    3

B <- matrix(c(0,-2,-5,12), nrow = 2, byrow = TRUE)
#       [,1] [,2]
# [1,]    0   -2
# [2,]   -5   12

A + B
#       [,1] [,2]
# [1,]    0   -1
# [2,]   -3   15

A2 <- matrix(1:6, nrow = 2, byrow = TRUE)
#       [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6

A + A2
#Error in A + A2 : non-conformable arrays


C <- matrix(c(-3,0,1,7,4,-6), nrow = 3, byrow = TRUE)
D <- matrix(c(-3,0,1,7,4,-6), nrow = 3, byrow = TRUE)

C - D
#       [,1] [,2]
# [1,]    0    0
# [2,]    0    0
# [3,]    0    0


# ---------------------------------------------
# 3. Multiplicación de matrices
# ---------------------------------------------

A * B
# Multiplicación elemento a elemento
#       [,1] [,2]
# [1,]    0   -2
# [2,]  -10   36

# Multiplicación Matricial 

A %*% B
#       [,1] [,2]
# [1,]   -5   12
# [2,]  -15   32

C %*% D
#Error in C %*% D : non-conformable arguments

B %*% A
#       [,1] [,2]
# [1,]   -4   -6
# [2,]   24   31





