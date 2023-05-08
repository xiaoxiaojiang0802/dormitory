package com.cdmzl.common.actable.service.impl;

import com.cdmzl.common.actable.constants.AcTableConstants;
import com.cdmzl.common.actable.service.StartUpHandler;
import com.cdmzl.common.actable.service.SysH2CreateTableService;
import com.cdmzl.common.actable.service.SysMysqlCreateTableManager;
import com.cdmzl.common.actable.utils.ConfigurationUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

/**
 * 启动时进行处理的实现类
 *
 * @author chenbin.sun
 */
@Component
@Service
public class StartUpHandlerImpl implements StartUpHandler {

    private static final Logger log = LoggerFactory.getLogger(StartUpHandlerImpl.class);

    @Autowired
    private ConfigurationUtil springContextUtil;

    /**
     * 数据库类型：mysql
     */
    public static String MYSQL = "mysql";

    /**
     * 数据库类型：h2
     */
    public static String H2 = "h2";

    /**
     * 数据库类型：oracle
     */
    public static String ORACLE = "oracle";

    /**
     * 数据库类型：sqlserver
     */
    public static String SQLSERVER = "sqlserver";

    /**
     * 数据库类型：postgresql
     */
    public static String POSTGRESQL = "postgresql";

    @Resource
    private SysMysqlCreateTableManager sysMysqlCreateTableManager;

    @Resource
    private SysH2CreateTableService sysH2CreateTableService;

    @Override
    @PostConstruct
    public void startHandler() {
        /*数据库类型*/
        String databaseType = springContextUtil.getConfig(AcTableConstants.DATABASE_TYPE_KEY) == null ? MYSQL : springContextUtil.getConfig(AcTableConstants.DATABASE_TYPE_KEY);
        if (databaseType == null) {
            databaseType = springContextUtil.getConfig(AcTableConstants.ACTABLE_DATABASE_TYPE_KEY);
        }
        // 执行mysql的处理方法
        if (MYSQL.equals(databaseType)) {
            log.info("databaseType=mysql，开始执行mysql的处理方法");
            sysMysqlCreateTableManager.createMysqlTable();
        } else if (ORACLE.equals(databaseType)) {
            log.info("databaseType=oracle，开始执行oracle的处理方法");
        } else if (SQLSERVER.equals(databaseType)) {
            log.info("databaseType=sqlserver，开始执行sqlserver的处理方法");
        } else if (POSTGRESQL.equals(databaseType)) {
            log.info("databaseType=postgresql，开始执行postgresql的处理方法");
        } else if (H2.equals(databaseType)) {
            log.info("databaseType=h2，开始执行h2的处理方法");
            sysH2CreateTableService.createH2Table();
        } else {
            log.info("没有找到符合条件的处理方法！");
        }
    }


}
