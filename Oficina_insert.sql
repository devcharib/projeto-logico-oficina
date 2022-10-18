use oficina;
show tables;

select * from cliente; -- idCliente**, dataCadastro
INSERT INTO cliente (dataCadastro) VALUES 
					('2022-01-15'),
					('2022-01-25'),
					('2022-02-05'),
					('2022-04-13'),
					('2022-05-22');
-- 
select * from oficina; -- idOficina**, Nome, Endereco, Telefone, CNPJ
INSERT INTO oficina (Nome, Endereco, Telefone, CNPJ) VALUES 
					('Oficina Pit Stop Brasil', 'Avenida 13 de maio - 1500 - Fortaleza - CE - 61650920','8534541551', 12547898630001);
--
select * from servicos; -- idServico, nome, descricao, valor, tempoGastoHoras
INSERT INTO servicos (nome, descricao, valor, tempoGastoHoras) VALUES
					 ('Troca de Óleo','Troca de óleo do motor',85.00,1),
                     ('Alinhamento','Alinhamento de direção',150.00,2),
                     ('Balanceamento','Balanciamento da direção',95.00,1),
                     ('Manutenção de Embreagem','Regulagem e troca de componentes',80.00,1),
                     ('Troca de Filtros','Troca de componente e ajuste',50.00,1),
                     ('Troca de Lâmpadas','Troca de componente e teste',30.00,1),
                     ('Troca de Velas','Troca de compponente e teste',45.00,1),
                     ('Motor de Arranque','Limpeza e ajustes',80.00,2),
                     ('Troca de Pneus','Troca de Pneus e calibração',50.00,2),
                     ('Revisão do Freio','Limpeza e regulagem',75.00,2);
--
select * from pecas; -- idPecas, nome, valor, descricao, garantia, quantidade
INSERT INTO pecas (nome, valor, descricao, garantia, quantidade) VALUES
			('Óleo para motor 50w10',45.00,'óleo para motor até 1000km','sem garantia',100),
            ('Freio dianteiro',25.00,'pastilhas de freio','2 meses',50),
            ('Freio traseiro',25.00,'pastilhas de freio','2 meses',50),
            ('Motor de arranque',300.00,'motor de arranque universal','1 ano',30),
            ('Kit de embreagem',150.00,'componentes da embreagem','1 mês',25),
            ('Filtro de óleo',40.00,'componente filtrante para motor','3 meses',10),
            ('Filtro de ar',35.00,'componente filtrante','2 meses',15),
            ('Pivô da direção',175.00,'peça para direção','6 meses',5),
            ('Kit reparo deslizante',200.00,'sistema de direção e suspensão','1 ano',5),
            ('Velas de ignição',45.00,'componente de funcionamento','3 meses',30);
--
select * from pessoaFisica;-- idPessoaFisica, clientePF, nome, idade, sexo, endereco, telefone, CPF
INSERT INTO pessoaFisica (clientePF, nome, idade, sexo, endereco, telefone, CPF) VALUES
			(1,'Fulano Costa Mendes',45,'M','Rua Jucelino Amadeu - 455 - Fortaleza - CE','85912346589',04158795632),
            (3,'Sicrano Fernandes Sá',32,'M','Rua Dionisio Torres - 1004 - Fortaleza - CE','85954887456',05485693214),
            (5,'Beltrano Jobson Nunes',27,'M','Rua Ruy Barbosa - 754 - Fortaleza - CE','85912459857',22354879521);
--
select * from pessoaJuridica; -- idPessoaJuridica, clientePJ, razaoSocial, endereco, telefone, CNPJ
INSERT INTO pessoaJuridica (clientePJ, razaoSocial, endereco, telefone, CNPJ) VALUES
			(2,'Locação SoftCar','Av. Parque José - 878 - Fortaleza - CE','8533654563',54896321540001),
            (4,'Petshop Dias','Av. Godofredo Maciel - 665 - Fortaleza - CE','8534345828',65421895640001);
--
select * from veiculo; -- idVeiculo, idClienteVeiculo, modelo, marca, placa, combustivel(enum), ano(char), cor, quilometragem
INSERT INTO veiculo (idClienteVeiculo, modelo, marca, placa, combustivel, ano, cor, quilometragem) VALUES
			(1,'Uno','Fiat','KIO3T7U','Gasolina',2010,'Branco',81548),
            (2,'Ka','Ford','POL9A0J','Gasolina',2012,'Azul',65489),
            (3,'City','Honda','POQ9J7A','Flex',2020,'Prata',15000),
            (4,'Uno','Fiat','MVB6O1S','Gasolina',2019,'Vinho',25045),
            (5,'Civic','Honda','CXV7G9A','Flex',2022,'Preto',2500),
            (2,'Corolla','Toyota','TRD7B5D','Flex',2021,'Branco',7500),
            (4,'Onix','Chevrolet','QOI7C4N','Gasolina',2018,'Vermelho',35012),
            (2,'Onix','Chevrolet','KIH9W3E','Gasolina',2019,'Preto',28050);
