import gensim 
import numpy as np
from numpy import zeros
from gensim.models import fasttext


model = fasttext.load_facebook_model('data/embeddings-s-model.bin')  
model = fasttext.load_facebook_model('data/embeddings-l-model.bin')  
wv = model.wv 

wv.most_similar(positive=['mujer', 'rey'], negative=['hombre'])
wv.most_similar(positive=['perro'])


wv.similarity('animal', 'hipopótamo')
wv.similarity('nación', 'hipopótamo')
