from flask import Flask, request, jsonify
import requests
from dotenv import load_dotenv
import os

load_dotenv()

app = Flask(__name__)

GPT_API_URL = 'https://api.openai.com/v1/chat/completions'
GPT_API_KEY = os.getenv('OPENAI_API_KEY')

@app.route('/process', methods=['POST'])
def process():
    data = request.json
    prompt = data.get('prompt')
    image = data.get('image')  # Assuming image is base64 encoded

    headers = {
        'Authorization': f'Bearer {GPT_API_KEY}',
        'Content-Type': 'application/json'
    }
    payload = {
        'model': 'gpt-4o',  # Specify the model you want to use
        'prompt': prompt,
        'image': image  # Adjust this based on GPT-4 API requirements
    }

    response = requests.post(GPT_API_URL, headers=headers, json=payload)
    return jsonify(response.json())

# @app.route('/') #initial testing, OK
# def home():
#     return 'Hello, World!'

if __name__ == '__main__':
    app.run(debug=True)
