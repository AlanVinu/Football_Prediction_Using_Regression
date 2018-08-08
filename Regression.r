library(plyr)

#I'm opting to use data from 1955, as it can be observed as the start of European Champions Competition

data_1955_to_2017 <- data_1872_to_2017[format(data_1872_to_2017$date,"%Y") >= "1955",]

#Let's find out the teams that have played agianst each other the most

freq_table <- count(data_1955_to_2017, vars=c("home_team", "away_team"))
#print(freq_table[freq_table$freq == max(freq_table$freq),])
Home_Team <- freq_table$home_team[freq_table$freq == max(freq_table$freq)]
Away_Team <- freq_table$away_team[freq_table$freq == max(freq_table$freq)]

#Now to create a DF containing only games played between the teams

NewDF <-
  data_1955_to_2017[data_1955_to_2017$home_team == Home_Team &
                      data_1955_to_2017$away_team == Away_Team,]

#Creating relation
x <- NewDF$home_score
y <- NewDF$away_score
relation <- lm(y~x)

# Give the chart file a name.
png(file = "linearregression.png")

# Plot the chart.
plot(y,x,col = "blue",main = "Regression",
     abline(lm(x~y)),cex = 1.3,pch = 16,xlab = paste0("Goals(",NewDF$home_team[1],")", sep = ""),ylab = paste0("Goals(",NewDF$away_team[1],")", sep = ""))

#Save file
dev.off()
