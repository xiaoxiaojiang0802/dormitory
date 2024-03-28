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
    private Long personCount;

    /**
     * 空闲寝室
     */
    private Long spareRoom;

    /**
     * 维修
     */
    private Long turnover;

    /**
     * 访客
     */
    private Long orderCount;
}
