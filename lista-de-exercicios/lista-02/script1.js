// Conecte-se ao MongoDB
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://root:jesus@localhost:27017/?authMechanism=DEFAULT";

MongoClient.connect(url, function(err, db) {
  if (err) throw err;

  // Crie um novo banco de dados chamado "iftm"
  var dbo = db.db("iftm");

  // Crie uma nova coleção chamada "School" com validação de esquema
  dbo.createCollection("School", {
    validator: {
      $jsonSchema: {
        bsonType: "object",
        required: ["name"],
        properties: {
          name: {
            bsonType: "string",
            description: "deve ser uma string e é obrigatório"
          }
        }
      }
    }
  });

  // Crie uma nova coleção chamada "Student" com validação de esquema
  dbo.createCollection("Student", {
    validator: {
      $jsonSchema: {
        bsonType: "object",
        required: ["age", "schoolId", "address"],
        properties: {
          age: {
            bsonType: "int",
            minimum: 15,
            maximum: 100,
            description: "deve ser um inteiro entre 15 e 100 e é obrigatório"
          },
          schoolId: {
            bsonType: "int",
            minimum: 1000,
            maximum: 9999,
            description: "deve ser um inteiro entre 1000 e 9999 e é obrigatório"
          },
          address: {
            bsonType: "object",
            required: ["number"],
            properties: {
              number: {
                bsonType: "int",
                minimum: 1,
                description: "deve ser um inteiro acima de 1 e é obrigatório"
              }
            }
          }
        }
      }
    }
  });

  console.log("Coleções 'School' e 'Student' criadas com validação de esquema!");
  db.close();
});