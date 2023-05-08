package com.cdmzl.common.actable.annotation;

import java.lang.annotation.*;

/**
 * 对象转换成xml注解
 *
 * @author 小江
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface BeanToXml {

    /**
     * 映射字段名称
     *
     * @return str
     */
    String name() default "";

    /**
     * 分类标记
     *
     * @return null
     */
    String[] groups() default {"V1"};
}
