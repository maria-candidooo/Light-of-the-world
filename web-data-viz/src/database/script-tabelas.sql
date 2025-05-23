create database crossconnect;

use crossconnect;

create table usuario (
  idusuario int  primary key auto_increment,
  nome varchar(45),
  sobrenome varchar(45),
  email varchar(200),
  senha varchar(100));

create table post (
  idpost int  primary key auto_increment,
  idusuario int not null,
  conteudo varchar(600),
  imagem text,
  categoria enum('Dúvidas', 'Testemunhos', 'Pedidos de Oração', 'Eventos', 'Outros'),
  status enum('Ativo', 'Inativo', 'Em análise') default 'Ativo',
  data datetime,
  constraint fk_post_usuario foreign key (idusuario) references usuario (idusuario)
);

create table denuncia (
  iddenuncia int primary key  auto_increment,
  idusuario int not null,
  descricao varchar(50) not null,
  idpost int not null,
  status enum('Pendente', 'Avaliada', 'Ignorada') default 'Pendente',
  constraint fk_denuncia_usuario foreign key (idusuario) references usuario (idusuario),
  constraint fk_denuncia_post foreign key (idpost) references post (idpost)
);

create table favoritos (
  idfavorito int primary key auto_increment,
  idpost int not null,
  idusuario int not null,
  unique key (idpost, idusuario), -- para evitar que tenha favoritos repetidos
  constraint fk_favoritos_post foreign key (idpost) references post (idpost),
  constraint fk_favoritos_usuario foreign key (idusuario) references usuario (idusuario)
);
select * from usuario;

