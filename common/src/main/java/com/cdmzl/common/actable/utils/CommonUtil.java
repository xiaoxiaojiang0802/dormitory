package com.cdmzl.common.actable.utils;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 常用工具类
 *

 */
public class CommonUtil {


    /**
     * 判断对象是否为空
     *
     * @return bool
     */
    public static boolean isNull(Object obj) {
        if (obj == null) {
            return true;
        } else {
            if ("String".equals(obj.getClass().getSimpleName())) {
                String str = (String) obj;
                if (str.trim().equals("") || str.trim().equals("null") || str.trim().equals("NULL")) {
                    return true;
                }
            }
            if ("ArrayList".equals(obj.getClass().getSimpleName())) {
                List list = (ArrayList) obj;
                if (list.size() == 0) {
                    return true;
                }
            }
            if ("String[]".equals(obj.getClass().getSimpleName())) {
                String[] strs = (String[]) obj;
                if (strs.length == 1) {
                    if (CommonUtil.isNull(strs[0])) {
                        return true;
                    }
                }
            }
            if ("HashMap".equals(obj.getClass().getSimpleName())) {
                Map<Object, Object> map = (Map<Object, Object>) obj;
                return map.isEmpty();
            }
        }
        return false;
    }

    /**
     * 通用的toString
     */
    public static String toString(Object obj) {
        if (!CommonUtil.isNull(obj)) {
            return obj.toString();
        }
        return null;
    }

    /**
     * 通用的toString
     */
    public static String toStringInteger(Object obj) {
        if (!CommonUtil.isNull(obj)) {
            return obj.toString();
        }
        return "0";
    }

    /**
     * 获取整形
     */
    public static Integer getInteger(Object obj) {
        if (!CommonUtil.isNull(obj)) {
            return Integer.parseInt(obj.toString());
        }
        return 0;
    }

    /**
     * 判断值是否相等
     */
    public static boolean equals(Object obj, String str) {
        if (CommonUtil.isNull(obj)) {
            return false;
        }
        return str.equals(obj.toString());
    }

    /**
     * 为空返回指定参数
     *
     * @param obj   判断的对象
     * @param reStr 返回的默认值
     * @return str
     */
    public static String nullReturn(Object obj, String reStr) {
        if (!CommonUtil.isNull(obj)) {
            return obj.toString();
        }
        return reStr;
    }

    /**
     * 用于组装sql，如传入str为sclead，返回'sclead'
     */
    public static String getString(String str) {
        if (isNull(str)) {
            return null;
        } else {
            return "'" + str + "'";
        }
    }

    /**
     * 用于组装sql，如传入str为sclead，返回'sclead'
     */
    public static String getStringDef(Object objectStr) {
        String str = toString(objectStr);
        if (isNull(str)) {
            return "";
        } else {
            return "" + str + "";
        }
    }

    /**
     * 保留小数点后两位
     */
    public static String getFloat2(String s) {
        if (CommonUtil.isNull(s)) {
            return "0.00";
        }
        if (CommonUtil.equals(Float.parseFloat(s), "0")) {
            return "0.00";
        }
        DecimalFormat df = new DecimalFormat("###.00");
        Float f = Float.parseFloat(s);
        return df.format(f);
    }

    /**
     * 保留小数点后两位
     */
    public static String getFloat2Object(Object objectStr) {
        String s = getFloat2(CommonUtil.toString(objectStr));
        if (CommonUtil.isNull(s)) {
            return "0.00";
        }
        if (CommonUtil.equals(Float.parseFloat(s), "0")) {
            return "0.00";
        }
        DecimalFormat df = new DecimalFormat("###.00");
        Float f = Float.parseFloat(s);
        return df.format(f);
    }

    /**
     * 保留小数点后两位
     */
    public static Double getDouble(String s) {
        if (CommonUtil.isNull(s)) {
            return 0.00;
        }
        if (CommonUtil.equals(Double.parseDouble(s), "0")) {
            return 0.00;
        }
        return Double.parseDouble(s);
    }

    /**
     * 保留小数点后两位
     */
    public static Long getLong(String s) {
        if (CommonUtil.isNull(s)) {
            return -1L;
        }
        if (CommonUtil.equals(Long.parseLong(s), "0")) {
            return -1L;
        }
        return Long.parseLong(s);
    }

}

