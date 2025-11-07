create database animes;

use animes;

create table animes (
    id int primary key auto_increment,
    titulo varchar(100),
    genero varchar(50)
);

use animes;

create table personagens (
    id int primary key auto_increment,
    nome varchar(100),
    anime_id int,
    foreign key (anime_id) references animes(id)
);

use animes;

create table habilidades (
    id int primary key auto_increment,
    nome varchar(100),
    personagem_id int,
    foreign key (personagem_id) references personagens(id)
);

use animes;

insert into animes (titulo, genero) values
('Attack on Titan', 'Ação'),
('Demon Slayer', 'Sobrenatural'),
('My Hero Academia', 'Ação'),
('Jujutsu Kaisen', 'Terror leve');

use animes;

insert into personagens (nome, anime_id) values
('Levi Ackerman', 1),
('Eren Yeager', 1),
('Tanjiro Kamado', 2),
('Izuku Midoriya', 3),
('Yuji Itadori', 4),
('Ichigo Kurosaki', null); 

use animes;

insert into habilidades (nome, personagem_id) values
('Força', 1),
('Titã de Ataque', 2),
('Respiração de água e sol', 3),
('Titã de Ataque', 4),
('Força', 5),
('Shinigami e Hollow', null);

use animes;

select 
    p.nome as personagem,
    a.titulo as anime,
    a.genero as genero
from personagens p
inner join animes a on p.anime_id = a.id;

use animes;

select 
    p.nome as personagem,
    a.titulo as anime,
    h.nome as habilidade
from personagens p
left join animes a on p.anime_id = a.id
left join habilidades h on p.id = h.personagem_id;

use animes;

select 
    p.nome as personagem,
    h.nome as habilidade,
    a.titulo as anime
from personagens p
right join habilidades h on p.id = h.personagem_id
left join animes a on p.anime_id = a.id;
