package com.code.dormitory.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.code.actable.annotation.Table;
import com.code.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author 小江
 * @description TODO
 * @date 2023/5/8 13:27
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@Table
public class DorDormitory extends BaseEntity {
    @TableId(type = IdType.AUTO)
    private Long id; // 主键，使用自增长策略

    @TableField("dormitory_number")
    private String dormitoryNumber; // 宿舍编号

    @TableField("dormitory_type")
    private String dormitoryType; // 宿舍类型

    @TableField("floor")
    private Integer floor; // 楼层

    @TableField("building_id")
    private Long buildingId; // 所属楼栋ID
}
