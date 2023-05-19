package com.code.dormitory.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.code.actable.annotation.Column;
import com.code.actable.annotation.Table;
import com.code.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 宿舍
 *
 * @author Administrator
 * @date 2023/5/8 13:27
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@Table(comment = "宿舍")
public class DorDormitory extends BaseEntity {


    @TableId
    private Long dormitoryId;

    /**
     * 宿舍编号
     */
    @Column(comment = "宿舍编号")
    private String dormitoryNumber;

    /**
     * 宿舍类型 dor_dormitory_type
     */
    @Column(comment = "宿舍类型")
    private String dormitoryType;

    /**
     * 楼层
     */
    @Column(comment = "楼层")
    private Integer floor;

    /**
     * 所属楼栋ID
     */
    @Column(comment = "楼栋")
    private Long buildingId;
}
