package com.cdmzl.common.actable.constants;


/**

 * @date 2022/4/24
 */
public enum H2DataTypeMap {

    VARCHAR("varchar", "12"),
    CHAR("char", "1"),
    INTEGER("integer", "4"),
    INT("int", "4"),
    SERIAL("serial", "4"),
    BIGINT("bigint", "-5"),
    TEXT("text", "2005"),
    LONGVARCHAR("longvarchar", "-1");

    private String dataType;

    private String h2DataType;

    H2DataTypeMap(String varchar, String s) {
        this.dataType = varchar;
        this.h2DataType = s;
    }

    /**
     * 数据类型转H2
     *
     * @param dataType
     * @return
     */
    public static String getDataType(String dataType) {
        for (H2DataTypeMap h2DataTypeMap : H2DataTypeMap.values()) {
            if (h2DataTypeMap.dataType.equals(dataType.substring(0, dataType.length()))) {
                return h2DataTypeMap.h2DataType;
            }
        }
        return "";
    }
}
