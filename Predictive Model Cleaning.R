library(readr)
library(stringr)

seoul <- read_csv("SBD_Clean.csv")

seasons <- model.matrix(~Seasons, data=seoul)
seasons = as.data.frame(seasons)
seasons <- seasons %>%
  select(c(-1)) %>%
  mutate(SeasonsFall = ifelse(SeasonsWinter==0&SeasonsSpring==0&SeasonsSummer==0,1,0))


holiday <- model.matrix(~Holiday, data=seoul)
holiday = as.data.frame(holiday)
holiday <- holiday %>%
  select(c(-1)) %>%
  mutate(`HolidayYesHoliday` <- ifelse(`HolidayNo Holiday`==0,1,0))
names(holiday)[2]="HolidayHoliday"

functioning <- model.matrix(~`Functioning_Day`, data=seoul)
functioning = as.data.frame(functioning)
functioning <- functioning %>%
  select(c(-1)) %>%
  mutate(`Functioning_DayNo` <- ifelse(`Functioning_DayYes`==0,1,0))
names(functioning)[2]="Functioning_DayNo"

seoul <- cbind(seoul, holiday, seasons, functioning)

cleaned <- seoul %>%
  select(c(-1, -14, -15, -16))

write_csv(cleaned, "C:/Users/joege/Desktop/Big Data and Artifical Intelligence for Business/Final Project//cleaned.csv")

#seoul <- str_split_fixed(seoul$Date, "/", 3)