--
select * from clienteOficina; -- idCOCliente, idCOOficina, dataVisita
INSERT INTO clienteOficina (idCOCliente, idCOOficina, dataVisita) VALUES
			(1,1,'2022-08-09'),
            (5,1,'2022-08-29'),
            (2,1,'2022-09-10'),
            (3,1,'2022-09-14'),
            (4,1,'2022-10-25');
--
select * from equipe; -- idEquipe, idEquipeOficina, nome, dataCriacao
INSERT INTO equipe (idEquipeOficina, nome, dataCriacao) VALUES
			(1,'Azul','2022-06-15'),
            (1,'Amarelo','2022-06-20'),
            (1,'Verde','2022-06-22');
            
--
select * from ordemDeServico; -- idOrdemDeServico, idOSVeiculo, idOSEquipe, dataEmissao, valor, statusOS(enum), dataConclusao, autorizacao(bolean) 'Em execução', 'Finalizado')
INSERT INTO ordemDeServico (idOSVeiculo, idOSEquipe, dataEmissao, valor, statusOS, dataConclusao, autorizacao) VALUES
			( 1, 1,'2022-08-10',1850.75,'Finalizado','2022-08-13',1),
            ( 2, 2,'2022-09-11',957.80,'Em execução','2022-09-13',1),
            ( 3, 3,'2022-09-15',548.50,'Em execução','2022-09-17',1),
            ( 4, 1,'2022-10-26',800.00,'Esperando autorização','2022-10-28',1),
            ( 5, 3,'2022-08-30',1294.30,'Finalizado','2022-09-02',1);
--
select * from servicoOrdem; -- idSOservico, idSOordemServico
INSERT INTO servicoOrdem (idSOservico, idSOordemServico) VALUES
			(1,1),
            (4,1),
            (7,1),
            (2,2),
            (3,2),
            (5,2),
            (4,3),
            (8,3),
            (10,3),
            (1,4),
            (6,4),
            (9,4),
            (1,5),
            (2,5),
            (3,5);
--
select * from pecasOrdem; -- idPOpecas, idPOordem, quantidade
INSERT INTO pecasOrdem (idPOpecas, idPOordem, quantidade) VALUES
			(1,1,1),
            (5,1,1),
            (10,1,4),
            (8,2,1),
            (9,2,1),
            (6,2,1),
            (5,3,1),
            (2,3,2),
            (3,3,2),
            (4,3,1),
            (1,4,1),
            (1,5,1),
            (4,5,1);
--
select * from mecanico; -- idMecanico, idPFmecanico, idEquipeMecanico, especialidade, dataInicio
INSERT INTO mecanico (idPFmecanico, idEquipeMecanico, especialidade, dataInicio) VALUES
			( 4, 1,'Alinhamento','2022-06-16'),
            ( 5, 1,'Motor Flex','2022-06-16'),
            ( 6, 1,'Elétrica automotiva','2022-06-16'),
            ( 7, 2,'Motor Gasolina e Diesel','2022-06-21'),
            ( 8, 2,'Elétrica e Suspensão','2022-06-21'),
            ( 9, 2,'Balanceameno e Elétrica','2022-06-21'),
            ( 10, 3,'Motor Flex','2022-06-23'),
            ( 11, 3,'Suspensão e Freios','2022-06-23'),
            ( 12, 3,'Elétrica automotiva','2022-06-23');
-- 
select * from pessoaFisica;
INSERT INTO pessoaFisica (nome, idade, sexo, endereco, telefone, CPF) VALUES
            ('Abraao Lincoln Ferreira',49,'M','Rua Pedro Pereira - 6589 - Fortaleza - CE','85912546987',04412547854),
            ('Anderson Silva Rodrigues',40,'M','Rua Guilherme Rocha - 1354 - Fortaleza - CE','85996329856',65198547856),
            ('Alberto Melo Lopes',39,'M','Rua Treze - 57 - Fortaleza - CE','8596878521',92365898741),
            ('João Inacio Teles',24,'M','Rua 24 de Maio - 200 - Fortaleza - CE','85995127532',12569854785),
            ('Antonio Machado Rocha',29,'M','Rua Liberato Barroso - 669 - Fortaleza - CE','859987456321',23659854125),
            ('Marlon Pedro Santos',30,'M','Rua Senhor Melo - 514 - Fortaleza - CE','85991658754',32654587491),
            ('Tony Ferreira Silva',28,'M','Rua 22 de Abril - 1008 - Fortaleza - CE','85999524561',45896854123),
            ('Vitor Luiz Alves',20,'M','Rua Tulipas - 58 - Fortaleza - CE','85988551246',54896854712);
            
