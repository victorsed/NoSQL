##### Exercice Aggréger des restaurants ####

# Q : Créer 1DB restaurant, ajouter 1 collection "restaurants", la remplir avec le fichier restaurants.json. Rq: Préciser, lors de l'injection du fichier json, dans la commande "mongoimport" la possibilité de supprimer la collection si elle existe (pour qu'elle soit recréer de nouveau et y injecter de la data fraîche). 
# Indice : 25357 restaurant en tout mongoimport -d db_agg -c restaurants --drop --file "C:/Users/bejao/OneDrive/DB/NoSQL/MongoDB/2 ProjetAggregation/fichiersApprenants/restaurants.json" 
# S : imported 25357 documents 

# R :
use restaurant 
db.createCollection("restaurants")

mongoimport -d db_agg -c restaurants --drop --file "D:/Cours/B3/NoSQL/TP3/tp3json/restaurants.json"

var schematodo = db.restaurants.findOne();
for (var key in schematodo) { print (key) ; }


Répondre aux questions suivantes : 
# Q : La répartition des restaurants par quartier ? 
# Indice : quartier => key 'borough' 

db.restaurants.aggregate( [
    { $project : {
        "name":1, "borough":1, "_id":0
    }},
    { $sort : {
        "borough":1
    }}
] )

# Q : un grade "C" par quartier ? 
# Indice : la dernière inspection : la plus récente, donc la première de La répartition des restaurants dont la dernière inspection a donné la liste ! # key : "grade" 




# Q : Calculer le score moyen des resto par quartier et trier par score décroissant ? 
# Indice : utiliser l'opérateur unwid { "_id" : "Queens", "moyenne" : 11.634865110930088 } { "_id" : "Brooklyn", "moyenne" : 11.447723132969035 } { "_id" : "Manhattan", "moyenne" : 11.41823125728344 } { "_id" : "Staten Island", "moyenne" : 11.370957711442786 } { "_id" : "Bronx", "moyenne" : 11.036186099942562 } { "_id" : "Missing", "moyenne" : 9.632911392405063 }

##### Exercice Aggréger des transactions ##### 
Q : Créer une collection "transactions" à partir du fichier transactions.json et répondre aux questions suivantes : 
Q-1. Calculer le montant total des paiements ? 
# Indice : key : Payment.Total 
Q-2. Calculer le montant total par paiment ? 
Q-3. Calculate total payments (Payment.Total) for each payment type (Payment.Type) ? 
Q-4. Trouver l'Id le plus élevé. Q-5. Find the max price (Transaction.price) ?

##### distinct ##### 
# Q : Age unique => distinct ? db.people.distinct("age") 
# S : [ 20, 35, 60 ] Q : Peut-on faire un distinct sur plusieurs key ? db.people.distinct("name", "age") 
# R : Ce n'est pas possible de faire un distinct sur plusieurs key => Il faut passer par map reduce !