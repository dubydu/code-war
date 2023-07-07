from pymongo import MongoClient
import certifi

def get_database():

    # Provide the mongodb atlas url to connect python to mongodb using pymongo
    CONNECTION_STRING = "mongodb+srv://dubvcontact:7tYakqyBTuEHxjXa@keocandy.7eqooab.mongodb.net/?retryWrites=true&w=majority"

    # Create a connection using MongoClient.
    client = MongoClient(CONNECTION_STRING, tlsCAFile=certifi.where())

    # Send a ping to confirm a successful connection
    try:
        client.admin.command('ping')
        print('Pinged your deployment. You successfully connected to MongoDB!')
    except Exception as e:
        print(e)

    # Create the database for our example (we will use the same database throughout the tutorial
    return client['keocandy']


if __name__ == "__main__":

    # Get the database
    dbname = get_database()

    # Create and insert a collection
    # dbname.col_master.insert_one(
    #   {'name': 'Asabeneh', 'country': 'Finland', 'city': 'Helsinki', 'age': 250})

    # Insert
    masters = [
        {'name': 'David', 'country': 'UK', 'city': 'London', 'age': 34},
        {'name': 'John', 'country': 'Sweden', 'city': 'Stockholm', 'age': 28},
        {'name': 'Sami', 'country': 'Finland', 'city': 'Helsinki', 'age': 25},
    ]
    # for master in masters:
    # dbname.col_master.insert_one(master)

    # Delete
    delete_query = {'name': 'Asabeneh'}
    # result = dbname.col_master.delete_many(delete_query)
    result = dbname.col_master.delete_one(delete_query)
    
    # amount deleted code goes here
    print("Number of documents deleted: ", result.deleted_count)
