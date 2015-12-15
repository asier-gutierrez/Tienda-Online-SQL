/*SCRIPT PARA LIMPIAR LA BASE DE DATOS*/
SET FEEDBACK OFF;
SET PAGESIZE 0;
SPOOL DROPOBJECTS.SQL;
SELECT 'DROP VIEW '||VIEW_NAME||';' FROM USER_VIEWS;
SELECT 'DROP INDEX '||INDEX_NAME||';' FROM USER_INDEXES;
SELECT DISTINCT 'DROP SEQUENCE '||SEQUENCE_NAME|| ';'FROM USER_SEQUENCES;
SELECT DISTINCT 'DROP TABLE '||TABLE_NAME|| ';'FROM USER_TABLES;
SELECT DISTINCT 'DROP PROCEDURE '||NAME|| ';'FROM USER_SOURCE WHERE TYPE = 'PROCEDURE';
SELECT DISTINCT 'DROP FUNCTION '||NAME|| ';'FROM USER_SOURCE WHERE TYPE = 'FUNCTION';
SELECT DISTINCT 'DROP PACKAGE '||NAME|| ';'FROM USER_SOURCE WHERE TYPE = 'PACKAGE';
SELECT DISTINCT 'DROP TYPE '||NAME|| ';'FROM USER_SOURCE WHERE TYPE = 'TYPE';
SELECT DISTINCT 'DROP TRIGGER '||NAME|| ';'FROM USER_SOURCE WHERE TYPE = 'TRIGGER';
SELECT 'DROP SYNONYM '||SYNONYM_NAME||';' FROM USER_SYNONYMS;
SPOOL OFF;
@ DROPOBJECTS.SQL;