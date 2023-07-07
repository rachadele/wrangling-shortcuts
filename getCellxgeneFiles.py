#shortcut to download select collections from cellxgene
#clone repo Lattice-Data/lattice-tools/notebooks/curation-api
#to run this, cd to single-cell-curation/notebooks/curation-api/python/

from src.dataset import (
    download_assets,
    get_dataset,   
)

from src.collection import (
get_collection
)

from src.utils.config import set_api_access_config
set_api_access_config()

#replace colluction_uuid with desired uuid(s)
collection_ids=['collection_uuid']

#initialize empy list for 'collections', which we will pass to get_dataset to get download links
#see curation-api/python/src/dataset.py for reference
collections=[]
datasets=[]

for id in collection_ids:
    collection = get_collection(id)
    collections.append(collection)
    
#print(collections)
    

#iterate through collections list and get dataset object, which contains download links we will pass to download_assets
#see src/dataset.py for source code
for item in collections:
    for dataset in item['datasets']:
        datasets.append(get_dataset(item['collection_id'],dataset['dataset_id']))
      
#download all h5ad and rds files for given collections
download_assets(datasets)
