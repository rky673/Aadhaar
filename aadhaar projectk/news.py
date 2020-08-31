l = []
d = []
k = []


def get():
    import requests
    a = requests.get("https://newsapi.org/v2/top-headlines?country=in&apiKey=69f7086f7fed4dda9bc4e50c3591be98")
    b = a.json()
    c = b["articles"]
    for item in c:
        l.append(item["title"])
        d.append(item["description"])
        k.append(item["content"])


get()
