package com.cdmzl.system.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.code.actable.annotation.Column;
import com.code.actable.annotation.Table;
import com.code.actable.constants.MySqlTypeConstant;
import com.cdmzl.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * @author 小江
 * @date 2023/4/21 12:50
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@Table
public class SchCourse extends BaseEntity {
    /**
     * 课程主键
     */
    @TableId
    private Long id;

    /**
     * 课程类别
     */
    private Long courseTypeId;

    /**
     * 课程名称
     */
    private String name;

    /**
     * 课程描述
     */
    @Column(type = MySqlTypeConstant.LONGTEXT)
    private String description;
    /**
     * 图片地址
     */
    @Column(type = MySqlTypeConstant.LONGTEXT)
    private String imageUrls;

    /**
     * 课程开始时间
     */
    @Column(type = MySqlTypeConstant.DATETIME)
    private Date startTime;

    /**
     * 课程结束时间
     */
    @Column(type = MySqlTypeConstant.DATETIME)
    private Date endTime;

    /**
     * 课程状态
     * 0-未开始
     * 1-进行中
     * 2-已结束
     */
    @Column(type = MySqlTypeConstant.CHAR, length = 1)
    private String status;
}
