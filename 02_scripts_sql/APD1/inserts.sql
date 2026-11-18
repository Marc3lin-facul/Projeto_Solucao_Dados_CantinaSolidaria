USE db_vendas_campus;

-- 1. Inserindo 25 USUARIOS (IDs 1 a 20 serão vendedores; 21 a 25 compradores/admins)
INSERT INTO USUARIOS (nome, email, vinculo, campus, telefone, papel, ativo) VALUES
('Ana Paula Silva', 'ana.silva@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99111-0001', 'vendedor', 1),
('Bruno Costa', 'bruno.costa@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99111-0002', 'vendedor', 1),
('Carla Mendes', 'carla.mendes@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99111-0003', 'vendedor', 1),
('Diego Oliveira', 'diego.oliveira@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99111-0004', 'vendedor', 1),
('Eduarda Santos', 'eduarda.santos@ifrj.edu.br', 'Aluno', 'São Gonçalo', '(21) 99111-0005', 'vendedor', 1),
('Felipe Rocha', 'felipe.rocha@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99111-0006', 'vendedor', 1),
('Gabriela Lima', 'gabriela.lima@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99111-0007', 'vendedor', 1),
('Henrique Alves', 'henrique.alves@ifrj.edu.br', 'Aluno', 'Maracanã', '(21) 99111-0008', 'vendedor', 1),
('Isabela Souza', 'isabela.souza@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99111-0009', 'vendedor', 1),
('João Pedro Gomes', 'joao.gomes@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99111-0010', 'vendedor', 1),
('Karina Martins', 'karina.martins@ifrj.edu.br', 'Aluno', 'São Gonçalo', '(21) 99111-0011', 'vendedor', 1),
('Lucas Ferreira', 'lucas.ferreira@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99111-0012', 'vendedor', 1),
('Mariana Ribeiro', 'mariana.ribeiro@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99111-0013', 'vendedor', 1),
('Nicolas Barbosa', 'nicolas.barbosa@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99111-0014', 'vendedor', 1),
('Olivia Castro', 'olivia.castro@ifrj.edu.br', 'Aluno', 'Maracanã', '(21) 99111-0015', 'vendedor', 1),
('Paulo Henrique', 'paulo.henrique@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99111-0016', 'vendedor', 1),
('Quesia Dias', 'quesia.dias@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99111-0017', 'vendedor', 1),
('Rafael Teixeira', 'rafael.teixeira@ifrj.edu.br', 'Aluno', 'São Gonçalo', '(21) 99111-0018', 'vendedor', 1),
('Sofia Moreira', 'sofia.moreira@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99111-0019', 'vendedor', 1),
('Thiago Nunes', 'thiago.nunes@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99111-0020', 'vendedor', 1),
('Prof. Hélvio Jr', 'helvio.jr@ifrj.edu.br', 'Professor', 'Niterói', '(21) 99222-0021', 'admin', 1),
('Valéria Campos', 'valeria.campos@ifrj.edu.br', 'Servidor', 'Niterói', '(21) 99222-0022', 'admin', 1),
('Wagner Pires', 'wagner.pires@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99222-0023', 'comprador', 1),
('Yasmin Duarte', 'yasmin.duarte@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99222-0024', 'comprador', 1),
('Zeca Pagodinho', 'zeca.aluno@ifrj.edu.br', 'Aluno', 'Niterói', '(21) 99222-0025', 'comprador', 0);

