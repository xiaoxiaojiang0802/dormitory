package com.cdmzl.common.actable.utils;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.date.LocalDateTimeUtil;
import com.cdmzl.common.actable.constants.DateFormatConstant;
import lombok.extern.slf4j.Slf4j;

import java.lang.reflect.Field;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author 0877
 */
@Slf4j
public class FieldUtils {

    public static <T> Field getKeyField(T obj) {
        Field[] allFields = getAllFields(obj);
        for (Field field : allFields) {
            // 设置访问权限
            field.setAccessible(true);
            if (ColumnUtils.isKey(field, obj.getClass())) {
                return field;
            }
        }
        return null;
    }

    public static <T> Field[] getAllFields(T obj) {
        Field[] declaredFields = obj.getClass().getDeclaredFields();

        // 递归扫描父类的filed
        declaredFields = recursionParents(obj.getClass(), declaredFields);
        return declaredFields;
    }

    /**
     * 递归扫描父类的fields
     *
     * @param clas
     * @param fields
     */
    @SuppressWarnings("rawtypes")
    public static Field[] recursionParents(Class<?> clas, Field[] fields) {
        if (clas.getSuperclass() != null) {
            Class clsSup = clas.getSuperclass();
            List<Field> fieldList = new ArrayList<Field>();
            fieldList.addAll(Arrays.asList(fields));
            fieldList.addAll(Arrays.asList(clsSup.getDeclaredFields()));
            fields = new Field[fieldList.size()];
            int i = 0;
            for (Object field : fieldList.toArray()) {
                fields[i] = (Field) field;
                i++;
            }
            fields = recursionParents(clsSup, fields);
        }
        return fields;
    }

    /**
     * 给对象赋值
     *
     * @param fieldValue  数值
     * @param newInstance 对象
     * @param field       field
     * @param <T>         t
     */
    public static <T> void buildFieldValue(Object fieldValue, T newInstance, Field field) {
        try {
            String fieldValueStr = CommonUtil.toString(fieldValue);
            String typeName = field.getType().toString();
            switch (typeName) {
                case "class java.time.LocalDateTime":
                    field.set(newInstance, Timestamp.valueOf(fieldValueStr).toLocalDateTime());
                    break;
                case "class java.time.LocalDate":
                    field.set(newInstance, Date.valueOf(fieldValueStr).toLocalDate());
                    break;
                case "class java.time.LocalTime":
                    field.set(newInstance, Time.valueOf(fieldValueStr).toLocalTime());
                    break;
                case "class java.lang.Short":
                    field.set(newInstance, Short.parseShort(fieldValueStr));
                    break;
                case "class java.lang.String":
                    field.set(newInstance, CommonUtil.getStringDef(fieldValueStr));
                    break;
                case "class java.lang.Long":
                    field.set(newInstance, CommonUtil.getLong(fieldValueStr));
                    break;
                case "class java.util.Date":
                    field.set(newInstance, DateUtil.parse(fieldValueStr, "yyyy-MM-dd HH:mm:ss"));
                    break;
                case "double":
                    field.set(newInstance, CommonUtil.getDouble(fieldValueStr));
                    break;
                default:
                    field.set(newInstance, fieldValue);
                    break;
            }
        } catch (Exception exception) {
            log.error("数据类型写入失败:" + field.getType());
            exception.printStackTrace();
        }
    }

    /**
     * 给对象赋值
     *
     * @param fieldValue 数值
     * @param field      field
     */
    public static String getFileValueStr(Object fieldValue, Field field) {
        String fieldValueStr = "";
        try {
            fieldValueStr = CommonUtil.toString(fieldValue);
            if (fieldValueStr == null) {
                return "";
            }
            String typeName = field.getType().toString();
            switch (typeName) {
                case "class java.time.LocalDateTime":
                    fieldValueStr = DateUtil.format(Timestamp.valueOf(fieldValueStr).toLocalDateTime(), DateFormatConstant.DATE_TIME_SEC_);
                    break;
                case "class java.time.LocalDate":
                    fieldValueStr = LocalDateTimeUtil.format(Date.valueOf(fieldValueStr).toLocalDate(), DateFormatConstant.DATE_TIME_SEC_);
                    break;
                case "class java.time.LocalTime":
                    fieldValueStr = Time.valueOf(fieldValueStr).toLocalTime().toString();
                    break;
                case "class java.util.Date":
                    java.util.Date date = (java.util.Date) fieldValue;
                    fieldValueStr = DateUtil.format(date, DateFormatConstant.DATE_TIME_SEC_);
                    break;
                default:
                    break;
            }
        } catch (Exception exception) {
            log.error("数据类型写入失败:" + field.getType());
            exception.printStackTrace();
        }
        return fieldValueStr;
    }
}
