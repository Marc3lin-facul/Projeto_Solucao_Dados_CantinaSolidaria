CREATE DATABASE IF NOT EXISTS db_vendas_campus
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_unicode_ci;

USE db_vendas_campus;

-- 1. Tabela USUARIOS
CREATE TABLE USUARIOS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    vinculo VARCHAR(50) NOT NULL, -- Ex: Aluno, Servidor, Professor
    campus VARCHAR(60) NOT NULL,
    telefone VARCHAR(20),
    papel VARCHAR(30) NOT NULL,   -- Ex: comprador, vendedor, admin
    ativo TINYINT(1) DEFAULT 1,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabela PERFIS_VENDEDOR
CREATE TABLE PERFIS_VENDEDOR (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL UNIQUE,
    apresentacao TEXT,
    turnos_habituais VARCHAR(100),
    chave_pix VARCHAR(100) NOT NULL,
    CONSTRAINT fk_perfil_usuario FOREIGN KEY (usuario_id) REFERENCES USUARIOS(id)
);

-- 3. Tabela PRODUTOS
CREATE TABLE PRODUTOS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vendedor_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    tipo VARCHAR(50) NOT NULL,      -- Ex: Pronta entrega, Encomenda
    categoria VARCHAR(50) NOT NULL, -- Ex: Salgados, Doces, Bebidas
    preco_unitario DECIMAL(10,2) NOT NULL,
    url_foto VARCHAR(255),
    disponivel TINYINT(1) DEFAULT 1,
    aceita_encomenda TINYINT(1) DEFAULT 0,
    ativo TINYINT(1) DEFAULT 1,
    CONSTRAINT fk_produto_vendedor FOREIGN KEY (vendedor_id) REFERENCES PERFIS_VENDEDOR(id)
);

-- 4. Tabela OFERTAS_DATA
CREATE TABLE OFERTAS_DATA (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    data_disponivel DATE NOT NULL,
    turno VARCHAR(30) NOT NULL, -- Ex: Manhã, Tarde, Noite
    quantidade_prevista INT NOT NULL,
    CONSTRAINT fk_oferta_produto FOREIGN KEY (produto_id) REFERENCES PRODUTOS(id)
);

-- 5. Tabela PEDIDOS
CREATE TABLE PEDIDOS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comprador_id INT NOT NULL,
    vendedor_id INT NOT NULL,
    data_solicitacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_retirada DATE NOT NULL,
    faixa_horario VARCHAR(50),
    status VARCHAR(30) NOT NULL, -- Ex: Pendente, Confirmado, Entregue, Cancelado
    observacoes TEXT,
    motivo_cancelamento VARCHAR(255),
    data_entrega DATETIME,
    valor_total DECIMAL(10,2) DEFAULT 0.00,
    CONSTRAINT fk_pedido_comprador FOREIGN KEY (comprador_id) REFERENCES USUARIOS(id),
    CONSTRAINT fk_pedido_vendedor FOREIGN KEY (vendedor_id) REFERENCES PERFIS_VENDEDOR(id)
);

-- 6. Tabela ITENS_PEDIDO
CREATE TABLE ITENS_PEDIDO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario_registrado DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_item_pedido FOREIGN KEY (pedido_id) REFERENCES PEDIDOS(id),
    CONSTRAINT fk_item_produto FOREIGN KEY (produto_id) REFERENCES PRODUTOS(id)
);

-- 7. Tabela PAGAMENTOS
CREATE TABLE PAGAMENTOS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    meio_pagamento VARCHAR(40) NOT NULL, -- Ex: PIX, Dinheiro
    status_pagamento VARCHAR(30) NOT NULL, -- Ex: Aprovado, Pendente
    url_comprovante VARCHAR(255),
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (pedido_id) REFERENCES PEDIDOS(id)
);

-- 8. Tabela VENDAS
CREATE TABLE VENDAS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL UNIQUE,
    data_consolidacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_final_recebido DECIMAL(10,2) NOT NULL,
    saldo_restante DECIMAL(10,2) DEFAULT 0.00,
    status_venda VARCHAR(30) NOT NULL, -- Ex: Concluída, Parcial
    CONSTRAINT fk_venda_pedido FOREIGN KEY (pedido_id) REFERENCES PEDIDOS(id)
);

-- 9. Tabela REGRAS_AVISOS
CREATE TABLE REGRAS_AVISOS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    admin_id INT NOT NULL,
    titulo VARCHAR(120) NOT NULL,
    descricao TEXT NOT NULL,
    data_publicacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    publico_alvo VARCHAR(50) NOT NULL, -- Ex: Todos, Vendedores, Compradores
    CONSTRAINT fk_aviso_admin FOREIGN KEY (admin_id) REFERENCES USUARIOS(id)
);