-- 2. Inserindo 20 PERFIS_VENDEDOR
INSERT INTO PERFIS_VENDEDOR (usuario_id, apresentacao, turnos_habituais, chave_pix) VALUES
(1, 'Doces gourmet e brownies artesanais', 'Manhã e Tarde', 'ana.silva@ifrj.edu.br'),
(2, 'Salgados assados na hora', 'Tarde e Noite', '21991110002'),
(3, 'Bolos de pote variados', 'Manhã', 'carla.mendes@ifrj.edu.br'),
(4, 'Sanduíches naturais e sucos', 'Manhã e Tarde', '21991110004'),
(5, 'Trufas e bombons recheados', 'Tarde', 'eduarda.santos@ifrj.edu.br'),
(6, 'Empadões e tortas salgadas', 'Noite', '21991110006'),
(7, 'Cookies americanos recém-saídos do forno', 'Tarde', 'gabriela.lima@ifrj.edu.br'),
(8, 'Café gelado e capuccino artesanal', 'Manhã e Noite', '21991110008'),
(9, 'Brigadeiros tradicionais e gourmet', 'Manhã e Tarde', 'isabela.souza@ifrj.edu.br'),
(10, 'Pão de queijo mineiro quentinho', 'Manhã', '21991110010'),
(11, 'Açaí no copo com acompanhamentos', 'Tarde', 'karina.martins@ifrj.edu.br'),
(12, 'Marmitas fit sob encomenda', 'Tarde', '21991110012'),
(13, 'Palha italiana de leite ninho', 'Manhã e Tarde', 'mariana.ribeiro@ifrj.edu.br'),
(14, 'Pastéis de forno diversos sabores', 'Noite', '21991110014'),
(15, 'Geladinhos gourmet cremosos', 'Tarde', 'olivia.castro@ifrj.edu.br'),
(16, 'Croissants recheados', 'Manhã e Noite', '21991110016'),
(17, 'Donuts decorados', 'Tarde', 'quesia.dias@ifrj.edu.br'),
(18, 'Esfihas abertas e fechadas', 'Noite', '21991110018'),
(19, 'Tortinhas de limão e maracujá', 'Manhã e Tarde', 'sofia.moreira@ifrj.edu.br'),
(20, 'Pipoca gourmet caramelizada', 'Tarde e Noite', '21991110020');

-- 3. Inserindo 20 PRODUTOS
INSERT INTO PRODUTOS (vendedor_id, nome, descricao, tipo, categoria, preco_unitario, url_foto, disponivel, aceita_encomenda, ativo) VALUES
(1, 'Brownie de Chocolate Belga', 'Brownie molhadinho com nozes', 'Pronta entrega', 'Doces', 8.00, 'img/brownie.jpg', 1, 1, 1),
(2, 'Joelho de Queijo e Presunto', 'Salgado assado grande', 'Pronta entrega', 'Salgados', 7.50, 'img/joelho.jpg', 1, 0, 1),
(3, 'Bolo de Pote Ninho com Nutella', '250ml de puro recheio', 'Pronta entrega', 'Doces', 12.00, 'img/bolopote.jpg', 1, 1, 1),
(4, 'Sanduíche Natural de Frango', 'Pão integral, frango desfiado e cenoura', 'Encomenda', 'Lanches', 10.00, 'img/sanduiche.jpg', 1, 1, 1),
(5, 'Trufa de Maracujá', 'Chocolate meio amargo recheado', 'Pronta entrega', 'Doces', 4.50, 'img/trufa.jpg', 1, 1, 1),
(6, 'Empadão de Frango com Catupiry', 'Fatia generosa 200g', 'Pronta entrega', 'Salgados', 11.00, 'img/empadao.jpg', 1, 1, 1),
(7, 'Cookie Tradicional Gotas', 'Cookie crocante por fora e macio por dentro', 'Pronta entrega', 'Doces', 6.50, 'img/cookie.jpg', 1, 0, 1),
(8, 'Iced Coffee Caramelo', 'Copo 300ml gelado', 'Pronta entrega', 'Bebidas', 9.00, 'img/coffee.jpg', 1, 0, 1),
(9, 'Caixa 4 Brigadeiros Gourmet', 'Sabores variados', 'Encomenda', 'Doces', 14.00, 'img/brigadeiro.jpg', 1, 1, 1),
(10, 'Porção Pão de Queijo (6 un)', 'Quentinho na hora', 'Pronta entrega', 'Salgados', 6.00, 'img/paodequeijo.jpg', 1, 0, 1),
(11, 'Copo Açaí 300ml', 'Com banana e granola', 'Pronta entrega', 'Sobremesas', 13.00, 'img/acai.jpg', 1, 0, 1),
(12, 'Marmita Fit Frango Grelhado', 'Arroz integral, feijão e legumes', 'Encomenda', 'Refeições', 18.00, 'img/marmita.jpg', 1, 1, 1),
(13, 'Palha Italiana Tradicional', 'Embalagem individual 80g', 'Pronta entrega', 'Doces', 5.50, 'img/palha.jpg', 1, 1, 1),
(14, 'Pastel de Forno Carne Seca', 'Massa podre leve', 'Pronta entrega', 'Salgados', 7.00, 'img/pastel.jpg', 1, 0, 1),
(15, 'Sacolé Gourmet Oreo', 'Cremoso 150ml', 'Pronta entrega', 'Sobremesas', 5.00, 'img/sacole.jpg', 1, 0, 1),
(16, 'Croissant Chocolate', 'Massa folhada artesanal', 'Pronta entrega', 'Lanches', 9.50, 'img/croissant.jpg', 1, 1, 1),
(17, 'Donut Homer Simpson', 'Cobertura rosa com confeitos', 'Encomenda', 'Doces', 8.50, 'img/donut.jpg', 1, 1, 1),
(18, 'Combo 3 Esfihas Carne', 'Temperadas com limão', 'Pronta entrega', 'Salgados', 12.00, 'img/esfiha.jpg', 1, 1, 1),
(19, 'Tortinha de Limão', 'Base de biscoito e merengue', 'Pronta entrega', 'Doces', 9.00, 'img/tortinha.jpg', 1, 0, 1),
(20, 'Pipoca Gourmet Leite Ninho', 'Pacote 100g', 'Pronta entrega', 'Doces', 7.00, 'img/pipoca.jpg', 0, 0, 0); -- Produto inativo para teste de subconsulta

