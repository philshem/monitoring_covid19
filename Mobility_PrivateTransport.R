#  Mobility_PrivateTransport.R

# Import libraries
require(tidyquant)
require(xts)
require(anytime)
library (readr)
library (lattice)
library(chron)
library(reshape)

################################

# Download data
urlfile="https://data.stadt-zuerich.ch/dataset/6212fd20-e816-4828-a67f-90f057f25ddb/resource/44607195-a2ad-4f9b-b6f1-d26c003d85a2/download/sid_dav_verkehrszaehlung_miv_od2031_2020.csv"
zhmiv<-data.frame(read_csv(url(urlfile)))
zhmiv$datum<-as.POSIXct(zhmiv$MessungDatZeit)
zhmiv$datum<-lubridate::date(zhmiv$datum)

################################

# Format data according to data structure specification
#Tagesfrequenzen Velo beide Richtungen
mivdaily<-with(zhmiv, tapply(AnzFahrzeuge, list(datum, ZSID), sum, na.rm=T))
#Velozählstellen an denen 2020 überhaupt etwas gemessen wird
# Das undifferenzierte Total der Fahrzeuge an allen Zählstellen 
#in beide Richtungen ist vielleicht als Indikator für die Gesamtverkehrsintensität, 
#Im folgenden könnte man eine Auswahl treffen  
mivdaily[,c("Z001", "Z002", "Z003", "Z004", "Z005", "Z006", "Z007", "Z008", 
  "Z009", "Z010", "Z011", "Z013", "Z014", "Z015", "Z016", "Z017", 
  "Z018", "Z019", "Z020", "Z021", "Z022", "Z025", "Z026", "Z027", 
  "Z028", "Z029", "Z030", "Z031", "Z032", "Z033", "Z034", "Z035", 
  "Z036", "Z037", "Z038", "Z039", "Z040", "Z041", "Z042", "Z043", 
  "Z044", "Z045", "Z046", "Z047", "Z048", "Z049", "Z050", "Z051", 
  "Z052", "Z053", "Z054", "Z055", "Z056", "Z057", "Z058", "Z059", 
  "Z060", "Z061", "Z062", "Z063", "Z064", "Z065", "Z066", "Z067", 
  "Z068", "Z069", "Z070", "Z071", "Z072", "Z073", "Z074", "Z075", 
  "Z076", "Z077", "Z078", "Z079", "Z080", "Z081", "Z082", "Z083", 
  "Z084", "Z085", "Z086", "Z087", "Z088", "Z089", "Z090", "Z091", 
  "Z092", "Z093", "Z095", "Z096", "Z097")]

mivtot<-data.frame(mivtot=apply(mivdaily,1, sum, na.rm=T))
mivfreq<-data.frame(
    date=as.POSIXct(paste(rownames(mivtot), "00:00:00", sep=" ")), 
    value=mivtot$mivtot, 
    topic="mobilität", 
    variable="miv_tot_261",
    location="Stadt Zürich",
    unit="Anzahl Fahrzeuge", 
    origin="Stadt Zürich",
    update="daily",
    public="ja",
    description="kumulierte tägliche Anzahl Fahrzeuge an allen MIV Zählstellen der Stadt Zürich")

################################

# export result
write.table(mivfreq, "../miv_freq_261.csv", sep=",", fileEncoding="UTF-8", row.names = F)







