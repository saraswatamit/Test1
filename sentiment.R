library(SentimentAnalysis)

## he SentimentAnalysis package entails three different dictionaries:
##Harvard-IV dictionary
##Henry's Financial dictionary (Henry 2008)
##Loughran-McDonald Financial dictionary (Loughran and McDonald 2011)
##QDAP dictionary from the package qdapDictionaries
##All of them can be manually inspected and even accessed as follows:
# Make dictionary available in the current R environment
  data(DictionarHE)
  # Access dictionary as an object of type SentimentDictionary
  dict.HE <- loadDictionaryHE()
  # Print summary statistics of dictionary
  summary(dict.HE)
  data(DictionaryLM)
  str(DictionaryLM)
  
sentiment <- analyzeSentiment("Yeah, this was a great soccer game for the German team!")
sentiment
str(sentiment)
convertToBinaryResponse(sentiment)$SentimentQDAP
documents <- c("Wow, I really like the new light sabers!",
               "That book was excellent.",
               "R is a fantastic language.",
               "The service in this restaurant was miserable.",
               "This is neither positive or negative.",
               "The waiter forget about my dessert -- what poor service!")

# Analyze sentiment
sentiment <- analyzeSentiment(documents)

# Extract dictionary-based sentiment according to the QDAP dictionary
sentiment$SentimentQDAP

# View sentiment direction (i.e. positive, neutral and negative)
convertToDirection(sentiment$SentimentQDAP)

response <- c(+1, +1, +1, -1, 0, -1)
compareToResponse(sentiment, response)
# https://cran.r-project.org/web/packages/SentimentAnalysis/vignettes/SentimentAnalysis.html#methods-for-sentiment-analysis