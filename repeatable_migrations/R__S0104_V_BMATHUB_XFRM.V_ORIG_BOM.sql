CREATE OR REPLACE VIEW Build_SIM_BOM."BMATHUB_XFRM".V_ORIG_BOM (
    INPUT_ITEM_ID,
	ITEM_CLASS_NM,
	OUTPUT_ITEM_ID,
	LOC 
) AS SELECT
        BOM.INPUT_ITEM_ID,
	    BOM.ITEM_CLASS_NM,
	    BOM.OUTPUT_ITEM_ID,
	    LOC.LOCATION_ID
FROM 
Build_SIM_BOM."BMATHUB_BASE".T_ORIG_BOM AS BOM
JOIN Build_SIM_BOM."BMATHUB_XFRM".V_LOCATION_ROOT AS LOC
ON BOM.INPUT_ITEM_ID = LOC.ITEM_ID;
