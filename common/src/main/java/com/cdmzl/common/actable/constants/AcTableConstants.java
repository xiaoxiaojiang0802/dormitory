package com.cdmzl.common.actable.constants;

/**

 */
public class AcTableConstants {

    public static final String DATABASE_TYPE_KEY = "mybatis.database.type";
    public static final String MODEL_PACK_KEY = "mybatis.model.pack";
    public static final String TABLE_AUTO_KEY = "mybatis.table.auto";

    public static final String DATABASE_TYPE_KEY_VALUE = "${mybatis.database.type:NULL}";
    public static final String MODEL_PACK_KEY_VALUE = "${mybatis.model.pack:NULL}";
    public static final String TABLE_AUTO_KEY_VALUE = "${mybatis.table.auto:NULL}";

    public static final String ACTABLE_DATABASE_TYPE_KEY = "actable.database.type";
    public static final String ACTABLE_MODEL_PACK_KEY = "actable.model.pack";
    public static final String ACTABLE_TABLE_AUTO_KEY = "actable.table.auto";
    public static final String ACTABLE_TABLE_SIMPLE_KEY = "actable.table.simple";

    public static final String ACTABLE_DATABASE_TYPE_KEY_VALUE = "${actable.database.type:NULL}";
    public static final String ACTABLE_MODEL_PACK_KEY_VALUE = "${actable.model.pack:NULL}";
    public static final String ACTABLE_TABLE_AUTO_KEY_VALUE = "${actable.table.auto:NULL}";

    public static final String NULL = "NULL";

    public static final String NEW_TABLE_MAP = "newTableMap";
    public static final String MODIFY_TABLE_MAP = "modifyTableMap";
    public static final String ADD_TABLE_MAP = "addTableMap";
    public static final String REMOVE_TABLE_MAP = "removeTableMap";
    public static final String MODIFY_TABLE_PROPERTY_MAP = "modifyTablePropertyMap";
    public static final String DROPKEY_TABLE_MAP = "dropKeyTableMap";
    public static final String DROPINDEXANDUNIQUE_TABLE_MAP = "dropIndexAndUniqueTableMap";
    public static final String ADDINDEX_TABLE_MAP = "addIndexTableMap";
    public static final String ADDUNIQUE_TABLE_MAP = "addUniqueTableMap";

    public static final String TABLE_INDEX_KEY = "actable.index.prefix";
    public static final String TABLE_UNIQUE_KEY = "actable.unique.prefix";

    public static final String TABLE_INDEX_KEY_VALUE = "${actable.index.prefix:actable_idx_}";
    public static final String TABLE_UNIQUE_KEY_VALUE = "${actable.unique.prefix:actable_uni_}";
    /**
     * UTF-8 字符集
     */
    public static final String UTF8 = "UTF-8";

    /**
     * json
     */
    public static final String JSON = "json";
    /**
     * xml
     */
    public static final String XML = "xml";

    /**
     * GBK 字符集
     */
    public static final String GBK = "GBK";

    /**
     * http请求
     */
    public static final String HTTP = "http://";

    /**
     * https请求
     */
    public static final String HTTPS = "https://";

    /**
     * 通用成功标识
     */
    public static final String SUCCESS = "1";

    /**
     * 通用失败标识
     */
    public static final String FAIL = "0";

    /**
     * 登录成功
     */
    public static final String LOGIN_SUCCESS = "Success";

    /**
     * 注销
     */
    public static final String LOGOUT = "Logout";

    /**
     * 注册
     */
    public static final String REGISTER = "Register";

    /**
     * 登录失败
     */
    public static final String LOGIN_FAIL = "Error";

    /**
     * 系统用户授权缓存
     */
    public static final String SYS_AUTH_CACHE = "sys-authCache";

    /**
     * 参数管理 cache name
     */
    public static final String SYS_CONFIG_CACHE = "sys-config";
    /**
     * SLPI日志保存地址
     */
    public static final String FILE_PATH = "file_path";

    /**
     * 参数管理 cache key
     */
    public static final String SYS_CONFIG_KEY = "sys_config:";

    /**
     * 字典管理 cache name
     */
    public static final String SYS_DICT_CACHE = "sys-dict";

    /**
     * 字典管理 cache key
     */
    public static final String SYS_DICT_KEY = "sys_dict:";

    /**
     * 资源映射路径 前缀
     */
    public static final String RESOURCE_PREFIX = "/profile";

    /**
     * RMI 远程方法调用
     */
    public static final String LOOKUP_RMI = "rmi:";

    /**
     * LDAP 远程方法调用
     */
    public static final String LOOKUP_LDAP = "ldap:";

    /**
     * LDAPS 远程方法调用
     */
    public static final String LOOKUP_LDAPS = "ldaps:";

    /**
     * 定时任务白名单配置（仅允许访问的包名，如其他需要可以自行添加）
     */
    public static final String[] JOB_WHITELIST_STR = {"com.sclead"};

    /**
     * 定时任务违规的字符
     */
    public static final String[] JOB_ERROR_STR = {"java.net.URL", "javax.naming.InitialContext", "org.yaml.snakeyaml",
            "org.springframework", "org.apache", "com.sclead.common.utils.file", "com.sclead.common.config"};

    public static final String KAPTCHA_SESSION_KEY = "KAPTCHA_SESSION_KEY";

}
