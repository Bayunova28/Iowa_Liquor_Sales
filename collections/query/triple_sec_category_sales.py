from pymongo import MongoClient

# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb://localhost:27017/')
filter={
    'category_name': 'Triple Sec'
}
project={
    '_id': 0, 
    'date': 0
}

result = client['db-test']['iowa_liquor_sales'].find(
  filter=filter,
  projection=project
)