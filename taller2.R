# trabajo_final
# Estoy editando el archivo y mi vecina me quiere copiar y me está rastreando
datos =read.csv(file ="/home/salainfo/Escritorio/base_enaj.csv", header=TRUE, sep=",")
head
names(datos)
dim
head(datos)
summary(datos$ht11pc)
min(datos$ht11pc)
resumen=head(datos,n=10)
min(datos$EDAD)
max(datos$EDAD)
datos$edad_rec=ifelse(datos$EDAD>=12&datos$EDAD<=18,"12 a 18",datos$EDAD)
datos$edad_rec=ifelse(datos$EDAD>=19&datos$EDAD<=22,"19 a 22",datos$edad_rec)
datos$edad_rec=ifelse(datos$EDAD>=23&datos$EDAD<=29,"23 a 29",datos$edad_rec)
table(datos$edad_rec,useNA="ifany")
addmargins(table(datos$edad_rec,useNA="ifany"))
addmargins(table(datos$SEXO,datos$edad_rec))
enaj_mujeres=subset(datos,SEXO=="mujer"&EDAD>18)
save(enaj_mujeres,file="/home/salainfo/Escritorio/enaj_mujeres.R")
enaj_sav=read.spss(file="enaj_sav.sav",to.data.frame=TRUE)
table(datos%in%enaj_sav$numero)
table(datos$Num_identificador%in%enaj_mujeres$Num_identificador)
enaj_fundida=merge(enaj_sav,enaj_dta,by="numero")