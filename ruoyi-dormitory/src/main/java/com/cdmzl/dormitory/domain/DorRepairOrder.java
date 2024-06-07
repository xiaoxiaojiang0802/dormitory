package com.cdmzl.dormitory.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.cdmzl.common.actable.annotation.Column;
import com.cdmzl.common.actable.annotation.Table;
import com.cdmzl.common.actable.constants.MySqlTypeConstant;
import com.cdmzl.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 保修工单
 *
 * @author Administrator
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Table(comment = "维修工单")
public class DorRepairOrder extends BaseEntity {

    @TableId
    private Long repairId;

    @Column(comment = "保修人")
    private String nickName;

    /**
     * 报修位置
     */
    @Column(comment = "报修位置")
    private String location;


    /**
     * 报修情况
     */
    @Column(comment = "报修情况")
    private String description;


    /**
     * 维修状态 dor_repair_state
     */
    @Column(comment = "维修状态")
    private String state;

    /**
     * 维修人
     */
    @Column(comment = "维修人")
    private String  repairUser;


    /**
     * 维修时间
     */
    @Column(comment = "维修时间", type = MySqlTypeConstant.DATETIME)
    private Date repairDateTime;

    /**
     * 确认人
     */
    @Column(comment = "确认人")
    private String confirmUser;


    /**
     * 确认时间
     */
    @Column(comment = "确认时间", type = MySqlTypeConstant.DATETIME)
    private Date confirmDateTime;

}
