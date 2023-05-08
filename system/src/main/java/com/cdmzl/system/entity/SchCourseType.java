package com.cdmzl.system.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.code.actable.annotation.Table;
import com.cdmzl.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@Table
public class SchCourseType extends BaseEntity {

    @TableId
    private Long id;

    /**
     * 类别名称
     */
    private String name;
}
