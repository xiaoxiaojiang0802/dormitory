package com.code.dormitory.domain;

import com.code.actable.annotation.Column;
import com.code.actable.annotation.Table;
import com.code.actable.constants.MySqlTypeConstant;
import com.code.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 居住记录
 *
 * @author Administrator
 * @date 2023/5/8 13:31
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@Table
public class DorEntranceRecord extends BaseEntity {

    /**
     * 学生ID
     */
    private Long userId;

    /**
     * 床位ID
     */
    private Long bedId;

    /**
     * 入住时间
     */
    @Column(type = MySqlTypeConstant.DATETIME)
    private Date entranceTime;

    /**
     * 离开时间
     */
    @Column(type = MySqlTypeConstant.DATETIME)
    private Date leaveTime;
}
