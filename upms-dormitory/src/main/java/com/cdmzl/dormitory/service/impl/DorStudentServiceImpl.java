package com.cdmzl.dormitory.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cdmzl.common.core.domain.entity.SysUser;
import com.cdmzl.dormitory.mapper.DorStudentMapper;
import com.cdmzl.dormitory.service.DorStudentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Administrator
 * @description TODO
 * @date 2023/5/21 7:41
 **/
@Service
@RequiredArgsConstructor
@Slf4j
public class DorStudentServiceImpl extends ServiceImpl<DorStudentMapper, SysUser> implements DorStudentService {


    /**
     * 查询未分配学生
     */
    @Override
    public List<SysUser> listStudent(String searchValue) {
        return baseMapper.listStudent(searchValue);
    }
}
