# Modelos de Caja Negra 

## 1. Neural Prophet - [Resultado 1](https://github.com/JJ-team-2021/Modelos-de-Caja-Negra/tree/main/Resultado_1) 
El primer resultado se realizo con Neural Prophet, este mantiene las características en la sencillez de 
uso de Prophet y, a su vez, añade las ventajas que poseen las redes neuronales. Cabe destacar que aunque tiene rasgos que
muestran su gran potencial, fue lanzada en octubre de 2020 y está aún en fase beta, por lo que carece de ciertas singularidades
que pueden ser de interés en el proyecto. 

En primera instancia, se introducen los datos de incidencia acumulada diarios, desde 2015 hasta 2020. El conjunto de datos se divide
aproximadamente en un 90% para el entrenamiento, y un 10% para la validación. Además, se ha establecido el valor de epochs en 200, siendo
este el número de veces en las que todos los datos de entrenamiento han pasado por la red neuronal 

## 2. Red Neuronal Recurrente (RNN)
En este resultado se realiza un ajuste con una red neuronal recurrente sobre los datos del indice S&P500 de manera diaria desde 1979 - 2008 
