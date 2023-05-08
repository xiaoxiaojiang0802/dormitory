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
 * @date 2023/5/8 13:30
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@Table
public class DorBed extends BaseEntity {
    @TableId(type = IdType.AUTO)
    private Long id; // 主键，使用自增长策略
    @TableField("bed_number")
    private String bedNumber; // 床位编号
    @TableField("dormitory_id")
    private Long dormitoryId; // 所属宿舍ID
    @TableField("status")
    private String status; // 床位状态
}
