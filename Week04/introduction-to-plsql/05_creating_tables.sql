-- Creating Tables
CREATE TABLE autos (
    auto_id NUMBER(5),
    acquire_date DATE,
    color VARCHAR2(15),
    CONSTRAINT auto_id_pk PRIMARY KEY (auto_id)
);
