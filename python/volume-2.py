### try to scrape db
"""
import requests
from bs4 import BeautifulSoup

endpoint = 'https://www.spanishdict.com/translate/weather'

response = requests.get(endpoint)

# status
status_code = response.status_code
print(f'======== {status_code}')

# content 
content = response.content
new_soup = BeautifulSoup(content, 'html.parser')

# body
body = new_soup.body

dictionary_neodict_en = new_soup.find_all(id='dictionary-neodict-en')
dictionary_neoharrap_en = new_soup.find_all(id='dictionary-neoharrap-en')
dictionary_collins_en = new_soup.find_all(id='dictionary-collins-en')
"""

### setup virtual env (macos)
"""
1. pip install virtualenv
2. virtualenv venv
3. source venv/bin/activate
4. pip freeze
"""

from flask import Flask, render_template
import os

app = Flask(__name__)
@app.route('/')
def home ():
    return render_template('home.html')

@app.route('/about')
def about():
    return render_template('about.html')


if __name__ == '__main__':
    # for deployment we use the environ
    # to make it work for both production and development
    port = int(os.environ.get("PORT", 5500))
    app.run(debug=True, host='0.0.0.0', port=port)