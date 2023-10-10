package com.cdmzl.system.domain;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.cdmzl.common.actable.annotation.Column;
import com.cdmzl.common.annotation.ExcelDictFormat;
import com.cdmzl.common.convert.ExcelDictConvert;
import com.cdmzl.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * 参数配置表 sys_config
 *
 * @author ruoyi
 */

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_config")
@ExcelIgnoreUnannotated
public class SysConfig extends BaseEntity {

    /**
     * 参数主键
     */
    @ExcelProperty(value = "参数主键")
    @TableId(value = "config_id")
    private Long configId;

    /**
     * 参数名称
     */
    @ExcelProperty(value = "参数名称")
    @Column
    @NotBlank(message = "参数名称不能为空")
    @Size(min = 0, max = 100, message = "参数名称不能超过100个字符")
    private String configName;

    /**
     * 参数键名
     */
    @Column
    @ExcelProperty(value = "参数键名")
    @NotBlank(message = "参数键名长度不能为空")
    @Size(min = 0, max = 100, message = "参数键名长度不能超过100个字符")
    private String configKey;

    /**
     * 参数键值
     */
    @Column
    @ExcelProperty(value = "参数键值")
    @NotBlank(message = "参数键值不能为空")
    @Size(min = 0, max = 500, message = "参数键值长度不能超过500个字符")
    private String configValue;

    /**
     * 系统内置（Y是 N否）
     */
    @Column
    @ExcelProperty(value = "系统内置", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_yes_no")
    private String configType;

    /**
     * 备注
     */
    @Column
    private String remark;

}
