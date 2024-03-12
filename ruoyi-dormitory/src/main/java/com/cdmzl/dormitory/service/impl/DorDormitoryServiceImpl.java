package com.cdmzl.dormitory.service.impl;

import com.cdmzl.dormitory.mapper.DorBedMapper;

import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cdmzl.dormitory.domain.DorBed;
import com.cdmzl.dormitory.domain.DorDormitory;
import com.cdmzl.dormitory.mapper.DorDormitoryMapper;
import com.cdmzl.dormitory.service.DorDormitoryService;
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
