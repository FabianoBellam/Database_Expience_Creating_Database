CREATE DATABASE e_commerce;

USE e_commerce;

CREATE TABLE Cliente (
	idCliente INT NOT NULL auto_increment,
	FName VARCHAR(10) NOT NULL,
	Mname VARCHAR(3),
    Lname VARCHAR(20),
    Documento VARCHAR(18),
	TipoPessoa  varchar (2) NOT NULL CHECK (TipoPessoa IN('PF', 'PJ')) DEFAULT 'PF',
	CONSTRAINT unique_Cliente_Documento UNIQUE (Documento),
	CONSTRAINT pk_Cliente_idCliente PRIMARY KEY (idCliente)
);

desc cliente;

CREATE TABLE StatusPedido (
	idStatusPedido INT NOT NULL auto_increment,
	Identificacao VARCHAR(45) NOT NULL,
	CONSTRAINT unique_StatusPedido_Identificacao UNIQUE (Identificacao),
	CONSTRAINT pk_StatusPedido_id PRIMARY KEY (idStatusPedido)
);

desc StatusPedido;

CREATE TABLE TipoPagamento (
	idTipoPagamento INT NOT NULL auto_increment,
	Identificacao VARCHAR(50) NOT NULL,
	CONSTRAINT unique_TipoPagamento_Identificacao UNIQUE (Identificacao),
	CONSTRAINT pk_TipoPagamento_id PRIMARY KEY (idTipoPagamento)
);

desc TipoPagamento;
show tables;

CREATE TABLE StatusEntrega (
	idStatusEntrega INT NOT NULL auto_increment,
	Identificacao VARCHAR(45) NOT NULL,
	CONSTRAINT unique_StatusEntrega_Identificacao UNIQUE (Identificacao),
	CONSTRAINT pk_StatusEntrega_id PRIMARY KEY (idStatusEntrega)
);

CREATE TABLE EnderecoEntrega (
	idEnd_Entrega INT NOT NULL auto_increment,
	IDStatusEntrega INT NOT NULL,
	CodRastreio VARCHAR(50) NOT NULL,
	CEP VARCHAR(8) NOT NULL,
	Logradouro VARCHAR(150) NOT NULL,
	Numero VARCHAR(10) NOT NULL,
	Complemento VARCHAR(10),
	DataEntrega DATETIME,
	CONSTRAINT pk_EnderecoEntrega_id PRIMARY KEY (idEnd_Entrega),
	CONSTRAINT fk_EnderecoEntrega_idStatusEntrega_StatusEntrega_id FOREIGN KEY (IDStatusEntrega) REFERENCES StatusEntrega(idStatusEntrega) ON DELETE NO ACTION
);

CREATE TABLE Estoque (
	idEstoque INT NOT NULL auto_increment,
	Identificacao VARCHAR(45) NOT NULL,
	CONSTRAINT unique_Estoque_Identificacao UNIQUE (Identificacao),
	CONSTRAINT pk_Estoque_id PRIMARY KEY (idEstoque)
);

CREATE TABLE VendedorTerceiro (
	idVendedorT INT NOT NULL auto_increment,
	RazaoSocial VARCHAR(100) NOT NULL,
	CNPJ VARCHAR(45) NOT NULL,
	CONSTRAINT unique_VendedorTerceiro_CNPJ UNIQUE (CNPJ),
	CONSTRAINT pk_VendedorTerceiro_id PRIMARY KEY (idVendedorT)
);

CREATE TABLE Fornecedor (
	idFornecedor INT NOT NULL auto_increment,
	RazaoSocial VARCHAR(100) NOT NULL,
	CNPJ VARCHAR(45) NOT NULL,
	CONSTRAINT unique_Fornecedor_CNPJ UNIQUE (CNPJ),
	CONSTRAINT pk_Fornecedor_id PRIMARY KEY (idFornecedor)
);

CREATE TABLE Categoria (
	idCategoria INT NOT NULL auto_increment,
	Identificacao VARCHAR(45) NOT NULL,
	CONSTRAINT unique_Categoria_Identificacao UNIQUE (Identificacao),
	CONSTRAINT pk_Categoria_id PRIMARY KEY (idCategoria)
);

CREATE TABLE Produto (
	idProduto INT NOT NULL auto_increment,
	idCategoria INT NOT NULL,
	Identificacao VARCHAR(100) NOT NULL,
	Descricao TEXT NOT NULL,
	Valor DECIMAL(18,2) NOT NULL,
	CONSTRAINT unique_Produto_Identificacao UNIQUE (Identificacao),
	CONSTRAINT pk_Produto_id PRIMARY KEY (idProduto),
	CONSTRAINT fk_Produto_idCategoria_Categoria_id FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria) ON DELETE NO ACTION
);

