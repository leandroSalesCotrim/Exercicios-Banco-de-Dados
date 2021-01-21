use bdEscolaIdioma

-- EXERCICIO A

	SELECT nomeCurso as 'CURSO', valorCurso as 'VALOR' FROM tbCurso
	WHERE valorCurso < (SELECT AVG (valorCurso) FROM tbCurso)

-- EXERCICIO B

	SELECT nomeAluno as 'Nome', rgAluno as 'RG' FROM tbAluno
	WHERE dataNascimento = (SELECT MAX (dataNascimento) FROM tbAluno)

-- EXERCICIO C

	SELECT nomeAluno as 'Nome' FROM tbAluno
	WHERE dataNascimento = (SELECT MIN (dataNascimento) FROM tbAluno)

-- EXERCICIO D

	SELECT nomeCurso as 'CURSO', valorCurso as 'VALOR' FROM tbCurso
	WHERE valorCurso = (SELECT MAX (valorCurso) FROM tbCurso)

-- EXERCICIO E

	SELECT nomeAluno as 'NOME', nomeCurso as 'CURSO' FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
	WHERE dataMatricula = (SELECT MAX (dataMatricula) FROM tbMatricula)

-- EXERCICIO F

	SELECT nomeAluno as 'NOME' FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
	WHERE dataMatricula = (SELECT MIN (dataMatricula) FROM tbMatricula)

-- EXERCICIO G

	SELECT nomeAluno as 'NOME', rgAluno as 'RG', dataNascimento as 'DATA NASCIMENTO' FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
	WHERE nomeCurso = 'Inglês'