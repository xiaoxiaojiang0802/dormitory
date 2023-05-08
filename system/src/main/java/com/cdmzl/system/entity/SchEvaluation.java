package com.cdmzl.system.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.code.actable.annotation.Column;
import com.code.actable.annotation.Table;
import com.cdmzl.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * @author 小江
 * @date 2023/4/21 16:52
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@Table(comment = "评价")
public class SchEvaluation extends BaseEntity {

    /**
     * 评价ID
     */
    @TableId
    @Column(comment = "评价ID")
    private Long id;

    /**
     * 评价内容
     */
    @Column(comment = "评价内容")
    private String content;

    /**
     * 评价分数
     */
    @Column(comment = "评价分数")
    private Integer score;

    /**
     * 评价时间
     */
    @Column(comment = "评价时间")
    private Date time;
}
