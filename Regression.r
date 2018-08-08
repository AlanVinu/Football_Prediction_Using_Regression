#I'm opting to use data from 1955, as it can be observed as the start of European Champions Competition

data_1955_to_2017 <- data_1872_to_2017[format(data_1872_to_2017$date,"%Y") >= "1955",]

#Let's find out the teams that have played agianst each other the most

freq_table <- count(data_1955_to_2017, vars=c("home_team", "away_team"))
print(freq_table[freq_table$freq == max(freq_table$freq),])

