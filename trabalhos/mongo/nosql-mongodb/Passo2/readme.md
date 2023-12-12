# Passo 2: Validação de Dados

## Schema de validação para `projects`
```json
{
  "$jsonSchema": {
    "bsonType": "object",
    "required": ["title", "start_date"],
    "properties": {
      "title": {
        "bsonType": "string",
        "description": "Título do projeto é obrigatório e deve ser uma string."
      },
      "start_date": {
        "bsonType": "date",
        "description": "Data de início do projeto é obrigatória e deve ser uma data."
      },
      "description": {
        "bsonType": "string",
        "description": "Descrição do projeto deve ser uma string, mas é opcional."
      },
      "tasks": {
        "bsonType": "array",
        "description": "Lista de IDs de tarefas relacionadas ao projeto."
      }
    }
  }
}   
```
## Schema de validação para `tasks`
```json
{
  "$jsonSchema": {
    "bsonType": "object",
    "required": ["title", "creation_date", "due_date", "priority", "status"],
    "properties": {
      "title": {
        "bsonType": "string",
        "description": "Título da tarefa é obrigatório e deve ser uma string."
      },
      "creation_date": {
        "bsonType": "date",
        "description": "Data de criação da tarefa é obrigatória e deve ser uma data."
      },
      "due_date": {
        "bsonType": "date",
        "description": "Data de vencimento da tarefa é obrigatória e deve ser uma data."
      },
      "priority": {
        "enum": ["Alta", "Média", "Baixa"],
        "description": "A prioridade da tarefa deve ser 'Alta', 'Média' ou 'Baixa'."
      },
      "status": {
        "enum": ["To-do", "In-Progress", "Complete"],
        "description": "O status da tarefa deve ser 'To-do', 'In-Progress' ou 'Complete'."
      },
      "assigned_to": {
        "bsonType": "objectId",
        "description": "ID do usuário atribuído à tarefa."
      },
      "related_task": {
        "bsonType": "objectId",
        "description": "ID de outra tarefa relacionada, se houver."
      }
    }
  }
}
```
## Schema de validação para `users`
```json
{
  "$jsonSchema": {
    "bsonType": "object",
    "required": ["name", "email"],
    "properties": {
      "name": {
        "bsonType": "string",
        "description": "Nome do usuário é obrigatório"
      },
      "email": {
        "bsonType": "string",
        "description": "Endereço de e-mail do usuário é obrigatório"
      },
      "tasks": {
        "bsonType": "array",
        "description": "Lista de IDs de tarefas relacionadas ao usuário."
      }
    }
  }
}
```