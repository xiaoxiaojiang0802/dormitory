package com.code.dormitory.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.code.common.core.domain.R;
import com.code.dormitory.domain.DorEntranceRecord;

/**
 * 【请填写功能名称】Service接口
 *
 * @author xiaojiang
 * @date 2023-05-15
 */
public interface DorEntranceRecordService extends IService<DorEntranceRecord> {
    R<Void> addEntranceRecord(DorEntranceRecord entranceRecord);

    IPage<DorEntranceRecord> page(IPage page, DorEntranceRecord entranceRecord);
}
