
# Importing the HomeworkData.csv file
movies <- read.csv(file.choose())

# Adding ggplot2 package
library(ggplot2)
str(movies)

# Changing column names for easier access 
colnames(movies) <- c('Day', 'Director', 'Genre', 'MovieTitle', 'ReleaseDate', 'Studio', 'AdjustedGross',
                      'Budget', 'Gross', 'ImdbRating', 'MovieLensRating', 'OverseasMill', 'OverseasPerc',
                      'Profit', 'ProfitPerc', 'Runtime', 'UsMill', 'GrossPercUS')
str(movies)
head(movies)
summary(movies)

# Selecting relevant studios for analysis
elvar <- (movies$Studio == 'Buena Vista Studios') | (movies$Studio == 'Fox') | (movies$Studio == 'Paramount Pictures') 
        | (movies$Studio == 'Sony') | (movies$Studio == 'Universal') | (movies$Studio == 'WB')

# Selecting relevant genres for analysis
elvar2 <- movies$Genre %in% c('action', 'adventure', 'animation', 'comedy', 'drama')

# Creating a new data frame with the studio and genre filters
movies2 <- movies[elvar & elvar2,]

# Plotting the final figure
fin <- ggplot(data=movies2, aes(x=Genre, y=GrossPercUS)) +
  geom_jitter(aes(size=Budget, colour=Studio)) + 
  geom_boxplot(alpha=0.7, outlier.colour = NA, size = 1.2) + 
  ylab('Gross % US') +
  theme(axis.title.x = element_text(colour = 'DarkBlue', size=20),
        axis.title.y = element_text(colour = 'DarkBlue', size=20),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15),
        plot.title = element_text(size=25),
        legend.title = element_text(size=20),
        legend.text = element_text(size=15),
        text = element_text(family = 'Comic Sans MS')) +
  ggtitle('Domestic Gross % by Genre')

# Changing the legend title
fin$labels$size <- 'Budget $M'
fin
