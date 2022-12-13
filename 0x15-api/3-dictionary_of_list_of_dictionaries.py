#!/usr/bin/python3
"""
export data in the JSON format
"""

import json
import requests
import sys


if __name__ == '__main__':
    user = requests.get('https://jsonplaceholder.typicode.com/users')
    username_list = [username.get('username') for username in user.json()]
    user_id = [id_number.get('id') for id_number in user.json()]
    todo = requests.get('https://jsonplaceholder.typicode.com/todos')
    new_list = todo.json()
    formatted_dict = {}
    for i in user_id:
        formatted_list = []
        for dict in new_list:
            userId = dict.get('userId')
            if userId == i:
                new_dict = {}
                new_dict['username'] = username_list[userId - 1]
                new_dict['task'] = dict.get('title')
                new_dict['completed'] = dict.get("completed")
                formatted_list.append(new_dict)
        formatted_dict[i] = formatted_list
    with open('todo_all_employees.json', 'w') as file:
        json.dump(formatted_dict, file, indent=2)
