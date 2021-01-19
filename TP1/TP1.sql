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



db.movies.find().skip(9).limit(12).pretty()

b.movies.find().sort({"title": 1}).skip(9).limit(12).pretty()
db.movies.find().sort({"title": -1}).skip(9).limit(12).pretty()

db.movies.findOne({"_id":"movie:2"})
db.movies.findOne({"_id":"movie:2"}, {"title":1, "genre":1, "summary":1})

db.movies.find({"year": 1979}, {"title":1, "genre":1, "actors":1}).sort({"title":-1}).pretty()

db.movies.find({"year": 1979, "title": "Alien"}).pretty()




db.movies.find({$and : [{"year": 1997}, {"actors.role": "Jack Dawson"}]} )

db.movies.find({"year": 1997, "actors.role": "Jack Dawson"} )

db.movies.find({$or : [{"year": 1997}, {"actors._id": "artist:147"}] }).limit(3).pretty()



db.movies.find({"director._id":"artist:4"}, {"country":0, "summary":0, "genre":0}).sort({"year":-1}).pretty()

db.movies.find({"director._id":"artist:4", "actors.role":"Maximus"}, {"country":0, "summary":0, "genre":0}).sort({"year":-1}).pretty()

critere_recherche = {"director._id":"artist:4", "actors.role":"Maximus"}
projection = {"country":0, "summary":0, "genre":0}
tri = {"year":-1}
db.movies.find(critere_recherche, projection).sort(tri).pretty()

db.movies.find( {"year": { $gte: 2000, $lte: 2005 }}).pretty()


db.movies.find({"actors._id": {$in: ["artist:34","artist:98","artist:1"]}}, {"title":1, "year":1, "actors":1}).sort({"year":1, "title":1}).pretty()

db.movies.find({"actors._id": {$all: ["artist:23","artist:147"]}})

db.movies.find({"actors._id": {$nin: ["artist:34", "artist:98", "artist:1"]}}, {"title":1, "year":1, "actors":1}).sort({"year":-1, "title":1}).limit(5).pretty()

db.movies.count({"actors": {$exists : false}})
db.movies.count({"actors": []})
db.movies.find({"actors": []}, {"_id" : 0, "title": 1, "actors" : 1} ).pretty()

db.movies.find ({"actors._id": "artist:147"}, {"actors": null, "summary": 0} ).pretty()

eastwood = db.artists.findOne({"first_name": "Clint", "last_name": "Eastwood"})

db.movies.find({"director._id": eastwood['_id']}, {"title": 1, "director._id" : 1})

db.movies.find ({"title": /^Re/}, {"actors": null, "summary": 0}).pretty()

db.movies.find ({"actors._id": "artist:147"}, {"title": true, "actors": 'j'} ).pretty()

db.movies.find ({"actors._id": "artist:147"}, {"actors": null, "summary": 0} ).pretty()


