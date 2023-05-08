package com.cdmzl.system.mapper;

import com.cdmzl.common.actable.mapper.BaseMapperPlus;
import com.cdmzl.system.domain.SysOssFile;
import org.apache.ibatis.annotations.Mapper;

/**
 * 文件管理
 *
 * @author Luckly
 * @date 2019-06-18 17:18:42
 */
@Mapper
public interface SysFileMapper extends BaseMapperPlus<SysFileMapper, SysOssFile> {

}
