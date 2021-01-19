from pymongo import MongoClient

client = MongoClient('mongodb://localhost:27017/')
db = client.metflix
movies = db.movies
print('connexion success')
movies.find_one()

movies.find()

for item in movies.find():
    print(item)

client.drop_database('metflix')

db = client["metflix"]
movies = db["movies"]
movie1 = {"title" : "Rocky" , "year" : 1976 }
movie2 = {"title" : "Jaws" , "year" : 1975 }
movie3 = {"title" : "Mad Max 2 : The Road Warrior" , "year" : 1981 }
movie4 = {"title" : "Raiders of the Lost Ark" , "year" : 1981 }

x = movies.insert_one(movie1)
z = movies.insert_one(movie2)
y = movies.insert_one(movie3)
w = movies.insert_one(movie4)
print(x.inserted_id)
print(z.inserted_id)
print(y.inserted_id)
print(w.inserted_id)

try:
    db = client.metflix
    col = db["movies"]
    print("collection movies added")
except:
    print ("Get MongoDB database and collection ERROR:")

for item in movies.find():
    print(item)

for item in movies.find({"title":"Jaws"}):
    print(item)

for item in movies.find({"year": 1981}):
    print(item)



use movies_artists
db.createCollection("movies")
db.createCollection("artists")
mongoimport -d movies_artists -c movies --drop --file "C:/Users/victo/Downloads/json/movies.json" --jsonArray
mongoimport -d movies_artists -c artists --drop --file "C:/Users/victo/Downloads/json/artists.json" --jsonArray
db.artists.find().pretty()
db.movies.find().pretty()
mongoimport -d movies_artists -c movies --mode insert --file "C:/Users/victo/Downloads/json/movies_suite.json" --jsonArray
mongoimport -d movies_artists -c artists --mode insert --type csv --headerline --file "C:/Users/victo/Downloads/json/artists_suite.csv"