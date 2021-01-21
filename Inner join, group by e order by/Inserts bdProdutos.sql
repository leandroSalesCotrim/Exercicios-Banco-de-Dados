use bdProdutos

insert into tbCliente (nomeCliente, dataNascimentoCliente, emailCliente, sexoCliente ,cpfCliente)
values ('Amando José Santana','1961-02-21','amandojsantana@outlook.com','m', '12345678900')
	,('Sheila Carvalho Leal','13-09-1978','scarvalho@ig.com.br','f', '45678909823')
	,('Carlos Henrique Souza','08-09-1981','chenrique@ig.com.br','m', '7659827899')
	,('Maria Aparecida Souza','07-07-1962','mapdasouza@outlook.com','f', '87365309899')
	,('Adriana Nogueira Silva','09-04-1977','drica1977@ig.com.br','f', '76354309388')
	,('Paulo Henrique Silva','02-02-1987','phsilva@hotmail.com','m', '87390123111')
insert into tbFabricante ( nomeFabricante)
values ('Unilever')
	,('P&G')
	,('Bunge')
insert into tbFornecedor ( contatoFornecedor,	nomeFornecedor)
values ('Carlos Santos','Atacadão')
	,('Maria Stella','Assai')
	,('Paulo césar','Roldão')
insert into tbVenda (codCliente,dataVenda,valorTotalVenda)
values ('1','01/02/2014','4500.00')
	,('1','03/02/2014','3400.00')
	,('2','10/02/2014','2100.00')
	,('3','15/02/2014','2700.00')
	,('3','17/03/2014','560.00')
	,('4','09/04/2014','1200.00')
	,('5','07/05/2014','3500.00')
	,('1','07/05/2014','3400.00')
	,('2','05/05/2014','4000.00')
insert into tbProduto (codFabricante,codFornecedor, descricaoProduto, quantidadeProduto, valorProduto )
values ('2','1','Amaciante Downy','1500','5.76')
	,('1','1','Amaciante Comfort','2300','5.45')
	,('1','2','Sabão em pó OMO','1280','5.99')
	,('3','1','Margarina Qually','2500','4.76')
	,('3','2','Salsicha Hot Dog Sadia','2900','6.78')
	,('3','3','Mortadela Perdigão','1200','2.50')
	,('3','1','Hamburguer Sadia','1600','9.89')
	,('2','3','Fralda Pampers','340','36.00')
	,('1','2','Xampu Seda','800','5.89')
	,('1','3','Condicionador Seda','700','6.50')
insert into tbItensVenda (codProduto,codVenda,quantidadeItensVenda, subTotalItensVenda)
values ('1','1','200','1500.00')
	,('2','1','300','3000.00')
	,('4','2','120','1400.00')
	,('2','2','200','1000.00')
	,('3','2','130','1000.00')
	,('5','3','200','2100.00')
	,('4','4','120','1000.00')
	,('5','4','450','700.00')
	,('5','5','200','560.00')
	,('7','6','200','600.00')
	,('6','6','300','600.00')
	,('1','8','300','2500.00')
	,('2','8','200','1000.00')
	,('6','9','250','1700.00')
	,('5','9','200','1700.00')
	,('4','9','1000','4000.00')

	--Exercicios Inner Join
select descricaoProduto as 'Produto', nomeFabricante as 'Fabricante' from
	tbProduto inner Join tbFabricante on
	(tbProduto.codFabricante=tbFabricante.codFabricante)

select descricaoProduto as 'Produto', nomeFornecedor as 'Fornecedor' from
	tbProduto inner Join tbFornecedor on
	(tbProduto.codFabricante=tbFornecedor.codFornecedor)

select valorProduto as 'Preço Produto', nomeFabricante as 'Fabricante' from
	tbProduto inner Join tbFabricante on
	(tbProduto.codFabricante=tbFabricante.codFabricante)

select codVenda as 'N° de Vendas', nomeCliente as 'Cliente' from tbVenda
	   inner Join tbCliente on
	   (tbVenda.codCliente = tbCliente.codCliente)
	 
