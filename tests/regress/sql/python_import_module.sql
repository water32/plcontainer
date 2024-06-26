--
-- import numpy
--
create or replace function numpy_test() RETURNS TEXT AS $$
# container: plc_python_shared
import numpy
a = numpy.arange(15).reshape(3, 5)
return "Success!"
$$ LANGUAGE plcontainer;

SELECT numpy_test();

DROP FUNCTION numpy_test();


--
-- import scipy
--
create or replace function scipy_test() RETURNS TEXT AS $$
# container: plc_python_shared
import sys
if not hasattr(sys, 'argv'):
    sys.argv  = ['']
import scipy
f = lambda x: -scipy.special.jv(3, x)
return "Success!"
$$ LANGUAGE plcontainer;

SELECT scipy_test();

DROP FUNCTION scipy_test();


--
-- import pandas
--
create or replace function pandas_test() RETURNS TEXT AS $$
# container: plc_python_shared
import pandas
import numpy
s = pandas.Series([1,3,5,numpy.nan,6,8])
return "Success!"
$$ LANGUAGE plcontainer;

SELECT pandas_test();

DROP FUNCTION pandas_test();


--
-- import pyLDAvis
--
create or replace function pyldavis_test() RETURNS TEXT AS $$
# container: plc_python_shared
import pyLDAvis
version = pyLDAvis.__version__
return "Success!"
$$ LANGUAGE plcontainer;

SELECT pyldavis_test();

DROP FUNCTION pyldavis_test();

--
-- import gensim
--
create or replace function gensim_test() RETURNS TEXT AS $$
# container: plc_python_shared
import gensim
corpus = [[(0, 1.0), (1, 1.0), (2, 1.0)],[(2, 1.0), (3, 1.0), (4, 1.0), (5, 1.0), (6, 1.0), (8, 1.0)]]
tfidf = gensim.models.TfidfModel(corpus)
return "Success!"
$$ LANGUAGE plcontainer;

SELECT gensim_test();

DROP FUNCTION gensim_test();


--
-- import xgboost
--
create or replace function xgboost_test() RETURNS TEXT AS $$
# container: plc_python_shared
import numpy as np
import xgboost as xgb
# generate data in numpy
data = np.random.rand(5,10)
label = np.random.randint(2, size=5)

dtrain = xgb.DMatrix( data, label=label)

return "Success!"
$$ LANGUAGE plcontainer;

SELECT xgboost_test();

DROP FUNCTION xgboost_test();


--
-- import sklearn
--
create or replace function sklearn_test() RETURNS TEXT AS $$
# container: plc_python_shared
from sklearn import datasets
from sklearn import linear_model
lr = linear_model.LinearRegression()
return "Success!"
$$ LANGUAGE plcontainer;

SELECT sklearn_test();

DROP FUNCTION sklearn_test();


--
-- import lifelines
--
create or replace function lifelines_test() RETURNS TEXT AS $$
# container: plc_python_shared
import lifelines
cph = lifelines.CoxPHFitter()
return "Success!"
$$ LANGUAGE plcontainer;

SELECT lifelines_test();

DROP FUNCTION lifelines_test();


--
-- download spacy
--
create or replace function spacy_test() RETURNS TEXT AS $$
# container: plc_python_shared
import sys
if not hasattr(sys, 'argv'):
    sys.argv  = ['']
import spacy
nlp = spacy.load('en_core_web_sm')
doc = nlp(u'this is a spacy tokenizer test.')

return "Success!"
$$ LANGUAGE plcontainer;

SELECT spacy_test();

DROP FUNCTION spacy_test();


--
-- import lxml
--
create or replace function lxml_test() RETURNS TEXT AS $$
# container: plc_python_shared
import lxml
from lxml import etree
xml = '<a xmlns="test"><b xmlns="test"/></a>'
t = etree.fromstring(xml)
return "Success!"
$$ LANGUAGE plcontainer;

SELECT lxml_test();

DROP FUNCTION lxml_test();


--
-- import statsmodels
--
create or replace function statsmodels_test() RETURNS TEXT AS $$
# container: plc_python_shared
import numpy as np
import statsmodels.nonparametric.api as nparam
italy_gdp =[8.556, 12.262, 9.587, 8.119, 5.537, 6.796, 8.638]
italy_year = [1951, 1951, 1951, 1951, 1951, 1951, 1951]
italy_year = np.asarray(italy_year, float)
model = nparam.KernelReg(endog=[italy_gdp],
                         exog=[italy_year],
                         reg_type='lc',
                         var_type='o',
                         bw='cv_ls')

return "Success!"
$$ LANGUAGE plcontainer;

SELECT statsmodels_test();

DROP FUNCTION statsmodels_test();


--
-- import BeautifulSoup
--
create or replace function beautifulsoup_test() RETURNS TEXT AS $$
# container: plc_python_shared
from bs4 import BeautifulSoup 
text="<!DOCTYPE html><!--STATUS OK--><html> <head>TEST</head><body>TEST bs4</body></html>"
soup=BeautifulSoup(text, "lxml")
result = soup.find_all('head')
return "Success!"
$$ LANGUAGE plcontainer;

SELECT beautifulsoup_test();

DROP FUNCTION beautifulsoup_test();


--
-- import pymc
--
create or replace function pymc_test() RETURNS TEXT AS $$
# container: plc_python_shared
from pymc import Model, Normal, HalfNormal
basic_model = Model()
return "Success!"
$$ LANGUAGE plcontainer;

SELECT pymc_test();

DROP FUNCTION pymc_test();


--
-- import nltk
--
create or replace function nltk_test() RETURNS TEXT AS $$
# container: plc_python_shared
import nltk
version=nltk.__version__

return "Success!"
$$ LANGUAGE plcontainer;

SELECT nltk_test();

DROP FUNCTION nltk_test();


--
-- import keras
--
create or replace function keras_test() RETURNS TEXT AS $$
# container: plc_python_shared
import sys
sys.argv=['']
from keras.models import Sequential
model = Sequential()
return "Success!"
$$ LANGUAGE plcontainer;

SELECT keras_test();

DROP FUNCTION keras_test();


--
-- import tensorflow
--
create or replace function tensorflow_test() RETURNS TEXT AS $$
# container: plc_python_shared
import sys
sys.argv=['']
import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
with tf.compat.v1.Session() as sess:
    c = tf.constant([[1.0, 2.0], [3.0, 4.0]])
    d = tf.constant([[1.0, 1.0], [0.0, 1.0]])
    e = tf.matmul(c, d)
    result = sess.run(e)
    print(result)

return "Success!"
$$ LANGUAGE plcontainer;

SELECT tensorflow_test();

DROP FUNCTION tensorflow_test();

-- import gluonts
--
create or replace function gluonts_test() RETURNS TEXT AS $$
# container: plc_python_shared
from gluonts.dataset.repository.datasets import get_dataset, dataset_recipes
from gluonts.dataset.util import to_pandas
return "Success!"
$$ LANGUAGE plcontainer;

SELECT gluonts_test();

DROP FUNCTION gluonts_test();