-- 4. Inserindo 20 OFERTAS_DATA
INSERT INTO OFERTAS_DATA (produto_id, data_disponivel, turno, quantidade_prevista) VALUES
(1, '2026-11-17', 'Manhã', 20), (2, '2026-11-17', 'Tarde', 30),
(3, '2026-11-17', 'Manhã', 15), (4, '2026-11-17', 'Tarde', 12),
(5, '2026-11-18', 'Tarde', 40), (6, '2026-11-18', 'Noite', 18),
(7, '2026-11-18', 'Tarde', 25), (8, '2026-11-18', 'Manhã', 20),
(9, '2026-11-19', 'Manhã', 10), (10, '2026-11-19', 'Manhã', 35),
(11, '2026-11-19', 'Tarde', 20), (12, '2026-11-19', 'Tarde', 15),
(13, '2026-11-20', 'Manhã', 30), (14, '2026-11-20', 'Noite', 25),
(15, '2026-11-20', 'Tarde', 40), (16, '2026-11-20', 'Manhã', 15),
(17, '2026-11-21', 'Tarde', 12), (18, '2026-11-21', 'Noite', 20),
(19, '2026-11-21', 'Manhã', 16), (1, '2026-11-21', 'Tarde', 20);

-- 5. Inserindo 20 PEDIDOS
INSERT INTO PEDIDOS (comprador_id, vendedor_id, data_retirada, faixa_horario, status, observacoes, motivo_cancelamento, data_entrega, valor_total) VALUES
(23, 1, '2026-11-17', '09:30 - 10:00', 'Entregue', 'Sem nozes se possível', NULL, '2026-11-17 09:45:00', 16.00),
(24, 2, '2026-11-17', '15:00 - 15:30', 'Entregue', 'Mandar guardanapo', NULL, '2026-11-17 15:10:00', 15.00),
(21, 3, '2026-11-17', '10:00 - 10:30', 'Entregue', NULL, NULL, '2026-11-17 10:05:00', 24.00),
(22, 4, '2026-11-17', '12:00 - 12:30', 'Confirmado', 'Entregar na sala dos professores', NULL, NULL, 20.00),
(23, 5, '2026-11-18', '14:00 - 14:30', 'Entregue', NULL, NULL, '2026-11-18 14:15:00', 18.00),
(24, 6, '2026-11-18', '18:30 - 19:00', 'Entregue', 'Esquentar antes', NULL, '2026-11-18 18:40:00', 22.00),
(21, 7, '2026-11-18', '16:00 - 16:30', 'Entregue', NULL, NULL, '2026-11-18 16:10:00', 19.50),
(22, 8, '2026-11-18', '08:30 - 09:00', 'Entregue', 'Pouco gelo', NULL, '2026-11-18 08:45:00', 18.00),
(23, 9, '2026-11-19', '10:00 - 10:30', 'Entregue', 'Para presente', NULL, '2026-11-19 10:15:00', 28.00),
(24, 10, '2026-11-19', '09:30 - 10:00', 'Entregue', NULL, NULL, '2026-11-19 09:35:00', 12.00),
(21, 11, '2026-11-19', '15:00 - 15:30', 'Entregue', 'Caprichar na granola', NULL, '2026-11-19 15:20:00', 26.00),
(22, 12, '2026-11-19', '12:30 - 13:00', 'Entregue', 'Sem cebola', NULL, '2026-11-19 12:35:00', 36.00),
(23, 13, '2026-11-20', '10:00 - 10:30', 'Entregue', NULL, NULL, '2026-11-20 10:10:00', 16.50),
(24, 14, '2026-11-20', '19:00 - 19:30', 'Cancelado', NULL, 'Comprador faltou aula', NULL, 14.00),
(21, 15, '2026-11-20', '14:00 - 14:30', 'Entregue', NULL, NULL, '2026-11-20 14:05:00', 15.00),
(22, 16, '2026-11-20', '09:00 - 09:30', 'Entregue', NULL, NULL, '2026-11-20 09:15:00', 19.00),
(23, 17, '2026-11-21', '15:00 - 15:30', 'Pendente', 'Confirmar disponibilidade', NULL, NULL, 17.00),
(24, 18, '2026-11-21', '18:30 - 19:00', 'Entregue', NULL, NULL, '2026-11-21 18:45:00', 24.00),
(21, 19, '2026-11-21', '10:00 - 10:30', 'Entregue', NULL, NULL, '2026-11-21 10:12:00', 18.00),
(22, 1, '2026-11-21', '16:00 - 16:30', 'Entregue', NULL, NULL, '2026-11-21 16:05:00', 24.00);

