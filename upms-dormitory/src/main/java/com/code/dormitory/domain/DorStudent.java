package com.code.dormitory.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;

/**
 * @author 小江
 * @description TODO
 * @date 2023/5/8 13:31
 **/
public class DorStudent {

    @TableId(type = IdType.AUTO)
    private Long id; // 主键，使用自增长策略

    @TableField("student_number")
    private String studentNumber; // 学号

    @TableField("name")
    private String name; // 姓名

    @TableField("gender")
    private String gender; // 性别

    @TableField("class_id")
    private Long classId; // 所属班级ID

    @TableField("dormitory_id")
    private Long dormitoryId; // 所属宿舍ID
}
