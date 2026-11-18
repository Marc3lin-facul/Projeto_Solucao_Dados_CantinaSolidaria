USE db_vendas_campus;

-- =====================================================================
-- 5 CONSULTAS SIMPLES / QUALIFICADAS
-- =====================================================================

-- 1. Listar produtos ativos da categoria 'Doces' ordenados do menor para o maior preço
SELECT nome, categoria, preco_unitario
FROM PRODUTOS
WHERE categoria = 'Doces' AND ativo = 1
ORDER BY preco_unitario ASC;

-- 2. Listar os campi distintos dos usuários cadastrados no sistema
SELECT DISTINCT campus
FROM USUARIOS;

-- 3. Buscar usuários do vínculo 'Aluno' cujo nome contenha 'Silva' ou comece com 'A'
SELECT id, nome, email, campus
FROM USUARIOS
WHERE vinculo = 'Aluno' AND (nome LIKE 'A%' OR nome LIKE '%Silva%');

-- 4. Listar pedidos com retirada prevista entre 18/11/2026 e 20/11/2026
SELECT id, comprador_id, vendedor_id, data_retirada, status, valor_total
FROM PEDIDOS
WHERE data_retirada BETWEEN '2026-11-18' AND '2026-11-20'
ORDER BY data_retirada ASC;

-- 5. Listar avisos publicados destinados ao público 'Vendedores' ou 'Todos'
SELECT titulo, publico_alvo, data_publicacao
FROM REGRAS_AVISOS
WHERE publico_alvo IN ('Vendedores', 'Todos')
ORDER BY data_publicacao DESC;

-- =====================================================================
-- 3 CONSULTAS COM JOINS, AGRUPAMENTOS E AGREGAÇÕES
-- =====================================================================

-- 6. Total faturado por cada vendedor (apenas vendas concluídas com total acima de R$ 20,00)
SELECT u.nome AS vendedor, COUNT(v.id) AS qtd_vendas, SUM(v.valor_final_recebido) AS total_faturado
FROM VENDAS v
INNER JOIN PEDIDOS p ON v.pedido_id = p.id
INNER JOIN PERFIS_VENDEDOR pv ON p.vendedor_id = pv.id
INNER JOIN USUARIOS u ON pv.usuario_id = u.id
WHERE v.status_venda = 'Concluída'
GROUP BY u.nome
HAVING SUM(v.valor_final_recebido) > 20.00
ORDER BY total_faturado DESC;

-- 7. Quantidade de pedidos realizados por cada comprador (incluindo quem tem 0 pedidos via LEFT JOIN)
SELECT u.nome AS comprador, u.vinculo, COUNT(p.id) AS total_pedidos, COALESCE(SUM(p.valor_total), 0) AS valor_gasto
FROM USUARIOS u
LEFT JOIN PEDIDOS p ON u.id = p.comprador_id
WHERE u.papel IN ('comprador', 'admin')
GROUP BY u.id, u.nome, u.vinculo
ORDER BY total_pedidos DESC;

-- 8. Total de unidades vendidas e receita por categoria de produto
SELECT pr.categoria, SUM(ip.quantidade) AS total_itens_vendidos, SUM(ip.subtotal) AS receita_categoria
FROM ITENS_PEDIDO ip
INNER JOIN PRODUTOS pr ON ip.produto_id = pr.id
INNER JOIN PEDIDOS pe ON ip.pedido_id = pe.id
WHERE pe.status <> 'Cancelado'
GROUP BY pr.categoria
HAVING SUM(ip.quantidade) >= 3
ORDER BY receita_categoria DESC;

-- =====================================================================
-- 3 SUBCONSULTAS
-- =====================================================================

-- 9. Subconsulta Escalar (Operador de Comparação =):
-- Obter os dados do produto mais caro cadastrado na plataforma
SELECT id, nome, categoria, preco_unitario
FROM PRODUTOS
WHERE preco_unitario = (SELECT MAX(preco_unitario) FROM PRODUTOS);

-- 10. Subconsulta com operador IN:
-- Listar nome e email dos usuários que já realizaram pagamentos aprovados via PIX
SELECT nome, email, telefone
FROM USUARIOS
WHERE id IN (
    SELECT p.comprador_id
    FROM PEDIDOS p
    INNER JOIN PAGAMENTOS pg ON p.id = pg.pedido_id
    WHERE pg.meio_pagamento = 'PIX' AND pg.status_pagamento = 'Aprovado'
);

-- 11. Subconsulta com operador NOT EXISTS:
-- Listar produtos cadastrados que NUNCA foram incluídos em nenhum pedido
SELECT pr.id, pr.nome, pr.categoria, pr.preco_unitario
FROM PRODUTOS pr
WHERE NOT EXISTS (
    SELECT 1
    FROM ITENS_PEDIDO ip
    WHERE ip.produto_id = pr.id
);