-- 6. Inserindo 20 ITENS_PEDIDO
INSERT INTO ITENS_PEDIDO (pedido_id, produto_id, quantidade, preco_unitario_registrado, subtotal) VALUES
(1, 1, 2, 8.00, 16.00),  (2, 2, 2, 7.50, 15.00),
(3, 3, 2, 12.00, 24.00), (4, 4, 2, 10.00, 20.00),
(5, 5, 4, 4.50, 18.00),  (6, 6, 2, 11.00, 22.00),
(7, 7, 3, 6.50, 19.50),  (8, 8, 2, 9.00, 18.00),
(9, 9, 2, 14.00, 28.00), (10, 10, 2, 6.00, 12.00),
(11, 11, 2, 13.00, 26.00),(12, 12, 2, 18.00, 36.00),
(13, 13, 3, 5.50, 16.50),(14, 14, 2, 7.00, 14.00),
(15, 15, 3, 5.00, 15.00),(16, 16, 2, 9.50, 19.00),
(17, 17, 2, 8.50, 17.00),(18, 18, 2, 12.00, 24.00),
(19, 19, 2, 9.00, 18.00),(20, 1, 3, 8.00, 24.00);

-- 7. Inserindo 20 PAGAMENTOS
INSERT INTO PAGAMENTOS (pedido_id, valor_pago, meio_pagamento, status_pagamento, url_comprovante) VALUES
(1, 16.00, 'PIX', 'Aprovado', 'comp/pix1.pdf'),
(2, 15.00, 'Dinheiro', 'Aprovado', NULL),
(3, 24.00, 'PIX', 'Aprovado', 'comp/pix3.pdf'),
(4, 10.00, 'PIX', 'Parcial', 'comp/pix4.pdf'),
(5, 18.00, 'PIX', 'Aprovado', 'comp/pix5.pdf'),
(6, 22.00, 'Dinheiro', 'Aprovado', NULL),
(7, 19.50, 'PIX', 'Aprovado', 'comp/pix7.pdf'),
(8, 18.00, 'PIX', 'Aprovado', 'comp/pix8.pdf'),
(9, 28.00, 'PIX', 'Aprovado', 'comp/pix9.pdf'),
(10, 12.00, 'Dinheiro', 'Aprovado', NULL),
(11, 26.00, 'PIX', 'Aprovado', 'comp/pix11.pdf'),
(12, 36.00, 'PIX', 'Aprovado', 'comp/pix12.pdf'),
(13, 16.50, 'PIX', 'Aprovado', 'comp/pix13.pdf'),
(14, 0.00, 'PIX', 'Estornado', NULL),
(15, 15.00, 'Dinheiro', 'Aprovado', NULL),
(16, 19.00, 'PIX', 'Aprovado', 'comp/pix16.pdf'),
(17, 0.00, 'PIX', 'Pendente', NULL),
(18, 24.00, 'PIX', 'Aprovado', 'comp/pix18.pdf'),
(19, 18.00, 'Dinheiro', 'Aprovado', NULL),
(20, 24.00, 'PIX', 'Aprovado', 'comp/pix20.pdf');