select nomeCliente as 'Cliente', tbVenda.codVenda as 'N° Venda', descricaoProduto as'Produto' from tbCliente
inner Join tbVenda on (tbCliente.codCliente = tbVenda.codCliente)
inner Join tbItensVenda on (tbVenda.codVenda = tbItensVenda.codVenda)
inner Join tbProduto on (tbItensVenda.codProduto = tbProduto.codProduto)

	--Exercicios Group by e order By
select sum (quantidadeProduto) as 'Quantidade Produtos' ,nomeFabricante as 'Fabricante' from
	tbProduto inner join tbFabricante on
	(tbProduto.codFabricante=tbFabricante.codFabricante)
group by nomeFabricante

select avg(valorProduto) as 'Preço Medio' ,nomeFornecedor as Fornecedor  from 
	tbProduto inner join tbFornecedor on
	(tbProduto.codFabricante=tbFornecedor.codFornecedor)
group by nomeFornecedor

select sum(valorTotalVenda) as 'Preço Total' ,nomeCliente as Cliente  from 
	tbVenda inner join tbCliente on
	(tbVenda.codVenda=tbCliente.codCliente)
group by nomeCliente
order by nomeCliente asc

select sum (valorProduto) as 'Preço Produtos' ,nomeFabricante as 'Fabricante' from
	tbProduto inner join tbFabricante on
	(tbProduto.codFabricante=tbFabricante.codFabricante)
group by nomeFabricante

select avg(valorProduto) as 'Preço Medio' ,nomeFornecedor as Fornecedor  from 
	tbProduto inner join tbFornecedor on
	(tbProduto.codFabricante=tbFornecedor.codFornecedor)
group by nomeFornecedor

select sum (subTotalItensVenda) as 'Vendas' ,descricaoProduto as 'Produtos' from
	tbItensVenda inner join tbProduto on
	(tbItensVenda.codProduto = tbProduto.codProduto)
group by descricaoProduto

select sum(valorTotalVenda) as 'Preço Total' ,nomeCliente as Cliente  from 
	 tbVenda inner join tbCliente on
	(tbVenda.codVenda=tbCliente.codCliente)
	where DATEPART (MONTH, dataVenda) = 02
group by nomeCliente






/*EXERCICIOS CORRIGIDOS PARA SERVIR DE EXEMPLOS
select *from tbCliente
--Exercício 1 
--Selecione e apresente  o nome do Cliente 
--o Cpf do Cliente ao lado de suas compras

select nomeCliente, cpfCliente, codVenda from
tbCliente inner join tbVenda on 
(tbCliente.codCliente = tbVenda.codCliente) 

--Exercício 2
--Selecione e a presente o Nome do Produto, 
--valor do produto ao lado do seu fabricante 
--e fornecedor.
select descricaoProduto, valorProduto, nomeFabricante from
tbProduto inner Join tbFabricante on
(tbProduto.codFabricante=tbFabricante.codFabricante)

--Exercício 3 
--Selecione a data da venda e o nome do cliente
--que realizou a compra.

select dataVenda, nomeClietne from tbVendas
inner join tbCliente on (tbVendas.codCliente=tbCliente.codCliente)

--Exercício 4
--Selecionar Nome do cliente data da compra, 
--valor da compra, nome do produto e 
--nome do fabricante.

select nomeClietne, dataVenda,valorTotal,tbProduto.descricaoProduto
,tbFabricante.nomeFabricante from tbCliente 
inner join tbVendas on (tbCliente.codCliente = tbVendas.codCliente)
inner join tbItensVenda on (tbVendas.codVenda = tbItensVenda.codVenda)
inner join tbProduto on (tbItensVenda.codProduto=tbProduto.codProduto)
inner join tbFabricante on (tbProduto.codFabricante=tbFabricante.codFabricante)


--Exercício 5
--Selecionar e apresentar e-mail do cliente, codigo da venda,
--código do produto e nome do fornecedor.

select emailCliente, tbVendas.codVenda,tbProduto.codProduto
,tbFornecedor.nomeFornecedor from tbCliente 
inner join tbVendas on (tbCliente.codCliente = tbVendas.codCliente)
inner join tbItensVenda on (tbVendas.codVenda = tbItensVenda.codVenda)
inner join tbProduto on (tbItensVenda.codProduto=tbProduto.codProduto)
inner join tbFornecedor on (tbProduto.codFabricante=tbFornecedor.codFornecedor)