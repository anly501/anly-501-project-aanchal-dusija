#!/usr/bin/env python
# coding: utf-8

import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.feature_extraction.text import CountVectorizer
import nltk 
import string
import re
from wordcloud import WordCloud
nltk.download()

tweet_data=pd.read_csv('tweets.csv')
tweet_data

tweet_data = tweet_data[['text']]
tweet_data = tweet_data.astype(str)

tweet_data

# Remove https

def remove_url(text):
    url = re.compile(r'https?://\S+|www\.\S+')
    return url.sub(r'',text)

tweet_data['text'] = tweet_data['text'].apply(lambda x : remove_url(x))

# Remove punctuation

tweet_data['clean_text'] = tweet_data['text'].str.replace('[^\w\s]','')
tweet_data.head()

def tokenization(text):
    text = re.split('\W+', text)
    return text

tweet_data['Tweet_tokenized'] = tweet_data['clean_text'].apply(lambda x: tokenization(x.lower()))
tweet_data.head()

nltk.download('stopwords')
stopwords = nltk.corpus.stopwords.words('english')
stopwords

def remove_stopwords(text):
    text = [word for word in text if word not in stopwords]
    return text
    
tweet_data['Tweet_without_stop'] = tweet_data['Tweet_tokenized'].apply(lambda x: remove_stopwords(x))
tweet_data.head(5)

ps = nltk.PorterStemmer()

def stemming(text):
    text = [ps.stem(word) for word in text]
    return text

tweet_data['Tweet_stemmed'] = tweet_data['Tweet_without_stop'].apply(lambda x: stemming(x))
tweet_data.head()

nltk.download('wordnet')
wordnet = nltk.WordNetLemmatizer()

def lemmatizer(text):
    text = [wordnet.lemmatize(word) for word in text]
    return text

tweet_data['Tweet_lemmatized'] = tweet_data['Tweet_without_stop'].apply(lambda x: lemmatizer(x))
tweet_data.head()

all_clean_words=[]

for i in tweet_data['Tweet_lemmatized']:
    for j in i:
        all_clean_words.append(j)

all_clean_words=list(set(all_clean_words)) #removes duplicate values from the list

clean_words_str=' '.join(all_clean_words)

from random import sample
clean_tweets=list(set(tweet_data['clean_text']))
sample=sample(clean_tweets,20)

from sklearn.feature_extraction.text import CountVectorizer
vectorizer = CountVectorizer()
X = vectorizer.fit_transform(sample)
vectorizer.get_feature_names()

count_vect_df = pd.DataFrame(X.toarray(), columns=vectorizer.get_feature_names())
count_vect_df.head()

from wordcloud import WordCloud
wordcloud = WordCloud(width = 800, height = 800,
                background_color ='white',
                stopwords = stopwords,
                min_font_size = 10).generate(clean_words_str)

plt.figure(figsize = (8, 8), facecolor = None)
plt.imshow(wordcloud)
plt.axis("off")
plt.tight_layout(pad = 0)
 
plt.show()

tweet_data.to_csv('Clean_Twitter_data.csv')