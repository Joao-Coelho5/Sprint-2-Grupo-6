-- criando o database market_e e colocando em uso
create database market_e;
use market_e;

-- criando a tabela empresa (cadastro)
create table empresa(
id int primary key auto_increment,
nome varchar(30) not null,
cnpj varchar(18) not null,
endereco varchar(150),
telefone varchar(15),
porte char(1) default 'M',
statusCad varchar(20),
unique ix_empresa (nome),
unique ix_cnjp (cnpj),
constraint chkPorte check(porte in('P', 'M', 'G')),
constraint chk_status_cadastro check (statusCad in ('Ativo', 'Manutenção', 'Inativo'))
)auto_increment = 100;


-- criando a tabela usuario
create table usuario(
id int primary key auto_increment,
usuario varchar(30) not null,
email varchar(100),
senha varchar(255) not null,
fkempresa int not null,
constraint fk_empresa foreign key (fkempresa) references empresa(id),
unique ix_usuario (usuario),
unique ix_email (email)
);
            
-- criando a tabela setor_empresa
create table setor(
id int primary key auto_increment,
nome varchar(100) not null,
fkempresa int not null,
constraint fk_empresa_setor foreign key (fkempresa) references empresa(id),
constraint uc_unique_setor_name unique (nome, fkempresa)
);

-- criando a tabela sensor
create table sensor(
id int primary key auto_increment,
fksetor int not null,
statusSens varchar(20) default 'Ativo',
constraint fk_setor foreign key (fksetor) references setor(id),
tipo varchar(30) default 'HC-SR04(Ultrassônico)',
constraint chk_status_sensor check (statusSens in ('Ativo', 'Inativo')) 
)auto_increment = 100;

-- criando a tabela de dados
create table telemetria(
id int primary key auto_increment,
datas datetime not null,
fksensor int not null,
constraint fk_sensor foreign key (fksensor) references sensor(id)
);

-- observação: na coluna dados, o número 0 significa "Sem fluxo" e o número 1 significa "Com fluxo" assim como o sensor mostra no Arduino
-- essa coluna só aceita 0 ou 1

-- inserindo dados na tabela empresa:
insert into empresa (nome, cnpj, endereco, telefone, porte, statusCad) 
values		('Supermercado Bragança', '12.345.678/0001-90', 'Rua A', '(11) 4002-8922', 'G', 'Ativo'),
			('Mercado Top Bragança', '98.765.432/0001-12', 'Rua B', '(11) 99988-7766', 'M', 'Ativo'),
			('Hiper Bragança', '56.789.123/0001-45', 'Rua C', '(11) 98877-6655', 'G', 'Manutenção'),
			('Feira Bragantina', '67.890.234/0001-56', 'Rua D', '(11) 97766-5544', 'P', 'Ativo'),
			('Compre Bem Bragança', '78.901.345/0001-67', 'Rua E', '(11) 96655-4433', 'M', 'Inativo');

-- usando o select na tabela empresa:
select * from empresa;
select * from empresa where telefone like '%5%';
select * from empresa order by cnpj;
select * from empresa order by nome;
select * from empresa;
select id,nome,
	case
		when statusCad = 'Inativo' then 'Seu cadastro está inativo'
        when statusCad = 'Ativo' then 'Está tudo certo'
        when statusCad = 'Manutenção' then 'Estamos tendo um problema com o seu cadastro'
	end as 'status da empresa'
from empresa;


-- inserindo dados na tabela usuario
insert into usuario (usuario, email, senha, fkempresa) 
values		('superbraganca', 'contato@superbraganca.com', 'senha123', 100),
			('mercadotop', 'suporte@mercadotop.com', 'senha456', 101),
			('hiperbra', 'vendas@hiperbra.com', 'senha789', 102),
			('bragafeira', 'atendimento@bragafeira.com', 'senha101', 103),
			('bragafeirauser2', 'atendimento@bragafeira.com.br', 'senha202', 103);

-- usando o select na tabela usuario:   
select * from usuario;
select email from usuario where email like 'a%';
select * from usuario where usuario like '%a';
select usuario from usuario;

-- inserindo dados na tabela setor_empresa
insert into setor (nome, fkempresa) 
values		('Laticínios', 100),
			('Açougue', 100),
			('Higiene', 100),
			('Padaria', 100),
			('Adega', 100),
			('Laticínios', 101),
			('Açougue', 101),
			('Higiene', 101),
			('Padaria', 101),
			('Adega', 101),
			('Laticínios', 102),
			('Açougue', 102),
			('Higiene', 102),
			('Padaria', 102),
			('Adega', 102),
			('Laticínios', 103),
			('Açougue', 103),
			('Higiene', 103),
			('Padaria', 103),
			('Adega', 103);

