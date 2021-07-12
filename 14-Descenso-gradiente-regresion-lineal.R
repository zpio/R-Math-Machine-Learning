# Descenso de gradiente en regresión lineal

# -------------------------------------------
# 1. Generar datos y ajustar el modelo
# 2. Ejecute Gradient Descent
#  ------------------------------------------

#Descenso de gradiente en regresión lineal:
# Suponga un modelo de regresión lineal simple de y = Bo + B1x
# Aplicar el descenso de gradiente a la función de pérdida (L)
# permitirá encontrar Bo y B1 de manera que la pérdida (error) se minimice.
# Podemos inicializar valores para B0 y B1, así como una tasa de aprendizaje alfa, 
# y luego ejecutar el descenso de gradiente para encontrar valores óptimos para B0 y B1

#En Regresión lineal, la función de costo (pérdida o error) es:

# L = sum(ei)^2
# L = sum(yi - y^_i)^1
# L = sum(yi - Bo - sum(Bi xij))^2



# -------------------------------------------
# 1. Generar datos y ajustar el modelo
#  ------------------------------------------
set.seed(1234)
x <- rnorm(500)
y <- 5 + 2*x + rnorm(500) # B0 = 5, B1 = 2
plot(x, y)

lm.mod <- lm(y ~ x)
lm.mod  ## Bastante cerca de los valores reales de 5 y 2
abline(a = lm.mod$coefficients[1], b = lm.mod$coefficients[2], col = 'red')


# -------------------------------------------
# 2. Ejecute Gradient Descent
#  ------------------------------------------
X <- as.matrix(cbind(1, x)) # Agregar vector de 1 para el término de intersección

# Definir función de error
error <- function(beta) {
  sum((X %*% beta - y)^2) # Suma de errores al cuadrado
}

# Define derivadas parcial de L con respecto B0
del.b0 <- function(b0, b1) {
  sum(-y + (b1*x + b0)) * (2 / length(x))
}

# Define derivadas parcial de L con respecto B1
del.b1 <- function(b0, b1) {
  sum(x %*% (-y + (b1*x + b0))) * (2 / length(x))
}


# Inicializar parámetros para algoritmo
b0 <- 0
b1 <- 0
alpha = 0.01
n.iter <- 500
error.history <- numeric(n.iter)
b0.history <- numeric(n.iter)
b1.history <- numeric(n.iter)

for (i in 1:n.iter) {
  # Calcular el gradiente (derivadas parciales evaluado en B0 y B1) 
  b0.gradient <- del.b0(b0, b1)
  b1.gradient <- del.b1(b0, b1)
  
  # Calcular los nuevos Betas
  b0 <- b0 - alpha*b0.gradient
  b1 <- b1 - alpha*b1.gradient
  beta <- as.matrix(c(b0, b1))
  
  # Guarda las iteraciones de (B0, B1)
  error.history[i] <- error(beta)
  b0.history[i] <- b0
  b1.history[i] <- b1
}


# Ver resultados y comparar con lm
beta # Cerca de 5 y 2
lm.mod # Salida de lm() y salida de descenso de gradiente idéntica

# Recta Real y ajustada con valores beta óptimos
plot(x, y)
abline(a = b0, b = b1, col = 'red')

# Convergencia hacia el error mínimo
min.error <- round(error.history[n.iter], 3) # error mínimo de 455.455

plot(error.history)
length(which(round(error.history,3) > min.error)) # Convergencia en torno a la iteración 440


# Datos reales con convergencia de la línea de mejor ajuste
library(animation)
#windows();
for (i in 1:n.iter) {
  plot(x, y)
  abline(a = b0.history[i], b = b1.history[i], col = 'red')
  text(c(-2,-2,-2), c(6,8,10), labels = c(paste('b1 = ', b1.history[i], sep = ''),
                                          paste('b0 = ', b0.history[i], sep = ''),
                                          paste('Iteration: ', i)))
  ani.pause(interval = 0.1)
}



