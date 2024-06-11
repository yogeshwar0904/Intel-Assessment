CREATE OR REPLACE PROCEDURE Build_SIM_BOM."BMATHUB_BASE".P_MASTER_ROOT_MAINTAIN()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN
    MERGE INTO 
        Build_SIM_BOM."BMATHUB_BASE".T_LOCATION_ROOT AS TGT
    USING  
        Build_SIM_BOM."MASTER_DATA".LOCATION AS SRC
    ON 
        TGT.ITEM_ID = SRC.ITEM_ID
    WHEN MATCHED THEN 
        UPDATE SET
            TGT.ITEM_CLASS_NM = SRC.ITEM_CLASS_NM,
            TGT.LOCATION_ID = SRC.LOCATION_ID
    WHEN NOT MATCHED THEN 
        INSERT (
            ITEM_ID,
            ITEM_CLASS_NM,
            LOCATION_ID
        ) VALUES (
            SRC.ITEM_ID,
            SRC.ITEM_CLASS_NM,
            SRC.LOCATION_ID
        );

    MERGE INTO 
        Build_SIM_BOM."BMATHUB_BASE".T_ITEM_DETAIL_ROOT AS TGT
    USING  
        Build_SIM_BOM."MASTER_DATA".ITEM AS SRC
    ON 
        TGT.ITEM_ID = SRC.ITEM_ID
    WHEN MATCHED THEN 
        UPDATE SET
            TGT.ITEM_CLASS_NM = SRC.ITEM_CLASS_NM,
            TGT.ITEM_DSC = SRC.ITEM_DSC,
            TGT.DELETE_IND = SRC.DELETE_IND
    WHEN NOT MATCHED THEN 
        INSERT (
            ITEM_ID,
            ITEM_CLASS_NM,
            ITEM_DSC,
            DELETE_IND  
        ) VALUES (
            SRC.ITEM_ID,
            SRC.ITEM_CLASS_NM,
            SRC.ITEM_DSC,
            SRC.DELETE_IND 
        );

    MERGE INTO 
        Build_SIM_BOM."BMATHUB_BASE".T_ORIG_BOM AS TGT
    USING  
        Build_SIM_BOM."MASTER_DATA".ORIG_BOM AS SRC
    ON 
        TGT.INPUT_ITEM_ID = SRC.INPUT_ITEM_ID 
    AND TGT.OUTPUT_ITEM_ID = SRC.OUTPUT_ITEM_ID      
    WHEN MATCHED THEN 
        UPDATE SET
            TGT.ITEM_CLASS_NM = SRC.ITEM_CLASS_NM,
            TGT.LOC = SRC.LOC
    WHEN NOT MATCHED THEN 
        INSERT (
            INPUT_ITEM_ID,
            ITEM_CLASS_NM,
            OUTPUT_ITEM_ID,
            LOC  
        ) VALUES (
            SRC.INPUT_ITEM_ID,
            SRC.ITEM_CLASS_NM,
            SRC.OUTPUT_ITEM_ID,
            SRC.LOC 
        );
    RETURN 'Insert into table successfully';
END;
$$;
call Build_SIM_BOM."BMATHUB_BASE".P_MASTER_ROOT_MAINTAIN();
