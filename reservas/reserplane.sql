CREATE TABLE reserva (
    cod_reserva       SMALLINT NOT NULL,
    nome_passageiro   VARCHAR (100) NOT NULL,

    CONSTRAINT reserva_pk   PRIMARY KEY (cod_reserva)
);

CREATE TABLE voo (
    cod_voo     SMALLINT NOT NULL,

    CONSTRAINT voo_pk       PRIMARY KEY (cod_voo)
);

CREATE TABLE cidade (
    cod_cidade SMALLINT NOT NULL,
    nome_cidade VARCHAR (40) NOT NULL,

    CONSTRAINT cidade_pk PRIMARY KEY (cod_cidade)
);

CREATE TABLE aeroporto (
    cod_aeroporto   SMALLINT NOT NULL,
    nome_aeroporto  VARCHAR (40) NOT NULL,
    cod_cidade      SMALLINT NOT NULL,

    CONSTRAINT aeroporto_pk PRIMARY KEY (cod_aeroporto),
    CONSTRAINT cidade_fk FOREIGN KEY (cod_cidade) REFERENCES cidade
);

CREATE TABLE tipo_aeronave (
    cod_aeronave     SMALLINT NOT NULL,
    nome_aeronave    VARCHAR (40) NOT NULL,

    CONSTRAINT aeronave_pk  PRIMARY KEY (cod_aeronave)
);

CREATE TABLE trecho (
    cod_trecho      SMALLINT NOT NULL,
    cod_voo         SMALLINT NOT NULL,
    cod_aeroporto   SMALLINT NOT NULL,
    cod_aeronave    SMALLINT NOT NULL,
    origem          SMALLINT NOT NULL,
    destino         SMALLINT NOT NULL, 
  
    CONSTRAINT trecho_pk PRIMARY KEY (cod_trecho, cod_aeroporto, cod_voo),
    CONSTRAINT voo_fk FOREIGN KEY (cod_voo) REFERENCES voo 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT aeroporto_fk FOREIGN KEY (cod_aeroporto) REFERENCES aeroporto,
    CONSTRAINT tipo_aeronave_fk FOREIGN KEY (cod_aeronave) REFERENCES tipo_aeronave
        ON UPDATE NO ACTION,
    CONSTRAINT origem_destino_fk FOREIGN KEY (origem) REFERENCES aeroporto (cod_aeroporto),
                                 FOREIGN KEY (destino) REFERENCES aeroporto (cod_aeroporto)
);

CREATE TABLE horario (
    cod_horario     SMALLINT NOT NULL,
    dma       	DATE NOT NULL,
	hora			TIME NOT NULL,
    cod_trecho      SMALLINT NOT NULL,
	cod_voo         SMALLINT NOT NULL,
    cod_aeroporto   SMALLINT NOT NULL,
    
    CONSTRAINT horario_pk PRIMARY KEY (cod_horario),
    CONSTRAINT trecho_fk FOREIGN KEY (cod_trecho, cod_aeroporto, cod_voo) REFERENCES trecho
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE assento (
    cod_assento SMALLINT NOT NULL,

    CONSTRAINT assento_pk PRIMARY KEY (cod_assento)
);

CREATE TABLE tipo_aeronave_assento (
    cod_assento SMALLINT NOT NULL,
    cod_aeronave SMALLINT NOT NULL,

    CONSTRAINT tipo_aeronave_assento_pk PRIMARY KEY (cod_assento, cod_aeronave),
    CONSTRAINT assento_fk FOREIGN KEY (cod_assento) REFERENCES assento,
    CONSTRAINT tipo_aeronave_fk FOREIGN KEY (cod_aeronave) REFERENCES tipo_aeronave
        ON UPDATE NO ACTION
);

CREATE TABLE res_trch (
    cod_assento SMALLINT NOT NULL,
    cod_trecho SMALLINT NOT NULL,
    cod_reserva SMALLINT NOT NULL,
	cod_voo         SMALLINT NOT NULL,
    cod_aeroporto   SMALLINT NOT NULL,

    CONSTRAINT res_trch_pk PRIMARY KEY (cod_assento, cod_trecho, cod_reserva),
    CONSTRAINT trecho_fk FOREIGN KEY (cod_trecho, cod_aeroporto, cod_voo) REFERENCES trecho,
    CONSTRAINT assento_fk FOREIGN KEY (cod_assento) REFERENCES assento,
    CONSTRAINT reserva_fk FOREIGN KEY (cod_reserva) REFERENCES reserva
);