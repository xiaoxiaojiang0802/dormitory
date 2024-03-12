package com.cdmzl.dormitory.service.impl;

import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.dormitory.domain.DorBed;
import com.cdmzl.dormitory.domain.DorEntranceRecord;
import com.cdmzl.dormitory.mapper.DorBedMapper;
import com.cdmzl.dormitory.mapper.DorEntranceRecordMapper;
import com.cdmzl.dormitory.service.DorEntranceRecordService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;

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
        baseMapper.updateStudent(entranceRecord.getUserId());
        entranceRecord.setRecordId(IdUtil.getSnowflakeNextId());
        entranceRecord.setEntranceTime(new Date());
        DorBed dorBed = new DorBed();
        dorBed.setBedId(entranceRecord.getBedId());
        dorBed.setRecordId(entranceRecord.getRecordId());
        dorBed.setStatus("2");
        dorBedMapper.updateById(dorBed);
        baseMapper.insert(entranceRecord);
        return R.ok();
    }

    /**
     * 分页查询数据
     *
     * @param page           分页
     * @param entranceRecord 参数
     * @return page
     */
    @Override
    public IPage<DorEntranceRecord> page(IPage page, DorEntranceRecord entranceRecord) {
        return baseMapper.pageRecord(page, this.baseMapper.buildWrapper(entranceRecord));
    }
}
