package com.cdmzl.common.core.redis;

import cn.hutool.cache.CacheUtil;
import cn.hutool.cache.impl.TimedCache;
import com.alibaba.fastjson2.JSONArray;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * spring redis 工具类
 **/
@SuppressWarnings(value = {"unchecked", "rawtypes"})
@Component
public class RedisCache {

    private static final TimedCache<String, Object> CACHE_MANAGER = CacheUtil.newTimedCache(60000);


    /**
     * 缓存基本的对象，Integer、String、实体类等
     *
     * @param key   缓存的键值
     * @param value 缓存的值
     */
    public <T> void setCacheObject(final String key, final T value) {
        CACHE_MANAGER.put(key, value);
    }

    /**
     * 缓存基本的对象，Integer、String、实体类等
     *
     * @param key      缓存的键值
     * @param value    缓存的值
     * @param timeout  时间
     * @param timeUnit 时间颗粒度
     */
    public <T> void setCacheObject(final String key, final T value, final Integer timeout, final TimeUnit timeUnit) {
        CACHE_MANAGER.put(key, value, timeUnit.toMillis(timeout));
    }

    /**
     * 设置有效时间
     *
     * @param key     Redis键
     * @param timeout 超时时间
     * @return true=设置成功；false=设置失败
     */
    public boolean expire(final String key, final long timeout) {
        return expire(key, timeout, TimeUnit.SECONDS);
    }

    /**
     * 设置有效时间
     *
     * @param key     Redis键
     * @param timeout 超时时间
     * @param unit    时间单位
     * @return true=设置成功；false=设置失败
     */
    public boolean expire(final String key, final long timeout, final TimeUnit unit) {
        Object o = CACHE_MANAGER.get(key);
        CACHE_MANAGER.put(key, o, timeout);
        return true;
    }

    /**
     * 获取有效时间
     *
     * @param key Redis键
     * @return 有效时间
     */
    public long getExpire(final String key) {
//         redisTemplate.getExpire(key);
        return 60000;
    }

    /**
     * 判断 key是否存在
     *
     * @param key 键
     * @return true 存在 false不存在
     */
    public Boolean hasKey(String key) {
        return CACHE_MANAGER.containsKey(key);
    }

    /**
     * 获得缓存的基本对象。
     *
     * @param key 缓存键值
     * @return 缓存键值对应的数据
     */
    public <T> T getCacheObject(final String key) {
        return (T) CACHE_MANAGER.get(key);
    }

    /**
     * 删除单个对象
     *
     * @param key
     */
    public boolean deleteObject(final String key) {
        CACHE_MANAGER.remove(key);
        return true;
    }

    /**
     * 删除集合对象
     *
     * @param collection 多个对象
     * @return
     */
    public boolean deleteObject(final Collection collection) {
        CACHE_MANAGER.remove("");
        return true;
    }

    /**
     * 缓存List数据
     *
     * @param key      缓存的键值
     * @param dataList 待缓存的List数据
     * @return 缓存的对象
     */
    public <T> long setCacheList(final String key, final List<T> dataList) {
        CACHE_MANAGER.put(key, dataList);
        return 6000;
    }

    /**
     * 获得缓存的list对象
     *
     * @param key 缓存的键值
     * @return 缓存键值对应的数据
     */
    public <T> List<T> getCacheList(final String key) {
        return (List<T>) CACHE_MANAGER.get(key);
    }


    /**
     * 获得缓存的基本对象列表
     *
     * @param pattern 字符串前缀
     * @return 对象列表
     */
    public Collection<String> keys(String pattern) {
        List<String> keys = new ArrayList<>();
        if (pattern.contains("*")) {
            pattern = pattern.replace("*", "");
            for (String key : CACHE_MANAGER.keySet()) {
                if (key.contains(pattern)) {
                    keys.add(key);
                }
            }
        }
        return keys;
    }
}
