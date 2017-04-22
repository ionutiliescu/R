
# Importing MovieRatings.csv
movies <- read.csv(file.choose())

head(movies)
# Renaming to columns to make them easier to access
colnames(movies) <- c('Film', 'Genre', 'CriticRating', 'AudienceRating',
                      'BudgetMillions', 'Year')
head(movies)

# 1
# Plotting the relation between Critic Rating and Audience Rating
# Split in facets by Year and Genre
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions)) + 
      geom_smooth() +
      facet_grid(Genre~Year) +
      coord_cartesian(ylim=c(0,100))

# 2
# Plotting the Movie Distribution using a histogram
# Genre contained in each bin, with the number of movies representing their section of the bin
ggplot(data=movies, aes(x=BudgetMillions)) + 
  geom_histogram(binwidth = 10, aes(fill=Genre), colour = 'black', size = 1.2) + 
  xlab('Money Axis') +
  ylab('Number of Movies') + 
  ggtitle('Movie Budget Distribution') +
  theme(axis.title.x = element_text(colour='DarkBlue', size=20),
        axis.title.y = element_text(colour='DarkBlue', size=20),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15),
        legend.title = element_text(size=20),
        legend.text = element_text(size=15),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(colour = 'DarkBlue', size=30))

# 3
# Plotting the audience rating as boxplots, based on Genre
ggplot(data=movies, aes(x=Genre, y=AudienceRating, colour=Genre)) + 
  geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)

# 4
# Plotting a histogram showing an even distribution of Critic Ratings
ggplot(data=movies) + 
  geom_histogram(binwidth = 10, aes(x=CriticRating), fill='White', colour='Blue', size = 1.2)

# 5
# Plotting a histogram showing a normal distribution of Audience Rating
ggplot(data=movies) +
  geom_histogram(binwidth = 10, aes(x=AudienceRating), fill='white', colour = 'DarkGreen', size = 1.2)

# 6
# Scatter plot showing the relation between the size of the Budget spent on a Movie and the Audience Rating
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions)) + 
  geom_point(aes(x=BudgetMillions)) +
  xlab("Budget Millions $$$")

