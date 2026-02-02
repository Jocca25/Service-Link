DROP DATABASE IF EXISTS ServiceLink;
CREATE DATABASE IF NOT EXISTS ServiceLink;
USE ServiceLink;

CREATE TABLE Utilizadores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255), -- Aumentado para 255
    tipo ENUM('cliente', 'profissional', 'admin'),
    telefone VARCHAR(9) UNIQUE,
    localizacao VARCHAR(50),
    data_registo DATETIME
);

CREATE TABLE Servicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    categoria VARCHAR(50),
    descricao TEXT
);

CREATE TABLE Pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cli INT,
    id_profissional INT,
    id_servico INT,
    descricao TEXT,
    data_pedido DATETIME,
    estado ENUM('pendente', 'aceite', 'concluido', 'cancelado'),
    FOREIGN KEY (id_cli) REFERENCES Utilizadores(id),
    FOREIGN KEY (id_profissional) REFERENCES Utilizadores(id),
    FOREIGN KEY (id_servico) REFERENCES Servicos(id)
);

CREATE TABLE Mensagens (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_remetente INT,
    id_destinatario INT,
    conteudo TEXT,
    data_envio DATETIME,
    FOREIGN KEY (id_remetente) REFERENCES Utilizadores(id),
    FOREIGN KEY (id_destinatario) REFERENCES Utilizadores(id)
);

CREATE TABLE Avaliacoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_avaliador INT,
    id_avaliado INT,
    comentario TEXT,
    classificacao INT,
    data_avaliacao DATETIME,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
    FOREIGN KEY (id_avaliador) REFERENCES Utilizadores(id),
    FOREIGN KEY (id_avaliado) REFERENCES Utilizadores(id)
);