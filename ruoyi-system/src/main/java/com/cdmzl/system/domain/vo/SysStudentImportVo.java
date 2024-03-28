package com.cdmzl.system.domain.vo;

import com.alibaba.excel.annotation.ExcelProperty;
import com.cdmzl.common.actable.annotation.Column;
import com.cdmzl.common.annotation.ExcelDictFormat;
import com.cdmzl.common.convert.ExcelDictConvert;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 用户对象导入VO
 *
 * @author ruoyi
 */

@Data
@NoArgsConstructor
public class SysStudentImportVo implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 登录名称
     */
    @ExcelProperty(value = "登录名称")
    private String userName;

    /**
     * 学号
     */
    @ExcelProperty(value = "学号")
    private String cardId;

    /**
     * 用户昵称
     */
    @ExcelProperty(value = "用户名称")
    private String nickName;

    /**
     * 用户邮箱
     */
    @ExcelProperty(value = "用户邮箱")
    private String email;

    /**
     * 手机号码
     */
    @ExcelProperty(value = "手机号码")
    private String phonenumber;

    /**
     * 用户性别
     */
    @ExcelProperty(value = "用户性别", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_user_sex")
    private String sex;

    /**
     * 帐号状态（0正常 1停用）
     */
    @ExcelProperty(value = "帐号状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_normal_disable")
    private String status;

}
