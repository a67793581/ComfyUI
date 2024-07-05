import requests
# 现在，所有通过requests发出的请求都将自动使用代理
response = requests.get(
    'https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/LICENSE.md?download=true')
print(response.text)
