# Passo 6: Indexação e Otimização

`Comando:` db.stats();
```json
[
  {
    "avgObjSize": 126.26086956521739,
    "collections": 3,
    "dataSize": 2904,
    "db": "ToDoListDB",
    "fsTotalSize": 223898288128,
    "fsUsedSize": 53578399744,
    "indexSize": 110592,
    "indexes": 3,
    "objects": 23,
    "ok": 1,
    "scaleFactor": 1,
    "storageSize": 110592,
    "totalSize": 221184,
    "views": 0
  }
]
```

`Comando:` db.tasks.createIndex({ "creation_date": 1 })

`Comando:` db.tasks.createIndex({ "status": 1 })

`Comando:` db.stats();

```json
[
  {
    "avgObjSize": 126.26086956521739,
    "collections": 3,
    "dataSize": 2904,
    "db": "ToDoListDB",
    "fsTotalSize": 223898288128,
    "fsUsedSize": 53578526720,
    "indexSize": 151552,
    "indexes": 5,
    "objects": 23,
    "ok": 1,
    "scaleFactor": 1,
    "storageSize": 110592,
    "totalSize": 262144,
    "views": 0
  }
]
```