show collections

db.Gymnases.find().count()
db.Sportifs.find().count()

db.Sportifs.findOne()
db.Gymnases.findOne()

db.Sportifs.find({"Nom":"KERVADEC"},{"IdSportifConseiller":1})
db.Sportifs.find({"Nom":"KERVADEC"},{"Prenom":1})

db.Sportifs.find({$or : [{"Age": 32}, {"Age":40}]},{"Nom":1,"Prenom":1, "Age":1}).sort({"Age":1})

db.Sportifs.find({"Sports.Jouer" : "Basket ball" },{"Nom":1})

db.Sportifs.find({$or : [{"Age": 32}, {"Sexe": "F"}]},{"Nom":1,"Prenom":1, "Age":1, "Sexe":1}).sort({"Age":1})

db.Sportifs.find({"Sexe":"F"}).count()

db.Sportifs.find({"Age" : {$gte:20, $lte:30} },{"_id":1, "Nom":1, "Prenom":1, "Age":1} )

db.Sportifs.find({"Sports.Jouer" : "Hand ball" },{"Nom":1})

db.Gymnases.find({"$and":[{$or : [{"Ville": "VILLETANEUSE"}, {"Ville":"SARCELLES"}]},{"Surface": { $gte: 400}}]},{"Ville":1,"Surface":1})

db.Gymnases.find("$and"[{"Seances.Libelle":"Hockey"},{"Seances.Jour":"mercredi"},{"Seances.Horaire":15}],{"NomGymnase":1})

db.Sportifs.find({"Sports.Jouer" : null},{"Nom" : 1})

db.Gymnases.find({"Seances.Jour" : { "$nin" : [ "dimanche", "Dimanche" ]}})

db.Gymnases.find(
    {
        "$nor": [
            { "Seances.Libelle": { "$ne": "Basket ball" }},
            { "Seances.Libelle": { "$ne": "Volley ball" }}
        ]
    })
