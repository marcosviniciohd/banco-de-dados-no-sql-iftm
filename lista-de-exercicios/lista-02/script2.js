// Conecte-se ao MongoDB
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://root:jesus@localhost:27017/?authMechanism=DEFAULT";

MongoClient.connect(url, function(err, db) {
  if (err) throw err;

  // Selecione o banco de dados "iftm"
  var dbo = db.db("iftm");

  // Dados a serem inseridos
  var myobj1 = { age: 20, schoolId: 2000, address: { number: 10 } };
  var myobj2 = { age: 30, schoolId: 3000, address: { number: 20 } };
  var myobj3 = { age: 140, schoolId: 4000, address: { number: 30 } }; // Erro proposital: idade acima do limite

  // Inserir dados na coleção "Student"
  dbo.collection("Student").insertOne(myobj1, function(err, res) {
    if (err) throw err;
    console.log("Documento 1 inserido");
  });

  dbo.collection("Student").insertOne(myobj2, function(err, res) {
    if (err) throw err;
    console.log("Documento 2 inserido");
  });

  dbo.collection("Student").insertOne(myobj3, function(err, res) {
    if (err) console.log("Erro ao inserir o documento 3: " + err);
    else console.log("Documento 3 inserido");

    db.close();
  });
});
