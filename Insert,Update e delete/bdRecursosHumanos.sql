create database bdRecursosHumanos

use bdRecursosHumanos
Create table tbDepartamento (
  codDepartamento  int primary key identity (1,1) not null
, nomeDepartamento  VARCHAR(20) not null
)
Create table tbFuncionario(
  codFuncionario int primary key identity (1,7) not null
, nomeFuncionario VARCHAR (30)
, cpfFuncionario VARCHAR (15)
, sexoFuncionario VARCHAR (9)
, dataNascimentoFuncionario smalldatetime not null
, salarioFuncionario smallmoney
, codDepartamento int foreign key references tbDepartamento(codDepartamento)
)
Create table tbDependente(
  codDependente int primary key identity (1,5) not null
, nomeDependente varchar (30) not null
, sexoDependente varchar (9)
, dataNascimento smalldatetime not null
, codFuncionario int foreign key references tbFuncionario (codFuncionario)
)

 
)