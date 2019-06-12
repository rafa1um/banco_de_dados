CREATE TABLE cliente(
    id INTEGER NOT NULL,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    CONSTRAINT pk_cliente
        PRIMARY KEY (id)
);

CREATE TABLE pessoa_fis(
    sexo CHAR(1) NOT NULL,
    birth VARCHAR(10),
    CPF INTEGER NOT NULL,
    CONSTRAINT pk_pessoa_fis
        PRIMARY KEY (CPF),
    CONSTRAINT fk_cliente
        FOREIGN KEY(id)
        REFERENCES cliente
);

CREATE TABLE pessoa_jur(
    n_estadual INTEGER NOT NULL,
    CNPJ INTEGER NOT NULL,
    CONSTRAINT pk_pessoa_jur
        PRIMARY KEY (CNPJ),
    CONSTRAINT fk_cliente
        FOREIGN KEY(id)
        REFERENCES cliente
);



CREATE TABLE veiculo(
    placa VARCHAR(7) NOT NULL,
    chassi VARCHAR(17) NOT NULL,
    cor VARCHAR(10) NOT NULL,
    CONSTRAINT pk_veiculo
        PRIMARY KEY (placa),
    CONSTRAINT fk_tipo_veiculo
        FOREIGN KEY (tipo)
        REFERENCES tipo_veiculo
);

CREATE TABLE tipo_veiculo(
    tipo VARCHAR(3) NOT NULL,
    tamanho VARCHAR(7) NOT NULL, 
    n_passageiro SMALLINT NOT NULL,
    n_portas SMALLINT NOT NULL,
    CONSTRAINT pk_tipo_veiculo
        PRIMARY KEY (tipo)
);

CREATE TABLE acessorios(
    id_acessorios SMALLINT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    CONSTRAINT pk_acessorios
        PRIMARY KEY (id_acessorios),
    CONSTRAINT fk_tipo_veiculo
        FOREIGN KEY (tipo)
        REFERENCES tipo_veiculo
);

CREATE TABLE tipo_acessorio(
    CONSTRAINT fk_tipo_veiculo
        FOREIGN KEY (tipo)
        REFERENCES tipo_veiculo,
    CONSTRAINT fk_acessorios
        FOREIGN KEY (id_acessorios)
        REFERENCES acessorios
);

CREATE TABLE camionetas_passageiro(
    CONSTRAINT fk_tipo_veiculo
        FOREIGN KEY (tipo)
        REFERENCES tipo_veiculo,
    CONSTRAINT fk_veiculo
        FOREIGN KEY (chassi)
        REFERENCES veiculo
);

CREATE TABLE camionetas_passageiro(
    CONSTRAINT fk_tipo_veiculo
        FOREIGN KEY (tipo)
        REFERENCES tipo_veiculo,
    CONSTRAINT fk_veiculo
        FOREIGN KEY (chassi)
        REFERENCES veiculo
);

CREATE TABLE camionetas_carga(
    capacidade VARCHAR(10) NOT NULL,
    CONSTRAINT fk_veiculo
        FOREIGN KEY (chassi)
        REFERENCES veiculo
);







