--DDL
CREATE DATABASE Devconnect

USE Devconnect;

CREATE TABLE tb_usuario(
id				   INT		        IDENTITY (1, 1)	 PRIMARY KEY,
nome_completo      NVARCHAR (255)				     NOT NULL,
nome_usuario	   NVARCHAR (255)	UNIQUE    		 NOT NULL,
email			   NVARCHAR (255)	UNIQUE			 NOT NULL,
senha			   NVARCHAR (255)					 NOT NULL,
foto_perfil_url	   NVARCHAR (50)			         NULL,
);

SELECT * FROM tb_usuario;

CREATE TABLE tb_publi(
id            INT				IDENTITY(1,1)		PRIMARY KEY,
descricao     NVARCHAR(255)     NOT NULL,
imagem_url    NVARCHAR(50)      NULL,
data_publi    DATE				NOT NULL,
);

SELECT * FROM tb_publi;

CREATE TABLE tb_comentario(
id					INT                IDENTITY           PRIMARY KEY,
texto				NVARCHAR (255)      NOT NULL,
data_comentario		DATE			    NOT NULL,

id_usuario          INT  FOREIGN KEY REFERENCES tb_usuario(id),
id_publi            INT  FOREIGN KEY REFERENCES tb_publi(id)
);

SELECT * FROM tb_comentario;

CREATE TABLE tb_usuario_seguindo(
id           INT			     IDENTITY	PRIMARY KEY,
Seguindo     TINYINT             NULL,
);

SELECT * FROM tb_usuario_seguindo;

CREATE TABLE tb_usuario_seguir(
id           INT			     IDENTITY	PRIMARY KEY,
Seguindo     TINYINT             NULL,
);

SELECT * FROM tb_usuario_seguir

CREATE TABLE tb_seguidor(
id_usuario_seguindo INT NOT NULL,
id_usuario_seguir INT NOT NULL,

PRIMARY KEY(id_usuario_seguindo, id_usuario_seguir)
);

SELECT * FROM tb_seguidor

CREATE TABLE tb_curtida(
id         INT IDENTITY  PRIMARY KEY,

id_usuario       INT  FOREIGN KEY REFERENCES tb_usuario(id),
id_publi         INT  FOREIGN KEY REFERENCES tb_publi(id)

);


