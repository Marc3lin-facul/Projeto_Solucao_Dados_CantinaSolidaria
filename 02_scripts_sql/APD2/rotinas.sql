USE db_vendas_campus;

-- =====================================================================
-- 1. TRÊS FUNCTIONS (Retornam um valor calculado/consultado)
-- =====================================================================

-- Function 1: Retorna o total faturado (vendas concluídas) de um vendedor pelo seu ID
DELIMITER //
CREATE FUNCTION fn_total_faturado_vendedor(p_vendedor_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_total DECIMAL(10,2) DEFAULT 0.00;
    SELECT COALESCE(SUM(v.valor_final_recebido), 0.00) INTO v_total
    FROM VENDAS v
    INNER JOIN PEDIDOS p ON v.pedido_id = p.id
    WHERE p.vendedor_id = p_vendedor_id AND v.status_venda = 'Concluída';
    RETURN v_total;
END //
DELIMITER ;

-- Function 2: Retorna a quantidade de pedidos já feitos por um comprador
DELIMITER //
CREATE FUNCTION fn_qtd_pedidos_comprador(p_comprador_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_qtd INT DEFAULT 0;
    SELECT COUNT(*) INTO v_qtd
    FROM PEDIDOS
    WHERE comprador_id = p_comprador_id;
    RETURN v_qtd;
END //
DELIMITER ;

-- Function 3: Verifica se um produto tem oferta prevista para uma data específica (retorna 1 ou 0)
DELIMITER //
CREATE FUNCTION fn_produto_ofertado_na_data(p_produto_id INT, p_data DATE)
RETURNS TINYINT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_existe INT DEFAULT 0;
    SELECT COUNT(*) INTO v_existe
    FROM OFERTAS_DATA
    WHERE produto_id = p_produto_id AND data_disponivel = p_data AND quantidade_prevista > 0;
    
    IF v_existe > 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END //
DELIMITER ;

-- =====================================================================
-- 2. TRÊS STORED PROCEDURES (Rotinas de execução de regras de negócio)
-- =====================================================================

-- Procedure 1: Cadastrar um novo produto validando se o preço é maior que zero
DELIMITER //
CREATE PROCEDURE sp_cadastrar_produto(
    IN p_vendedor_id INT,
    IN p_nome VARCHAR(100),
    IN p_descricao TEXT,
    IN p_tipo VARCHAR(50),
    IN p_categoria VARCHAR(50),
    IN p_preco DECIMAL(10,2),
    IN p_aceita_encomenda TINYINT
)
BEGIN
    IF p_preco <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: O preço unitário do produto deve ser maior que zero.';
    ELSE
        INSERT INTO PRODUTOS (vendedor_id, nome, descricao, tipo, categoria, preco_unitario, disponivel, aceita_encomenda, ativo)
        VALUES (p_vendedor_id, p_nome, p_descricao, p_tipo, p_categoria, p_preco, 1, p_aceita_encomenda, 1);
    END IF;
END //
DELIMITER ;

-- Procedure 2: Cancelar um pedido e registrar o motivo (impede cancelar pedido já entregue)
DELIMITER //
CREATE PROCEDURE sp_cancelar_pedido(
    IN p_pedido_id INT,
    IN p_motivo VARCHAR(255)
)
BEGIN
    DECLARE v_status_atual VARCHAR(30);
    SELECT status INTO v_status_atual FROM PEDIDOS WHERE id = p_pedido_id;

    IF v_status_atual IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Pedido não encontrado.';
    ELSEIF v_status_atual = 'Entregue' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Não é possível cancelar um pedido que já foi entregue.';
    ELSE
        UPDATE PEDIDOS
        SET status = 'Cancelado', motivo_cancelamento = p_motivo
        WHERE id = p_pedido_id;
    END IF;
END //
DELIMITER ;

-- Procedure 3: Consolidar venda automaticamente após pagamento aprovado
DELIMITER //
CREATE PROCEDURE sp_consolidar_venda(
    IN p_pedido_id INT,
    IN p_valor_recebido DECIMAL(10,2)
)
BEGIN
    DECLARE v_valor_pedido DECIMAL(10,2);
    DECLARE v_saldo DECIMAL(10,2);
    DECLARE v_status VARCHAR(30);

    SELECT valor_total INTO v_valor_pedido FROM PEDIDOS WHERE id = p_pedido_id;
    SET v_saldo = v_valor_pedido - p_valor_recebido;

    IF v_saldo <= 0 THEN
        SET v_saldo = 0.00;
        SET v_status = 'Concluída';
    ELSE
        SET v_status = 'Parcial';
    END IF;

    INSERT INTO VENDAS (pedido_id, valor_final_recebido, saldo_restante, status_venda)
    VALUES (p_pedido_id, p_valor_recebido, v_saldo, v_status);
END //
DELIMITER ;

-- =====================================================================
-- 3. TRÊS TRIGGERS (Ações automáticas BEFORE / AFTER)
-- =====================================================================

-- Trigger 1: BEFORE INSERT em ITENS_PEDIDO
-- Busca o preço atual do produto automaticamente e calcula o subtotal do item
DELIMITER //
CREATE TRIGGER trg_before_insert_item_pedido
BEFORE INSERT ON ITENS_PEDIDO
FOR EACH ROW
BEGIN
    DECLARE v_preco_atual DECIMAL(10,2);
    SELECT preco_unitario INTO v_preco_atual FROM PRODUTOS WHERE id = NEW.produto_id;
    
    SET NEW.preco_unitario_registrado = v_preco_atual;
    SET NEW.subtotal = v_preco_atual * NEW.quantidade;
END //
DELIMITER ;

-- Trigger 2: AFTER INSERT em ITENS_PEDIDO
-- Atualiza automaticamente o valor_total na tabela PEDIDOS (usando COALESCE conforme slide 23!)
DELIMITER //
CREATE TRIGGER trg_after_insert_item_pedido
AFTER INSERT ON ITENS_PEDIDO
FOR EACH ROW
BEGIN
    UPDATE PEDIDOS
    SET valor_total = COALESCE(valor_total, 0) + NEW.subtotal
    WHERE id = NEW.pedido_id;
END //
DELIMITER ;

-- Trigger 3: BEFORE DELETE em PRODUTOS
-- Impede a exclusão física de um produto que já esteja vinculado a algum pedido (conforme slide 24!)
DELIMITER //
CREATE TRIGGER trg_before_delete_produto
BEFORE DELETE ON PRODUTOS
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM ITENS_PEDIDO WHERE produto_id = OLD.id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Não é possível excluir este produto pois ele já possui pedidos vinculados. Desative-o (ativo = 0).';
    END IF;
END //
DELIMITER ;