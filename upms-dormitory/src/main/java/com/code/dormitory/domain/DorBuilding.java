package com.code.dormitory.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.code.actable.annotation.Column;
import com.code.actable.annotation.Table;
import com.code.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * @date 2023/5/19 15:26
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@Table(comment = "楼栋信息")
public class DorBuilding extends BaseEntity {


    @TableId
    private Long buildingId;

    @Column(comment = "名称")
    private String name;

    @Column(comment = "楼层数量")
    private Integer numberFloors;

    @Column(comment = "房间数量")
    private Integer totalRooms;

    @Column(comment = "可用房间数量")
    private Integer availableRooms;

    @Column(comment = "已使用房间数量")
    private Integer occupiedRooms;

    @Column(comment = "地址")
    private String address;

}
