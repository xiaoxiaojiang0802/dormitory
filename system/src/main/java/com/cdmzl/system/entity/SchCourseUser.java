package com.cdmzl.system.entity;

import com.cdmzl.common.actable.annotation.Table;
import lombok.Data;

/**
 * @author 小江
 * @date 2023/4/21 17:14
 **/
@Data
@Table
public class SchCourseUser {

    /**
     * 学生id
     */
    private Long userId;

    /**
     * 课程id
     */
    private Long courseId;
}
