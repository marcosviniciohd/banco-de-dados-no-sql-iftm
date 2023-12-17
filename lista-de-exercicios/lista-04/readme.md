use pedidos;

> 1. Qual é o valor total de vendas por cliente? Crie um pipeline de agregação que agrupe os documentos por cliente e calcule o valor total de vendas para cada cliente.
``` json
db.pedidos.aggregate([
    {
        $group: {
            _id: "$cliente",
            valorTotalVendas: { $sum: "$valor_total" }
        }
    }
]);
```
> 2. Quais são os produtos mais vendidos? Crie um pipeline de agregação que calcule o total de unidades vendidas para cada produto e apresente os produtos em ordem decrescente de vendas.
``` json	
db.pedidos.aggregate([
    { $unwind: "$itens" },
    {
        $group: {
            _id: "$itens.produto",
            unidadesVendidas: { $sum: "$itens.quantidade" }
        }
    },
    { $sort: { unidadesVendidas: -1 } }
]);
```
> 3. Qual é o valor médio dos pedidos por mês? Crie um pipeline de agregação que agrupe os pedidos por mês e calcule o valor médio dos pedidos para cada mês.
``` json
db.pedidos.aggregate([
    {
        $group: {
            _id: { $month: "$data_pedido" },
            valorMedioPedidos: { $avg: "$valor_total" }
        }
    },
    { $sort: { _id: 1 } }
]);
```
> 4. Quais são os clientes que fizeram pedidos em mais de um mês? Crie um pipeline de agregação que identifique os clientes que fizeram pedidos em mais de um mês e apresente seus nomes.
``` json	
db.pedidos.aggregate([
    {
        $group: {
            _id: "$cliente",
            meses: { $addToSet: { $month: "$data_pedido" } }
        }
    },
    {
        $match: {
            meses: { $gt: { $size: 1 } }
        }
    },
    {
        $project: {
            _id: 1
        }
    }
]);
```	
> 5. Quantos pedidos foram feitos em cada dia da semana (segunda-feira, terça-feira, etc.)? Crie um pipeline de agregação que agrupe os pedidos por dia da semana e conte quantos pedidos foram feitos em cada dia.
``` json	
db.pedidos.aggregate([
    {
        $group: {
            _id: { $dayOfWeek: "$data_pedido" },
            totalPedidos: { $sum: 1 }
        }
    },
    { $sort: { _id: 1 } }
]);
```
> 6. Qual é a média de preço unitário por produto? Crie uma consulta de agregação que calcule a média do preço unitário para cada produto em todos os pedidos. Apresente o resultado em ordem decrescente de média de preço.
``` json	
db.pedidos.aggregate([
    { $unwind: "$itens" },
    {
        $group: {
            _id: "$itens.produto",
            mediaPrecoUnitario: { $avg: "$itens.preco_unitario" }
        }
    },
    { $sort: { mediaPrecoUnitario: -1 } }
]);
```	
> 7. Quais são os clientes que fizeram o pedido de maior valor? Crie uma consulta de agregação que identifique os clientes que fizeram o pedido de maior valor total e apresente seus nomes.
``` json
db.pedidos.aggregate([
    {
        $group: {
            _id: "$cliente",
            maxValorTotal: { $max: "$valor_total" }
        }
    },
    {
        $sort: { maxValorTotal: -1 }
    }
]);
```	
