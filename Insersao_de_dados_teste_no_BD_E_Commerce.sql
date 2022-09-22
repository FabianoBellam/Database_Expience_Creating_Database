use e_commerce;

INSERT INTO Cliente (Fname, Mname, Lname, Documento, TipoPessoa) VALUES ('Jose', 'C', 'Tenorio', '718.914.421-36', 'PF');
INSERT INTO Cliente (Fname, Mname, Lname, Documento, TipoPessoa) VALUES ('Odair', 'T', 'da Cunha', '327.725.438-16', 'PF');
INSERT INTO Cliente (Fname, Mname, Lname, Documento, TipoPessoa) VALUES ('Maria', 'D', 'Silva', '529.326.412-66', 'PF');
INSERT INTO Cliente (Fname, Mname, Lname, Documento, TipoPessoa) VALUES ('Silva', 'E', 'Silva Ltda.', '35.721.499/0001-27', 'PJ');
INSERT INTO Cliente (Fname, Mname, Lname, Documento, TipoPessoa) VALUES ('Varte', 'E', 'Varte Ltda.', '18.345.444/0001-16', 'PJ');

INSERT INTO StatusPedido (Identificacao) VALUES ('ABERTO');
INSERT INTO StatusPedido (Identificacao) VALUES ('EM ANDAMENTO');
INSERT INTO StatusPedido (Identificacao) VALUES ('EM PAUSA');
INSERT INTO StatusPedido (Identificacao) VALUES ('CANCELADO');
INSERT INTO StatusPedido (Identificacao) VALUES ('CONCLUÍDO');

INSERT INTO TipoPagamento (Identificacao) VALUES ('Dinheiro');
INSERT INTO TipoPagamento (Identificacao) VALUES ('Debito');
INSERT INTO TipoPagamento (Identificacao) VALUES ('Credito');
INSERT INTO TipoPagamento (Identificacao) VALUES ('Boleto');

INSERT INTO StatusEntrega (Identificacao) VALUES ('Aguardando separação');
INSERT INTO StatusEntrega (Identificacao) VALUES ('Retirado pela transportadora');
INSERT INTO StatusEntrega (Identificacao) VALUES ('Em transito para entrega');
INSERT INTO StatusEntrega (Identificacao) VALUES ('Entregue');

INSERT INTO EnderecoEntrega (CodRastreio, CEP, Logradouro, Numero, Complemento) VALUES ('DP1445831290', '14890444', 'Rua Carlos Cunha', '00', NULL);

INSERT INTO Estoque (Identificacao) VALUES ('Setor A');
INSERT INTO Estoque (Identificacao) VALUES ('Setor B');
INSERT INTO Estoque (Identificacao) VALUES ('Setor C');
INSERT INTO Estoque (Identificacao) VALUES ('Setor D');

INSERT INTO VendedorTerceiro (RazaoSocial, CNPJ) VALUES ('Walter Sipindolla Ltda.', '22.866.136/0001-11');
INSERT INTO VendedorTerceiro (RazaoSocial, CNPJ) VALUES ('Atos Desencatos Ltda.', '92.813.647/0001-50');

INSERT INTO Fornecedor (RazaoSocial, CNPJ) VALUES ('Walter Sipindolla Ltda..', '22.866.136/0001-11');
INSERT INTO Fornecedor (RazaoSocial, CNPJ) VALUES ('Atos Desencatos Ltda.', '92.813.647/0001-50');

INSERT INTO Categoria (Identificacao) VALUES ('Informatica');
INSERT INTO Categoria (Identificacao) VALUES ('Escritorio');
INSERT INTO Categoria (Identificacao) VALUES ('Papelaria');
INSERT INTO Categoria (Identificacao) VALUES ('Decoracao');

INSERT INTO Produto (idCategoria, Identificacao, Descricao, Valor) VALUES ('Teclado', 'Teclado ABNT2 USB', 89.90);
INSERT INTO Produto (idCategoria, Identificacao, Descricao, Valor) VALUES ('Mouse', 'Mouse USB', 49.90);
INSERT INTO Produto (idCategoria, Identificacao, Descricao, Valor) VALUES ('Caderno', 'Caderno 500fl', 29.90);

INSERT INTO ProdutoFornecedor (idProduto, idFornecedor) VALUES (2, 1);
INSERT INTO ProdutoFornecedor (idProduto, idFornecedor) VALUES (3, 2);

INSERT INTO ProdutoVendedorTerceiro (idProduto, idVendedorTerceiro) VALUES (2, 1);
INSERT INTO ProdutoVendedorTerceiro (idProduto, idVendedorTerceiro) VALUES (3, 2);

INSERT INTO ProdutoEstoque (idProduto, idEstoque, Quantidade) VALUES (2, 1, 10);
INSERT INTO ProdutoEstoque (idProduto, idEstoque, Quantidade) VALUES (3, 2, 15);

INSERT INTO Pedido (idEnderecoEntrega, idCliente, idStatusPedido, Codigo, DataPedido, VlrFrete, VlrPedido, VlrTotal) VALUES (1, 1, 1, '0000000001', '2022-09-09', 0, 10, 10);

INSERT INTO PedidoProduto (idPedido, idProduto) VALUES (2, 2);
INSERT INTO PedidoProduto (idPedido, idProduto) VALUES (2, 3);

INSERT INTO TipoPagamentoPedido (idPedido, idTipoPagamento, Valor) VALUES (2, 1, 5.75);
INSERT INTO TipoPagamentoPedido (idPedido, idTipoPagamento, Valor) VALUES (2, 2, 4.25);