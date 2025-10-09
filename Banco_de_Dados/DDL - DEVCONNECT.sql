-- Criação do banco
CREATE DATABASE db_Devconnect_;

-- Tabela de usuários
CREATE TABLE tb_usuario (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nomeCompleto NVARCHAR(255) NOT NULL,
    nomeDeUsuario NVARCHAR(20) UNIQUE NOT NULL,
    email NVARCHAR(255) UNIQUE NOT NULL,
    senha NVARCHAR(50) NOT NULL,
    fotoPerfilUrl NVARCHAR(255)
);
 SELECT * FROM tb_usuario

GO

-- Tabela de publicações
CREATE TABLE tb_publicacao (
    id_publicacao INT IDENTITY(1,1) PRIMARY KEY,
    descricao NVARCHAR(500),
    imagemUrl NVARCHAR(255) NOT NULL,
    data_Publicacao DATE NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario)
);
SELECT * FROM tb_publicacao

GO

-- Tabela de curtidas
CREATE TABLE tb_curtida (
    id_curtida INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_publicacao INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario),
    FOREIGN KEY (id_publicacao) REFERENCES tb_publicacao(id_publicacao)
);
SELECT * FROM tb_curtida

-- Tabela de comentários
CREATE TABLE tb_comentario (
    id_comentario INT IDENTITY(1,1) PRIMARY KEY,
    texto NVARCHAR(300) NOT NULL,
    dataComentario DATE NOT NULL,
    id_publicacao INT NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_publicacao) REFERENCES tb_publicacao(id_publicacao),
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario)
);

SELECT * FROM tb_comentario

-- Tabela de seguidores
CREATE TABLE tb_seguidor (
    id_usuario_seguidor INT NOT NULL,
    id_usuario_seguido INT NOT NULL,
    PRIMARY KEY (id_usuario_seguidor, id_usuario_seguido),
    FOREIGN KEY (id_usuario_seguidor) REFERENCES tb_usuario(id_usuario),
    FOREIGN KEY (id_usuario_seguido) REFERENCES tb_usuario(id_usuario)
);

SELECT * FROM tb_seguidor