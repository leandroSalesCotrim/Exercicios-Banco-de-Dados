Use bdEscola

Insert Into tbAluno (nomeAluno, dataNascimentoAluno, rgAluno, naturalidadeAluno)
VALUES ('Paulo Santos', '03-10-2000', '82.282.122-0', 'SP')
	,  ('Maria da Glória', '10-03-1999', '45.233.123-0', 'SP')
	,  ('Pedro Nogueira da Silva', '04-04-1998', '23.533.211-9', 'SP')
	,  ('Gilson Barros Silva', '09-09-1995', '34.221.111-x', 'PE')
	,  ('Mariana Barbosa Santos', '10-10-2001', '54.222.122-9', 'RJ')
	,  ('Alessandro Pereira', '10-11-2003', '24.402.454-9', 'ES')
	,  ('Aline Melo', '10-08-2001', '88.365.012-3', 'RJ')

Insert Into tbCurso (nomeCurso, cargaHorariaCurso, valorCurso)
VALUES ('Inglês', 2000, '356.00')
	,  ('Alemão', 3000, '478.00')
	,  ('Espanhol', 4000, '500.00')


Insert Into tbTurma (nomeTurma, codCurso, horarioTurma)
VALUES ('1|A', 1, '1900-01-01 12:00:00')
	,  ('1|C', 3, '1900-01-01 18:00:00')
	,  ('1|B', 1, '1900-01-01 18:00:00')
	,  ('1AA', 2, '1900-01-01 19:00:00')

Insert Into tbMatricula (dataMatricula, codAluno, codTurma)
VALUES ('10-03-2015', 1, 1)
	,  ('05-04-2014', 2, 1)
	,  ('05-04-2014', 2, 4)
	,  ('05-03-2012', 3, 2)
	,  ('03-03-2016', 1, 3)
	,  ('05-07-2015', 4, 2)
	,  ('07-05-2015', 4, 3)

	
/*EXERCICIO 01*/
select nomeAluno as Nome, tbCurso.nomeCurso as Curso from
tbAluno inner join tbMatricula on
(tbAluno.codAluno = tbMatricula.codAluno)
inner join tbTurma on (tbMatricula.codTurma = tbTurma.codTurma)
inner join tbCurso on (tbTurma.codCurso = tbCurso.codCurso)

/*EXERCICIO 02*/
select count (codAluno) as 'N° de alunos', nomeCurso as 'Curso' from tbMatricula
inner join tbTurma on (tbMatricula.codTurma = tbTurma.codTurma)
inner join tbCurso on (tbTurma.codCurso = tbCurso.codCurso)
group by nomeCurso

/*EXERCICIO 03*/
select count (codAluno) as 'N° de alunos', nomeTurma as 'Turma' from
tbMatricula inner join tbTurma on 
(tbMatricula.codTurma = tbTurma.codTurma)
group by nomeTurma

/*EXERCICIO 04*/
select count (codAluno) as 'N° de alunos', dataMatricula as 'Data Matricula' from
tbMatricula
where DATEPART (YEAR, dataMatricula) = 2016
group by dataMatricula

/*EXERCICIO 05*/
select nomeAluno as Aluno, tbTurma.nomeTurma as Turma from
tbAluno inner join tbMatricula on
(tbAluno.codAluno = tbMatricula.codAluno)
inner join tbTurma on (tbMatricula.codTurma = tbTurma.codTurma)
order by nomeAluno asc

/*EXERCICIO 06*/
select tbCurso.nomeCurso as 'Curso', horarioTurma as 'Horarios'
from tbTurma inner join tbCurso on 
(tbTurma.codTurma = tbCurso.codCurso)

/*EXERCICIO 07*/
select count (codAluno) as 'N° de alunos', naturalidadeAluno as 'Naturalidade' from
tbAluno
group by naturalidadeAluno

/*EXERCICIO 08*/
select  nomeAluno as Nome_do_Aluno ,CONVERT(char , dataMatricula, 103) as data_da_Matricula   from
tbAluno  inner join tbMatricula on 
(tbAluno.codAluno = tbMatricula.codAluno)

/*EXERCICIO 09*/
select nomeAluno as 'Alunos', tbCurso.nomeCurso as 'Curso' from
tbAluno inner join tbMatricula on
(tbAluno.codAluno = tbMatricula.codAluno)
inner join tbTurma on (tbMatricula.codMatricula = tbTurma.codCurso)
inner join tbCurso on (tbTurma.codCurso = tbCurso.codCurso)
Where nomeAluno like '%A' and nomeCurso like '%Inglês'
 

/*EXERCICIO 10*/
select count (codMatricula) as 'N° de Matriculas', dataMatricula as 'Data da Matricula' from
tbMatricula
where DATEPART (YEAR, dataMatricula) = 2016
group by dataMatricula





	--Exercicios anteriores--
	/*
	use bdEscola
	SELECT nomeAluno as Nome, rgAluno as RG, dataNascimentoAluno as Nascimento
	from bdEscola.dbo.tbAluno
	WHERE  naturalidadeAluno like 'SP'

	SELECT nomeAluno as Nome, rgAluno as RG
	from bdEscola.dbo.tbAluno
	WHERE  nomeAluno like 'P%'

	SELECT nomeCurso as Curso
	from bdEscola.dbo.tbCurso
	WHERE  cargaHorariaCurso >2000

	SELECT nomeAluno as Nome, rgAluno as RG
	from bdEscola.dbo.tbAluno
	WHERE  nomeAluno like '%Silva%'

	SELECT nomeAluno, dataNascimentoAluno 
	from bdEscola.dbo.tbAluno
	WHERE DATEPART(month, dataNascimentoAluno) = 03

	SELECT codAluno as 'Código do Aluno',dataMatricula as 'Data da Matricula'
	from bdEscola.dbo.tbMatricula
	WHERE DATEPART (MONTH, dataMatricula) = 5


	SELECT codAluno as 'Código do Aluno'
	from bdEscola.dbo.tbMatricula
	WHERE codTurma <3

	SELECT codAluno as 'Código do Aluno'
	from bdEscola.dbo.tbMatricula
	WHERE codTurma >2

	SELECT  nomeAluno as 'nome', dataNascimentoAluno as 'Data de Nascimento', rgAluno as 'RG', naturalidadeAluno as 'Naturalidade'
	from bdEscola.dbo.tbAluno

	SELECT nomeTurma as Turma, codCurso as Curso, horarioTurma as Horario
	from bdEscola.dbo.tbTurma

	SELECT nomeAluno as Nome, rgAluno as RG
	from bdEscola.dbo.tbAluno
	WHERE  nomeAluno like 'A%'

	SELECT nomeAluno as 'nome'
	from bdEscola.dbo.tbAluno
	WHERE DATEPART(YEAR, dataNascimentoAluno) between 1990 AND 1999

	SELECT nomeAluno as 'Nome'
	from bdEscola.dbo.tbAluno
	WHERE  naturalidadeAluno NOT like 'SP'

	SELECT codAluno as 'Nome'
	from bdEscola.dbo.tbMatricula
	WHERE  codTurma NOT like '1'

	SELECT codTurma as 'codigo da turma'
	from bdEscola.dbo.tbTurma
	WHERE horarioTurma > '17:59'



	


