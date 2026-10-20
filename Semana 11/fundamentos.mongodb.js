use('tinder');

db.explorar.insertOne(
    {
        "username" : "Luchito",
        "age" : 20,
        "description" : "Me gusta archlinux",
        "hobbies" : [
            "programar",
            "pokemon tcg"
        ],
        "photos" : [
                "https://i.pinimg.com/736x/7e/3e/ae/7e3eaeb6098477f14bb1cfac81e251bf.jpg"
        ]
    }
);



use("tinder");

db.explorar.find();

use("tinder");

db.explorar.findOne(
    {
        "username" : "Pepita"
    }
);