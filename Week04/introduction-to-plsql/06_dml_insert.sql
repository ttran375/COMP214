-- DML - Insert
INSERT INTO autos (
    auto_id,
    acquire_date,
    color
) VALUES (
    45321,
    TO_DATE('05-MAY-2012', 'DD-MON-YYYY'),
    'gray'
);

INSERT INTO autos (
    auto_id,
    acquire_date,
    color
) VALUES (
    81433,
    TO_DATE('12-OCT-2012', 'DD-MON-YYYY'),
    'red'
);

COMMIT;

SELECT
    *
FROM
    autos;
