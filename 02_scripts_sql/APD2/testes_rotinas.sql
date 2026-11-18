-- Testando as 3 Functions:
SELECT fn_total_faturado_vendedor(1) AS faturamento_vendedor_1;
SELECT fn_qtd_pedidos_comprador(23) AS pedidos_comprador_23;
SELECT fn_produto_ofertado_na_data(1, '2026-11-17') AS oferta_disponivel;

-- Testando as 3 Procedures:
CALL sp_cadastrar_produto(1, 'Bolo de Cenoura', 'Com cobertura de chocolate', 'Pronta entrega', 'Doces', 7.50, 1);
CALL sp_cancelar_pedido(17, 'Desistência do comprador antes do preparo');
-- Para testar sp_consolidar_venda, criamos um pedido novo (ID 21) e consolidamos:
INSERT INTO PEDIDOS (comprador_id, vendedor_id, data_retirada, faixa_horario, status, valor_total)
VALUES (23, 2, '2026-11-22', '10:00 - 10:30', 'Confirmado', 0.00);

-- Testando Triggers 1 e 2 (inserir item deve calcular subtotal e atualizar valor_total do pedido 21):
INSERT INTO ITENS_PEDIDO (pedido_id, produto_id, quantidade) VALUES (21, 2, 2);
SELECT * FROM PEDIDOS WHERE id = 21; -- Verifique que valor_total mudou sozinho para 15.00!

-- Consolidando o pedido 21 via Procedure 3:
CALL sp_consolidar_venda(21, 15.00);
SELECT * FROM VENDAS WHERE pedido_id = 21;

-- Testando Trigger 3 (deve disparar erro impedindo a exclusão do produto 1):
DELETE FROM PRODUTOS WHERE id = 1;