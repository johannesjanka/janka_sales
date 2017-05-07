create or replace 
PROCEDURE PROC_CT_CUSTOMER IS
  v_tabcnt number;
BEGIN
  SELECT count(*) INTO v_tabcnt
  FROM   ALL_TABLES
  WHERE  TABLE_NAME = 'CUSTOMER' and
         OWNER = USER;
         
  IF v_tabcnt = 0 THEN
    EXECUTE IMMEDIATE 'CREATE TABLE CUSTOMER
                       (
                          CUSTOMER_ID   INTEGER,
                          FIRSTNAME     VARCHAR2(20),
                          CREDIT        DECIMAL(10,2),
                          CONSTRAINT CUSTOMER_PK PRIMARY KEY (CUSTOMER_ID)
                       )';
    COMMIT;
  END IF;
  
 
END PROC_CT_CUSTOMER;