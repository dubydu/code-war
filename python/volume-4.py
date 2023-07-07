from pymongo import MongoClient
import certifi
from flask import Flask, request, Response, jsonify
import json
from bson.objectid import ObjectId
import os
from bson.json_util import dumps

app = Flask(__name__)

# Provide the mongodb atlas url to connect python to mongodb using pymongo
CONNECTION_STRING = "mongodb+srv://dubvcontact:7tYakqyBTuEHxjXa@keocandy.7eqooab.mongodb.net/?retryWrites=true&w=majority"

# Create a connection using MongoClient
client = MongoClient(CONNECTION_STRING, tlsCAFile=certifi.where())

try:
    client.admin.command('ping')
    print('Pinged your deployment. You successfully connected to MongoDB!')
except Exception as e:
    print(e)

api_client = client['keocandy']


@app.route('/api/v1/users', methods=['GET'])
def get_user_method():
    users = api_client.col_master.find()
    return Response(dumps(users), mimetype='application/json')


@app.route('/api/v1/users/<name>', methods=['GET'])
def get_user_byname_method(name):
    users = api_client.col_master.find({'name': name})
    return Response(dumps(users), mimetype='application/json')


@app.route('/api/v1/users', methods=['POST'])
def post_user_method():
    data = request.get_json()
    name = data['name']
    country = data['country']
    city = data['city']
    age = data['age']
    user = {
        'name': name,
        'country': country,
        'city': city,
        'age': age
    }
    response_data = api_client.col_master.insert_one(user)
    response_data = {'status': 'success',
                     'status_code': 200, 'message': 'Data received 🎉'}

    if not data:
        response_data['status'] = 'error'
        response_data['message'] = 'Invalid data.'
        response_data['status_code'] = 400

    return jsonify(response_data)


@app.route('/api/v1/users/<user_id>', methods=['PUT'])
def update_user_method(user_id):
    data = request.get_json()
    query = {"_id": ObjectId(user_id)}
    response_data = api_client.col_master.update_one(query, {'$set': data})
    response_data = {'status': 'success',
                     'status_code': 200,
                     'message': f'User account {user_id} updated 🎉'}

    if not data:
        response_data['status'] = 'error'
        response_data['message'] = 'Invalid data.'
        response_data['status_code'] = 400
    return jsonify(response_data)


@app.route('/api/v1/users/<user_id>', methods=['DELETE'])
def delete_user_method(user_id):
    query = {"_id": ObjectId(user_id)}
    result = api_client.col_master.delete_one(query)
    if result.deleted_count > 0:
        response_data = {
            'status': 'success',
            'status_code': 200,
            'message': f'User account {user_id} deleted 🎉'
        }
    else:
        response_data = {
            'status': 'error',
            'status_code': 404,
            'message': f'User account {user_id} not found'
        }
    return jsonify(response_data)


@app.route('/api/v1/users', methods=['DELETE'])
def delete_users_by_ids_method():
    data = request.get_json()
    user_ids = data.get('user_ids', [])
    query = {'_id': {'$in': [ObjectId(uid) for uid in user_ids]}}
    result = api_client.col_master.delete_many(query)
    if result.deleted_count > 0:
        response_data = {
            'status': 'success',
            'status_code': 200,
            'message': f'{result.deleted_count} user accounts deleted 🎉'
        }
    else:
        response_data = {
            'status': 'error',
            'status_code': 404,
            'message': 'No user accounts found'
        }
    return jsonify(response_data)


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5500))
    app.run(debug=True, host='0.0.0.0', port=port)
