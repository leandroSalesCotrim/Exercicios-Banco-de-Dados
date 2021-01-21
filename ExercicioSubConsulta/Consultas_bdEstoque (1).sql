-- EXERCICIO 1

	SELECT codProduto as 'C�digo', descricaoProduto as 'Produto', nomeFabricante as 'Fabricante' FROM tbProduto
	INNER JOIN tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante
	WHERE valorProduto = (SELECT MAX (valorProduto)FROM tbProduto)

-- EXERCICIO 2

	SELECT  descricaoProduto as 'Produto', nomeFabricante as 'Fabricante', valorProduto as 'Pre�o' FROM tbProduto
	INNER JOIN tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante
	WHERE valorProduto > (SELECT AVG (valorProduto)FROM tbProduto)

-- EXERCICIO 3

	SELECT nomeCliente as 'Cliente' FROM tbCliente
	INNER JOIN tbVenda ON tbCliente.codCliente = tbVenda.codCliente
	WHERE valorTotalVenda > (SELECT AVG (valorTotalVenda) FROM tbVenda)

-- EXERCICIO 4

	SELECT descricaoProduto as 'Produto', valorProduto as 'Pre�o' FROM tbProduto
	WHERE valorProduto = (SELECT MAX(valorProduto) FROM tbProduto)

-- EXERCICIO 5

	SELECT descricaoProduto as 'Produto', valorProduto as 'Pre�o' FROM tbProduto
	WHERE valorProduto = (SELECT MIN(valorProduto) FROM tbProduto)