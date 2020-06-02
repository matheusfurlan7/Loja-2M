Use VS12019;
Go

-- Deleta as tabelas

DROP TABLE Usuario;
DROP TABLE Perfil;
DROP TABLE PedidoVendaItem;
DROP TABLE PedidoVenda;
DROP TABLE PedidoCompraItem;
DROP TABLE PedidoCompra;
DROP TABLE Saldo;
DROP TABLE Movimento;
DROP TABLE Produto;
DROP TABLE Unidade;
DROP TABLE Grupo;
DROP TABLE Pessoa;
DROP TABLE Cidade;
DROP TABLE Estado;
DROP TABLE Pais;

-- Para criar o cadastro de pessoa

CREATE TABLE Pais(
	Pai_Codigo int IDENTITY(1,1) NOT NULL,
	Pai_Nome varchar(60) NULL,
    PRIMARY KEY(Pai_Codigo)
);

CREATE TABLE Estado(
	Est_Pais int NOT NULL,
	Est_Estado char(2) NOT NULL,
	Est_Cidade varchar(40) NOT NULL,
    PRIMARY KEY(Est_Pais,Est_Estado),
    FOREIGN KEY(Est_Pais) REFERENCES Pais (Pai_Codigo)
);

CREATE TABLE Cidade(
	Cid_Pais int NOT NULL,
	Cid_Estado char(2) NOT NULL,
	Cid_Cidade varchar(40) NOT NULL,
    PRIMARY KEY(Cid_Pais, Cid_Estado, Cid_Cidade),
    FOREIGN KEY(Cid_Pais, Cid_Estado) REFERENCES Estado (Est_Pais, Est_Estado),
    FOREIGN KEY(Cid_Pais) REFERENCES Pais (Pai_Codigo)
);

CREATE TABLE Pessoa(
	Pes_Codigo int IDENTITY(1,1) NOT NULL,
	Pes_Nome varchar(50) NULL,
	Pes_RazaoSocial varchar(50) NULL,
	Pes_Situacao varchar(7) NULL,
	Pes_TipoDePessoa varchar(8) NULL,
	Pes_CPFCNPJ varchar(18) NULL,
	Pes_RGIE varchar(14) NULL,
	Pes_Telefone varchar(20) NULL,
	Pes_Celular varchar(20) NULL,
	Pes_Email varchar(100) NULL,
	Pes_Site varchar(100) NULL,
	Pes_Pais int NULL,
	Pes_Estado char(2) NULL,
	Pes_Cidade varchar(40) NULL,
	Pes_Bairro varchar(30) NULL,
	Pes_Endereco varchar(50) NULL,
	Pes_Numero varchar(5) NULL,
	Pes_Complemento varchar(50) NULL,
	Pes_Cep varchar(8) NULL,
	Pes_DataCadastro date NULL,
	Pes_DataNascimento date NULL,
	Pes_Cliente varchar(3) NULL,
	Pes_Fornecedor varchar(3) NULL,
	Pes_Sexo varchar(9) NULL,
	Pes_Vendedor char(3) NULL,
	Pes_Comprador char(3) NULL,
    PRIMARY KEY(Pes_Codigo),
	FOREIGN KEY(Pes_Pais, Pes_Estado) REFERENCES Estado (Est_Pais, Est_Estado),
    FOREIGN KEY(Pes_Pais, Pes_Estado, Pes_Cidade) REFERENCES Cidade (Cid_Pais, Cid_Estado, Cid_Cidade),
    FOREIGN KEY(Pes_Pais) REFERENCES Pais (Pai_Codigo)
);

-- Para criar o cadastro de produto

CREATE TABLE Grupo(
	Gru_Codigo int IDENTITY(1,1) NOT NULL,
	Gru_Descricao varchar(60) NULL,
    PRIMARY KEY(Gru_Codigo)
);

CREATE TABLE Unidade(
	Uni_Unidade varchar(5) NOT NULL,
	Uni_Descricao varchar(40) NULL,
    PRIMARY KEY(Uni_Unidade)
);

