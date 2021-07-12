# Derivada de una funcion

# ------------------------------------------------
# 1. Graficar una función y su derivada
# 2. Encontrar la derivada (y la regla de la potencia)
# 3. Encontrar y graficar derivadas parciales
# ------------------------------------------------

## package para encontrar la funcion derivada
library(Deriv)

# ----------------------------------------------
# 1. Graficar una función y su derivada
# ----------------------------------------------

# Definir una función
f <- function(x) x^3

plot(f, main = "f(x) = x^3", xlim = c(-5,5), col = 'blue')

## Graficar la recta tangente
tangent.plots <-  function(fun, pt) {   ## fun = function; pt = point where sec lines will occur
  f.prime <- Deriv(f)
  x1 <- pt
  y1 <- f(x1)
  m1 <- f.prime(x1)
  plot(f, xlim = c(x1-10,x1+10), ylim = c(y1-10,y1+10), col = 'blue')
  points(x = x1, y = y1, col = 'blue', type = 'p', pch = 16)
  sec.int <- -m1*x1 + y1
  abline(a = sec.int, b = m1, col = 'red')
  text(x1+8, y1-8, labels = paste('Slope:', m1, sep = ""))
  text(x1-0.5, y1+0.5, labels = paste('(',x1,',',y1,')'))
}

tangent.plots(fun = f, pt = 2)
#Slope = 12

## Para x = -2, f' = 12; 
## Para x = -1, f' = 3; 
## Para x = 0, f' = 0 (***); 
## Para x = 1, f' = 3; 
## Para x = 2, f' = 12


## Grafique los siguientes puntos en la grafica
plot(f, xlim = c(-5,5), col = 'blue')

points(x = -4:4, y = c(48,27,12,3,0,3,12,27,48), col = 'red') 



# ----------------------------------------------
# 2. Encontrar la derivada (y la regla de la potencia)
# ----------------------------------------------
### Usar la función Deriv() para encontrar la derivada
f.prime <- Deriv(f)
f.prime

# function (x) 
# 3 * x^2

## add to previous plot
plot(f, xlim = c(-5,5), col = 'blue')
points(x = -4:4, y = c(48,27,12,3,0,3,12,27,48), col = 'red') 
curve(f.prime, add = TRUE)


### Realice algunas derivadas y busque un patrón
f <- function(x) x^5
Deriv(f)

# function (x) 
#   5 * x^4

### REGLA DE POTENCIA para encontrar derivadas: Si f(x) = x^n, f'(x) = n*x^(n-1)
### DE forma General, Si f(x) = ax^n, f'(x) = an*x^(n-1)


# ----------------------------------------------
# 3. Encontrar y graficar derivadas parciales
# ----------------------------------------------
f <- function(x,y) x^2 + y^2

## Derivada Parcial con respecto a x
f.x <- Deriv(f, x = 'x')
# function (x, y) 
#   2 * x

## Derivada Parcial con respecto a y
f.y <- Deriv(f, x = 'y')
# function (x, y) 
#   2 * y

library(rgl)
plot3d(f, xlim = c(-10,10), ylim = c(-10,10), col = 'blue')

plot3d(f.x, xlim = c(-10,10), ylim = c(-10,10), type = 'p', col = 'red', add = TRUE)

plot3d(f.y, xlim = c(-10,10), ylim = c(-10,10), col = 'green', add = TRUE)






