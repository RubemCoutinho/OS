INSERT INTO cliente (fname, lname, tipo_cliente, cpf_cnpj, endereço, telefone, email, inscricao_estadual, razao_social, nome_responsavel, data_nascimento)
			VALUES ('João', 'Silva', 'PF', '12345678901', 'Rua A, 123', '987654321', 'joao.silva@example.com', NULL, NULL, NULL, '1990-05-10'),
				   ('Empresa X', NULL, 'PJ', '1234567890001', 'Rua B, 456', '987654321', 'empresa.x@example.com', '1234567890', 'Empresa X LTDA', 'Fernando', NULL),
                   ('Maria', 'Santos', 'PF', '98765432109', 'Av. C, 789', '123456789', 'maria.santos@example.com', NULL, NULL, NULL, '1985-09-20'),
                   ('Empresa Y', NULL, 'PJ', '9876543210001', 'Av. D, 987', '123456789', 'empresa.y@example.com', '9876543210', 'Empresa Y LTDA', 'Roberto', NULL);
                   
INSERT INTO veiculo (idcliente, marca, modelo, ano, placa)
			VALUES 	  (1, 'Chevrolet', 'Cruze', '2018', 'ABC1234'),
					  (2, 'Ford', 'Fiesta', '2015', 'DEF5678'),
                      (3, 'Volkswagen', 'Gol', '2017', 'GHI9012'),
                      (4, 'Toyota', 'Corolla', '2020', 'JKL3456');
                      
INSERT INTO mecanico_responsável (fname, lname, cpf)
			VALUES ('Maria', 'Silva', '12345678901'),
				   ('João', 'Santos', '23456789012'),
                   ('Ana', 'Ferreira', '34567890123'),
				   ('Pedro', 'Gomes', '45678901234');
                   

INSERT INTO pedido_os (idVeiculo, idMecanico_Responsavel, dataAbertura, statusOr, descricaoServico, valorTotal)
			VALUES (1, 1, '2023-07-12', 'AGUARDANDO APROVAÇÃO', 'Troca de óleo e filtros', 150.00),
				   (2, 2, '2023-07-15', 'AGUARDANDO APROVAÇÃO', 'Revisão completa', 250.00),
                   (3, 3, '2023-07-20', 'ORÇAMENTO APROVADO', 'Troca de pneus', 300.00),
                   (4, 4, '2023-07-25', 'AGUARDANDO APROVAÇÃO', 'Substituição do sistema de freios', 500.00);

INSERT INTO os (idROrder) values (3);

INSERT INTO os (idOs,idROrder, valorTotal, dataAprovacao, observacoes)
VALUES (3,1, 250.00, '2023-07-15', 'Serviço aprovado. Aguardando início das atividades.');

update os set dataAprovacao='2023-07-23', observacoes='teste' where idOs=1;

-- todos os produtos em andamento ou concluído
select concat(marca,' ',v.modelo ) as OBJETO, r.fname as MECANICO, statusOr from pedido_os join veiculo as v on pedido_os.idVeiculo=v.idVeiculo
												 join mecanico_responsável as r on idMecanico_Responsavel=idResponsavel;
-- retorna todos os pedidos que se tornaram uma ordem de serviço, na minha interpretação viraram um produto, ou seja, foram entregues.
select * from pedido_os join os on idOrdem=idRorder;

desc pedido_os;
