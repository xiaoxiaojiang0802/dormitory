package com.cdmzl.common.actable.service;

import java.util.List;

/**

 * @date 2022/4/19
 */
public interface SysH2CreateTableService {

    /**
     * h2数据库自动建表
     */
    void createH2Table();

    List<Object> getAllFields(Class<?> clas);
}
