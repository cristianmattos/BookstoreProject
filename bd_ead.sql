create database db_EAD
default character set utf8
default collate utf8_general_ci;

use db_EAD;

create table tbl_categoria
(	
    cd_categoria int primary key auto_increment,
    ds_categoria varchar(25) not null    
)
default charset utf8;


create table tbl_autor
(	
    cd_autor int primary key auto_increment,
    nm_autor varchar(45) not null    
)
default charset utf8;


create table tbl_livro
(	
    cd_livro int primary key auto_increment,
    no_isbn varchar(17) not null,
    cd_categoria int not null,
    nm_livro varchar(70) not null,
    cd_autor int not null,
    no_pag varchar(4) not null,
    vl_preco decimal(6,2) not null,
    qt_estoque int not null,
    ds_resumo_obra text not null,
    ds_capa varchar(255) not null,
    sg_lancamento enum('S','N') not null,
    constraint fk_cat foreign key(cd_categoria) references tbl_categoria(cd_categoria),
    constraint fk_autor foreign key(cd_autor) references tbl_autor(cd_autor)
)  
default charset utf8;

create view vw_livro
as select
		tbl_livro.cd_livro,
        tbl_livro.no_isbn,
        tbl_categoria.ds_categoria,
        tbl_livro.nm_livro,
        tbl_autor.nm_autor,
        tbl_livro.no_pag,
        tbl_livro.vl_preco,
        tbl_livro.qt_estoque,
        tbl_livro.ds_resumo_obra,
        tbl_livro.ds_capa,
        tbl_livro.sg_lancamento
from tbl_livro inner join tbl_autor
on tbl_livro.cd_autor = tbl_autor.cd_autor
inner join tbl_categoria
on  tbl_livro.cd_categoria = tbl_categoria.cd_categoria;

select *from tbl_categoria;
        
select *from vw_livro;

 CREATE USER 'ead'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
 GRANT ALL PRIVILEGES ON db_ead.* TO 'ead'@'localhost' WITH GRANT OPTION;