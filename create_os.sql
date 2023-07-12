create database OS;
use OS;
drop database os;

-- no cenário que desenvolvi esse bd, a oficina pode prestar serviços a uma empresa/pj

-- criando a tabela cliente
create table cliente (
        idCliente INT PRIMARY KEY auto_increment,
        fname VARCHAR(15),
        lname varchar(15),
        tipo_cliente VARCHAR(2) NOT NULL,
        cpf_cnpj VARCHAR(14) NOT NULL unique,
        endereço VARCHAR(200) NOT NULL,
        telefone VARCHAR(15) NOT NULL,
        email VARCHAR(100) NOT NULL,
        inscricao_estadual VARCHAR(20),
        razao_social VARCHAR(100),
        nome_responsavel VARCHAR(100),
        data_nascimento DATE,
        CONSTRAINT tipo_cliente CHECK (tipo_cliente IN ('PJ', 'PF'))
);
drop table veiculo;

-- criando a tabela veiculo
create table veiculo (
        idveiculo int primary key auto_increment,
        idcliente int,
        marca varchar(10),
        modelo varchar(10),
        ano varchar(10),
        placa varchar(10) unique,
        constraint pk_idcliente_veiculo foreign key (idcliente) references cliente(idCliente)
);

-- criando a tabela funcionário_mecâncico
create table mecanico_responsável(
        idResponsavel int primary key auto_increment,
        fname varchar(15),
        lname varchar(15),
        cpf char(11) unique
);

-- criando a tabela pedido de ordem de serviço
create table pedido_os (
        idOrdem INT PRIMARY KEY auto_increment,
        idVeiculo int,
        idMecanico_Responsavel int,
        dataAbertura DATE NOT NULL,
        statusOr enum('AGUARDANDO APROVAÇÃO','ORÇAMENTO APROVADO'),
        descricaoServico VARCHAR(200) NOT NULL,
        valorTotal DECIMAL(10, 2) NOT NULL,
        constraint fk_veiculo_cliente foreign key (idVeiculo) references veiculo(idveiculo),
        constraint fk_responsavel_mecanico foreign key (idMecanico_Responsavel) references mecanico_responsável(idResponsavel),
        CONSTRAINT statusOr CHECK (statusOr IN ('AGUARDANDO APROVAÇÃO', 'ORÇAMENTO APROVADO'))
);
drop table os;

-- criando a tabela de ordem e serviço
create table os (
        idOs int primary key auto_increment,
        idROrder int,
        constraint fk_idOrder_referential foreign key (idROrder) references pedido_os(idOrdem));

desc os;

ALTER TABLE  os    
ADD COLUMN dataAprovacao DATE,
ADD COLUMN observacoes VARCHAR(200);
