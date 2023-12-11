// 1. Query para Obter os clientes com idade acima de 50 anos;
db.customer.find({ age: { $gt: 50 } }).pretty();

// 2. Obter os clientes com idade abaixo a 18 anos;
db.customer.find({ age: { $lt: 18 } }).pretty();

// 3. Obter os clientes com idade entre 20 e 40 anos;
db.customer.find({ age: { $gte: 20, $lte: 40 } }).pretty();

// 4. Obter os clientes com idade igual a 15 e 18 anos;
db.customer.find({ age: { $in: [15, 18] } }).pretty();

// 5. Obter todos os clientes com nome Fernando;
db.customer.find({ name: "Fernando" }).pretty();

// 6. Obter um cliente com o nome Ana;
db.customer.findOne({ name: "Ana" });

// 7. Obter todos os clientes com 90 anos ou acima disso;
db.customer.find({ age: { $gte: 90 } }).pretty();

// 8. Obter todos os clientes com sobrenome Oliveira;
db.customer.find({ lastName: "Oliveira" }).pretty();

// 9. Obter todos os clientes que não tem o sobrenome Bueno;
db.customer.find({ lastName: { $ne: "Bueno" } }).pretty();

// 10. Obter todos os clientes que tem créditos acima de 3000 pontos;
db.customer.find({ credits: { $gt: 3000 } }).pretty();

// 11. Obter todos os clientes que tem créditos acima de 1000 pontos e abaixo de 2500 pontos;
db.customer.find({ credits: { $gt: 1000, $lt: 2500 } }).pretty();

// 12. Contar quantos clientes tem créditos acima de 1000 pontos e abaixo de 2500 pontos;
db.customer.find({ credits: { $gt: 1000, $lt: 2500 } }).count();

// 13. Obter todos os clientes que não tem crédito;
db.customer.find({ credits: { $exists: false } }).pretty();

// 14. Inserir 1000 de créditos para os clientes que não possuem;
db.customer.updateMany({ credits: { $exists: false } }, { $set: { credits: 1000 } });

// 15. Obter todos os clientes que tem o país BR;
db.customer.find({ country: "BR" }).pretty();

// 16. Obter todos os clientes que não tem o país BR;
db.customer.find({ country: { $ne: "BR" } }).pretty();

// 17. Remover o cliente Roberto;
db.customer.deleteOne({ name: "Roberto" });

// 18. Alterar o sobrenome da Luzia para “Araújo";
db.customer.updateOne({ name: "Luzia" }, { $set: { lastName: "Araújo" } });

// 19. Obter todos os clientes que possuem filme com o gênero “Romance”;
db.customer.find({ "movies.genre": "Romance" }).pretty();

// 20. Alterar os filmes do gênero “Ação” para “Ação da Pesada”;
db.customer.updateMany({ "movies.genre": "Ação" }, { $set: { "movies.$.genre": "Ação da Pesada" } });