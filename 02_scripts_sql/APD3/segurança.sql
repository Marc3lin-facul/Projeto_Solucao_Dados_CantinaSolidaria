USE db_vendas_campus;

-- 1. Criação dos Papéis (Roles) conforme os perfis do sistema
CREATE ROLE IF NOT EXISTS 'papel_admin', 'papel_vendedor', 'papel_comprador';

-- 2. Definição de Privilégios para cada Papel (Princípio do Menor Privilégio)

-- Papel Admin: Controle total sobre a base de dados do projeto
GRANT ALL PRIVILEGES ON db_vendas_campus.* TO 'papel_admin';

-- Papel Vendedor: Pode gerenciar seus produtos/ofertas, visualizar pedidos/pagamentos e executar procedures/functions de venda
GRANT SELECT, INSERT, UPDATE ON db_vendas_campus.PRODUTOS TO 'papel_vendedor';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_vendas_campus.OFERTAS_DATA TO 'papel_vendedor';
GRANT SELECT, UPDATE ON db_vendas_campus.PEDIDOS TO 'papel_vendedor';
GRANT SELECT ON db_vendas_campus.ITENS_PEDIDO TO 'papel_vendedor';
GRANT SELECT ON db_vendas_campus.PAGAMENTOS TO 'papel_vendedor';
GRANT SELECT, INSERT ON db_vendas_campus.VENDAS TO 'papel_vendedor';
GRANT SELECT ON db_vendas_campus.REGRAS_AVISOS TO 'papel_vendedor';
GRANT EXECUTE ON PROCEDURE db_vendas_campus.sp_cadastrar_produto TO 'papel_vendedor';
GRANT EXECUTE ON PROCEDURE db_vendas_campus.sp_consolidar_venda TO 'papel_vendedor';
GRANT EXECUTE ON FUNCTION db_vendas_campus.fn_total_faturado_vendedor TO 'papel_vendedor';

-- Papel Comprador: Pode consultar produtos/ofertas/avisos e criar/acompanhar seus pedidos e pagamentos
GRANT SELECT ON db_vendas_campus.PRODUTOS TO 'papel_comprador';
GRANT SELECT ON db_vendas_campus.OFERTAS_DATA TO 'papel_comprador';
GRANT SELECT ON db_vendas_campus.PERFIS_VENDEDOR TO 'papel_comprador';
GRANT SELECT ON db_vendas_campus.REGRAS_AVISOS TO 'papel_comprador';
GRANT SELECT, INSERT ON db_vendas_campus.PEDIDOS TO 'papel_comprador';
GRANT SELECT, INSERT ON db_vendas_campus.ITENS_PEDIDO TO 'papel_comprador';
GRANT SELECT, INSERT ON db_vendas_campus.PAGAMENTOS TO 'papel_comprador';
GRANT EXECUTE ON PROCEDURE db_vendas_campus.sp_cancelar_pedido TO 'papel_comprador';
GRANT EXECUTE ON FUNCTION db_vendas_campus.fn_qtd_pedidos_comprador TO 'papel_comprador';

-- 3. Criação dos Usuários no MySQL Server
CREATE USER IF NOT EXISTS 'admin_campus'@'localhost' IDENTIFIED BY 'Admin@2026!';
CREATE USER IF NOT EXISTS 'vendedor_ana'@'localhost' IDENTIFIED BY 'Vend@2026!';
CREATE USER IF NOT EXISTS 'comprador_wagner'@'localhost' IDENTIFIED BY 'Comp@2026!';

-- 4. Vinculação dos Papéis aos Usuários e Ativação Padrão
GRANT 'papel_admin' TO 'admin_campus'@'localhost';
GRANT 'papel_vendedor' TO 'vendedor_ana'@'localhost';
GRANT 'papel_comprador' TO 'comprador_wagner'@'localhost';

SET DEFAULT ROLE ALL TO
    'admin_campus'@'localhost',
    'vendedor_ana'@'localhost',
    'comprador_wagner'@'localhost';

FLUSH PRIVILEGES;

-- =====================================================================
-- 5. REVOGAÇÃO DE PRIVILÉGIOS (REVOKE) - Controle e Restrição de Acesso
-- =====================================================================

-- Exemplo 1: Revogar o privilégio de DELETE na tabela OFERTAS_DATA do papel_vendedor
-- (Justificativa: Impedir que vendedores apaguem o histórico de ofertas já publicadas,
-- permitindo apenas que insiram ou atualizem a disponibilidade)
REVOKE DELETE ON db_vendas_campus.OFERTAS_DATA FROM 'papel_vendedor';

-- Exemplo 2: Revogar a permissão de inserir pagamentos diretamente pelo comprador
-- (Justificativa: Garantir que apenas o sistema/vendedor confirme registros na tabela PAGAMENTOS)
REVOKE INSERT ON db_vendas_campus.PAGAMENTOS FROM 'papel_comprador';

-- Aplicar imediatamente as alterações de privilégios
FLUSH PRIVILEGES;

-- Comando para verificar os privilégios ativos de cada usuário/papel (ótimo para print de evidência!):
SHOW GRANTS FOR 'papel_vendedor';
SHOW GRANTS FOR 'papel_comprador';