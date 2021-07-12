# Funciones y Rectas tangentes

# ------------------------------------------
#   1. Definición de una función
#   2. Graficar una función
#   3. Estimando la pendiente de una recta tangente
# ------------------------------------------


# ------------------------------------------
# 1. Definición de una función
# ------------------------------------------

#Una función es una regla matemática que opera sobre una entrada para producir una salida.

f <- function(x) x 
x2 <- function(x) x^2
x3 <- function(x) x^3
x4 <- function(x) x^4
sqrt.x <- function(x) sqrt(x)



# ------------------------------------------
# 2. Graficar una función
# ------------------------------------------
plot(f, main = "f(x) = x", xlim = c(-5,5), col = 'blue')
plot(x2, main = "f(x) = x^2", xlim = c(-5,5), col = 'blue')
plot(x3, main = "f(x) = x^3", xlim = c(-5,5), col = 'blue')
plot(x4, main = "f(x) = x^4", xlim = c(-5,5), col = 'blue')
plot(sqrt.x, main = "f(x) = sqrt(x)", xlim = c(-5,5), col = 'blue')



# ------------------------------------------
# 3. Estimando la pendiente de una recta tangente
# ------------------------------------------

# Funcion para estimar la pendiente de la recta tangente usando rectas secantes

#install.packages("animation")
library(animation)
library(Deriv)
?Deriv

f <- function(x) x^2

plot(f, main = "f(x) = x^2", xlim = c(-5,5), col = 'blue')


secant.plots <- function(fun, pt) {
  # obtener la funcion derivada
  f.prime <- Deriv(fun)
  # Definir un punto
  x1 <- pt
  # Evaluar el pto en la fn
  y1 <- fun(x1)
  # Evaluar el pto en la fn derivada (Obtener pendiente)
  m1 <- f.prime(x1)
  
  # crear un vector de pendientes para grafica animada
  if (m1 < 0) {
    min <- f.prime(x1)-12
    max <- f.prime(x1)
    j <- 0.5
  } else {
    min <- f.prime(x1)+12
    max <- f.prime(x1)
    j <- -0.5
  }
  
  #windows();
  
  #Bucle para graficar rectas tangentes en un rango de pendientes 
  for (i in seq(min ,max, j)) {
   
    # Grafica de la funcion
    plot(fun, xlim = c(x1-10, x1+10), ylim = c(y1-10,y1+10), col = 'blue')
    
    # Puntos a evaluarse en la funcion
    points(x = x1, y = y1, col = 'blue', type = 'p', pch = 16)
    
    # crear interceptos <b = -mx + y> para abline
    sec.int <- -i*x1 + y1
    
    # abline requiere de intercepto y pendiente para crear rectas en c/iteración
    abline(a = sec.int, b = i, col = 'red')
    
    # Colocar texto de las pendientes en c/iteración
    text(x1+8, y1-8, labels = paste('Slope:', i, sep = ""))
    
    # Colocar texto de las puntos a evaluarse en la función
    text(x1-0.5, y1+0.5, labels = paste('(',x1,',',y1,')'))
    
    ani.pause(interval = 0.5)
  }
}

# estimar la pendiente de la recta tangente para x = -2
secant.plots(fun = f, pt = -2)

# Slope = -4


# Funcion para estimar la pendiente de la recta tangente con una sola recta

tangent.plots <-  function(fun, pt) {
  f.prime <- Deriv(fun)
  x1 <- pt
  y1 <- fun(x1)
  m1 <- f.prime(x1)
    plot(fun, xlim = c(x1-10,x1+10), ylim = c(y1-10,y1+10), col = 'blue')
    points(x = x1, y = y1, col = 'blue', type = 'p', pch = 16)
    sec.int <- -m1*x1 + y1
    abline(a = sec.int, b = m1, col = 'red')
    text(x1+8, y1-8, labels = paste('Slope:', m1, sep = ""))
    text(x1-0.5, y1+0.5, labels = paste('(',x1,',',y1,')'))
}

tangent.plots(fun = x3, pt = -2)

#Slope = 12


# Graficar rectas tangentes y secantes de la funcion f(x) = sqrt(x)

plot(sqrt.x, xlim = c(-10,10))

plot(sqrt.x, xlim = c(0,20))

sqrt.x.prime <- Deriv(sqrt.x)

# Grafica de la funcion derivada
curve(sqrt.x.prime, add = TRUE)

secant.plots(fun = sqrt.x, pt = 3)

tangent.plots(fun = sqrt.x, pt = 3)








