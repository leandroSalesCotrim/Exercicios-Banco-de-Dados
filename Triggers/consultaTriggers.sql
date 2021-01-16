/*NECESSARIO DEIXAR APENAS 1 TRIGGER SEM COMENTARIOS PARA FAZER FUNCIONAR 1 DE CADA VEZ*/
/* PRIMEIRO TRIGGER

CREATE TRIGGER tgAtualizaQuantidade ON tbItensVenda AFTER INSERT
AS 
	DECLARE @codProduto int, @quantidadeItensVenda smallint
	SET @codProduto = (SELECT codProduto FROM INSERTED)
	SET @quantidadeItensVenda = (SELECT quantidadeItensVenda FROM INSERTED)

	UPDATE tbProduto 
		SET quantidadeProduto =  quantidadeProduto - @quantidadeItensVenda
		WHERE codProduto = @codProduto

SELECT * FROM tbProduto
*/
CREATE TRIGGER tgInserirSaidaProduto ON tbItensVenda AFTER INSERT 
AS 
	DECLARE @codProduto int , @quantidadeSaidaProduto int 
	SET @codProduto = (SELECT codProduto FROM INSERTED)
	SET @quantidadeSaidaProduto = (SELECT quantidadeItensVenda FROM INSERTED)

	INSERT INTO tbSaidaProduto (dataSaidaProduto, quantidadeSaidaProduto, codProduto)
	VALUES (GETDATE(),@quantidadeSaidaProduto,@codProduto)

	SELECT * from tbSaidaProduto

