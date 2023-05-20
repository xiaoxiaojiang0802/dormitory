package com.code.dormitory.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.code.common.core.domain.entity.SysUser;

import java.util.List;

/**
 * @description TODO
 * @date 2023/5/21 7:40
 **/
public interface DorStudentService extends IService<SysUser> {

    /**
     * 查询未分配学生
     */
    List<SysUser> listStudent(String searchValue);
}
