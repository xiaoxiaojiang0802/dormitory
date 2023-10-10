package com.cdmzl.dormitory.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.cdmzl.common.core.mapper.BaseMapperPlus;
import com.cdmzl.dormitory.domain.DorEntranceRecord;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author xiaojiang
 * @date 2023-05-15
 */
@Mapper
public interface DorEntranceRecordMapper extends BaseMapperPlus<DorEntranceRecordMapper, DorEntranceRecord> {


    /**
     * 居住
     *
     * @param userId 用户id
     */
    void updateStudent(@Param("userId") Long userId);

    /**
     * 分页查询数据
     *
     * @param page    分页
     * @param wrapper 查询条件
     * @return page
     */
    IPage pageRecord(IPage page, @Param(Constants.WRAPPER) Wrapper wrapper);

}
