package com.code.dormitory.service.impl;

import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.code.common.constant.Constants;
import com.code.common.core.domain.R;
import com.code.dormitory.domain.DorBed;
import com.code.dormitory.domain.DorEntranceRecord;
import com.code.dormitory.mapper.DorBedMapper;
import com.code.dormitory.mapper.DorEntranceRecordMapper;
import com.code.dormitory.service.DorEntranceRecordService;
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
public class DorEntranceRecordServiceImpl extends ServiceImpl<DorEntranceRecordMapper, DorEntranceRecord> implements DorEntranceRecordService {


    private final DorBedMapper dorBedMapper;

    /**
     * 添加居住记录
     *
     * @param entranceRecord 居住记录
     * @return r
     */
    @Override
    public R<Void> addEntranceRecord(DorEntranceRecord entranceRecord) {
        entranceRecord.setRecordId(IdUtil.getSnowflakeNextId());
        DorBed dorBed = new DorBed();
        dorBed.setBedId(entranceRecord.getBedId());
        dorBed.setRecordId(entranceRecord.getRecordId());
        dorBed.setStatus(Constants.YES);
        dorBedMapper.updateById(dorBed);
        baseMapper.insert(entranceRecord);
        return R.ok();
    }
}
