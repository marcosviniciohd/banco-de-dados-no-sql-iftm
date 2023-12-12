# Passo 5: Operações de Update

```json
db.tasks.update(
  { "title": "Tarefa 1" },  // Critério de seleção da tarefa
  { $set: { "assigned_to": ObjectId("ID_DO_NOVO_USUÁRIO") } }
)

```

```json
db.tasks.update(
  { "title": "Tarefa 2" },  // Critério de seleção da tarefa
  { $set: { "due_date": ISODate("2023-03-10T18:00:00Z") } }
)

```

```json
db.tasks.update(
  { "title": "Tarefa 3", "status": "In-Progress" },  // Critério de seleção da tarefa em progresso
  { $set: { "status": "Complete" } }
)

```

```json
db.tasks.update(
  { "title": "Tarefa 4" },  // Critério de seleção da tarefa
  { $set: { "related_task": ObjectId("ID_DA_TAREFA_RELACIONADA") } }
)

```

```json
db.tasks.update(
  { "title": "Tarefa 5" },  // Critério de seleção da tarefa
  { $set: { "description": "Nova descrição da Tarefa 5" } }
)

```