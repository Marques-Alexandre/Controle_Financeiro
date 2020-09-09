use poolibertas;

create table receita (
	idreceita int not null auto_increment,
    descricao varchar(55) null,
    dataReceita date,
    tipo varchar(25) null,
    valor float null,
    primary key (idreceita)
);

create table despesa (
	iddespesa int not null auto_increment,
    descricao varchar(55) null,
    dataDespesa date,
    tipo varchar(25) null,
    valor float null,
    primary key (iddespesa)
);
