package com.cdmzl.dormitory.mapper;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cdmzl.common.core.mapper.BaseMapperPlus;
import com.cdmzl.dormitory.domain.DorBed;
import org.apache.ibatis.annotations.Mapper;

/**
 * 床位Mapper接口
 *
 * @author xiaojiang
 * @date 2023-05-15
 */
@Mapper
public interface DorBedMapper extends BaseMapperPlus<DorBedMapper, DorBed> {


    /**
     * 查询是否存在该床号
     *
     * @param dormitoryId 宿舍ID
     * @param bedNumber   床号
     * @return 是否存在
     */
    default boolean haveBed(Long dormitoryId, String bedNumber) {
        LambdaQueryWrapper<DorBed> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(DorBed::getDormitoryId, dormitoryId);
        wrapper.eq(DorBed::getBedNumber, bedNumber);
        wrapper.eq(DorBed::getStatus, "1");
        return selectCount(wrapper) > 0;
    }
}