CREATE TABLE Produto(
	Pro_Codigo int IDENTITY(1,1) NOT NULL,
	Pro_Descricao varchar(50) NOT NULL,
	Pro_Situacao varchar(7) NOT NULL,
	Pro_DataCadastro date NULL,
	Pro_Grupo int NOT NULL,
	Pro_Unidade varchar(5) NOT NULL,
	Pro_CodigoDeBarras varchar(20) NULL,
	Pro_EstoqueMinimo numeric(12, 4) NOT NULL,
	Pro_CustoMedio numeric(12, 4) NOT NULL,
	Pro_MargemLucro numeric(5, 2) NOT NULL,
	Pro_PrecoVenda numeric(12, 4) NOT NULL,
	Pro_ControlaEstoque char(3) NOT NULL,
    PRIMARY KEY CLUSTERED(Pro_Codigo),
    FOREIGN KEY(Pro_Grupo) REFERENCES Grupo (Gru_Codigo),
    FOREIGN KEY(Pro_Unidade) REFERENCES Unidade (Uni_Unidade)
);

-- Estoque

CREATE TABLE Movimento(
	Mov_Produto int NOT NULL,
	Mov_Data date NOT NULL,
	Mov_Sequencia int NOT NULL,
	Mov_TipoDeMovimento varchar(11) NULL,
	Mov_SaldoAnterior numeric(14, 2) NULL,
	Mov_SaldoAtual numeric(14, 2) NULL,
	Mov_Quantidade numeric(14, 2) NULL,
    PRIMARY KEY CLUSTERED (Mov_Produto, Mov_Data, Mov_Sequencia),
	FOREIGN KEY(Mov_Produto) REFERENCES Produto (Pro_Codigo)
);

CREATE TABLE Saldo(
	Sal_Produto int NOT NULL,
	Sal_Reserva numeric(14, 2) NULL,
	Sal_Encomenda numeric(14, 2) NULL,
	Sal_Saldo numeric(14, 2) NULL,
    PRIMARY KEY CLUSTERED (Sal_Produto),
    FOREIGN KEY(Sal_Produto) REFERENCES Produto (Pro_Codigo)
);

-- Pedido de compra

CREATE TABLE PedidoCompra(
	Pec_Codigo int IDENTITY(1,1) NOT NULL,
	Pec_Data date NOT NULL,
	Pec_Baixa date NULL,
	Pec_Fornecedor int NOT NULL,
	Pec_Comprador int NULL,
	Pec_Status char(1) NULL,
	Pec_ValorTotal numeric(14, 2) NULL,
	Pec_ValorProduto numeric(14, 2) NULL,
	Pec_ValorDesconto numeric(14, 2) NULL,
    PRIMARY KEY CLUSTERED (Pec_Codigo),
    FOREIGN KEY(Pec_Comprador) REFERENCES Pessoa (Pes_Codigo),
    FOREIGN KEY(Pec_Fornecedor) REFERENCES Pessoa (Pes_Codigo)
);

CREATE TABLE PedidoCompraItem(
	Pci_PedidoCompra int NOT NULL,
	Pci_Codigo int NOT NULL,
	Pci_Data date NOT NULL,
	Pci_Baixa date NULL,
	Pci_Fornecedor int NOT NULL,
	Pci_Comprador int NULL,
	Pci_Produto int NOT NULL,
	Pci_Quantidade numeric(14, 2) NULL,
	Pci_PrecoUnitario numeric(14, 2) NULL,
	Pci_ValorTotal numeric(14, 2) NULL,
	Pci_Status char(1) NOT NULL,
    PRIMARY KEY CLUSTERED (Pci_PedidoCompra, Pci_Codigo),
    FOREIGN KEY(Pci_Comprador) REFERENCES Pessoa (Pes_Codigo),
    FOREIGN KEY(Pci_Fornecedor) REFERENCES Pessoa (Pes_Codigo),
    FOREIGN KEY(Pci_Produto) REFERENCES Produto (Pro_Codigo)
);

-- Pedido venda

CREATE TABLE PedidoVenda(
	Pev_Codigo int IDENTITY(1,1) NOT NULL,
	Pev_Data date NOT NULL,
	Pev_Baixa date NULL,
	Pev_Cliente int NOT NULL,
	Pev_Vendedor int NULL,
	Pev_Status char(1) NOT NULL,
	Pev_ValorTotal numeric(14, 2) NULL,
	Pev_ValorProduto numeric(14, 2) NULL,
	Pev_ValorDesconto numeric(14, 2) NULL,
    PRIMARY KEY (Pev_Codigo),
    FOREIGN KEY(Pev_Cliente) REFERENCES dbo.Pessoa (Pes_Codigo),
    FOREIGN KEY(Pev_Vendedor) REFERENCES dbo.Pessoa (Pes_Codigo)
);

