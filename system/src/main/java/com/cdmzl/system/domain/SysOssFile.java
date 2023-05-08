package com.cdmzl.system.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.code.actable.annotation.Column;
import com.code.actable.annotation.Table;
import com.cdmzl.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 文件管理
 *
 * @author Luckly
 * @date 2019-06-18 17:18:42
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Table
public class SysOssFile extends BaseEntity {

    /**
     * 编号
     */
    @TableId
    @ApiModelProperty(value = "文件编号")
    private Long id;

    /**
     * 文件名
     */
    @Column
    @ApiModelProperty(value = "文件名")
    private String fileName;

    /**
     * 原文件名
     */
    @Column
    @ApiModelProperty(value = "原始文件名")
    private String original;

    /**
     * 容器名称
     */
    @Column
    @ApiModelProperty(value = "存储桶名称")
    private String bucketName;

    /**
     * 文件类型
     */
    @Column
    @ApiModelProperty(value = "文件类型")
    private String type;

    /**
     * 文件大小
     */
    @Column
    @ApiModelProperty(value = "文件大小")
    private Long fileSize;


    /**
     * 删除标识：1-删除，0-正常
     */
    @Column
    @TableLogic
    @ApiModelProperty(value = "删除标记,1:已删除,0:正常")
    private Integer delFlag;

}
