use torneio_luta;

select
	l.nome as Lutador,
	l.estilo as Estilo,
	a.nome as Academia,
	a.cidade as Cidade
from lutadores l
inner join academias a on l.academia_id = a.id;

use torneio_luta;

select
	l.nome as Lutador,
	l.estilo as Estilo,
	a.nome as Academia
from lutadores l
left join academias a on l.academia_id = a.id;

use torneio_luta;

select
	l.nome as Academia,
	a.cidade as Cidade,
	a.nome as Lutador
from lutadores l
right join academias a on l.academia_id = a.id;

use torneio_luta;

select
	l.nome as Lutador,
	a.nome as Academia
from lutadores l
left join academias a on l.academia_id = a.id

union

select
	l.nome as Lutador,
	a.nome as Academia
from lutadores l
right join academias a on l.academia_id = a.id;

select
	l1.nome as Lutador_1,
    l2.nome as Lutador_2,
	v.nome as Vencedor
from lutas l
inner join lutadores l1 on l.lutador1_id = l1.id
inner join lutadores l2 on l.lutador2_id = l2.id
inner join lutadores v on l.vencedor_id = v.id;

use torneio_luta;

select
	a.nome as Academia, count(l.id) as Total_Lutadores
from academias a
left join lutadores l on a.id = l.academia_id
group by a.nome;

use torneio_luta;

select l.nome
from lutadores l
left join lutas lu1 on l.id = lu1.lutador1_id
left join lutas lu2 on l.id = lu2.lutador2_id
where lu1.id is null and lu2.id is null;

