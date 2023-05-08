package com.code.dormitory.domain;

import com.baomidou.mybatisplus.annotation.TableField;

import java.util.Date;

/**
 * @author 小江
 * @description TODO
 * @date 2023/5/8 13:31
 **/
public class DorEntranceRecord {

    @TableField("student_id")
    private Long studentId; // 学生ID

    @TableField("bed_id")
    private Long bedId; // 床位ID

    @TableField("entrance_time")
    private Date entranceTime; // 入住时间

    @TableField("leave_time")
    private Date leaveTime; // 离开时间
}
