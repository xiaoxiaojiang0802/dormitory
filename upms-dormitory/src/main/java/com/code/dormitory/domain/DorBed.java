package com.code.dormitory.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.code.actable.annotation.Table;
import com.code.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 床位
 *
 * @description TODO
 * @date 2023/5/8 13:30
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@Table
public class DorBed extends BaseEntity {

    @TableId
    private Long id;

    /**
     * 所属宿舍ID
     */
    private Long dormitoryId;

    /**
     * 床位编号
     */
    private String bedNumber;

    /**
     * 床位状态
     */
    private String status;
}