CREATE TABLE ProdutoFornecedor (
	idProd_Fornecedor INT NOT NULL auto_increment,
	idProduto INT NOT NULL,
	idFornecedor INT NOT NULL,
	CONSTRAINT pk_ProdutoFornecedor_id PRIMARY KEY (idProd_Fornecedor),
	CONSTRAINT fk_ProdutoFornecedor_idProduto_Produto_id FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) ON DELETE NO ACTION,
	CONSTRAINT fk_ProdutoFornecedor_idFornecedor_Fornecedor_id FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor) ON DELETE NO ACTION
);

CREATE TABLE ProdutoVendedorTerceiro (
	idProdVendTer INT NOT NULL auto_increment,
	idProduto INT NOT NULL,
	idVendedorTerceiro INT NOT NULL,
	CONSTRAINT pk_ProdutoVendedorTerceiro_id PRIMARY KEY (idProdVendTer),
	CONSTRAINT fk_ProdutoVendedorTerceiro_idProduto_Produto_id FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) ON DELETE NO ACTION,
	CONSTRAINT fk_ProdutoVendedorTerceiro_idVendedorTerceiro_id FOREIGN KEY (idVendedorTerceiro) REFERENCES VendedorTerceiro(idVendedorT) ON DELETE NO ACTION
);

CREATE TABLE ProdutoEstoque (
	idProdEstoque INT NOT NULL auto_increment,
	idProduto INT NOT NULL,
	idEstoque INT NOT NULL,
	Quantidade INT NOT NULL,
	CONSTRAINT pk_ProdutoEstoque_id PRIMARY KEY (idProdEstoque),
	CONSTRAINT fk_ProdutoEstoque_idProduto_Produto_id FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) ON DELETE NO ACTION,
	CONSTRAINT fk_ProdutoEstoque_idEstoque_Estoque_id FOREIGN KEY (idEstoque) REFERENCES Estoque(idEstoque) ON DELETE NO ACTION
);

CREATE TABLE Pedido (
	idPedido INT NOT NULL auto_increment,
	idEnderecoEntrega INT NOT NULL,
	idCliente INT NOT NULL,
	idStatusPedido INT NOT NULL,
	Codigo VARCHAR(45) NOT NULL,
	DataPedido DATETIME NOT NULL,
	VlrFrete DECIMAL(18,2),
	VlrPedido DECIMAL(18,2),
	VlrTotal DECIMAL(18,2),
	CONSTRAINT unique_Pedido_Codigo UNIQUE (Codigo),
	CONSTRAINT pk_Pedido_id PRIMARY KEY (idPedido),
	CONSTRAINT fk_Pedido_idEnderecoEntrega_EnderecoEntrega_id FOREIGN KEY (idEnderecoEntrega) REFERENCES EnderecoEntrega(idEnd_Entrega) ON DELETE NO ACTION,
	CONSTRAINT fk_Pedido_idCliente_Cliente_id FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE NO ACTION,
	CONSTRAINT fk_Pedido_idStatusPedido_StatusPedido_id FOREIGN KEY (idStatusPedido) REFERENCES StatusPedido(idStatusPedido) ON DELETE NO ACTION
);

CREATE TABLE PedidoProduto (
	idPedidoProduto INT NOT NULL auto_increment,
	idPedido INT NOT NULL,
	idProduto INT NOT NULL,
	CONSTRAINT pk_PedidoProduto_id PRIMARY KEY (idPedidoProduto),
	CONSTRAINT fk_PedidoProduto_idPedido_Pedido_id FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido) ON DELETE NO ACTION,
	CONSTRAINT fk_PedidoProduto_idProduto_Produto_id FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) ON DELETE NO ACTION
);

CREATE TABLE TipoPagamentoPedido (
	idTipoPagamentoPedido INT NOT NULL auto_increment,
	idPedido INT NOT NULL,
	idTipoPagamento INT NOT NULL,
	Valor DECIMAL(18,2),
	CONSTRAINT pk_TipoPagamentoPedido_id PRIMARY KEY (idTipoPagamentoPedido),
	CONSTRAINT fk_TipoPagamentoPedido_idPedido_Pedido_id FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido) ON DELETE NO ACTION,
	CONSTRAINT fk_TipoPagamentoPedido_idTipoPagamento_TipoPagamento_id FOREIGN KEY (idTipoPagamento) REFERENCES TipoPagamento(idTipoPagamento) ON DELETE NO ACTION
);

show tables;