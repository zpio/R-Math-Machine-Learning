# Descenso del Gradiente

# ---------------------------------------------------
# 1. Ejecución del algoritmo de descenso de gradiente
# 2. Visualización e interpretación de resultados
# ---------------------------------------------------

# Recuerde: si F es una función de x e y, entonces f_x y f_y representan las derivadas parciales de f con respecto a x e y.
# Las derivadas parciales son funciones que describen la tasa de cambio de f, en las direcciones x e y.

# Entonces podemos definir una función de 𝑓_𝑥 y 𝑓_𝑦.
# Esta función, conocida como 𝛻𝑓  es el gradiente de 𝑓.
# 𝛻𝑓 (𝑥, 𝑦) = [𝑓_𝑥 (𝑥, 𝑦), 𝑓_𝑦 (𝑥, 𝑦)] es una función vectorial. Devuelve un vector.
# 𝛻𝑓 proporciona la dirección con la tasa máxima de cambio de 𝑓 desde el punto (𝑥, 𝑦)

# Algoritmo del Descenso del Gradiente:

# Imagina que estás parado en la ladera de una montaña y deseas caminar hasta el fondo. Sin embargo, tiene los ojos vendados y no puede ver en qué dirección caminar.
# Al probar el paso (pendiente) de todas las direcciones a su alrededor, puede seleccionar la dirección que desciende más rápidamente.
# Cada pocos pasos, se detiene y revisa todas las pendientes circundantes nuevamente, y ajusta el rumbo según sea necesario.
# El descenso de gradientes funciona exactamente así, pero desde un punto de partida en una curva hasta el mínimo (o máximo).


# Algoritmo del Descenso del Gradiente:

# Definir 𝛻𝑓 (𝑥, 𝑦) = [𝑓_𝑥 (𝑥, 𝑦), 𝑓_𝑦 (𝑥, 𝑦)]
# Inicializar un punto de partida (𝑥_1, 𝑦_1)
# Calcular 𝛻𝑓 (𝑥_1, 𝑦_1)
# Calcule (𝑥_2, 𝑦_2) como 𝑥_2 = 𝑥_1 − 𝛼 ∗ 𝑓_𝑥 (𝑥_1, 𝑦_1) y 𝑦_2 = 𝑦_1 − 𝛼 ∗ 𝑓_𝑦 (𝑥_1, 𝑦_1)
# 𝛼 es la tasa de aprendizaje y determina qué tan grandes son los pasos
# Repita hasta que (𝑥_𝑛, 𝑦_𝑛) sea un punto crítico



library(Deriv)
library(rgl)

# ---------------------------------------------------
# 1. Ejecución del algoritmo de descenso de gradiente
# ---------------------------------------------------

# 0. Defina y grafique f (x, y) = (x-2)^2 + (y+3)^2 para xey entre -10 y 10

f <- function(x,y) (x-2)^2 + (y+3)^2

plot3d(f, xlim = c(-10,10), ylim = c(-10,10), col = 'green')

## 1. Define el gradiente de f

f.x <- Deriv(f, x = 'x') ## derivada parcial con respecto a x
f.y <- Deriv(f, x = 'y') ## derivada parcial con respecto a y

# 2. Inicializar un punto de partida
x <- 0
y <- 0

### Ejecutar un bucle para repetir la sección
alpha = 0.01
n.iter <- 500
f.history <- numeric(n.iter)
x.history <- numeric(n.iter)
y.history <- numeric(n.iter)

for (i in 1:n.iter) {
  # 3. Calcular el gradiente (derivadas parciales evaluado en el punto) 
  x.gradient <- f.x(x=x)
  y.gradient <- f.y(y=y)
  
  # 4. Calcule el nuevo punto como xnew = x - alpha * f_x (x, y) y ynew = y - alpha * f_y (x, y)
  x <- x - alpha*x.gradient
  y <- y - alpha*y.gradient
  
  # 5. Repita hasta que (x, y) sea un punto crítico
  
  f.history[i] <- f(x,y)
  x.history[i] <- x
  y.history[i] <- y
}



# ---------------------------------------------------
# 2. Visualización e interpretación de resultados
# ---------------------------------------------------
plot(f.history)
plot(x.history, y.history)

plot3d(f, xlim = c(-5,5), ylim = c(-5,5), col = 'green')
points3d(x.history, y.history, f(x.history,y.history), col = 'red')








