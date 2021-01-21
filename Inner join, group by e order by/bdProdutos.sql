create database bdProdutos


use bdProdutos

create table tbCliente (
	codCliente int primary key identity (1,1) not null
	,nomeCliente varchar (30)
	,cpfCliente varchar (15)
	,emailCliente varchar (30)
	,sexoCliente varchar (10)
	,dataNascimentoCliente date not null
)
create table tbVenda (
	codVenda int primary key identity (1,1) not null
	,dataVenda date 
	,valorTotalVenda float
	,codCliente int foreign key references tbCliente (codCliente)
)
create table tbFabricante (
	codFabricante int primary key identity (1,1) not null
	,nomeFabricante varchar (30)
)
create table tbFornecedor (
	codFornecedor int primary key identity (1,1) not null
	,nomeFornecedor varchar (30)
	,contatoFornecedor varchar (30)

)
create table tbProduto (
	codProduto int primary key identity (1,1) not null
	,descricaoProduto varchar (30)
	,valorProduto float
	,quantidadeProduto int 
	,codFabricante int foreign key references tbFabricante (codFabricante)
	,codFornecedor int foreign key references tbFornecedor (codFornecedor)
)
create table tbItensVenda (
	 codItensVenda int primary key identity (1,1) not null
	,codVenda int foreign key references tbVenda (codVenda)
	,codProduto int foreign key references tbProduto (codProduto)
	,quantidadeItensVenda int
	,subTotalItensVenda float
)

