create database sistema_lanche;

use sistema_lanche;

create table clientes (
    id int primary key auto_increment,
    nome varchar(100)
);

use sistema_lanche;

create table pedidos (
    id int primary key auto_increment,
    cliente_id int,
    data date,
    foreign key (cliente_id) references clientes(id)
);

use sistema_lanche;
create table produtos (
    id int primary key auto_increment,
    nome varchar(100),
    preco decimal(10,2)
);

use sistema_lanche;

create table itens_pedido (
    id int primary key auto_increment,
    pedido_id int,
    produto_id int,
    quantidade int,
    foreign key (pedido_id) references pedidos(id),
    foreign key (produto_id) references produtos(id)
);

use sistema_lanche;

insert into clientes (nome) values
('Lewis Hamilton'),
('Oscar Piastri'),
('George Russel'),
('Gabriel Bortoleto'),
('Kimi Antonelli');


use sistema_lanche;

insert into pedidos (cliente_id, data) values
(1, '2025-10-28'),
(2, '2025-10-29'),
(3, '2025-10-30'),
(4, '2025-10-31');

use sistema_lanche;

insert into produtos (nome, preco) values
('Smash Duplo Bacon', 35.90),
('Batata Frita com bacon e cheddar', 15.50),
('Refrigerante', 6.00),
('Suco', 12.00),
('Chicken bacon', 33.00);

use sistema_lanche;

insert into itens_pedido (pedido_id, produto_id, quantidade) values
(1, 1, 2),  
(3, 2, 1),
(4, 4, 2);


use sistema_lanche;
  
select 
    c.nome as cliente,
    p.id as pedido,
    p.data as data_pedido
from clientes c
inner join pedidos p on c.id = p.cliente_id;

use sistema_lanche;

select 
    c.nome as cliente,
    p.id as pedido,
    p.data as data_pedido
from clientes c
left join pedidos p on c.id = p.cliente_id;

use sistema_lanche;

select 
    p.id as pedido,
    pr.nome as produto,
    pr.preco,
    i.quantidade
from itens_pedido i
right join produtos pr on i.produto_id = pr.id
left join pedidos p on i.pedido_id = p.id;
