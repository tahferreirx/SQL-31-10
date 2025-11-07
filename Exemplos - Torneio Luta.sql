use torneio_luta;

select    -- Mostrar apenas os lutadores que TÊM ACADEMIA
	l.nome as Lutador,
	l.estilo as Estilo,
	a.nome as Academia,
	a.cidade as Cidade
from lutadores l
inner join academias a  -- Depende do enunciado, ou seja, depende de qual tabela irá realizar a junção
on l.academia_id = a.id;  -- O 'ON' serve de comparação, o 'JOIN' é a junção

use torneio_luta;

select  -- Mostrar todos os lutadores, inclusive os que ainda NÃO ESTÃO EM UMA ACADEMIA
	l.nome as Lutador,
	l.estilo as Estilo,
	a.nome as Academia
from lutadores l
left join academias a -- Traz sobre a academia da esquerda chamada academias
on l.academia_id = a.id;  -- O 'ON' serve de comparação, o 'JOIN' é a junção

use torneio_luta;

select -- Mostrar todas as academias, mesmo as que4 ainda NÃO TÊM LUTADORES
	l.nome as Academia,
	a.cidade as Cidade,
	a.nome as Lutador
from lutadores l 
right join academias a -- Traz sobre os lutadores da direita chamada academias
on l.academia_id = a.id;  -- O 'ON' serve de comparação, o 'JOIN' é a junção

use torneio_luta;

select  -- Mostrar todos os lutadores e academias, com ou sem vinculo
	l.nome as Lutador,
	a.nome as Academia
from lutadores l
left join academias a 
on l.academia_id = a.id  -- O 'ON' serve de comparação, o 'JOIN' é a junção

union

select
	l.nome as Lutador,
	a.nome as Academia
from lutadores l
right join academias a 
on l.academia_id = a.id;  -- O 'ON' serve de comparação, o 'JOIN' é a junção

select -- Exibir quem lutou contra quem e quem venceu
	l1.nome as Lutador_1,
    l2.nome as Lutador_2,
	v.nome as Vencedor
from lutas l
inner join lutadores l1 on l.lutador1_id = l1.id
inner join lutadores l2 on l.lutador2_id = l2.id
inner join lutadores v on l.vencedor_id = v.id;

use torneio_luta;

select -- Liste o nome da academia e quantos lutadores ele possui
	a.nome as Academia, count(l.id) as Total_Lutadores  -- Contar o total de lutadores
from academias a
left join lutadores l on a.id = l.academia_id
group by a.nome;  -- Grupa em nome de academias

use torneio_luta;

select -- Liste o nome dos lutadores que NUNCA LUTARAM
	l.nome
from lutadores l
left join lutas lu1 on l.id = lu1.lutador1_id
left join lutas lu2 on l.id = lu2.lutador2_id
where lu1.id is null and lu2.id is null;

