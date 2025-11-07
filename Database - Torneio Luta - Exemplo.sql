create database torneio_luta;

use torneio_luta;

create table academias (
	id int primary key auto_increment,
    nome varchar(50),
    cidade varchar(30)
);

create table lutadores (
	id int primary key auto_increment,
    nome varchar(50),
    estilo varchar(30),
    academia_id int,
    foreign key (academia_id) references academias(id)
);

create table lutas (
	id int primary key auto_increment,
    lutador1_id int,
    lutador2_id int,
    vencedor_id int,
    foreign key (lutador1_id) references lutadores(id),
    foreign key (lutador2_id) references lutadores(id),
    foreign key (vencedor_id) references lutadores(id)
);

insert into academias (nome, cidade) values
('Gracie Barra', 'São Paulo'),
('Dragon Dojo', 'Curitiba'),
('Konoha Team', 'Rio de Janeiro'),
('Eagle Fight', 'Salvador');

insert into lutadores (nome, estilo, academia_id) values
('Ryu', 'Karate', 1),
('Ken', 'Kickboxing', 1),
('Goku', 'Kung Fu' , 2),
('Vegeta', 'Boxe', 2),
('Naruto', 'Ninjutsu', 3),
('Sasuke', 'Ninjutsu', 3),
('Baki' , 'Grappling', null),
('Sakura', 'Jiu-Jitsu', null);

insert into lutas (lutador1_id, lutador2_id, vencedor_id) values
(1, 2, 1), 
(3, 4, 3),
(5, 6, 5);