
INSERT INTO produtos (nome, descricao, preco, estoque) VALUES
('Notebook Dell', 'Notebook i5 8GB RAM', 3500.00, 10),
('Mouse Gamer', 'Mouse RGB 16000 DPI', 150.00, 50),
('Teclado Mecânico', 'Teclado switch blue', 300.00, 30),
('Monitor 24"', 'Monitor Full HD', 900.00, 20),
('Headset', 'Headset com microfone', 200.00, 25);
('Webcam Full HD', 'Webcam 1080p com microfone embutido', 250.00, 15),
('Cadeira Gamer', 'Cadeira ergonômica reclinável', 1200.00, 8);

INSERT INTO clientes (nomeCompleto, cpf, email, telefone, cep) VALUES
('João Silva', '12345678901', 'joao@email.com', '11999999999', '01001000'),
('Maria Oliveira', '23456789012', 'maria@email.com', '11988888888', '02002000'),
('Carlos Souza', '34567890123', 'carlos@email.com', '11977777777', '03003000');
('Ana Pereira', '45678901234', 'ana@email.com', '11966666666', '04004000'),
('Bruno Costa', '56789012345', 'bruno@email.com', '11955555555', '05005000'),
('Fernanda Lima', '67890123456', 'fernanda@email.com', '11944444444', '06006000'),
('Ricardo Alves', '78901234567', 'ricardo@email.com', '11933333333', '07007000'),
('Patricia Gomes', '89012345678', 'patricia@email.com', '11922222222', '08008000'),
('Lucas Martins', '90123456789', 'lucas@email.com', '11911111111', '09009000'),
('Juliana Rocha', '11223344556', 'juliana@email.com', '11900000000', '10010000');

INSERT INTO pedidos (clientes_cliente_id, valor_total) VALUES
(1, 3650.00), -- João
(2, 1050.00), -- Maria
(3, 500.00);  -- Carlos

INSERT INTO pedidos (clientes_cliente_id, data_pedido, valor_total) VALUES
(1, '2026-03-01', 3650.00), -- João
(2, '2026-03-05', 1050.00), -- Maria
(3, '2026-03-10', 500.00);  -- Carlos