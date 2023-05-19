package com.code.dormitory.service.impl;

import java.util.Date;

import com.code.dormitory.mapper.DorBedMapper;
import com.google.common.collect.Maps;

import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.code.dormitory.domain.DorBed;
import com.code.dormitory.domain.DorDormitory;
import com.code.dormitory.mapper.DorDormitoryMapper;
import com.code.dormitory.service.DorDormitoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author xiaojiang
 * @date 2023-05-15
 */
@Service
@RequiredArgsConstructor
public class DorDormitoryServiceImpl extends ServiceImpl<DorDormitoryMapper, DorDormitory> implements DorDormitoryService {

    private final DorBedMapper bedMapper;

    @Override
    public void addDormitory(DorDormitory dorDormitory) {
        dorDormitory.setDormitoryId(IdUtil.getSnowflakeNextId());
        for (int i = 0; i < Integer.parseInt(dorDormitory.getDormitoryType()); i++) {
            DorBed bed = new DorBed();
            bed.setDormitoryId(dorDormitory.getDormitoryId());
            bed.setBedNumber(String.valueOf(i + 1));
            bed.setStatus("1");
            bedMapper.insert(bed);
        }
        baseMapper.insert(dorDormitory);
    }
}