-- 8. Inserindo 20 VENDAS
INSERT INTO VENDAS (pedido_id, valor_final_recebido, saldo_restante, status_venda) VALUES
(1, 16.00, 0.00, 'Concluída'),  (2, 15.00, 0.00, 'Concluída'),
(3, 24.00, 0.00, 'Concluída'),  (4, 10.00, 10.00, 'Parcial'),
(5, 18.00, 0.00, 'Concluída'),  (6, 22.00, 0.00, 'Concluída'),
(7, 19.50, 0.00, 'Concluída'),  (8, 18.00, 0.00, 'Concluída'),
(9, 28.00, 0.00, 'Concluída'),  (10, 12.00, 0.00, 'Concluída'),
(11, 26.00, 0.00, 'Concluída'), (12, 36.00, 0.00, 'Concluída'),
(13, 16.50, 0.00, 'Concluída'), (14, 0.00, 0.00, 'Cancelada'),
(15, 15.00, 0.00, 'Concluída'), (16, 19.00, 0.00, 'Concluída'),
(17, 0.00, 17.00, 'Aguardando'),(18, 24.00, 0.00, 'Concluída'),
(19, 18.00, 0.00, 'Concluída'), (20, 24.00, 0.00, 'Concluída');

-- 9. Inserindo 20 REGRAS_AVISOS
INSERT INTO REGRAS_AVISOS (admin_id, titulo, descricao, publico_alvo) VALUES
(21, 'Boas-vindas ao Sistema', 'Plataforma oficial de vendas do Campus Niterói.', 'Todos'),
(21, 'Higiene na Manipulação', 'Todos os alimentos devem estar embalados.', 'Vendedores'),
(22, 'Proibição de Venda em Sala', 'Entregas apenas nos corredores e pátio.', 'Todos'),
(21, 'Uso de Chave PIX', 'Mantenha sua chave PIX atualizada no perfil.', 'Vendedores'),
(22, 'Pontualidade na Retirada', 'Respeite a faixa de horário combinada.', 'Compradores'),
(21, 'Horário de Funcionamento', 'Pedidos permitidos das 07h às 22h.', 'Todos'),
(22, 'Cancelamento de Pedidos', 'Avise com 1h de antecedência.', 'Compradores'),
(21, 'Alergênicos', 'Informe ingredientes como glúten e lactose.', 'Vendedores'),
(22, 'Comprovante PIX', 'Anexe o comprovante para agilizar.', 'Compradores'),
(21, 'Semana de Provas', 'Alta demanda prevista para esta semana.', 'Todos'),
(22, 'Atualização de Estoque', 'Desative produtos esgotados.', 'Vendedores'),
(21, 'Segurança Alimentar', 'Produtos perecíveis exigem refrigeração.', 'Vendedores'),
(22, 'Avaliação de Pedidos', 'Reporte problemas à administração.', 'Compradores'),
(21, 'Feira Cultural IFRJ', 'Inscrições abertas para barracas.', 'Vendedores'),
(22, 'Manutenção do Sistema', 'Domingo das 02h às 04h.', 'Todos'),
(21, 'Novas Categorias', 'Adicionada categoria Refeições Fit.', 'Todos'),
(22, 'Política de Reembolso', 'Pedidos cancelados antes do preparo são estornados.', 'Todos'),
(21, 'Limite de Encomendas', 'Defina sua quantidade prevista diária.', 'Vendedores'),
(22, 'Recesso Acadêmico', 'Vendas suspensas durante o recesso.', 'Todos'),
(21, 'Canal de Suporte', 'Dúvidas enviar e-mail para admin@ifrj.edu.br.', 'Todos');