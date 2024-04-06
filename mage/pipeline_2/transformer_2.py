if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test
@transformer
def transform(data, *args):

    choosen_column = ['company_id', 'name', 'state', 'country', 'city']    
    data = data[choosen_column]
    data = data.drop_duplicates(subset=['company_id'])
    return data
