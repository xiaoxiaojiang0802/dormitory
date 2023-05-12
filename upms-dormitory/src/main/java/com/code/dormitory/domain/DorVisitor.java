package com.code.dormitory.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.code.actable.annotation.Column;
import com.code.actable.annotation.Table;
import com.code.actable.constants.MySqlTypeConstant;
import com.code.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 访客记录
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Table
public class DorVisitor extends BaseEntity {


    @TableId
    private Long visitorId;


    /**
     * 姓名
     */
    private String name;

    /**
     * 联系电话
     */
    private String phone;


    /**
     * 来访时间
     */
    @Column(type = MySqlTypeConstant.DATETIME)
    private Date visitDate;
    /**
     * 离开时间
     */
    @Column(type = MySqlTypeConstant.DATETIME)
    private Date leaveDate;
}
