package com.cdmzl.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.cdmzl.common.actable.annotation.Column;
import com.cdmzl.common.actable.annotation.Unique;
import lombok.Data;

/**
 * 用户和角色关联 sys_user_role
 *
 * @author ruoyi
 */
@Data
@TableName("sys_user_role")
public class SysUserRole {

    /**
     * 用户ID
     */
    @Unique
    private Long userId;

    /**
     * 角色ID
     */
    @Unique
    private Long roleId;

}
