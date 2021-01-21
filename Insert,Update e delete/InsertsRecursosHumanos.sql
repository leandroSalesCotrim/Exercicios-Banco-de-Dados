use bdRecursosHumanos

Insert into tbDepartamento ( nomeDepartamento)

VALUES ( 'Compras')
      ,( 'Vendas')
	  ,('TI')
	  ,('Marketing')


Insert into tbFuncionario (nomeFuncionario, cpfFuncionario,sexoFuncionario, dataNascimentoFuncionario, salarioFuncionario, codDepartamento)

VALUES ('Maria Luisa Moura', '12345678900', 'F', '1990-02-10', '3400.00', 1)
	 , ('Mariana Goulart', '45678909299', 'F', '1991-04-08', '2800.00', 1)
	 , ('Pedro Paulo Vidigal', '65487222388', 'M', '1994-05-07', '5400.00', 2)
	 , ('Carlos Calixto', '83738232233', 'M', '1965-03-03', '8900.00', 2)
	 , ('Viviane Martins', '77832233399', 'F', '1976-06-06', '4300.00', 3)
	 , ('Analice Mendes', '83703383493', 'F', '1981-09-09', '6800.00', 3) 
	 , ('Patricia Ishikawa', '43356609300', 'F', '1978-05-05', '4900.00',4)

Insert into tbDependente (nomeDependente, sexoDependente, dataNascimento, codFuncionario)

VALUES ('Lucas Moura','M', '10-01-2015', 1)
	 , ('Carlos Calixto Jr', 'M', '08-06-2000',  4)
	 , ('Michele Costa Calixto', 'F', '09-09-2003',  4)
	 , ('Silvana Costa Calixto', 'F', '04-04-2006', 4)
	 , ('Arthur Mendes Silva', 'M','07-07-2010',6)



update  tbFuncionario
set nomeFuncionario = 'Maria Luisa dos Santos'
where codFuncionario = 1
select * from   tbFuncionario

update tbFuncionario
set salarioFuncionario = salarioFuncionario + (salarioFuncionario*12/100)
where salarioFuncionario <=5900
select * from tbFuncionario

delete from tbDependente
where codDependente= 11
select * from tbDependente