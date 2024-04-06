import io
import pandas as pd
import requests
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(*args, **kwargs):

    url_companies = 'https://media.githubusercontent.com/media/doniyordjon/doniyor-de-zoomcamp-final-project/main/Data/company_details/companies.csv'

    companies = pd.read_csv(url_companies)

    return companies

