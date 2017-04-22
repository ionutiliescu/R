
# Building plots with a given function (no ggplot known at the time)
myplot <- function(tableSelect, players=1:10){
  Data <- tableSelect[players,,drop=F]
  matplot(t(Data), type='b', pch=15:14, col=c(1:4,6))
  legend('bottomleft', inset=0.01, legend=Players[players], col=c(1:4,6), pch=15:14, horiz=F)
}


#Salary
myplot(Salary)
myplot(Salary / Games) #skewed due to injuries, shouldn't analyse
myplot(Salary / FieldGoals) #skewed due to injuries, shouldn't analyse

#In-game metrics
myplot(MinutesPlayed)
myplot(Points)

#In-game metrics normalized
myplot(FieldGoals / Games)
myplot(FieldGoals / FieldGoalAttempts)
myplot(FieldGoalAttempts / Games)
myplot(Points / Games)

#Interesting observation
myplot(MinutesPlayed / Goals)
myplot(Games)

#Time is valuable
myplot(FieldGoals / MinutesPlayed)

#Player Style
myplot(Points / FieldGoals)

#----------HOMEWORK


myplot(FreeThrowAttempts / Games) #free throw attempts per game

myplot(FreeThrows / FreeThrowAttempts) #accuracy of free throw attempts

myplot((FreeThrows / FreeThrowAttempts) * (FreeThrowAttempts/Games)) #points per game from free throws, based on free throw attempts

myplot((Points - FreeThrows) / FieldGoals) #playing style average per game (average of points per goal)

myplot(Points / FieldGoals) #Playing style not adjusted for free throws

