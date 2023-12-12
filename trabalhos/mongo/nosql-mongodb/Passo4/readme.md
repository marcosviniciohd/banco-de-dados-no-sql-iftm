# Passo 4: Operações de CR

## Inserindo documentos
```json
db.projects.insertOne({
  "title": "Projeto 1",
  "start_date": ISODate("2023-01-15T08:00:00Z"),
  "description": "Descrição do Projeto 1",
  "tasks": [
       ObjectId("6533e6ef1e136d22815fb0b0"),
       ObjectId("6533e70c1e136d22815fb0b2"),
       ObjectId("6533e7271e136d22815fb0b4"),
  ]
})
```
```json
db.projects.insertOne({
  "title": "Projeto 2",
  "start_date": ISODate("2023-02-20T10:00:00Z"),
  "description": "Descrição do Projeto 2",
  "tasks": [
       ObjectId("6533e72a1e136d22815fb0b6"),
       ObjectId("6533e72c1e136d22815fb0b8"),
  ]
})
```
```json
db.projects.insertOne({
  "title": "Projeto 3",
  "start_date": ISODate("2023-03-10T09:30:00Z"),
  "description": "Descrição do Projeto 3",
  "tasks": [
    ObjectId("6533e7521e136d22815fb0ba")
  ]
})
```jon
```json
db.projects.insertOne({
  "title": "Projeto 4",
  "start_date": ISODate("2023-04-05T14:00:00Z"),
  "description": "Descrição do Projeto 4",
  "tasks": [
    ObjectId("6533e7621e136d22815fb0bc")
  ]
})
```
```json
db.projects.insertOne({
  "title": "Projeto 5",
  "start_date": ISODate("2023-05-20T08:30:00Z"),
  "description": "Descrição do Projeto 5",
  "tasks": []
})
```
```json
db.tasks.insertOne({
  "title": "Tarefa 1",
  "creation_date": ISODate("2023-01-15T10:00:00Z"),
  "due_date": ISODate("2023-01-31T17:00:00Z"),
  "priority": "Alta",
  "status": "To-do",
  "assigned_to": ObjectId("6533cad31e136d22815fb088"),
  "related_task":  ObjectId("6533e70c1e136d22815fb0b2")
})
```
```json
db.tasks.insertOne({
  "title": "Tarefa 2",
  "creation_date": ISODate("2023-02-10T14:30:00Z"),
  "due_date": ISODate("2023-02-28T12:00:00Z"),
  "priority": "Média",
  "status": "In-Progress",
  "assigned_to": ObjectId("6533cad31e136d22815fb088")
})
```
```json
db.tasks.insertOne({
  "title": "Tarefa 3",
  "creation_date": ISODate("2023-03-05T09:00:00Z"),
  "due_date": ISODate("2023-03-20T15:30:00Z"),
  "priority": "Baixa",
  "status": "To-do",
  "assigned_to": ObjectId("6533cad31e136d22815fb088")
})
```
```json
db.tasks.insertOne({
  "title": "Tarefa 4",
  "creation_date": ISODate("2023-04-15T12:45:00Z"),
  "due_date": ISODate("2023-04-30T18:00:00Z"),
  "priority": "Alta",
  "status": "To-do",
  "assigned_to": ObjectId("6533cad31e136d22815fb088"),
  "related_task": ObjectId("6533e72a1e136d22815fb0b6")
})
```
```json
db.tasks.insertOne({
  "title": "Tarefa 5",
  "creation_date": ISODate("2023-05-10T10:45:00Z"),
  "due_date": ISODate("2023-05-25T16:00:00Z"),
  "priority": "Média",
  "status": "In-Progress",
  "assigned_to": ObjectId("6533cad31e136d22815fb088"),
  "related_task": ObjectId("6533e72a1e136d22815fb0b6")
})
```
```json
db.users.insertOne({
  "name": "Usuário 1",
  "email": "usuario1@email.com",
  "tasks": []
})
```
```json
db.users.insertOne({
  "name": "Usuário 2",
  "email": "usuario2@email.com",
  "tasks": []
})
```

```json
db.users.insertOne({
  "name": "Usuário 3",
  "email": "usuario3@email.com",
  "tasks": []
})
```

```json
db.users.insertOne({
  "name": "Usuário 4",
  "email": "usuario4@email.com",
  "tasks": []
})
```

```json
db.users.insertOne({
  "name": "Usuário 5",
  "email": "usuario5@email.com",
  "tasks": []
})
```

## QUERIES DE BUSCA
```json
db.projects.find({})
```

```json
db.projects.find({ "title": "Projeto 1" })
```

```json
db.projects.find({ "description": /palavra-chave/i })
```

```json
db.tasks.find({})
```

```json
db.tasks.find({ "project_id": ObjectId("ID_DO_PROJETO") })
```


```json
db.tasks.find({ "assigned_to": ObjectId("ID_DO_USUÁRIO") })
```

```json
db.tasks.find({ "status": "To-do" })
```

```json
db.tasks.find({ "due_date": { $lt: new Date() } })
```

```json
db.users.find({})
```

```json
db.users.find({ "name": "Usuário 1" })
```

```json
db.users.find({ "email": "usuario1@email.com" })
```

```json
db.tasks.find({ "assigned_to": ObjectId("ID_DO_USUÁRIO"), "status": "Complete" })
```


```json
db.tasks.find({ "assigned_to": ObjectId("ID_DO_USUÁRIO"), "status": "Complete" })
```

```json
db.tasks.find({ "priority": "Alta", "due_date": { $lt: new Date() }, "status": { $ne: "Complete" } })
```

```json
db.projects.find({
  "tasks": {
    $elemMatch: { "due_date": { $lt: new Date() }, "status": { $ne: "Complete" } }
  }
})
```

```json
db.tasks.find({ "related_task": ObjectId("ID_DA_TAREFA_RELACIONADA") })
```