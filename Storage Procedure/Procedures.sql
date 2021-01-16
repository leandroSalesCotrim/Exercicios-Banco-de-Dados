use bdEscolaIdioma

-- EXERCICIO 1

CREATE PROCEDURE spBuscaAluno
	
	 @cod_aluno int

AS

	SELECT nomeAluno, rgAluno, cpfAluno, logradouro, numero, complemento, cep, bairro, cidade, dataNascimento FROM tbAluno
	WHERE codAluno = @cod_aluno

	EXEC spBuscaAluno 1010

--EXERCICIO 2

CREATE PROCEDURE spInsereAluno

	@nome varchar (90), @rg varchar (15), @cpf varchar(15), @logradouro varchar (50), @numero varchar (20)
	,@complemento varchar (50), @cep varchar (12), @bairro varchar (30), @cidade varchar (30), @dataN smalldatetime
AS

	begin
		INSERT INTO tbAluno  (nomeAluno, rgAluno, cpfAluno, logradouro, numero, complemento, cep, bairro, cidade, dataNascimento)
		VALUES (@nome, @rg, @cpf, @logradouro, @numero, @complemento, @cep, @bairro, @cidade, @dataN)
		print ('Aluno ' +@nome+ ' cadastrado com sucesso!')
	end
	EXEC spInsereAluno 'Leandro Salles', '62.325.854-5', '654.241.364-95', 'Rua do Lago', '26', 'Casa', '08445-650', 'Itaquera',
								'SP', '20/04/1998'

	EXEC spInsereAluno 'Ana Luiza Lopes', '22.645.104-9', '364.241.364-95', 'Rua Igarapé Mirim', '87', 'Casa', '08655-850', 'Guaianases',
								'SP', '15/07/1998'

	SELECT * FROM tbAluno


-- EXERCICIO 3

	SELECT * FROM tbCurso

	CREATE PROCEDURE spAumentaPreco

	 @nomeCurso varchar (40)
	,@percentual float

AS
	begin

		UPDATE tbCurso

		SET valorCurso = valorCurso + (valorCurso*(@percentual/100))
		WHERE nomeCurso = @nomeCurso

		EXEC spAumentaPreco 'Espanhol', 200


-- EXERCICIO 4


	CREATE PROCEDURE spExibeTurma

	@descricaoTurma varchar (20)
AS
	begin
	SELECT * FROM tbTurma
	WHERE descricaoTurma = @descricaoTurma

	EXEC spExibeTurma '1B'

-- EXERCICIO 5

CREATE PROCEDURE spExibeAlunosdaTurma

	@descricaoTurma VARCHAR(20)
AS
	begin

	SELECT nomeALuno FROM tbTurma
	INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
	INNER JOIN tbAluno ON tbAluno.codAluno = tbMatricula.codAluno
	WHERE descricaoTurma = @descricaoTurma

EXEC spExibeAlunosdaTurma '1A'

--EXERCICIO 6

CREATE PROCEDURE spInserindoAluno

	@nome varchar (90), @rg varchar (15), @cpf varchar(15), @logradouro varchar (50), @numero varchar (20)
	,@complemento varchar (50), @cep varchar (12), @bairro varchar (30), @cidade varchar (30), @dataN smalldatetime
AS
	
	BEGIN
		IF EXISTS ( SELECT codAluno from tbAluno WHERE cpfAluno like @cpf)
			BEGIN 
				print('Impossivel Cadastrar. Ja existe o cpf '+ @cpf + ' Cadastrado')
			END
		ELSE
			BEGIN
				INSERT INTO tbAluno  (nomeAluno, rgAluno, cpfAluno, logradouro, numero, complemento, cep, bairro, cidade, dataNascimento)
				VALUES (@nome, @rg, @cpf, @logradouro, @numero, @complemento, @cep, @bairro, @cidade, @dataN)
			
				print('Aluno ' + @nome + ' foi cadastrado com sucesso') 
			END	
	END

	EXEC spInserindoAluno 'Ana Luiza Lopes', '22.645.104-9', '364.241.364-95', 'Rua Igarapé Mirim', '87', 'Casa', '08655-850', 'Guaianases',
								'SP', '15/07/1998'


-- EXERCICIO 7

CREATE PROCEDURE spMatriculaAluno
	@nomeAluno VARCHAR(30),
	@nomeCurso VARCHAR(30)

AS	
	IF EXISTS(SELECT codAluno FROM tbAluno WHERE nomeALuno Like @nomeAluno) and
		EXISTS(SELECT TOP 1 codTurma FROM tbCurso
				INNER JOIN tbTurma ON tbTurma.codCurso = tbCurso.codCurso
				WHERE nomeCurso Like @nomeCurso)
		BEGIN
			declare @codAluno int = (SELECT codAluno FROM tbAluno WHERE nomeALuno Like @nomeAluno)
			declare @codTurma int = (SELECT TOP 1 codTurma FROM tbCurso 
										INNER JOIN tbTurma ON tbTurma.codCurso = tbCurso.codCurso
										WHERE nomeCurso Like @nomeCurso )

			INSERT INTO tbMatricula(dataMatricula, codAluno, codTurma)
			VALUES( GETDATE(), @codAluno, @codTurma)
			print(@nomeAluno+' Foi cadastrado com sucesso no curso de' +@nomeCurso+'.')		

		END
	ELSE
		BEGIN
			print('Nenhum Aluno ou Curso foi encontrado com esses parâmetros!')		
		END

EXEC spMatriculaAluno 'Leandro Sales', 'Espanhol'
EXEC spMatriculaAluno 'Leandro Sales', 'Alemão'
EXEC spMatriculaAluno 'Leandro Sales', 'Inglês'
EXEC spMatriculaAluno 'Giovanna Melo', 'Alemão'