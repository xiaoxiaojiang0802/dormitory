package com.cdmzl.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.cdmzl.common.actable.annotation.Column;
import com.cdmzl.common.actable.annotation.Table;
import com.cdmzl.common.actable.annotation.Unique;
import lombok.Data;

/**
 * 角色和菜单关联 sys_role_menu
 *
 * @author ruoyi
 */
@Data
@Table
@TableName("sys_role_menu")
public class SysRoleMenu {

    /**
     * 角色ID
     */
    @Unique
    private Long roleId;

    /**
     * 菜单ID
     */
    @Unique
    private Long menuId;

}
