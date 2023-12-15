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
