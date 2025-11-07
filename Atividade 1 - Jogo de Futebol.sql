create database jogo_futebol;

use jogo_futebol;

create table times (
	id int primary key auto_increment,
    nome varchar(50),
    cidade varchar(30)
);

use jogo_futebol;

create table posicoes (
	id int primary key auto_increment,
    nome varchar(50)
);

use jogo_futebol;

create table jogadores (
	id int primary key auto_increment,
    nome varchar(50),
    posicao_id int,
    time_id int,
    foreign key (posicao_id) references posicoes(id),
    foreign key (time_id) references times(id)
);

use jogo_futebol;

insert into times (nome, cidade) values
('São Paulo Futebol Clube', 'São Paulo'),
('Sociedade Esportiva Palmeiras', 'São Paulo'),
('Botafogo de Futebol e Regatas', 'Rio de Janeiro'),
('Sport Club Corinthians Paulista', 'São Paulo');

use jogo_futebol;

insert into posicoes (nome) values
('Goleiro'),
('Atacante'),
('Lateral'),
('Zagueiro'),
('Libero'),
('Volante'),
('Meia-Lateral'),
('Meia-Central'),
('Meia-Armador');

use jogo_futebol;

insert into jogadores (nome, posicao_id, time_id) values
('Lucas Moura', '2', 1),
('Rafael Pires', '1', 1),
('Andreas Pereira', '7' , 2),
('Jefté', '4', 2),
('Marlon Freitas', '8', 3),
('Goleiro', '1', 3),
('Yuri Alberto' , '2', null),
('José Andrés', '9', null);


use jogo_futebol;

select 
    j.nome as jogador,
    t.nome as time,
    p.nome as posicao
from jogadores j
inner join times t on j.time_id = t.id
inner join posicoes p on j.posicao_id = p.id;

use jogo_futebol;

select
    j.nome as jogador,
    t.nome as time,
    p.nome as posicao
from jogadores j
left join times t on j.time_id = t.id
left join posicoes p on j.posicao_id = p.id;

use jogo_futebol;

select 
    j.nome as jogador,
    t.nome as time,
    p.nome as posicao
from jogadores j
right join times t on j.time_id = t.id
left join posicoes p on j.posicao_id = p.id;

use jogo_futebol;

select 
    j.nome as jogador,
    t.nome as time,
    p.nome as posicao
from jogadores j
left join times t on j.time_id = t.id
left join posicoes p on j.posicao_id = p.id

union

select 
    j.nome as jogador,
    t.nome as time,
    p.nome as posicao
from jogadores j
right join times t on j.time_id = t.id
left join posicoes p on j.posicao_id = p.id;



