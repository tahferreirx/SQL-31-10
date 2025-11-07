create database jogo_batalha;

use jogo_batalha;

create table classes (
    id int primary key auto_increment,
    nome varchar(50),
    tipo_ataque varchar(50)
);

use jogo_batalha;

create table personagens (
	id int primary key auto_increment,
    nome varchar(50),
    classe_id int,
    nivel int,
    foreign key (classe_id) references classes(id)
);

use jogo_batalha;

create table batalhas (
    id int primary key auto_increment,
    personagem1_id int,
    personagem2_id int,
    vencedor_id int,
    foreign key (personagem1_id) references personagens(id),
    foreign key (personagem2_id) references personagens(id),
    foreign key (vencedor_id) references personagens(id)
);

use jogo_batalha;

insert into classes (nome, tipo_ataque) values
('Guerreiro', 'Corpo a corpo'),
('Maga', 'Magia'),
('Espadachim', 'Ataques físicos e vento'),
('Atiradora', 'Armas de fogo e explosivos'),
('Espiã', 'Armas de fogo');

use jogo_batalha;

insert into personagens (nome, classe_id, nivel) values
('Dovahkiin', 1, 10),
('Serana', 2, 15),
('Yasuo', 3, 12),
('Jinx', 4, 18),
('Ada Wong', 1, 8),
('Geralt de Rivia', 2, 4);

use jogo_batalha;

insert into batalhas (personagem1_id, personagem2_id, vencedor_id) values
(1, 2, 2),
(3, 4, 4),
(5, 1, 1);

use jogo_batalha;

select 
    p.nome as personagem,
    c.nome as classe,
    c.tipo_ataque
from personagens p
inner JOIN classes c on p.classe_id = c.id;

use jogo_batalha; 

select 
    p.nome as personagem,
    b.id as batalha_id,
    b.vencedor_id
from personagens p
left join batalhas b 
on p.id = b.personagem1_id or p.id = b.personagem2_id;

use jogo_batalha;

select 
    p.nome as personagem,
    c.nome as classe,
    c.tipo_ataque
from personagens p
right join classes c on p.classe_id = c.id;