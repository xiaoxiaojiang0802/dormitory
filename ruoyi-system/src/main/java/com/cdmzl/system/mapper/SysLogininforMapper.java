package com.cdmzl.system.mapper;

import com.cdmzl.common.core.mapper.BaseMapperPlus;
import com.cdmzl.system.domain.SysLogininfor;
import com.cdmzl.system.domain.vo.SysLoginInfoIndex;

import java.util.List;

/**
 * 系统访问日志情况信息 数据层
 *
 * @author ruoyi
 */
public interface SysLogininforMapper extends BaseMapperPlus<SysLogininforMapper, SysLogininfor> {


    List<SysLoginInfoIndex> listLoginInfoIndex();
}
