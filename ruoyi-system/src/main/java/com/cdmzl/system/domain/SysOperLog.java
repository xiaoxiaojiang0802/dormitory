package com.cdmzl.system.domain;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.cdmzl.common.actable.annotation.Column;
import com.cdmzl.common.actable.constants.MySqlTypeConstant;
import com.cdmzl.common.annotation.ExcelDictFormat;
import com.cdmzl.common.convert.ExcelDictConvert;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 操作日志记录表 oper_log
 *
 * @author ruoyi
 */

@Data
@TableName("sys_oper_log")
@ExcelIgnoreUnannotated
public class SysOperLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 日志主键
     */
    @ExcelProperty(value = "日志主键")
    @TableId(value = "oper_id")
    private Long operId;

    /**
     * 操作模块
     */
    @Column
    @ExcelProperty(value = "操作模块")
    private String title;

    /**
     * 业务类型（0其它 1新增 2修改 3删除）
     */
    @ExcelProperty(value = "业务类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_oper_type")
    @Column
    private Integer businessType;

    /**
     * 业务类型数组
     */
    @TableField(exist = false)
    private Integer[] businessTypes;

    /**
     * 请求方法
     */
    @Column
    @ExcelProperty(value = "请求方法")
    private String method;

    /**
     * 请求方式
     */
    @Column
    @ExcelProperty(value = "请求方式")
    private String requestMethod;

    /**
     * 操作类别（0其它 1后台用户 2手机端用户）
     */
    @Column
    @ExcelProperty(value = "操作类别", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=其它,1=后台用户,2=手机端用户")
    private Integer operatorType;

    /**
     * 操作人员
     */
    @Column
    @ExcelProperty(value = "操作人员")
    private String operName;

    /**
     * 部门名称
     */
    @Column
    @ExcelProperty(value = "部门名称")
    private String deptName;

    /**
     * 请求url
     */
    @Column
    @ExcelProperty(value = "请求地址")
    private String operUrl;

    /**
     * 操作地址
     */
    @Column
    @ExcelProperty(value = "操作地址")
    private String operIp;

    /**
     * 操作地点
     */
    @Column
    @ExcelProperty(value = "操作地点")
    private String operLocation;

    /**
     * 请求参数
     */
    @Column(length = 2000)
    @ExcelProperty(value = "请求参数")
    private String operParam;

    /**
     * 返回参数
     */
    @Column
    @ExcelProperty(value = "返回参数")
    private String jsonResult;

    /**
     * 操作状态（0正常 1异常）
     */
    @Column
    @ExcelProperty(value = "状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_common_status")
    private Integer status;

    /**
     * 错误消息
     */
    @Column(type = MySqlTypeConstant.LONGTEXT)
    @ExcelProperty(value = "错误消息")
    private String errorMsg;

    /**
     * 操作时间
     */
    @Column
    @ExcelProperty(value = "操作时间")
    private Date operTime;

    /**
     * 请求参数
     */
    @TableField(exist = false)
    private Map<String, Object> params = new HashMap<>();

}
