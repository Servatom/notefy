import requests
import random

def getImages():
    url = "https://assets.servatom.com/notefy/avatars"
    response = requests.request("GET", url)
    
    images = []
    for i in response.json():
        if i['isFolder'] == False:
            images.append(i['url'])
    return images

def selectImage():
    images = getImages()
    if len(getImages()) > 0:
        choice = random.choice(images)
        print(choice)
        return choice
    return 0