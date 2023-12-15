# Passo 1 - Modelagem do Banco de Dados:
Diagrama da estrutura do banco de dados em grafos:
(https://github.com/marcosviniciohd/banco-de-dados-no-sql-iftm/blob/main/trabalhos/neo4j/diagrama/instagram.drawio.png)

# Passo 2 - Requisitos Mínimos da Estrutura do Banco de Dados:
Nós:
1. Usuário: 
   - Atributos: ID do usuário, nome, nome de usuário, bio, site, número de seguidores, número de seguindo, número de postagens

2. Postagem: 
   - Atributos: ID da postagem, ID do usuário, legenda, localização, data e hora da postagem, número de curtidas, número de comentários

3. Comentário: 
   - Atributos: ID do comentário, ID da postagem, ID do usuário, texto do comentário, data e hora do comentário

4. Hashtag: 
   - Atributos: nome da hashtag, número de postagens

Relacionamentos:
1. SEGUE: 
   - Atributos: data de início do seguimento
   - Descrição: Um usuário segue outro usuário

2. POSTOU: 
   - Atributos: data da postagem
   - Descrição: Um usuário postou uma postagem

3. CURTIU: 
   - Atributos: data da curtida
   - Descrição: Um usuário curtiu uma postagem

4. COMENTOU: 
   - Atributos: data do comentário
   - Descrição: Um usuário comentou em uma postagem

5. MARCADO_EM: 
   - Atributos: data da marcação
   - Descrição: Uma postagem foi marcada com uma hashtag

# Passo 3 - Implementação do Banco de Dados:
> Definir uma restrição de unicidade para o ID do usuário
CREATE CONSTRAINT UniqueUserIdConstraint FOR (u:Usuario) REQUIRE u.id IS UNIQUE;

> Definir uma restrição de unicidade para o ID da postagem
CREATE CONSTRAINT UniquePostIdConstraint FOR (p:Postagem) REQUIRE p.id IS UNIQUE;

> Definir uma restrição de unicidade para o ID do comentário
CREATE CONSTRAINT UniqueCommentIdConstraint FOR (c:Comentario) REQUIRE c.id IS UNIQUE;

> Definir uma restrição de unicidade para o nome da hashtag
CREATE CONSTRAINT UniqueHashtagNameConstraint FOR (h:Hashtag) REQUIRE h.nome IS UNIQUE;

# Passo 4 - Inserir do Banco de Dados:
> Criar um nó de Usuário
CREATE (u:Usuario {id: '123', nome: 'Nome do Usuário', nome_de_usuario: 'username', bio: 'Bio do Usuário', site: 'www.site.com', numero_de_seguidores: 100, numero_de_seguindo: 50, numero_de_postagens: 20})

> Criar um nó de Postagem
CREATE (p:Postagem {id: '456', id_do_usuario: '123', legenda: 'Legenda da Postagem', localizacao: 'Localização da Postagem', data_e_hora_da_postagem: datetime(), numero_de_curtidas: 100, numero_de_comentarios: 50})

> Criar um nó de Comentário
CREATE (c:Comentario {id: '789', id_da_postagem: '456', id_do_usuario: '123', texto_do_comentario: 'Texto do Comentário', data_e_hora_do_comentario: datetime()})

> Criar um nó de Hashtag
CREATE (h:Hashtag {nome: 'hashtag', numero_de_postagens: 1000})

> Criar um relacionamento SEGUE entre dois usuários
MATCH (a:Usuario {id: '123'}), (b:Usuario {id: '456'})
CREATE (a)-[:SEGUE {data_de_inicio_do_seguimento: date()}]->(b)

> Criar um relacionamento POSTOU entre um usuário e uma postagem
MATCH (u:Usuario {id: '123'}), (p:Postagem {id: '456'})
CREATE (u)-[:POSTOU {data_da_postagem: date()}]->(p)

> Criar um relacionamento CURTIU entre um usuário e uma postagem
MATCH (u:Usuario {id: '123'}), (p:Postagem {id: '456'})
CREATE (u)-[:CURTIU {data_da_curtida: date()}]->(p)

> Criar um relacionamento COMENTOU entre um usuário e uma postagem
MATCH (u:Usuario {id: '123'}), (p:Postagem {id: '456'})
CREATE (u)-[:COMENTOU {data_do_comentario: date()}]->(p)

> Criar um relacionamento MARCADO_EM entre uma postagem e uma hashtag
MATCH (p:Postagem {id: '456'}), (h:Hashtag {nome: 'hashtag'})
CREATE (p)-[:MARCADO_EM {data_da_marcacao: date()}]->(h)

> Criar um segundo nó de Usuário
CREATE (u2:Usuario {id: '124', nome: 'Nome do Usuário 2', nome_de_usuario: 'username2', bio: 'Bio do Usuário 2', site: 'www.site2.com', numero_de_seguidores: 200, numero_de_seguindo: 100, numero_de_postagens: 40})

> Criar um segundo nó de Postagem
CREATE (p2:Postagem {id: '457', id_do_usuario: '124', legenda: 'Legenda da Postagem 2', localizacao: 'Localização da Postagem 2', data_e_hora_da_postagem: datetime(), numero_de_curtidas: 200, numero_de_comentarios: 100})

> Criar um segundo nó de Comentário
CREATE (c2:Comentario {id: '790', id_da_postagem: '457', id_do_usuario: '124', texto_do_comentario: 'Texto do Comentário 2', data_e_hora_do_comentario: datetime()})

> Criar um segundo nó de Hashtag
CREATE (h2:Hashtag {nome: 'hashtag2', numero_de_postagens: 2000})

> Criar um segundo relacionamento SEGUE entre dois usuários
MATCH (a2:Usuario {id: '124'}), (b2:Usuario {id: '123'})
CREATE (a2)-[:SEGUE {data_de_inicio_do_seguimento: date()}]->(b2)

> Criar um segundo relacionamento POSTOU entre um usuário e uma postagem
MATCH (u2:Usuario {id: '124'}), (p2:Postagem {id: '457'})
CREATE (u2)-[:POSTOU {data_da_postagem: date()}]->(p2)

> Criar um segundo relacionamento CURTIU entre um usuário e uma postagem
MATCH (u2:Usuario {id: '124'}), (p2:Postagem {id: '457'})
CREATE (u2)-[:CURTIU {data_da_curtida: date()}]->(p2)

> Criar um segundo relacionamento COMENTOU entre um usuário e uma postagem
MATCH (u2:Usuario {id: '124'}), (p2:Postagem {id: '457'})
CREATE (u2)-[:COMENTOU {data_do_comentario: date()}]->(p2)

> Criar um segundo relacionamento MARCADO_EM entre uma postagem e uma hashtag
MATCH (p2:Postagem {id: '457'}), (h2:Hashtag {nome: 'hashtag2'})
CREATE (p2)-[:MARCADO_EM {data_da_marcacao: date()}]->(h2)

# Passo 5 - Queries de busca:
> 1. Buscar um usuário pelo nome de usuário
MATCH (u:Usuario {nome_de_usuario: 'username'}) RETURN u
```json	
{
  "identity": 0,
  "labels": [
    "Usuario"
  ],
  "properties": {
    "site": "www.site.com",
    "numero_de_seguidores": 100,
    "nome_de_usuario": "username",
    "numero_de_postagens": 20,
    "bio": "Bio do Usuário",
    "nome": "Nome do Usuário",
    "id": "123",
    "numero_de_seguindo": 50
  },
  "elementId": "0"
}
```

> 2. Buscar todas as postagens de um usuário
MATCH (u:Usuario {id: '123'})-[:POSTOU]->(p:Postagem) RETURN p
```json
{
  "identity": 1,
  "labels": [
    "Postagem"
  ],
  "properties": {
    "numero_de_curtidas": 100,
    "legenda": "Legenda da Postagem",
    "localizacao": "Localização da Postagem",
    "id": "456",
    "data_e_hora_da_postagem": "2023-12-15T20:29:47.114000000Z",
    "numero_de_comentarios": 50,
    "id_do_usuario": "123"
  },
  "elementId": "1"
}
```

> 3. Buscar todos os comentários de uma postagem
MATCH (p:Postagem {id: '456'})<-[:COMENTOU]-(c:Comentario) RETURN c

> 4. Buscar todas as hashtags de uma postagem
MATCH (p:Postagem {id: '456'})-[:MARCADO_EM]->(h:Hashtag) RETURN h
```json
{
  "identity": 3,
  "labels": [
    "Hashtag"
  ],
  "properties": {
    "numero_de_postagens": 1000,
    "nome": "hashtag"
  },
  "elementId": "3"
}
```	
> 5. Buscar todos os usuários que um usuário está seguindo
MATCH (u:Usuario {id: '123'})-[:SEGUE]->(u2:Usuario) RETURN u2

> 6. Buscar todas as postagens que um usuário curtiu
MATCH (u:Usuario {id: '123'})-[:CURTIU]->(p:Postagem) RETURN p
```json
{
  "identity": 1,
  "labels": [
    "Postagem"
  ],
  "properties": {
    "numero_de_curtidas": 100,
    "legenda": "Legenda da Postagem",
    "localizacao": "Localização da Postagem",
    "id": "456",
    "data_e_hora_da_postagem": "2023-12-15T20:29:47.114000000Z",
    "numero_de_comentarios": 50,
    "id_do_usuario": "123"
  },
  "elementId": "1"
}
```
> 7. Buscar todos os comentários feitos por um usuário
MATCH (u:Usuario {id: '123'})-[:COMENTOU]->(c:Comentario) RETURN c

> 8. Buscar todas as postagens em que uma hashtag foi marcada
MATCH (h:Hashtag {nome: 'hashtag'})<-[:MARCADO_EM]-(p:Postagem) RETURN p
```json
{
  "identity": 1,
  "labels": [
    "Postagem"
  ],
  "properties": {
    "numero_de_curtidas": 100,
    "legenda": "Legenda da Postagem",
    "localizacao": "Localização da Postagem",
    "id": "456",
    "data_e_hora_da_postagem": "2023-12-15T20:29:47.114000000Z",
    "numero_de_comentarios": 50,
    "id_do_usuario": "123"
  },
  "elementId": "1"
}
```	

> 9. Buscar todos os usuários que seguem um usuário específico
MATCH (u:Usuario {id: '123'})<-[:SEGUE]-(u2:Usuario) RETURN u2
```json
{
  "identity": 4,
  "labels": [
    "Usuario"
  ],
  "properties": {
    "site": "www.site2.com",
    "numero_de_seguidores": 200,
    "nome_de_usuario": "username2",
    "numero_de_postagens": 40,
    "bio": "Bio do Usuário 2",
    "nome": "Nome do Usuário 2",
    "id": "124",
    "numero_de_seguindo": 100
  },
  "elementId": "4"
}
```	

> 10. Buscar todas as postagens que um usuário comentou
MATCH (u:Usuario {id: '123'})-[:COMENTOU]->(p:Postagem) RETURN p
```json
{
  "identity": 1,
  "labels": [
    "Postagem"
  ],
  "properties": {
    "numero_de_curtidas": 100,
    "legenda": "Legenda da Postagem",
    "localizacao": "Localização da Postagem",
    "id": "456",
    "data_e_hora_da_postagem": "2023-12-15T20:29:47.114000000Z",
    "numero_de_comentarios": 50,
    "id_do_usuario": "123"
  },
  "elementId": "1"
}
```	

