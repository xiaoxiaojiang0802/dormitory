package com.code.dormitory.mapper;

import java.util.List;

import com.code.actable.mapper.BaseMapperPlus;
import com.code.dormitory.domain.DorBed;
import org.apache.ibatis.annotations.Mapper;

/**
 * 床位Mapper接口
 *
 * @author xiaojiang
 * @date 2023-05-15
 */
@Mapper
public interface DorBedMapper extends BaseMapperPlus<DorBedMapper, DorBed> {

}
