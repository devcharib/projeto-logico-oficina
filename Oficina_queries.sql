use oficina;
show tables;
--
-- SELECT
select * from pecas;

select modelo, marca, cor from veiculo;

select nome, idade from pessoaFisica;
-- WHERE
select nome, idade, sexo, dataCadastro from cliente, pessoaFisica
where idCliente = clientePF;

select pf.nome, pf.idade, pf.CPF, m.especialidade, m.dataInicio, e.nome
from pessoaFisica pf, mecanico m, equipe e 
where pf.idPessoaFisica = m.idPFmecanico
	and m.idEquipeMecanico = e.idEquipe;
    
select os.idOrdemDeServico as Cod_Ordem, os.dataEmissao, sum(po.quantidade) as Total_Pecas,sum(p.valor) as Valor_Total
from ordemDeServico os, pecasOrdem po, pecas p
where idOrdemDeServico = idPOordem
	and idPOpecas = idPecas
	and idOrdemDeServico = 5;
-- ATRIBUTOS DERIVADOS
select nome, valor, quantidade, (valor*quantidade) as Valor_Total
from pecas;

select count(nome) as Qnt_tipos_peça, sum(quantidade) as Total_peças, min(valor) as Peça_mais_barata, max(valor) as Peça_mais_cara
from pecas;
-- ORDER BY
select dataEmissao, statusOS, idPOpecas, quantidade
from ordemDeServico, pecasOrdem
where idOrdemDeServico = idPOordem
	and idOrdemDeServico = 1
order by quantidade;

select dataEmissao, statusOS, idSOservico
from ordemDeServico, servicoOrdem
where idOrdemDeServico = idSOordemServico
	and idOrdemDeServico = 1
order by idSoservico desc;

select pf.nome as Cliente, v.modelo as Carro, v.ano, v.cor, os.statusOS as Status, e.nome as Equipe_mec
from veiculo v, pessoaFisica pf, ordemDeServico os, equipe e
where clientePF = idClienteVeiculo
	and idVeiculo = idOSVeiculo
    and idEquipe = idOSEquipe
order by v.ano desc;

-- HAVING
select * from cliente;
select * from veiculo;

select idCliente, count(*) as Total_veiculo
from cliente, veiculo
where idClienteVeiculo = idCliente
group by idCliente
having count(*) = 1;

select idOrdemDeServico as OS, count(*) as Total_tipos_pecas, sum(quantidade) as total_pecas
from ordemDeServico, pecasOrdem
where idOrdemDeServico = idPOordem
group by OS
having Total_tipos_pecas >= 1;

select idOrdemDeServico as OS, count(*) as Total_servico
from ordemDeServico, servicoOrdem
where idOrdemDeServico = idSOordemServico
group by OS
having Total_servico >= 1;
-- JOIN
show tables;
select * from veiculo;
select idOrdemDeServico, dataEmissao, modelo, cor
from ordemDeServico
join veiculo on idVeiculo = idOSVeiculo;

select idOrdemDeServico, dataEmissao, modelo, cor, count(*) as Total_serviços
from ordemDeServico
join veiculo on idVeiculo = idOSVeiculo
join servicoOrdem on idSOordemServico = idOrdemDeServico
group by idOrdemDeServico;


select distinct pf.nome, especialidade, e.nome
from ordemDeServico os
join Equipe e on e.idEquipe = os.idOSEquipe
join Mecanico m on idEquipeMecanico = idEquipe
join PessoaFisica pf on idPessoaFisica = idPFmecanico;
