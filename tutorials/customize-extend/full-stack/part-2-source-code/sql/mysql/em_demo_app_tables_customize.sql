
/* Part-02 : Add Column and New Table */

ALTER TABLE erp_product 
add (
  product_added_column varchar(50) DEFAULT ''
);

CREATE TABLE erp_product_added_table
AS
SELECT * 
FROM erp_product
;


/* Part-02 : Reverse Changes For Tutorial Remove Column and Table */

/*
ALTER TABLE erp_product 
 drop product_add_column 
;

DROP TABLE erp_product_add_table
;

*/