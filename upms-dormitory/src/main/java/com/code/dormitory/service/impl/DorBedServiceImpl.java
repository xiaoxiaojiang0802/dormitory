package com.code.dormitory.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.code.common.core.domain.R;
import com.code.dormitory.domain.DorBed;
import com.code.dormitory.domain.DorDormitory;
import com.code.dormitory.mapper.DorBedMapper;
import com.code.dormitory.mapper.DorDormitoryMapper;
import com.code.dormitory.service.DorBedService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 床位Service业务层处理
 *
 * @author xiaojiang
 * @date 2023-05-15
 */
@Service
@RequiredArgsConstructor
public class DorBedServiceImpl extends ServiceImpl<DorBedMapper, DorBed> implements DorBedService {

    private final DorDormitoryMapper dorDormitoryMapper;

    /**
     * 添加床位
     *
     * @return r
     */
    @Override
    public R<Void> addBed(DorBed bed) {
        Long count = baseMapper.selectCount(new LambdaQueryWrapper<DorBed>().eq(DorBed::getDormitoryId, bed.getDormitoryId()));
        DorDormitory dorDormitory = dorDormitoryMapper.selectById(bed.getDormitoryId());
        if (count >= Long.parseLong(dorDormitory.getDormitoryType())) {
            return R.fail("宿舍床位已满无法新增!");
        }
        baseMapper.insert(bed);
        return R.ok();
    }
}
