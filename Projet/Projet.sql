mongoimport -d vg_sales -c game --mode insert --type csv --headerline --file "D:\Cours\B3\NoSQL\Projet\csv\vgsales.csv"

db.createCollection("game")

### Lister les jeux par année ###

db.game.find({"Year": 2004}).pretty()

### Lister les jeux par range d année ###

db.game.find({"Year": { $gte: 2000, $lte: 2005 }}).pretty()

### Trier les jeux par console ### 

db.game.aggregate( [
     { $project : {
         "Name":1, "Platform":1, "_id":0
     }},
     { $sort : {
        "Platform":1
     }}
] )

### Trier les jeux par année ##

db.game.aggregate( [
     { $project : {
         "Name":1, "Year":1, "_id":0
     }},
     { $sort : {
        "Year":1
     }}
] )

### Trier par éditeur ###

db.game.aggregate( [
     { $project : {
         "Name":1, "Publisher":1, "_id":0
     }},
     { $sort : {
        "Publisher":1
     }}
] )

### Trier par genre ### 

db.game.aggregate( [
     { $project : {
         "Name":1, "Genre":1, "_id":0
     }},
     { $sort : {
        "Genre":1
     }}
] )

### Lister les jeux dont le nom commence par : Wi ###

db.game.find ({"Name": /^Wi/}, {"Name":1, "Platform": 1, "_id": 0}).pretty()


### Pourcentage des ventes par Zones géographiques ###

db.game.aggregate(
   [
     { $project: { 
         "Name":1, "_id":0,
         "percentage_NA_Sales": { 
                "$concat": [ { "$substr": [ { "$multiply": [ { "$divide": [ "$NA_Sales", "$Global_Sales"] }, 100 ] }, 0,3 ] }, "", " %" ]}
        ,
         "percentage_EU_Sales": { 
                "$concat": [ { "$substr": [ { "$multiply": [ { "$divide": [ "$EU_Sales", "$Global_Sales"] }, 100 ] }, 0,3 ] }, "", " %" ]}
        ,
        "percentage_JP_Sales": { 
                "$concat": [ { "$substr": [ { "$multiply": [ { "$divide": [ "$JP_Sales", "$Global_Sales"] }, 100 ] }, 0,3 ] }, "", " %" ]}
        ,
         "percentage_Other_Sales": { 
                "$concat": [ { "$substr": [ { "$multiply": [ { "$divide": [ "$Other_Sales", "$Global_Sales"] }, 100 ] }, 0,3 ] }, "", " %" ]}
        }
     }   
   ]
)

### Pourcentage des ventes par Zones géographiques + tri sur le genre ###

db.game.aggregate(
   [
     { $project: { 
         "Name":1, "_id":0, "Genre":1,
         "percentage_NA_Sales": { 
                "$concat": [ { "$substr": [ { "$multiply": [ { "$divide": [ "$NA_Sales", "$Global_Sales"] }, 100 ] }, 0,3 ] }, "", " %" ]}
        ,
         "percentage_EU_Sales": { 
                "$concat": [ { "$substr": [ { "$multiply": [ { "$divide": [ "$EU_Sales", "$Global_Sales"] }, 100 ] }, 0,3 ] }, "", " %" ]}
        ,
        "percentage_JP_Sales": { 
                "$concat": [ { "$substr": [ { "$multiply": [ { "$divide": [ "$JP_Sales", "$Global_Sales"] }, 100 ] }, 0,3 ] }, "", " %" ]}
        ,
         "percentage_Other_Sales": { 
                "$concat": [ { "$substr": [ { "$multiply": [ { "$divide": [ "$Other_Sales", "$Global_Sales"] }, 100 ] }, 0,3 ] }, "", " %" ]}
        }
     },
     {
        $sort : {
           "Genre":1
        }
     }      
   ]
)

db.game.aggregate(
   [
     { $project: { 
         "Name":1, "_id":0, 
        }
     }   
   ]
)

db.game.aggregate(
   [
     { $project: { 
         "Name":1, "_id":0, "NA_Sales":1
        }
     },
     { $group: {
        _id: null,
        maxSellsNA: { $max: "$NA_Sales" }
     }}   
   ]
)

