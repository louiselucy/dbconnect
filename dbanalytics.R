install.packages("RSQLite")
install.packages("digest")
install.packages("dplyr")

library(RSQLite)
library(digest)
library(dplyr)

con <- dbConnect(SQLite(), "SQLite.db")

dbListTables(con)

crm <- dbReadTable(con, "crm")
ga_sessions <- dbReadTable(con, "ga_sessions")
ga_transactions <- dbReadTable(con, "ga_transactions")
sales <- dbReadTable(con, "sales")
store <- dbReadTable(con, "store")

length(unique(sales$customerId))


crm <- dbReadTable(con, "crm")
length(unique(crm$id))

data <- merge(sales, crm, by.x="customerId", by.y="id", all.x=TRUE)


group_by(data, customerId) %>% summarise(sum_salesGrossSek = sum(salesGrossSek))


joined <- inner_join(sales, crm, by=c("customerId" = "id"))  
group_by(joined, customerId) %>% summarise(lou = sum(as.numeric(salesGrossSek)))



# test
grouped <- group_by(joined, customerId)
med_sum <- group_by(joined, customerId) %>% mutate(sum_gross = sum(as.numeric(salesGrossSek))) %>% arrange(sum_gross)
max(med_sum$sum_gross)

sort(grouped, decreasing = FALSE, na.last = TRUE)
aggregate(grouped)



data <- merge(sales, crm, by.x="customerId", by.y="id", all.x=TRUE)
("max.print")

group_by(data, customerId) %>% summarise(sum_salesGrossSek = sum(salesGrossSek))


s399 <- sales %>% filter(storeId==399)
joined <- inner_join(s399, crm, by=c("customerId" = "id"))  
group_by(joined, customerId) %>% summarise(lou = sum(as.numeric(salesGrossSek)))


grouped <- group_by(joined, customerId)
med_sum <- group_by(joined, customerId) %>% mutate(sum_gross = sum(as.numeric(salesGrossSek))) %>% arrange(sum_gross)
max(med_sum$sum_gross)

sort(grouped, decreasing = FALSE, na.last = TRUE)
aggregate(grouped)


online_data <- filter(sales, storeId==399)
list_of_offline <- c(101, 102, 103, 104, 105)
offline_data <- filter(sales, storeId %in% list_of_offline) %>% group_by(customerId) 

count(online_data, "customerId")

customer_order_count <- data.frame(
  customerId = as.character(crm$id),
 # online_count = filter(online_data, customerId == crm$id),
 # offline_count = filter(offline_data, customerId == crm$id),
  stringAsFactors = FALSE
)

customer_order_count$online_count <- sapply(hash_keys$customerId, digest, "md5")

merge(crm, sales, by.x="id", by.y="customerId", all.x=TRUE)


#hur många köp de gjort offline / hur många köp de gjort online 
sales <- read.csv('sales.csv')

sum(sales$salesGrossSek) 

s101 <- sales %>% filter(storeId==101)
sum(s101$salesGrossSek) 

s102 <- sales %>% filter(storeId==102)
sum(s102$salesGrossSek) 

s103 <- sales %>% filter(storeId==103)
sum(s103$salesGrossSek) 

s104 <- sales %>% filter(storeId==104)
sum(s104$salesGrossSek) 

s105 <- sales %>% filter(storeId==105)
sum(s105$salesGrossSek) 

svar: storeId102


  
  s399 <- sales %>% filter(storeId==399)
sum(s399$salesGrossSek) 

sum(c(88765, 126933, 55735, 26931, 66577))

list_of_offline <- c(101, 102, 103, 104, 105)
offline_data <- filter(sales, storeId %in% list_of_offline)

offline_sum <- sum(offline_data$salesGrossSek)

count(offline_data)

list_of_online <- c(399)
online_data <- filter(sales, storeId==399)
#dbWriteTable(con, "online_data", online_data)
online_sum <- sum(online_data$salesGrossSek)

dbWriteTable(con, "online_data", online_data)

count(online_data)

avg <- 419505/275

online_sum / count(online_data)

offline_sum / count(offline_data)

mean(online_data$salesGrossSek)

mean(offline_data$salesGrossSek)

  
  joined <- inner_join(ga_sessions, ga_transactions, by=c("sessionId" = "sessionId"))  
group_by(joined, sourceMedium) %>% summarise(lou = max(revenue))

  
  joined <- merge(ga_sessions, ga_transactions, by=c("sessionId" = "sessionId"))  
group_by(joined, deviceCategory) %>% summarise(sum_revenue = sum(as.numeric(revenue)))



online_data <- filter(sales, storeId==399)
sum(as.numeric(ga_transactions$revenue)) / sum(as.numeric(online_data$salesGrossSek))


mutate()

crm_md5 <- mutate(crm, userId=)


crm_md5 <- mutate(crm, userId=digest(id, algo="md5"))

hash_keys <- data.frame(
  customerId = as.character(crm$id),
  stringAsFactors = FALSE
)

hash_keys$userId <- sapply(hash_keys$customerId, digest, "md5")



  
cityname <- merge(sales, store, by.x="storeId", by.y="id", all.x=TRUE) %>% group_by(store_city)

cityname <- merge(sales, store, by.x="storeId", by.y="id", all.x=TRUE)
group_by(cityname, store_city)

group_by(cityname, store_city) %>% summarise(sum_revenue = sum(as.numeric(salesGrossSek)))


