CREATE OR REPLACE TABLE Build_SIM_BOM."BMATHUB_BASE".T_COMPRESS_BOM_CORE (
  INPUT_ITEM_ID VARCHAR(21),
  ITEM_CLASS_NM VARCHAR(30),
  OUTPUT_ITEM_ID VARCHAR(21),
  BOM_NUM NUMBER autoincrement start 100 increment 1,
  LOC VARCHAR(10)
);
