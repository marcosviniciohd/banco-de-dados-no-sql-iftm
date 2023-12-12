# Passo 1: Modelagem do Banco de dados em MongoDB

### Coleção 'projects'
```json
{
  "_id": ObjectId("ID_DO_PROJETO"),
  "title": "Título do Projeto",
  "description": "Descrição do Projeto",
  "start_date": ISODate("Data de Início do Projeto"),
  "tasks": [
    ObjectId("ID_DA_TAREFA_1"),
    ObjectId("ID_DA_TAREFA_2"),
    ...
  ]
}
```
### Coleção 'tasks'
```json
{
  "_id": ObjectId("ID_DA_TAREFA"),
  "title": "Título da Tarefa",
  "description": "Descrição da Tarefa",
  "creation_date": ISODate("Data de Criação da Tarefa"),
  "due_date": ISODate("Data de Vencimento da Tarefa"),
  "priority": "Alta",
  "status": "To-do",
  "assigned_to": ObjectId("ID_DO_USUÁRIO"),
  "related_task": ObjectId("ID_DA_TAREFA_RELACIONADA")
}
```

### Coleção 'users'
```json
{
  "_id": ObjectId("ID_DO_USUÁRIO"),
  "name": "Nome do Usuário",
  "email": "Email do Usuário",
  "tasks": [
    ObjectId("ID_DA_TAREFA_1"),
    ObjectId("ID_DA_TAREFA_2"),
    ...
  ]
}
```