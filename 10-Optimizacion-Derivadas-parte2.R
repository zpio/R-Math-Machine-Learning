# Optimizacion mediante Derivadas - Funciones de dos variables

# -------------------------------------------
# 1. Encontrar todas las derivadas iguales a cero
# 2. Prueba de la segunda derivada para dos Variables
# -------------------------------------------

# Recuerde que: Si f(x) tiene un valor extremo en x*, entonces f'(x*) = 0.
# Suponga que f es una función de dos variables, x e y. Entonces:
## Si f(x,y) tiene un valor extremo en (x*, y*), entonces, f_x(x*,y*) y f_y(x*,y*) ambos serán = 0.
## El punto (x*, y*) es un punto critico de f

# Dada la funcion f(x,y) = x^2 + y^2 - 2*x - 6*y + 14
# su derivada con respecto a x es f_x(x,y) = 2x - 2 = 0 => x=1
# su derivada con respecto a y es f_y(x,y) = 2y - 6 = 0 => y=3
# (1, 3) es un punto crítico y, por lo tanto, f(1,3) = 4 es el valor extremo (mínimo).

# Prueba de la segunda derivada para dos Variables
# Si (x*, y*) es un punto critico de f(x,y) se define el valo D como:
# D = f_xx(x*,y*) f_yy(x*,y*) - [f_xy(x*,y*)]^2
# si D > 0 y f_xx(x*,y*) > 0, entonces, f(x*,y*) es un minimo local.
# si D > 0 y f_xx(x*,y*) < 0, entonces, f(x*,y*) es un maximo local.
# si D < 0 entonces, f(x*,y*) no es ni minimo ni maximo local.

# Calculando D:
## f_xx(1,3) = 2 => 2 > 0
## f_yy(1,3) = 2 => 2 > 0
## f_xy(1,3) = 0
## D = 2*2 - 0 = 4 => D > 0
## Como D > 0 y f_xx(1,3) > 0, entonces, (1,3) es un minimo local

# -------------------------------------------
# 1. Encontrar todas las derivadas iguales a cero
# -------------------------------------------
library(Deriv)

f <- function(x,y) x^2 + y^2 - 2*x - 6*y + 14
f.x <- Deriv(f, x = 'x')
f.x # 2x - 2

f.y <- Deriv(f, x = 'y')
f.y # 2y - 6

plot(f.x, xlim = c(-10,10))


### En este caso, podemos hacer f.x y f.y individualmente con uniroot ()

## Encontrar el punto critico donde f'(x*) = 0
uniroot(f.x, interval = c(-10,10)) 
# f.x = 0 at x = 1

# need to pass uniroot() something that's a function of 'x'
uniroot(function(x) 2*x-6, interval = c(-10,10)) 
# f.y = 0 at y = 3


### También se pueden usar un par de otros métodos. Utilice solve().
# Want:
### 2x-2=0 --> 2x + 0y - 2 = 0 --> 2x + 0y = 2
### 2y-6=0 --> 0x + 2y - 6 = 0 --> 0x + 2y = 6
LHS <- matrix(c(2,0,0,2), nrow = 2, byrow = TRUE)
LHS

RHS <- c(2,6)
RHS

solve(LHS, RHS)


### ¿Qué pasa si f' es una función de dos variables?

f2 <- function(x,y) x^2 + y^2 + x*y
f2.x <- Deriv(f2, x = 'x')
f2.x

f2.y <- Deriv(f2, x = 'y')
f2.y

### Encuentra cuando f2.x = 0

# necesito una idea de dónde buscar
library(rgl)
plot3d(f2.x, xlim = c(-10,10), ylim = c(-10,10))


library(rootSolve)
func <- function(x) c(f1 = 2*x[1]+x[2], f2 = 2*x[2] +x[1])
multiroot(f = func, start = c(0,0))



# -------------------------------------------
# 2. Prueba de la segunda derivada para dos Variables
# -------------------------------------------
f.xx <- Deriv(f.x, x = 'x')
f.xx

f.yy <- Deriv(f.y, x = 'y')
f.yy

f.xy <- Deriv(f.x, x = 'y')
f.xy

D <- f.xx(c(1,3))*f.yy(c(1,3)) - f.xy(c(1,3))^2
D

## Como D > 0 y f.xx > 0, entonces, f(1,3) es un minimo local












