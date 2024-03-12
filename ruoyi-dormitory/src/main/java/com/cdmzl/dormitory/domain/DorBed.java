package com.cdmzl.dormitory.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.cdmzl.common.actable.annotation.Column;
import com.cdmzl.common.actable.annotation.Table;
import com.cdmzl.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * 床位
 *
 * @author Administrator
 * @date 2023/5/8 13:30
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@Table(comment = "床位")
public class DorBed extends BaseEntity {

    @TableId
    private Long bedId;

    /**
     * 所属宿舍ID
     */
    @NotNull
    @Column(comment = "宿舍")
    private Long dormitoryId;

    /**
     * 床位编号
     */
    @Column(comment = "床位编号")
    private String bedNumber;

    /**
     * 床位状态 dor_bed_status
     */
    @Column(comment = "床位状态")
    private String status;

    /**
     * 记录id
     */
    @Column(comment = "记录id")
    private Long recordId;
}
