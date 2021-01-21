create database bdEscola

use bdEscola

Create table tbAluno(
	codAluno int primary key identity (1,1) not null
,	nomeAluno varchar (50) not null
,	dataNascimentoAluno smalldatetime not null
,	rgAluno varchar (13) not null
,	naturalidadeAluno varchar (10)
)

Create table tbCurso(
	codCurso int primary key identity (1,1) not null
,	nomeCurso varchar (20) not null
,	cargaHorariaCurso int not null
,	valorCurso smallmoney not null
)

Create table tbTurma(
	codTurma int primary key identity (1,1) not null
,	nomeTurma varchar (20) not null
,	codCurso int foreign key references tbCurso (codCurso)
,	horarioTurma smalldatetime not null
)

Create table tbMatricula(
	codMatricula int primary key identity (1,1) not null
,	dataMatricula smalldatetime not null
,	codAluno int foreign key references tbAluno (codAluno)
,	codTurma int foreign Key references tbTurma (codTurma)
)