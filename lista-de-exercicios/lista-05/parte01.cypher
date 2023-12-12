CREATE (Uberaba:Cidade {nome: 'Uberaba'}),
       (Uberlandia:Cidade {nome: 'Uberlândia'}),
       (Monte_Carmelo:Cidade {nome: 'Monte Carmelo'}), // Escolas
       (IFTM_Uberaba:Escola {nome: 'IFTM'}),
       (IFTM_Uberlandia:Escola {nome: 'IFTM'}),
       (UFU_Uberlandia:Escola {nome: 'UFU'}),
       (UFU_Monte_Carmelo:Escola {nome: 'UFU'}), // Cursos
       (Sistemas_Internet:Curso {nome: 'Sistemas para Internet'}),
       (Licenciatura:Curso {nome: 'Licenciatura em Computação'}),
       (Ciencias_Computacao:Curso {nome: 'Ciências da Computação'}), // Alunos
       (Carlos:Aluno {nome: 'Carlos', idade: 26}),
       (Roberto:Aluno {nome: 'Roberto', idade: 30}),
       (Ana:Aluno {nome: 'Ana', idade: 25}),
       (Alan:Aluno {nome: 'Alan', idade: 20}), // Disciplinas
       (Seguranca:Disciplina {nome: 'Segurança da Internet', carga: 80}),
       (Sistemas_Operacionais:Disciplina {nome: 'Sistemas Operacionais', carga: 30}),
       (Banco_Dados:Disciplina {nome: 'Banco de Dados', carga: 86}),
       (Educacao:Disciplina {nome: 'Educação', carga: 20}), // Relacionamentos locação
       (IFTM_Uberaba)-[:Locada {Data: '04/08/2000'}]->(Uberaba),
       (IFTM_Uberlandia)-[:Locada {Data: '22/12/2003'}]->(Uberlandia),
       (UFU_Uberlandia)-[:Locada {Data: '04/01/1960'}]->(Uberlandia),
       (UFU_Monte_Carmelo)-[:Locada {Data: '04/01/1960'}]->(Monte_Carmelo), // Relacionamentos oferta
       (IFTM_Uberaba)-[:Oferta {Vagas: 50}]->(Sistemas_Internet),
       (IFTM_Uberlandia)-[:Oferta {Vagas: 30}]->(Sistemas_Internet),
       (IFTM_Uberlandia)-[:Oferta {Vagas: 30}]->(Licenciatura), (UFU_Uberlandia)-[:Oferta {Vagas: 250}]->(Licenciatura),
       (UFU_Monte_Carmelo)-[:Oferta {Vagas: 100}]->(Ciencias_Computacao), // Relacionamentos aplica
       (Sistemas_Internet)-[:Aplica {Semestre: 1}]->(Seguranca),
       (Sistemas_Internet)-[:Aplica {Semestre: 2}]->(Sistemas_Operacionais),
       (Sistemas_Internet)-[:Aplica {Semestre: 1}]->(Banco_Dados),
       (Licenciatura)-[:Aplica {Semestre: 2}]->(Sistemas_Operacionais),
       (Licenciatura)-[:Aplica {Semestre: 1}]->(Banco_Dados), (Licenciatura)-[:Aplica {Semestre: 2}]->(Educacao),
       (Ciencias_Computacao)-[:Aplica {Semestre: 2}]->(Sistemas_Operacionais),
       (Ciencias_Computacao)-[:Aplica {Semestre: 1}]->(Banco_Dados), // Relacionamentos matriculado
       (Carlos)-[:Matriculado {Inicio: 2020}]->(Sistemas_Internet),
       (Roberto)-[:Matriculado {Inicio: 2021}]->(Sistemas_Internet),
       (Ana)-[:Matriculado {Inicio: 2021}]->(Sistemas_Internet),
       (Alan)-[:Matriculado {Inicio: 2022}]->(Ciencias_Computacao), // Relacionamentos amigo
       (Roberto)-[:Amigo {Inicio: 2013}]->(Carlos), (Roberto)-[:Amigo {Inicio: 2012}]->(Ana),
       (Alan)-[:Amigo {Inicio: 2010}]->(Ana)
