//a. Busque todas as entidades e seus relacionamentos;
MATCH (cidade:Cidade)<-[locada:Locada]-(escola:Escola),
      (escola:Escola)-[oferta:Oferta]->(curso:Curso),
      (curso:Curso)-[aplica:Aplica]->(disciplina:Disciplina),
      (aluno:Aluno)-[matriculado:Matriculado]->(curso2:Curso),
      (aluno2:Aluno)-[amigo:Amigo]->(aluno3:Aluno)
RETURN cidade, locada, escola, oferta, curso, aplica, disciplina,
       matriculado, amigo, curso2, aluno2, aluno3

//b. Busque todas as cidades;
MATCH (cidade:Cidade)
RETURN cidade

//c. Busque todos os cursos;
MATCH (curso:Curso)
RETURN curso

//d. Busque todos os cursos e seus relacionamentos com as cidades;
MATCH (cidade:Cidade)<-[locada:Locada]-(escola:Escola),
      (escola:Escola)-[oferta:Oferta]->(curso:Curso)
RETURN cidade, locada, escola, oferta, curso

//e. Busque todos os cursos e seus relacionamentos com disciplinas e alunos;
MATCH (curso:Curso)-[aplica:Aplica]->(disciplina:Disciplina),
      (aluno:Aluno)-[matriculado:Matriculado]->(curso2:Curso)
RETURN curso, aplica, disciplina, matriculado, curso2, aluno

//f. Busque as escolas da cidade Uberlândia;
MATCH (cidade:Cidade)<-[locada:Locada]-(escola:Escola)
  WHERE cidade.nome = 'Uberlândia'
RETURN cidade, locada, escola

//g. Busque as escolas da cidade Monte Carmelo;
MATCH (cidade:Cidade)<-[locada:Locada]-(escola:Escola)
  WHERE cidade.nome = 'Monte Carmelo'
RETURN cidade, locada, escola

//h. Busque os cursos da escola IFTM da cidade Uberlândia;
MATCH (cidade:Cidade)<-[locada:Locada]-(escola:Escola),
      (escola:Escola)-[oferta:Oferta]->(curso:Curso)
  WHERE cidade.nome = 'Uberlândia' AND escola.nome = 'IFTM'
RETURN cidade, locada, escola, oferta, curso

//i. Busque em quais cidades há o curso Sistemas para Internet;
MATCH (cidade:Cidade)<-[locada:Locada]-(escola:Escola),
      (escola:Escola)-[oferta:Oferta]->(curso:Curso)
  WHERE curso.nome = 'Sistemas para Internet'
RETURN cidade, locada, escola, oferta, curso

//j. Busque quais escolas há o curso Licenciatura em Computação;
MATCH (cidade:Cidade)<-[locada:Locada]-(escola:Escola),
      (escola:Escola)-[oferta:Oferta]->(curso:Curso)
  WHERE curso.nome = 'Licenciatura em Computação'
RETURN cidade, locada, escola, oferta, curso

//k. Busque os cursos da escola IFTM da cidade Uberlândia;
MATCH (cidade:Cidade)<-[locada:Locada]-(escola:Escola),
      (escola:Escola)-[oferta:Oferta]->(curso:Curso)
  WHERE cidade.nome = 'Uberlândia' AND escola.nome = 'IFTM'
RETURN cidade, locada, escola, oferta, curso

//l. Busque os cursos que aplicam a disciplina Sistemas Operacionais;
MATCH (curso:Curso)-[aplica:Aplica]->(disciplina:Disciplina)
  WHERE disciplina.nome = 'Sistemas Operacionais'
RETURN curso, aplica, disciplina

//m. Busque os alunos que estão matriculados no curso Sistemas para Internet;
MATCH (aluno:Aluno)-[matriculado:Matriculado]->(curso:Curso)
  WHERE curso.nome = 'Sistemas para Internet'
RETURN aluno, matriculado, curso

//n. Busque as disciplinas do aluno Carlos;
MATCH (aluno:Aluno)-[matriculado:Matriculado]->(curso:Curso),
      (curso:Curso)-[aplica:Aplica]->(disciplina:Disciplina)
  WHERE aluno.nome = 'Carlos'
RETURN aluno, matriculado, curso, aplica, disciplina

//o. Busque o amigo do amigo do aluno Carlos;
MATCH (aluno:Aluno)<-[amigo:Amigo]->(aluno2:Aluno),
      (aluno2:Aluno)<-[amigo2:Amigo]->(aluno3:Aluno)
  WHERE aluno.nome = 'Carlos'
RETURN aluno, amigo, aluno2, amigo2, aluno3

//p. Busque o amigo do amigo do amigo do aluno Alan;
MATCH (aluno:Aluno)<-[amigo:Amigo]->(aluno2:Aluno),
      (aluno2:Aluno)<-[amigo2:Amigo]->(aluno3:Aluno),
      (aluno3:Aluno)<-[amigo3:Amigo]->(aluno4:Aluno)
  WHERE aluno.nome = 'Alan'
RETURN aluno, amigo, aluno2, amigo2, aluno3, amigo3, aluno4

//q. Busque os amigos do aluno Roberto;
MATCH (aluno:Aluno)<-[amigo:Amigo]->(aluno2:Aluno)
  WHERE aluno.nome = 'Roberto'
RETURN aluno, amigo, aluno2
