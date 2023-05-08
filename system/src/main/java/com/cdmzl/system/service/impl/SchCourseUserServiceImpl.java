package com.cdmzl.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cdmzl.common.core.domain.entity.SysUser;
import com.cdmzl.system.entity.SchCourseUser;
import com.cdmzl.system.mapper.SchCourseUserMapper;
import com.cdmzl.system.service.SchCourseUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 【请填写功能名称】Service业务层处理
 *

 * @date 2023-04-21
 */
@Service
@RequiredArgsConstructor
public class SchCourseUserServiceImpl extends ServiceImpl<SchCourseUserMapper, SchCourseUser> implements SchCourseUserService {
    /**
     * 查询修读名单
     *
     * @param courseId 课程id
     * @return list
     */
    @Override
    public List<SysUser> listCourseUser(Long courseId) {
        return baseMapper.listCourseUser(courseId);
    }
}
