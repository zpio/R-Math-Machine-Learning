# Representacion Matricial de una Regresion Lineal

# ---------------------------------------------
# TOC:
# 1. Ejemplo Deterministico
# 2. Ejemplo Estocástico 
# 3. Calculate predicted values
# ---------------------------------------------

# Traducir componentes de regresión lineal a matrices


# y = B_0 + B_1.x + B_2.x2 + .. + B_x.xn + e

# Suponga que hay 𝑛 observaciones y 𝑘 variables de entrada
# Sea 𝒚 el vector de respuestas 𝑛 𝑥 1
# Sea 𝑿 el vector 𝑛 𝑥 (𝑘 + 1) de valores para las variables independientes
# Sea 𝜷 el (𝑘 + 1) 𝑥 1 vector de coeficientes
# Sea 𝝐 el vector de errores 𝑛 𝑥 1

# El modelo y = B_0 + B_1.x + B_2.x2 + .. + B_x.xn + e se traduce en:

# y = X.B + e

# El desafío entonces es encontrar los valores en el vector B:

# beta <- solve(t(X) %*% X) %*% t(X) %*% y


# ---------------------------------------------
# 1. Ejemplo Deterministico
# ---------------------------------------------

# Definimos las datos en matrices

y <- c(24,30,41) ## Costo Total
x.0 <- rep(1,3)  ## vector unitario para el término de intersección
x.1 <- c(0,2,5)  ## cantidad de hot dogs comprados
x.2 <- c(2,2,3)  ## cantidad de fries comprados
X <- cbind(x.0,x.1,x.2)
X
#      x.0 x.1 x.2
# [1,]   1   0   2
# [2,]   1   2   2
# [3,]   1   5   3

# Graficar las varibales

plot(x.1, y)
plot(x.2, y)
plot3d(x = x.1, y = x.2, z = y, type = 's', col = 'red')

## Calcula el vector de Betas (Coeficientes)
beta <- solve(t(X) %*% X) %*% t(X) %*% y
beta
#     [,1]
# x.0   20
# x.1    3
# x.2    2

# Escribe la ecuación de regresión lineal
# c = 20 + 3*h + 2*f 



# ---------------------------------------------
# 2. Ejemplo Estocastico
# ---------------------------------------------

# Tener un data frame

head(mtcars)
#                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    2

data <- mtcars %>% 
  select(mpg, wt, qsec)

# Graficar mpg vs wt y mpg vs qsec

plot(data$wt, data$mpg)
plot(data$qsec, data$mpg)

# Graficar las 3 variables juntas
library(rgl)
plot3d(x = data$wt, y = data$qsec, z = data$mpg, type = 's', col = 'red')

# Definimos las datos en matrices (modelo deseado: mpg ~ wt + qsec)

y <- as.matrix(mtcars$mpg) ## variable respuesta
X <- as.matrix(cbind(rep(1,length(mtcars$mpg)), mtcars[,c('wt','qsec')]))

head(X)
#                  rep(1, length(mtcars$mpg))    wt  qsec
# Mazda RX4                                  1 2.620 16.46
# Mazda RX4 Wag                              1 2.875 17.02
# Datsun 710                                 1 2.320 18.61

## Calcule el vector beta (Coeficientes) (debería ser 19,75, -5.05 y 0.93)
beta <- solve(t(X) %*% X) %*% t(X) %*% y
beta

#                                 [,1]
# rep(1, length(mtcars$mpg)) 19.746223
# wt                         -5.047982
# qsec                        0.929198


# Escribe la ecuación de regresión lineal
# mpg = 19.746223 -5.047982*wt + 0.929198*qsec 



# ---------------------------------------------
# 3. Calcular valores predichos
# ---------------------------------------------
library(tidyverse)
pred <- mtcars %>%
  mutate(Predicted = 19.746223 - 5.047982*wt + 0.929198*qsec)

head(pred)
#    mpg cyl disp  hp drat    wt  qsec vs am gear carb Predicted
# 1 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4  21.81511
# 2 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4  21.04822
# 3 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1  25.32728
# 4 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1  21.58057
# 5 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2  18.19611
# 6 18.1   6  225 105 2.76 3.460 20.22  1  0    3    1  21.06859


# Graficar la variable respuesta y los valores predichos
# Esperamos una línea recta
plot(pred$mpg, pred$Predicted)  

plot3d(x = pred$wt, y = pred$qsec, z = pred$mpg, type = 's', col = 'red')
