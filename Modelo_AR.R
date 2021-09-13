# ------------------------------ LIBRERIAS A UTILIZAR --------------------------
library(lubridate)
library(tidyverse)
library(car)
library(tseries)
library(astsa)
library(foreign)
library(timsac)
library(vars)
library(lmtest)
library(mFilter)
library(dynlm)     
library(nlme)
library(broom)
library(knitr)
library(MASS)
library(parallel)
library(mlogit)
library(dplyr)
library(tidyr)
library(forecast)
library(fpp2)
library(stats)
library(quantmod)
library(season)
library(MuMIn)
# --------------------------------------------------------------------------------
attach(IPCH)
names(IPCH)

# Convertimos la data IPCHonduras a una serie de tiempo 

IPC.ts =  ts(IPC, start = 1960, frequency = 1) 
start(IPC.ts); end(IPC.ts)
IPC.ts


# Graficamos la serie de tiempo IPCHonduras

plot(IPC.ts, ylab='% IPC', main = 'Inflación, precios al consumidor (% Anual) Honduras',col="red", xlab = "Años")

# Realizamos el test de Box-Pierce para compribar que en efecto la serie anterior no es estacionaria

Box.test(IPC.ts,type = "Box-Pierce")

# Graficamos su ACF
ACF = acf(IPC.ts)

# Graficamos su ACFP
ACFP = pacf(IPC.ts)

# *************************************************************************
#       Convertimos la serie IPC.ts a IPC.tse usando diferenciación
# *************************************************************************

IPC.tse = diff(IPC.ts)
plot(IPC.tse)

# Comprobamos que en efecto IPC.tse ahora es estacionaria usando el test de Box-Pierce

Box.test(IPC.tse,type = "Box-Pierce")

# Graficamos la ACF y ACFP para IPC.tse
ACF1 = acf(IPC.tse)
pacf(IPC.tse)



# Análisis visual de las gráficas de autocorrelacion
par(mfrow = c(2,2), mar=c(4,4,4,1) + .1)  # comando pa que me grafique mfrow = c(2,2) dos columnas y dos renglones de mi grafica
plot(IPC.ts,xlab = 'Año' , ylab = 'Inflación', main = 'Serie con tendencia')
acf(IPC.ts, main = 'Serie no estacionaria', xlab = 'Rezagos')
plot(IPC.tse,main = 'Serie centrada en cero, sin tendencia',xlab ='Año',ylab = 'Inflación')
acf(IPC.tse, main = 'Serie Estacionaria',xlab='Rezagos')


# *************************************************************************
#               Modelo Autoregresivo (AR) de orden 1
# *************************************************************************

modelo1 = dynlm(IPC.tse~L(IPC.tse), data=IPCH)                               # La "L" nos indica un solo rezago 
summary(modelo1)

# *************************************************************************
#               Modelo Autoregresivo (AR) de orden 2
# *************************************************************************
modelo2 =  dynlm(IPC.tse~L(IPC.tse,1:2), data=IPCH)
summary(modelo2)

# *************************************************************************
#               Modelo Autoregresivo (AR) de orden 3
# *************************************************************************
modelo3 =  dynlm(IPC.tse~L(IPC.tse,1:3), data=IPCH)
summary(modelo3)

# *************************************************************************
#               Modelo Autoregresivo (AR) de orden 2
# *************************************************************************
modelo4 =  dynlm(IPC.tse~L(IPC.tse,c(2,17)), data=IPCH)
summary(modelo4)

# *************************************************************************
#   Realizamos pruebas de informacion AIC, BIC a los modelos candidatos
# *************************************************************************
AIC(modelo1,modelo2,modelo3,modelo4)
BIC(modelo1,modelo2,modelo3,modelo4)

