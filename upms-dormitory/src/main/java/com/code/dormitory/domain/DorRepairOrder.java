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
 * 保修工单
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Table
public class DorRepairOrder extends BaseEntity {

    @TableId
    private Long repairId;

    /**
     * 保修位置
     */
    private String location;


    /**
     * 保修情况
     */
    private String description;


    /**
     * 维修状态 dor_repair_state
     */
    private String state;

    /**
     * 维修人
     */
    private Long repairUser;


    /**
     * 维修时间
     */
    @Column(type = MySqlTypeConstant.DATETIME)
    private Date repairDateTime;

    /**
     * 确认人
     */
    private Long confirmUser;


    /**
     * 确认时间
     */
    @Column(type = MySqlTypeConstant.DATETIME)
    private Date confirmDateTime;

}
