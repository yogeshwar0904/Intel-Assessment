CREATE OR REPLACE VIEW Build_SIM_BOM."BMATHUB_XFRM".V_LOCATION_ROOT(
  ITEM_ID,
  ITEM_CLASS_NM,
  LOCATION_ID 
) AS SELECT 
  ITEM_ID,
  ITEM_CLASS_NM,
  LOCATION_ID 
FROM 
  Build_SIM_BOM."BMATHUB_BASE".T_LOCATION_ROOT;