package com.code.dormitory.service;

import java.util.List;

import com.code.common.core.domain.R;
import com.code.dormitory.domain.DorBed;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 床位Service接口
 *
 * @author xiaojiang
 * @date 2023-05-15
 */
public interface DorBedService extends IService<DorBed> {
    R<Void> addBed(DorBed bed);
}
