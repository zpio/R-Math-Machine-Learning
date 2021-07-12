#Introduccion a Linear Regression

# ---------------------------------------------
# 1. Ejemplo Deterministico
# 2. Ejemplo Estocástico 
# 3. Error del Modelo
# ---------------------------------------------
library(tidyverse)

# ---------------------------------------------
# 1. Ejemplo Deterministico
# ---------------------------------------------
# Conjunto de datos creados de hot dog
hot.dogs <- 0:20 # Cantidad de hot dogs comprados
fries <- 0:20    # cantidad de papas fritas compradas
game.cost <- expand.grid(hot.dogs, fries)
colnames(game.cost) <- c('Hot.Dogs', 'Fries')

game.cost <- game.cost %>%
  mutate(Ticket = 20,
         Total.Cost = Ticket + 3*Hot.Dogs + 2*Fries)

head(game.cost)
#     Hot.Dogs Fries Ticket Total.Cost
# 1        0     0     20         20
# 2        1     0     20         23
# 3        2     0     20         26
# 4        3     0     20         29
# 5        4     0     20         32
# 6        5     0     20         35

### graficar
library(rgl)


plot3d(x = game.cost$Hot.Dogs,
       y = game.cost$Fries,
       z = game.cost$Total.Cost,
       type = 'p',
       col = 'green',
       xlim = c(0,20),
       ylim = c(0,20),
       zlim = c(0,120),
       xlab = 'Hot Dogs Purchased',
       ylab = 'French Fries Purchased',
       zlab = 'Total Cost')
rgl.clear()

# Utilice la función lm() para estimar un modelo de regresión lineal
hot.dog.model <- lm(Total.Cost ~ Hot.Dogs + Fries, data = game.cost)

summary(hot.dog.model)

# Call:
#   lm(formula = Total.Cost ~ Hot.Dogs + Fries, data = game.cost)
# 
# Residuals:
#   Min         1Q     Median         3Q        Max 
# -6.965e-14 -1.799e-15 -5.900e-16  6.420e-16  2.230e-13 
# 
# Coefficients:
#   Estimate Std. Error   t value Pr(>|t|)    
# (Intercept) 2.000e+01  1.485e-15 1.347e+16   <2e-16 ***
#   Hot.Dogs    3.000e+00  9.652e-17 3.108e+16   <2e-16 ***
#   Fries       2.000e+00  9.652e-17 2.072e+16   <2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 1.227e-14 on 438 degrees of freedom
# Multiple R-squared:      1,	Adjusted R-squared:      1 
# F-statistic: 6.977e+32 on 2 and 438 DF,  p-value: < 2.2e-16



# ---------------------------------------------
# 2. Ejemplo Estocástico 
# ---------------------------------------------
head(mtcars)
#                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
# Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
# Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

### Graficar
plot3d(x = mtcars$wt,
       y = mtcars$qsec,
       z = mtcars$mpg,
       type = 's',
       col = 'green',
       xlim = c(min(mtcars$wt)-1,max(mtcars$wt)+1),
       ylim = c(min(mtcars$qsec)-1,max(mtcars$qsec)+1),
       zlim = c(min(mtcars$mpg)-1,max(mtcars$mpg)+1),
       xlab = 'Wt',
       ylab = 'Qsec',
       zlab = 'MPG')
rgl.clear()


scatter3D(x=mtcars$wt, y=mtcars$qsec, z=mtcars$mpg, 
          pch = 20, cex = 2, bty ="g",
          theta = 20, phi = 20, 
          #ticktype = "detailed",
          xlab = "wt", ylab = "disp", zlab = "mpg", main = "mtcars")



# Utilice lm() para ajustar un modelo de regresión lineal
mpg.model <- lm(mpg ~ wt + qsec, data = mtcars)

mpg.model
# Coefficients:
#   (Intercept)           wt         qsec  
#       19.7462      -5.0480       0.9292 


# Graficar datos modelo ajustado vs. reales
# queremos una linea
plot(mtcars$mpg, mpg.model$fitted.values)

plot3d(x = mtcars$wt,
       y = mtcars$qsec,
       z = mpg.model$fitted.values,
       type = 's',
       col = 'red',
       xlim = c(min(mtcars$wt)-1,max(mtcars$wt)+1),
       ylim = c(min(mtcars$qsec)-1,max(mtcars$qsec)+1),
       zlim = c(min(mtcars$mpg)-1,max(mtcars$mpg)+1),
       xlab = 'Wt',
       ylab = 'Qsec',
       zlab = 'MPG',
       add = TRUE)
rgl.clear()

x = mtcars$wt
y = mtcars$qsec
z = mpg.model$fitted.values

scatter3D(x, y, z, pch = 20, cex = 2, bty ="g",
          theta = 20, phi = 20, ticktype = "detailed",
          xlab = "wt", ylab = "disp", zlab = "mpg", main = "mtcars"
          )

grid.lines = 26
x.pred <- seq(min(mtcars$wt), max(mtcars$wt), length.out = grid.lines)
y.pred <- seq(min(mtcars$qsec), max(mtcars$qsec), length.out = grid.lines)
xy <- expand.grid( wt = x.pred, qsec = y.pred)
z.pred <- matrix(predict(mpg.model, newdata = xy), 
                 nrow = grid.lines, ncol = grid.lines)

fitpoints <- predict(mpg.model)

scatter3D(x=mtcars$wt, y=mtcars$qsec, z=mtcars$mpg, 
          pch = 18, cex = 1, bty ="g",
          theta = 10, phi = 10, 
          #ticktype = "detailed",
          xlab = "wt", ylab = "disp", zlab = "mpg", 
          surf = list(x =  x.pred,
                      y = y.pred, 
                      z = z.pred,  
                      facets = NA, 
                      fit = fitpoints),
          main = "mtcars")


# ---------------------------------------------
# 3. Error del Modelo
# ---------------------------------------------
# Different outputs
mpg.model # da los coefientes del modelo
summary(mpg.model)


# Plot actuals vs predicted values 2D


# Calcular medidas de error para el modelo
error.measures <- as.data.frame(cbind(mpg.model$model$mpg, mpg.model$fitted.values))
colnames(error.measures) <- c("Actuals", "Predicted.Values")
error.measures <- error.measures %>%
  mutate(error = Actuals - Predicted.Values,
         squared.error = error^2)

head(error.measures)
#    Actuals Predicted.Values       error squared.error
# 1     21.0        21.815109 -0.81510855   0.664401940
# 2     21.0        21.048224 -0.04822401   0.002325555
# 3     22.8        25.327279 -2.52727880   6.387138113
# 4     21.4        21.580569 -0.18056924   0.032605252

# suma del error
sum(error.measures$error)
#[1] 1.776357e-15
boxplot(error.measures$error)


# La media del error cuadratico (mse)
mean.squared.error <- mean(error.measures$squared.error)
#[1] 6.108238
boxplot(error.measures$squared.error)


# La raiz cuadrada de la media del error cuadratico
#estimación del error total en el modelo
root.mse <- sqrt(mean.squared.error)
#[1] 2.471485






