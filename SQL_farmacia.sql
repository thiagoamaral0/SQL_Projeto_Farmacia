-- TIPOS PRODUTO
insert into tipos_produto (tipo_do_produto) values ('Remedios');
insert into tipos_produto (tipo_do_produto) values ('Cosmeticos');
insert into tipos_produto (tipo_do_produto) values ('Diversos');

-- FABRICANTES
insert into fabricantes (nome_fabricante) values ('Roche');
insert into fabricantes (nome_fabricante) values ('Vitalis');
insert into fabricantes (nome_fabricante) values ('Palmolive');

-- MEDICOS
insert into medicos (nome) values ('Alfredo Muniz');
insert into medicos (nome) values ('Fernanda Silva');
insert into medicos (nome) values ('Julieta Santana');	

-- CLIENTES
insert into clientes (nome,endereco,telefone,codigo_postal,localidade,cpf) values ('Felicity Jones', 'Rua da paz, 34 ', '(11)  2352-2344', '34-453452', 'Santos', '2343423234');
insert into clientes (nome,endereco,telefone,codigo_postal,localidade,cpf) values ('Mias Bolas', 'Rua do caos, 666', '(35) 2324-5756', '76-545345', 'Acre', '4645645645');
insert into clientes (nome,endereco,telefone,codigo_postal,localidade,cpf) values ('Gracy Kellyinguiça', 'Rua da desgraça, 24', '(65) 3455-5743', '23-13123', 'Bahia', '56756754');

-- PRODUTOS

insert into produtos (produto,designacao,composicao,preco,fabricante_id,tipo_produto_id) values ('camisinha', 'secso', 'tesao', '10', 1, 1);
insert into produtos (produto,designacao,composicao,preco,fabricante_id,tipo_produto_id) values ('pfizer', 'ta pasada', 'vrpdnp', '12', 2, 3);
insert into produtos (produto,designacao,composicao,preco,fabricante_id,tipo_produto_id) values ('vitaC', 'vitamina C', 'escorbuto', '15',3 , 3);

-- COMPRAS

insert into compras (codigo_cliente, data, medico_id) values (1,'2019-05-09',1);
insert into compras (codigo_cliente, data, medico_id) values (2,'2019-05-10',2);
insert into compras (codigo_cliente, data, medico_id) values (3,'2019-05-11',3);


-- PRODUTOS_COMPRA
insert into produtos_compra (id_compra, id_produto, quantidade) values (1, 1, 2);
insert into produtos_compra (id_compra, id_produto, quantidade) values (2, 2, 5);
insert into produtos_compra (id_compra, id_produto, quantidade) values (3, 3, 3);

-- RECEITAS_MEDICA
insert into receitas_medica (id_produto_compra, id_medico, receita) values (1 , 1, 'sexo');
insert into receitas_medica (id_produto_compra, id_medico, receita) values (2 , 2, 'muita coisa');
insert into receitas_medica (id_produto_compra, id_medico, receita) values (3, 3, 'estudar');

















