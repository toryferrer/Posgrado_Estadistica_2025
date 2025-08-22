# EJERCICIO 1
#**Luis Miguel Toribio Ferrer**
#**14/08/2025 y 21/08/2025**  

library(repmis)

localidad <- source_data("https://www.dropbox.com/s/fbrwxypacjgeayj/Datos_Rascon_Anova.csv?dl=1")


shapiro.test(localidad$DAP)

# Transformar x (DAP) usando log10

localidad$Dap_log <- round(log10(localidad$DAP + 1),2)
shapiro.test(localidad$Dap_log)
hist(localidad$Dap_log)

library(e1071)

skewness(localidad$DAP)
skewness(localidad$Dap_log)


localidad$sqrt <- round(sqrt(localidad$DAP),2)
skewness(localidad$sqrt)

shapiro.test(localidad$sqrt)

trans.sqrt <- localidad[,-6]

# aov

dap.aov <- aov(localidad$sqrt ~ localidad$Paraje)

dap.aov
summary(dap.aov)
summary.aov()
boxplot(localidad$sqrt ~ localidad$Paraje,
        col ="indianred",
        xlab = "Parajes",
        ylab = "DAP (cm)")
text(1,7, "b")
text(2,6.2, "c")
text(3,7.7, "a")
text(4,8, "bc")
mtext("Mediciones", side = 4)

# Para agregar las letras para la diferenciación podemos utilizar
# la librería multcompView

plot
TukeyHSD(dap.aov)
plot(TukeyHSD(dap.aov), las =1)
