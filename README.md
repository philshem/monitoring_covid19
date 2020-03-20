
# monitoring_covid19

# Table of Content
- [Aim](https://github.com/statistikZH/monitoring_covid19/tree/master#aim)
- [Naming convention for scipts](https://github.com/statistikZH/monitoring_covid19/tree/master#naming-convention-for-scipts)
- [Data structure specification for output data](https://github.com/statistikZH/monitoring_covid19/tree/master#data-structure-specification-for-output-data)
- [Whats already done](https://github.com/statistikZH/monitoring_covid19/tree/master#whats-already-done)
- [Script Structure](https://github.com/statistikZH/monitoring_covid19/tree/master#script-structure)
- [More Information about the project (in german)](https://github.com/statistikZH/monitoring_covid19/tree/master#More-Information-about-the-project-(in-german))

# Aim
The aim is to create different datasets that all follow the same data structure. 

# Naming convention for scipts
Theme  + _ +  NameOfDataset (CamelCase)
E.g.: Mobility_SlowTraffic

# Data structure specification for output data

**Encoding**<br>
UTF-8 <br>

**Tab separator**<br>
"," <br>

**Variables**<br>

- **date**: POSIXct Format. Even though the granulation of the original signal data may be finer, the data for the resulting master table should be stored in POSIXct format on a daily basis. The function POSIXct() usually generates this from other input formats. E.g:<br>
> as.POSIXct(paste("25.2.2020", "00:00:00", sep=" "), format="%d.%m.%y")  
> as.POSIXct(paste("datumsvariable", "00:00:00", sep=" "), format="%d.%m.%y")	 

- **value** <br>
... - Value without thousand separator or the like  <br>
... - Decimal separator is the dot "."<br>

- **topic**: The five defined subject areas (lower case) <br>
... - economy <br>
... - social <br>
... - mobility <br>
... - health <br>
... - education <br>
... - other <br>

- **variable**: meaningful short name of the variable (lower case) <br>

- **location**: Geographic reference <br>

- **unit**: unit of measurement <br>

- **origin**: Short reference, such as could be used in the footer of a plot <br>

- **update**: Time interval of update? baselines are values that serve as a comparative figure and do not change (e.g. from STATENT) <br>

- **public**: Can the variable OGD be set? <br>	

- **description**: if necessary, further, more detailed information  <br>

# Whats already done

See: https://docs.google.com/spreadsheets/d/1AXn18Cz-DJATHCsc_zfyHReWdK0FGjbcbLxxIgjGulg/edit#gid=2058194538

# Recommended Script Structure

I recommend to structure the script as follows: <br>
- Download data <br>
- Format data according to data structure specification <br>
- export result to csv (separator =",") UTF-8 formatted <br>

# More Information about the project (in german)

See http://www.peter-moser.ch/publikationen/Kurzbeschrieb%20Covid-19_Monitoring_zh.pdf
