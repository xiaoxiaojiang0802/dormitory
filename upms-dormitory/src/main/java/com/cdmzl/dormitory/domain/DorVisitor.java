package com.cdmzl.dormitory.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.cdmzl.common.actable.annotation.Column;
import com.cdmzl.common.actable.annotation.Table;
import com.cdmzl.common.actable.constants.MySqlTypeConstant;
import com.cdmzl.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 访客记录
 *
 * @author Administrator
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
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Column(type = MySqlTypeConstant.DATETIME)
    private Date visitDate;
    /**
     * 离开时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Column(type = MySqlTypeConstant.DATETIME)
    private Date leaveDate;
}
