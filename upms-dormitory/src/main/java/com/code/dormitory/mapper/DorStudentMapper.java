package com.code.dormitory.mapper;

import com.code.actable.mapper.BaseMapperPlus;
import com.code.common.core.domain.entity.SysUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;

import java.util.List;

/**
 * @description TODO
 * @date 2023/5/21 7:39
 **/
@Mapper
public interface DorStudentMapper extends BaseMapperPlus<DorStudentMapper, SysUser> {

    /**
     * 查询未入住
     *
     * @param searchValue 姓名
     * @return list
     */
    List<SysUser> listStudent(@Param("searchValue") String searchValue);
}