-- usando o select na tabela setor_empresa:            
select * from setor;
select * from setor where fkempresa = 100;
select nome, id_setor from setor where nome = 'Padaria';
select nome,fkempresa from setor where id = 4;

-- inserindo dados na tabela sensor:
insert into sensor(statusSens, fksetor)
	values  ('Ativo', 1),
			('Ativo', 1),
			('Ativo', 2),
			('Ativo', 2),
            ('Ativo', 3),
			('Ativo', 3),
			('Ativo', 4),
			('Ativo', 4),
			('Ativo', 5),
            ('Ativo', 5),
			('inativo', 6),
			('inativo', 6),
			('inativo', 7),
            ('inativo', 7), 
			('inativo', 8), 
			('Ativo', 8),
			('Ativo', 9),
			('Ativo', 9),
			('Ativo', 10),
			('Ativo', 10),
			('Ativo', 11),
            ('Ativo', 11),
			('Ativo', 12),
			('Ativo', 12),
			('Ativo', 13),
			('inativo', 13),
            ('inativo', 14),
			('inativo', 14),
            ('inativo', 15),
			('inativo', 15),
			('Ativo', 16),
			('Ativo', 16),
			('Ativo', 17),
			('Ativo', 17),
			('Ativo', 18),
			('Ativo', 18),
            ('Ativo', 19),
			('Ativo', 19),
			('Ativo', 20),
			('Ativo', 20);

-- usando o select na tabela sensor:            
select * from sensor;
select * from sensor where id = 102;
select statusSens from sensor;
select id,
	case
		when statusSens = 'Inativo' then 'Seu sensor está inativo'
        when statusSens = 'Ativo' then 'Está tudo certo com o seu sensor'
	end as 'status do sensor'
from sensor;

-- inserindo dados na tabela de dados dos sensores
insert into telemetria(datas, fksensor)
values 		('2025-03-12 08:15:00', 100),
			('2025-03-12 08:30:00', 101),
			('2025-03-12 08:45:00', 102),
			('2025-03-12 09:00:00', 103),
			('2025-03-12 09:15:00', 104),
			('2025-03-12 09:30:00', 105),
            ('2025-03-12 09:30:00', 124),
			('2025-03-12 09:45:00', 106),
			('2025-03-12 09:45:00', 100),
			('2025-03-12 10:00:00', 107),
			('2025-03-12 10:15:00', 108),
            ('2025-03-12 10:15:00', 118),
			('2025-03-12 10:30:00', 109),
			('2025-03-12 10:45:00', 115),
			('2025-03-12 11:00:00', 116),
			('2025-03-12 11:15:00', 117),
			('2025-03-12 11:30:00', 118),
			('2025-03-12 11:45:00', 119),
            ('2025-03-12 11:45:00', 123),
			('2025-03-12 12:00:00', 120),
			('2025-03-12 12:15:00', 121),
			('2025-03-12 12:30:00', 122),
			('2025-03-12 12:45:00', 123),
			('2025-03-12 13:00:00', 124),
            ('2025-03-12 13:00:00', 120),
			('2025-03-12 13:15:00', 130),
			('2025-03-12 13:30:00', 131),
			('2025-03-12 13:45:00', 132),
			('2025-03-12 14:00:00', 133),
			('2025-03-12 14:15:00', 134),
			('2025-03-12 14:30:00', 135),
			('2025-03-12 14:45:00', 136),
			('2025-03-12 14:45:00', 121),
			('2025-03-12 15:00:00', 137),
			('2025-03-12 15:15:00', 138),
            ('2025-03-12 15:30:00', 139),
            ('2025-03-12 15:45:00', 100),
            ('2025-03-12 16:00:00', 131),
            ('2025-03-12 16:15:00', 132),
            ('2025-03-12 16:30:00', 133),
            ('2025-03-12 16:30:00', 124),
            ('2025-03-12 16:45:00', 134),
            ('2025-03-12 16:45:00', 130),
            ('2025-03-12 17:00:00', 135),
            ('2025-03-12 17:15:00', 136),
            ('2025-03-12 17:15:00', 139),
            ('2025-03-12 17:30:00', 137);

select * from telemetria;
select * from telemetria where fksensor = 131;
select id, fksensor from telemetria where datas = '2025-03-12 17:15:00';
select * from telemetria where data like '%09:%';

drop database market_e;