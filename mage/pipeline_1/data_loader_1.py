import io
import pandas as pd
import requests
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(*args, **kwargs):
    
    url_job = 'https://media.githubusercontent.com/media/doniyordjon/doniyor-de-zoomcamp-final-project/main/Data/job_postings.csv'
       
    job_postings = pd.read_csv(url_job, encoding = 'utf8')    

    return job_postings