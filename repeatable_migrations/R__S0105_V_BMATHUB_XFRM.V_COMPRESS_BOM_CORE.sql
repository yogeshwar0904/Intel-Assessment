CREATE OR REPLACE VIEW Build_SIM_BOM."BMATHUB_XFRM".V_COMPRESS_BOM_CORE
AS
    SELECT
        BOM.INPUT_ITEM_ID AS ITEM,
        BOM.ITEM_CLASS_NM,
        BOM1.INPUT_ITEM_ID AS ANCHOR_ITEM_ID,
        BOM.BOM_NUM,
        BOM.LOC AS LOC,
        CURRENT_DATE AS CREATE_DATE,
        'Admin' AS CREATE_USER
    FROM
       Build_SIM_BOM."BMATHUB_BASE".T_COMPRESS_BOM_CORE AS BOM
    JOIN
        Build_SIM_BOM."BMATHUB_BASE".T_COMPRESS_BOM_CORE AS BOM1
        ON BOM.INPUT_ITEM_ID = BOM1.OUTPUT_ITEM_ID
    JOIN
        Build_SIM_BOM."BMATHUB_BASE".T_COMPRESS_BOM_CORE  AS BOM2
        ON BOM1.INPUT_ITEM_ID = BOM2.OUTPUT_ITEM_ID
    WHERE
        BOM.ITEM_CLASS_NM = 'IC';