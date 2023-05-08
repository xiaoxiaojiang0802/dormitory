package com.cdmzl.system.mapper;

import com.cdmzl.common.actable.mapper.BaseMapperPlus;
import com.cdmzl.common.core.domain.entity.SysUser;
import com.cdmzl.system.entity.SchCourseUser;

import java.util.List;

/**
 * 【请填写功能名称】Mapper接口
 *

 * @date 2023-04-21
 */
public interface SchCourseUserMapper extends BaseMapperPlus<SchCourseUserMapper, SchCourseUser> {


    /**
     * 查询修读名单
     *
     * @param courseId 课程id
     * @return list
     */
    List<SysUser> listCourseUser(Long courseId);
}
