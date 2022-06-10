DATABASE CHESS;

-- Macros, contains pre-written SQL
DROP MACRO my_macro;

CREATE MACRO my_macro AS (
    SELECT *
        FROM CHESS.Players
        WHERE Rating > 2800;
    );

EXECUTE my_macro;
EXEC my_macro;

-- Can be multiple statements
REPLACE MACRO my_macro AS (
    SELECT *
        FROM CHESS.Players
        WHERE Rating > 2800;
    SELECT *
        FROM CHESS.Players
        WHERE First_Name LIKE 'vlad%';
    );

EXECUTE my_macro;

-- Can have multiple inputs
REPLACE MACRO my_macro (
    input_value1 INTEGER,
    input_value2 INTEGER ) AS (
    SELECT *
        FROM CHESS.Players
        WHERE Rating BETWEEN :input_value1 AND :input_value2; -- :
    );

EXECUTE my_macro(2700, 2750);

SELECT *
    FROM dbc.tables
    SAMPLE 2;