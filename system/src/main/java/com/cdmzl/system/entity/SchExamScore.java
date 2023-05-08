package com.cdmzl.system.entity;

import com.code.actable.annotation.Column;
import com.code.actable.annotation.Table;
import com.cdmzl.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author 小江
 * @description TODO
 * @date 2023/4/21 17:13
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@Table(comment = "考试成绩")
public class SchExamScore extends BaseEntity {

    /**
     * 学生ID
     */
    @Column(comment = "学生ID")
    private int studentId;

    /**
     * 考试ID
     */
    @Column(comment = "考试ID")
    private int examId;

    /**
     * 成绩
     */
    @Column(comment = "成绩")
    private double score;
}
