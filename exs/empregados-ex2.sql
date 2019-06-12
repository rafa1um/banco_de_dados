CREATE TABLE departamento (
    codigo_depto        INTEGER NOT NULL,
    nome VARCHAR (40)   NOT NULL,
    CONSTRAINT departamento_pk
        PRIMARY KEY (codigo_depto)
);


CREATE TABLE empregado (
    codigo_emp      INTEGER NOT NULL,
    nome            VARCHAR (40) NOT NULL,
    cod_emp_chefe   INTEGER NULL,
    CONSTRAINT empregado_pk
        PRIMARY KEY (codigo_emp),

    CONSTRAINT emp_dpto_fk
        FOREIGN KEY (codigo_depto)
        REFERENCES departamento
        ON DELETE NO ACTION
        ON UPDATE CASCADE,

    CONSTRAINT emp_chefe_fk
        FOREIGN KEY (cod_emp_chefe)
        REFERENCES empregado
        ON DELETE SET NULL
        ON UPDATE CASCADE
);