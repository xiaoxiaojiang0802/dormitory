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

import java.util.ArrayList;
import java.util.List;

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

    /**
     * 新增宿舍
     *
     * @param dorDormitory 宿舍信息
     */
    @Override
    public void addDormitory(DorDormitory dorDormitory) {
        dorDormitory.setDormitoryId(IdUtil.getSnowflakeNextId());
        /*初始化床位信息*/
        for (int i = 0; i < Integer.parseInt(dorDormitory.getDormitoryType()); i++) {
            DorBed bed = new DorBed();
            bed.setDormitoryId(dorDormitory.getDormitoryId());
            bed.setBedNumber(dorDormitory.getDormitoryNumber() + (i + 1));
            bed.setStatus("1");
            bedMapper.insert(bed);
        }
        baseMapper.insert(dorDormitory);
    }

    /**
     * 修改宿舍信息
     *
     * @param dorDormitory 宿舍
     */
    @Override
    public void updateDormitory(DorDormitory dorDormitory) {
        for (int i = 0; i < Integer.parseInt(dorDormitory.getDormitoryType()); i++) {
            DorBed bed = new DorBed();
            bed.setDormitoryId(dorDormitory.getDormitoryId());
            bed.setBedNumber(dorDormitory.getDormitoryNumber() + (i + 1));
            bed.setStatus("1");
            if (!bedMapper.haveBed(dorDormitory.getDormitoryId(), bed.getBedNumber())) {
                bedMapper.insert(bed);
            }
        }
        baseMapper.updateById(dorDormitory);
    }
}
