# Mobility_GooglePopularTimeGraph.md

# Download
Files can be loaded directly from the bucket: <br>
- all data: https://storage.googleapis.com/kantonzh-covid-hkfsaqgshw/gmaps_scrape/all.csv  <br>
- only hours with “current”: https://storage.googleapis.com/kantonzh-covid-hkfsaqgshw/gmaps_scrape/all_valid.csv  <br>
the data in the buckets is refreshed every 30 minutes or so, so you can just keep hitting this URL

Thank you https://twitter.com/philshem 

In order to get the names of the place (description) join the following csv the above mentioned datasets via the "url" 
https://www.google.com/maps/place/Der+Gr%C3%BCne+Libanon/@47.3809042,8.5325368,17z/data=!3m1!4b1!4m5!3m4!1s0x47900a0e662015b7:0x54fec14b60b7f528!8m2!3d47.3809006!4d8.5347255?tqx=out:csv&sheet=Sheet1

# Note

This file does not follow the data structure specification. 

# Methodology

## Google
https://support.google.com/business/answer/6263531?hl=en <br>
>Popular times graph: “Shows how busy your location typically is during different times of the day. Popular times are based on average popularity over the last several weeks. Popularity for any given hour is shown **relative to the typical peak popularity for the business for the week**. For example, in the image below, 6:00PM-7:00PM on Thursday is one of the more popular times of the week for this business.”

Questions reagrding this methodology: <br>
- how is the "typical  peak popularity for the business for the week" calculated? I red, that they used an average of several weeks (same as for “visit duration” and “wait time estimates”; see metadata link for more details).  <br>
- "relative to": I guess the data is indexed. But the methodology is not described in more detail here. I strongly assume that a pink bar whose height is 2x than the blue bar is 2x more visited. But I am not 100% certain. 
- how does Google count people in a park? radius around a certain point?

## Economist
https://www.economist.com/graphic-detail/2020/03/14/foot-traffic-has-fallen-sharply-in-cities-with-big-coronavirus-outbreaks <br>
https://twitter.com/JamesFransham/status/1238179709516685314 <br>

## Other
https://support.google.com/business/answer/6263531?hl=en <br>
https://www.linkedin.com/pulse/how-accurate-googles-popular-time-function-m%C3%A9lissa-sanchot/ <br>
https://www.quora.com/How-does-the-Google-Maps-Popular-Times-feature-work <br>
https://medium.com/@bossley.samuel/part-1-how-to-mimic-google-maps-popular-times-to-track-live-and-averaged-visit-data-using-amazon-2fc3cb589358

# Visualization 
https://observablehq.com/@mmznrstat/people-density




