# Optimizacion mediante Derivadas - Funciones de una variable

# La optimización en cálculo es encontrar cantidades mínimas y máximas de una función,
# estas se llaman valores extremos.
# En un pequeño intervalo, son extremos locales
# Sobre toda la función, son extremos globales

# Una empresa ha determinado que las ventas de un artículo varían con su precio ('x') de acuerdo 
# a la función f(x) = - 0.02x^2 + 0.75x
# ¿Cuál debería ser el precio ('x') del artículo para maximizar las ventas?
# Con Derivada de la función podemos encontrar el valor maximo.
# La derivada será igual a 0 donde ocurre el máximo.
# Solo necesitamos encontrar los puntos donde la derivada es igual a cero.

# Si f(x) tiene un valor extremo en x*, entonces f'(x*) = 0

# Si f'(x*) = 0 usamos la segunda derivada para determinar si el valor extremo es máximo o mínimo.

### Si f'(x*) = 0 y f''(x*) > 0, entonces, f esconcave up y f(x*) is minimo local
### Si f'(x*) = 0 and f''(x*) < 0, entonces, f es concave down y f(x*) is maximo local

# ---------------------------------------
# TOC:
#  1. Resolviendo para cero
#  2. Prueba de la segunda derivada
# ---------------------------------------

# ---------------------------------------
# 1. Resolviendo para cero 
# ---------------------------------------
library(Deriv)

## Dada la funcion calcule la derivada
f <- function(x) -0.02*x^2 + 0.75*x
f.prime <- Deriv(f)
f.prime

# function (x) 
#   0.75 - 0.04 * x

plot(f, xlim = c(0,40), col = 'blue')
abline(h = 0, lty = 3)

# Graficar la funcion derivada
curve(f.prime, col = 'red', add = TRUE)

## Encontrar el punto critico donde f'(x*) = 0
uniroot(f.prime, interval = c(15,25)) 

# root is 18.75

## Encontar el valor extremo evaluando el punto crítico en f(x)
f(18.75)

#[1] 7.03125



# ---------------------------------------
# 2. Prueba de la segunda derivada
# ---------------------------------------

# Calcular la segunda drivada de f(x) -> f''(x)
f.prime.prime <- Deriv(f.prime)
f.prime.prime

# function (x) 
#   -0.04

#Si f'(x*) = 0 and f''(x*) < 0, entonces, f es <concave down> y f(x*) es un maximo local


### if f'(x*) = 0 and f''(x*) > 0, then f(x*) is local min
### if f'(x*) = 0 and f''(x*) < , then f(x*) is local max
# Here, f.prime.prime = -0.04, which is always < 0, so f(18.75) is a local max



