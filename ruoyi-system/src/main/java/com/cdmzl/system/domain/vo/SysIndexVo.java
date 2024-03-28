package com.cdmzl.system.domain.vo;

import lombok.Data;

/**
 * @author LJJ
 * @date 2024/3/28
 */
@Data
public class SysIndexVo {


    /**
     * 人数
     */
    private Integer personCount;

    /**
     * 消息
     */
    private Integer spareRoom;

    /**
     * 维修
     */
    private Integer turnover;

    /**
     * 维保
     */
    private Integer orderCount;
}