CREATE TABLE PedidoVendaItem(
	Pvi_PedidoVenda int NOT NULL,
	Pvi_Codigo int NOT NULL,
	Pvi_Data date NOT NULL,
	Pvi_Baixa date NULL,
	Pvi_Cliente int NOT NULL,
	Pvi_Vendedor int NULL,
	Pvi_Produto int NOT NULL,
	Pvi_Quantidade numeric(14, 2) NULL,
	Pvi_PrecoUnitario numeric(14, 2) NULL,
	Pvi_ValorTotal numeric(14, 2) NULL,
	Pvi_Status char(1) NOT NULL,
    PRIMARY KEY (Pvi_PedidoVenda, Pvi_Codigo),
    FOREIGN KEY(Pvi_Cliente) REFERENCES dbo.Pessoa (Pes_Codigo),
    FOREIGN KEY(Pvi_Produto) REFERENCES dbo.Produto (Pro_Codigo),
    FOREIGN KEY(Pvi_Vendedor) REFERENCES dbo.Pessoa (Pes_Codigo)
);

-- Login e direitos

CREATE TABLE Perfil(
	PER_CODIGO int IDENTITY(1,1) NOT NULL,
	PER_STATUS char(1) NULL,
	PER_INCLUSAO date NULL,
	PER_ALTERACAO date NULL,
	PER_DESCRICAO varchar(50) NULL,
	PER_DIREITOS text NULL,
    PRIMARY KEY (PER_CODIGO)
);

CREATE TABLE Usuario(
	USU_CODIGO int IDENTITY(1,1) NOT NULL,
	USU_STATUS char(1) NULL,
	USU_INCLUSAO date NULL,
	USU_ALTERACAO date NULL,
	USU_NOME varchar(80) NULL,
	USU_DEPARTAMENTO varchar(80) NULL,
	USU_SENHA varchar(10) NULL,
	USU_LOGIN varchar(20) NULL,
	USU_PERFIL int NULL,
    PRIMARY KEY ( USU_CODIGO),
    FOREIGN KEY(USU_PERFIL) REFERENCES dbo.Perfil (PER_CODIGO)
);

-- Insert do perfil

Insert into Perfil (PER_INCLUSAO,PER_ALTERACAO,PER_STATUS,PER_DESCRICAO,PER_DIREITOS) 
values ('2019-05-19','2019-05-19','S','Administrador',';PerfilMenu=S;PerfilIncluir=S;PerfilAlterar=S;PerfilExcluir=S;UsuarioMenu=S;UsuarioIncluir=S;UsuarioAlterar=S;UsuarioExcluir=S;PaisMenu=S;PaisIncluir=S;PaisAlterar=S;PaisExcluir=S;EstadoMenu=S;EstadoIncluir=S;EstadoAlterar=S;EstadoExcluir=S;CidadeMenu=S;CidadeIncluir=S;CidadeExcluir=S;UnidadeMenu=S;UnidadeIncluir=S;UnidadeAlterar=S;UnidadeExcluir=S;GrupoMenu=S;GrupoIncluir=S;GrupoAlterar=S;GrupoExcluir=S;ProdutoMenu=S;ProdutoIncluir=S;ProdutoAlterar=S;ProdutoExcluir=S;PessoaMenu=S;PessoaIncluir=S;PessoaAlterar=S;PessoaExcluir=S;VendaManutencao=S;VendaIncluir=S;VendaAlterar=S;VendaExcluir=S;VendaConsultar=S;VendaBaixar=S;VendaEstornar=S;VendaHistNum=S;VendaHistCli=S;VendaHistVen=S;CompraManutencao=S;CompraIncluir=S;CompraAlterar=S;CompraExcluir=S;CompraConsultar=S;CompraBaixar=S;CompraEstornar=S;CompraHistNum=S;CompraHistFor=S;CompraHistCom=S;EstoqueLancamento=S;EstoquePosicao=S;EstoqueHisPro=S;');

Insert into Usuario (USU_INCLUSAO,USU_ALTERACAO,USU_STATUS,USU_DEPARTAMENTO,USU_NOME,USU_LOGIN,USU_SENHA,USU_PERFIL)
values ('2019-05-19','2019-05-19','S','Administrador','Matheus Furlan','FURLAN','123',1);