-- DROP DATABASE oficina;
show databases;
CREATE DATABASE IF NOT EXISTS oficina;
use oficina;
show tables;

CREATE TABLE oficina(
	idOficina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(25) NOT NULL,
    CNPJ CHAR(14) NOT NULL ,
    CONSTRAINT cpnj_oficina_unique UNIQUE (CNPJ)
);

CREATE TABLE cliente(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    dataCadastro DATE NOT NULL
);

CREATE TABLE pecas(
	idPecas INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    valor DOUBLE NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    garantia VARCHAR(45),
    quantidade INT NOT NULL
);

CREATE TABLE servicos(
	idServico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor DOUBLE NOT NULL,
    tempoGastoHoras INT
);

-- ###########################################################

CREATE TABLE pessoaFisica(
	idPessoaFisica INT PRIMARY KEY AUTO_INCREMENT,
    clientePF INT,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    sexo CHAR NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(25) NOT NULL,
    CPF CHAR(11) NOT NULL,
    CONSTRAINT cpf_pf_unique UNIQUE (CPF),
    CONSTRAINT pessoafisica_cliente_FK FOREIGN KEY (clientePF) REFERENCES cliente(idCliente)
);

CREATE TABLE pessoaJuridica(
	idPessoaJuridica INT PRIMARY KEY AUTO_INCREMENT,
    clientePJ INT,
    razaoSocial VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(25) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    CONSTRAINT cnpj_pj_unique UNIQUE (CNPJ),
    CONSTRAINT pessoajuridica_cliente_FK FOREIGN KEY (clientePJ) REFERENCES cliente(idCliente)
);

CREATE TABLE veiculo(
	idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    idClienteVeiculo INT,
    modelo VARCHAR(45) NOT NULL,
    marca VARCHAR(45) NOT NULL,
    placa VARCHAR(45) NOT NULL,
    combustivel ENUM('Alcool','Gasolina','Flex') NOT NULL,
    ano CHAR(4) NOT NULL,
    cor VARCHAR(45) NOT NULL,
    quilometragem INT NOT NULL,
    CONSTRAINT placa_veiculo_unique UNIQUE (placa),
    CONSTRAINT veiculo_cliente_FK FOREIGN KEY (idClienteVeiculo) REFERENCES cliente(idCliente)
);

CREATE TABLE clienteOficina(
	idCOCliente INT,
    idCOOficina INT,
    dataVisita DATE NOT NULL,
    CONSTRAINT cliofi_cliente_FK FOREIGN KEY (idCOCliente) REFERENCES cliente(idCliente),
    CONSTRAINT cliofi_oficina_FK FOREIGN KEY (idCOOficina) REFERENCES oficina(idOficina)
);

CREATE TABLE equipe(
	idEquipe INT PRIMARY KEY AUTO_INCREMENT,
    idEquipeOficina INT,
    nome VARCHAR(45) NOT NULL,
    dataCriacao DATE NOT NULL,
    CONSTRAINT equipe_oficina_FK FOREIGN KEY (idEquipeOficina) REFERENCES oficina(idOficina)
);

CREATE TABLE ordemDeServico(
	idOrdemDeServico INT PRIMARY KEY AUTO_INCREMENT,
    idOSVeiculo INT,
    idOSEquipe INt,
    dataEmissao DATE NOT NULL,
    valor DOUBLE NOT NULL,
    statusOS ENUM('Esperando autorização', 'Em execução', 'Finalizado') NOT NULL DEFAULT 'Esperando autorização',
    dataConclusao DATE,
    autorizacao BOOLEAN DEFAULT FALSE,
    CONSTRAINT ordemDeServico_veiculo_FK FOREIGN KEY (idOSVeiculo) REFERENCES veiculo(idVeiculo),
    CONSTRAINT ordemDeServico_equipe_FK FOREIGN KEY (idOSEquipe) REFERENCES equipe(idEquipe)
);

CREATE TABLE servicoOrdem(
	idSOservico INT,
    idSOordemServico INT,
    CONSTRAINT SO_servico_FK FOREIGN KEY (idSOservico) REFERENCES servicos(idServico),
    CONSTRAINT SO_ordemDeServico_FK FOREIGN KEY (idSOordemServico) REFERENCES ordemDeServico(idOrdemDeServico)
);

CREATE TABLE pecasOrdem(
	idPOpecas INT,
    idPOordem INT,
    quantidade INT DEFAULT 1,
    CONSTRAINT pecasOrdem_pecas_FK FOREIGN KEY (idPOpecas) REFERENCES pecas(idPecas),
    CONSTRAINT pecasOrdem_ordemDeServico_FK FOREIGN KEY (idPOordem) REFERENCES ordemDeServico(idOrdemDeServico)
);

CREATE TABLE mecanico(
	idMecanico INT PRIMARY KEY AUTO_INCREMENT,
    idPFmecanico INT,
    idEquipeMecanico INT,
    especialidade VARCHAR(45) NOT NULL,
    dataInicio DATE NOT NULL,
    CONSTRAINT mecanico_pessoaFisica_FK FOREIGN KEY (idPFmecanico) REFERENCES pessoaFisica(idPessoaFisica),
    CONSTRAINT mecanico_equipe_FK FOREIGN KEY (idEquipeMecanico) REFERENCES equipe(idEquipe)
);
