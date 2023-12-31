package com.cdmzl.system.mapper;

import com.cdmzl.common.core.mapper.BaseMapperPlus;
import com.cdmzl.system.domain.SysUserRole;

import java.util.List;

/**
 * 用户与角色关联表 数据层
 *
 * @author ruoyi
 */
public interface SysUserRoleMapper extends BaseMapperPlus<SysUserRoleMapper, SysUserRole> {

    List<Long> selectUserIdsByRoleId(Long roleId);

}
