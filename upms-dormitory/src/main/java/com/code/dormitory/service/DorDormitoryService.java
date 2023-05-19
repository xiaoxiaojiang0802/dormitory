package com.code.dormitory.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.code.dormitory.domain.DorDormitory;

/**
 * 【请填写功能名称】Service接口
 *
 * @author xiaojiang
 * @date 2023-05-15
 */
public interface DorDormitoryService extends IService<DorDormitory> {


    /**
     * 新增宿舍
     *
     * @param dorDormitory 苏浙
     */
    void addDormitory(DorDormitory dorDormitory);

}
