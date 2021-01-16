use bdEscolaIdioma

-- Exercicio 1
CREATE VIEW precoBaixo as (
	SELECT codCurso, nomeCurso, cargaHoraria, valorCurso FROM tbCurso 
	WHERE valorCurso< (select AVG(valorCurso) from tbCurso)
) 

-- Exercicio 2
SELECT * FROM precoBaixo 
ORDER BY cargaHoraria

-- Exercicio 3
CREATE VIEW vwAlunosTurma as (
	SELECT nomeCurso, COUNT (tbAluno.codAluno) as 'QuantidadeAlunos' FROM tbAluno
	INNER JOIN tbMatricula ON
	tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma ON 
	tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso ON
	tbTurma.codCurso = tbcurso.codCurso
	GROUP BY nomeCurso
)
SELECT * FROM vwAlunosTurma

-- Exercicio 4
	SELECT nomeCurso, MAX([QuantidadeAlunos]) from vwAlunosTurma
	GROUP BY QuantidadeAlunos

-- Exercicio 5
CREATE VIEW vwTurmaCurso AS (
	SELECT nomeCurso, COUNT (tbTurma.codTurma) as 'quantidadeTurmas' FROM tbCurso
	INNER JOIN tbTurma ON
	tbTurma.codTurma = tbCurso.codCurso
	Group by nomeCurso
)
-- Exercicio 6
	SELECT nomeCurso, MIN([quantidadeTurmas]) from vwTurmaCurso
	GROUP BY nomeCurso