package com.cdmzl.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.cdmzl.common.actable.annotation.Column;
import com.cdmzl.common.actable.annotation.Unique;
import lombok.Data;

/**
 * 角色和部门关联 sys_role_dept
 *
 * @author ruoyi
 */

@Data
@TableName("sys_role_dept")
public class SysRoleDept {

    /**
     * 角色ID
     */
    @Unique
    private Long roleId;

    /**
     * 部门ID
     */
    @Unique
    private Long deptId;

}
