package com.cdmzl.system.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.code.actable.annotation.Column;
import com.code.actable.annotation.Table;
import com.cdmzl.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author 小江
 * @date 2023/4/21 16:40
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@Table(comment = "题目")
public class SchQuestion extends BaseEntity {


    /**
     * 题目ID
     */
    @TableId
    private Long id;

    /**
     * 题目内容
     */
    @Column(comment = "题目内容")
    private String content;


    /**
     * 题型 sch_question_type 1填空 2单选题 3多选题 4判断题
     */
    @Column(comment = "题型")
    private String questionType;
    /**
     * 题目选项
     */
    @Column(comment = "题目选项")
    private String options;


    /**
     * 题目答案
     */
    @Column(comment = "题目答案")
    private String answer;
}
