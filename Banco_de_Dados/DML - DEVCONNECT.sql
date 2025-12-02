USE db_Devconnect_;


-- Inserindo usuários
INSERT INTO tb_usuario (nomeCompleto, nomeDeUsuario, email, senha, fotoPerfilUrl)
VALUES 
('Tupac Shakur', '2pac', '2pac@gmail.com', '123', '2pac.jpg'),
('Snoop Dogg', 'Snoop', 'snoopdog@gmail.com', '1234', 'dog.jpg'),
('Curtis James', '50cent', '50cent@gmail.com', '823', '50cent.url'),
('Eric Lynn', 'Eazy-E', 'eazy@gmail.com', '234', 'Eazy-E.url'),
('Shea Jackson', 'IceCube', 'icecube@gmail.com', '567', 'icecube.url');

SELECT * FROM tb_usuario;

-- Inserindo publicações (é necessário o id_usuario!)
INSERT INTO tb_publicacao (descricao, imagemUrl, data_Publicacao, id_usuario)
VALUES 
('Nova música lançada hoje!', '2pac.url', '2025-01-11', 31),
('Trabalhando em um novo álbum!', 'snoop.url', '2025-02-02', 32),
('Treinando no estúdio', '50cent.url', '2025-03-05', 33),
('Lembrando os velhos tempos', 'eazye.url', '2025-04-10', 34);

SELECT * FROM tb_publicacao;


-- Inserindo curtidas (somente IDs!)
INSERT INTO tb_curtida (id_usuario, id_publicacao)
VALUES 
(31, 4),  -- Tupac curtiu a publicação do Snoop
(32, 5),  -- Snoop curtiu a publicação do Tupac
(33, 6);  -- 50cent curtiu a publicação do Tupac

SELECT * FROM tb_curtida

-- Inserindo comentários
INSERT INTO tb_comentario (texto, dataComentario, id_publicacao, id_usuario)
VALUES 
('Clássico!', '2025-01-11', 5,31 ),
('Boa demais!', '2025-01-12', 4,32 ),
('Essa ficou braba!', '2025-01-15', 6,33 );

SELECT * FROM tb_comentario

-- Inserindo seguidores (auto-relacionamento)
INSERT INTO tb_seguidor (id_usuario_seguidor, id_usuario_seguido)
VALUES 
(31, 32),  -- Tupac segue Snoop
(32, 31),  -- Snoop segue Tupac
(33, 31),  -- 50cent segue Tupac
(34, 33);  -- Eazy-E segue 50cent

SELECT * FROM tb_seguidor
