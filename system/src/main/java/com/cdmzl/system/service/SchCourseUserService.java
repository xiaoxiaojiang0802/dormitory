package com.cdmzl.system.service;

import java.util.List;

import com.cdmzl.common.core.domain.entity.SysUser;
import com.cdmzl.system.entity.SchCourseUser;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 【请填写功能名称】Service接口
 *

 * @date 2023-04-21
 */
public interface SchCourseUserService extends IService<SchCourseUser> {

    /**
     * 查询修读名单
     *
     * @param courseId 课程id
     * @return list
     */
    List<SysUser> listCourseUser(Long courseId);
}
