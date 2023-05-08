package com.cdmzl.common.actable.annotation;

import java.lang.annotation.*;

/**
 * 对象转换成xml注解
 *
 * @author 小江
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface XmlName {

    /**
     * 映射字段名称
     *
     * @return str
     */
    String name() default "";

}
