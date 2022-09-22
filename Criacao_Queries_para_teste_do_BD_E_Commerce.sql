-- Recuperações simples com SELECT Statement
select * from e_commerce.pedido;

-- Filtros com WHERE Statement
select * from e_commerce.pedido where codigo='0000000001';

-- Crie expressões para gerar atributos derivados
select (sum(vlrFrete)+sum(vlrPedido)) as ValorTotal from e_commerce.Pedido;

-- Defina ordenações dos dados com ORDER BY
select Identificacao, Valor from e_commerce.Produto order by valor desc;

-- Condições de filtros aos grupos – HAVING Statement
select idCategoria, sum(Valor) from e_commerce.Produto group by idCategoria having count(idCategoria)>1;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
select c.Identificacao, p.Identificacao, p.Descricao, p.Valor
    from e_commerce.Produto p
    inner join e_commerce.Categoria c on p.idCategoria = c.id
	

-- PERGUNTAS
-- 1) Quantos pedidos foram feitos por cada cliente?
select Count(p.idCliente), c.Nome
    from e_commerce.Pedido p
    inner join e_commerce.Cliente c on p.idCliente = c.id
    group by p.idCliente, c.Nome

-- 2) Algum vendedor também é fornecedor?
select f.RazaoSocial from e_commerce.Fornecedor f where f.CNPJ in (select t.CNPJ from e_commerce.VendedorTerceiro t)

-- 3) Relação de produtos fornecedores e estoques;
select f.RazaoSocial, p.Identificacao, pe.Quantidade
    from e_commerce.Produto p
    inner join e_commerce.ProdutoFornecedor pf on p.id = pf.idProduto
    inner join e_commerce.Fornecedor f on f.id = pf.idFornecedor
    inner join e_commerce.ProdutoEstoque pe on p.id = pe.idProduto

-- 4) Relação de nomes dos fornecedores e nomes dos produtos;-- 4) Relação de nomes dos fornecedores e nomes dos produtos;
select f.RazaoSocial as Fornecedor, p.Identificacao as Produto
    from e_commerce.Produto p
    inner join e_commerce.ProdutoFornecedor pf on p.id = pf.idProduto
    inner join e_commerce.Fornecedor f on f.id = pf.idFornecedor