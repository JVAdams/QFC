library(tidyverse)

# MSU Degrees Conferred
library(tabulizer)
out <- "https://reg.msu.edu/Read/EnrollmentTermEnd/DegreesByType.pdf" %>%
  extract_tables()
df <- data.frame(do.call(rbind, out), stringsAsFactors=FALSE)
names(df) <- c("FY", "Bachelor", "Master", "Doctoral",
  "MD", "DO", "DVM", "EDD", "DNP", "DAGS", "EDS", "TOTAL")
enrollment <- df %>%
  filter(
    FY<3000
  ) %>%
  mutate(
    Year = as.numeric(substring(FY, 1, 4)) + 1
  ) %>%
  select(Year, Bachelor, Master, Doctoral) %>%
  gather(Degree, Number, Bachelor, Master, Doctoral) %>%
  mutate(
    Number = as.numeric(gsub("-", "0", gsub(",", "", Number))),
    Degree = factor(Degree, levels=c("Bachelor", "Master", "Doctoral"))
  )
rm(out, df)

# Lake Huron USGS bottom trawl surveys
huron.url <- "https://github.com/JVAdams/vizzy/raw/master/Huron0610.RData"
load(url(huron.url))
survey <- optrop %>%
  select(-time, -surftemp, -towtime, -fishtemp)
rm(huron.url)

# Lake Huron depth by species catch matrix
catch <- with(optrcat, tapply(n, list(format(depth), spname), mean))
catch[is.na(catch)] <- 0
catch <- catch[, apply(catch, 2, sum)>50]

smelt <- optrcat[optrcat$spname=="Rainbow smelt",
  c("year", "depth", "pname", "n", "lat")]

save(enrollment, survey, catch, smelt, file="TIQS.RData")
