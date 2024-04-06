if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args):   
    
    choosen_column = ['company_id', 'title', 'med_salary','formatted_work_type', 'location','remote_allowed','sponsored']
    data = data[choosen_column]    
    data['remote_allowed'].fillna('Unknown', inplace=True)
    data = data.drop_duplicates(subset=['company_id'])      
    return data