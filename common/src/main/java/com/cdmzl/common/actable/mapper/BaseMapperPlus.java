package com.cdmzl.common.actable.mapper;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.enums.SqlMethod;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.TableInfo;
import com.baomidou.mybatisplus.core.metadata.TableInfoHelper;
import com.baomidou.mybatisplus.core.toolkit.*;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.toolkit.SqlHelper;
import com.google.common.base.CaseFormat;
import com.cdmzl.common.actable.annotation.Column;
import com.cdmzl.common.actable.annotation.Like;
import com.cdmzl.common.actable.utils.BeanCopyUtils;
import com.cdmzl.common.actable.utils.CommonUtil;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.binding.MapperMethod;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**

 * @date 2022/6/30
 */
@Mapper
public interface BaseMapperPlus<M, T> extends BaseMapper<T> {


    Log log = LogFactory.getLog(BaseMapperPlus.class);

    int DEFAULT_BATCH_SIZE = 1000;

    default Class<T> currentModelClass() {
        return (Class<T>) ReflectionKit.getSuperClassGenericType(this.getClass(), BaseMapperPlus.class, 1);
    }

    default Class<M> currentMapperClass() {
        return (Class<M>) ReflectionKit.getSuperClassGenericType(this.getClass(), BaseMapperPlus.class, 0);
    }

    default List<T> selectList() {
        return this.selectList(new QueryWrapper<>());
    }

    /**
     * 批量插入
     */
    default boolean insertBatch(Collection<T> entityList) {
        return insertBatch(entityList, DEFAULT_BATCH_SIZE);
    }

    /**
     * 批量更新
     */
    default boolean updateBatchById(Collection<T> entityList) {
        return updateBatchById(entityList, DEFAULT_BATCH_SIZE);
    }

    /**
     * 批量插入或更新
     */
    default boolean insertOrUpdateBatch(Collection<T> entityList) {
        return insertOrUpdateBatch(entityList, DEFAULT_BATCH_SIZE);
    }

    /**
     * 批量插入(包含限制条数)
     */
    default boolean insertBatch(Collection<T> entityList, int batchSize) {
        String sqlStatement = SqlHelper.getSqlStatement(this.currentMapperClass(), SqlMethod.INSERT_ONE);
        return SqlHelper.executeBatch(this.currentModelClass(), log, entityList, batchSize,
                (sqlSession, entity) -> sqlSession.insert(sqlStatement, entity));
    }

    /**
     * 批量更新(包含限制条数)
     */
    default boolean updateBatchById(Collection<T> entityList, int batchSize) {
        String sqlStatement = SqlHelper.getSqlStatement(this.currentMapperClass(), SqlMethod.UPDATE_BY_ID);
        return SqlHelper.executeBatch(this.currentModelClass(), log, entityList, batchSize,
                (sqlSession, entity) -> {
                    MapperMethod.ParamMap<T> param = new MapperMethod.ParamMap<>();
                    param.put(Constants.ENTITY, entity);
                    sqlSession.update(sqlStatement, param);
                });
    }

    /**
     * 批量插入或更新(包含限制条数)
     */
    default boolean insertOrUpdateBatch(Collection<T> entityList, int batchSize) {
        TableInfo tableInfo = TableInfoHelper.getTableInfo(this.currentModelClass());
        Assert.notNull(tableInfo, "error: can not execute. because can not find cache of TableInfo for entity!");
        String keyProperty = tableInfo.getKeyProperty();
        Assert.notEmpty(keyProperty, "error: can not execute. because can not find column for id from entity!");
        return SqlHelper.saveOrUpdateBatch(this.currentModelClass(), this.currentMapperClass(), log, entityList, batchSize, (sqlSession, entity) -> {
            Object idVal = tableInfo.getPropertyValue(entity, keyProperty);
            String sqlStatement = SqlHelper.getSqlStatement(this.currentMapperClass(), SqlMethod.SELECT_BY_ID);
            return StringUtils.checkValNull(idVal)
                    || CollectionUtils.isEmpty(sqlSession.selectList(sqlStatement, entity));
        }, (sqlSession, entity) -> {
            MapperMethod.ParamMap<T> param = new MapperMethod.ParamMap<>();
            param.put(Constants.ENTITY, entity);
            String sqlStatement = SqlHelper.getSqlStatement(this.currentMapperClass(), SqlMethod.UPDATE_BY_ID);
            sqlSession.update(sqlStatement, param);
        });
    }

    /**
     * 插入或更新(包含限制条数)
     */
    default boolean insertOrUpdate(T entity) {
        if (null != entity) {
            TableInfo tableInfo = TableInfoHelper.getTableInfo(this.currentModelClass());
            Assert.notNull(tableInfo, "error: can not execute. because can not find cache of TableInfo for entity!");
            String keyProperty = tableInfo.getKeyProperty();
            Assert.notEmpty(keyProperty, "error: can not execute. because can not find column for id from entity!");
            Object idVal = tableInfo.getPropertyValue(entity, tableInfo.getKeyProperty());
            if (StringUtils.checkValNull(idVal) || Objects.isNull(selectById((Serializable) idVal))) {
                return insert(entity) > 0;
            } else {
                return updateById(entity) > 0;
            }
        }
        return false;
    }


    /**
     * 根据 ID 查询
     */
    default <C> C selectVoById(Serializable id, Class<C> voClass) {
        T obj = this.selectById(id);
        if (ObjectUtil.isNull(obj)) {
            return null;
        }
        return BeanCopyUtils.copy(obj, voClass);
    }


    /**
     * 查询（根据ID 批量查询）
     */
    default <C> List<C> selectVoBatchIds(Collection<? extends Serializable> idList, Class<C> voClass) {
        List<T> list = this.selectBatchIds(idList);
        if (CollUtil.isEmpty(list)) {
            return CollUtil.newArrayList();
        }
        return BeanCopyUtils.copyList(list, voClass);
    }

    /**
     * 查询（根据 columnMap 条件）
     */
    default <C> List<C> selectVoByMap(Map<String, Object> map, Class<C> voClass) {
        List<T> list = this.selectByMap(map);
        if (CollUtil.isEmpty(list)) {
            return CollUtil.newArrayList();
        }
        return BeanCopyUtils.copyList(list, voClass);
    }


    /**
     * 根据 entity 条件，查询一条记录
     */
    default <C> C selectVoOne(Wrapper<T> wrapper, Class<C> voClass) {
        T obj = this.selectOne(wrapper);
        if (ObjectUtil.isNull(obj)) {
            return null;
        }
        return BeanCopyUtils.copy(obj, voClass);
    }


    /**
     * 根据 entity 条件，查询全部记录
     */
    default <C> List<C> selectVoList(Wrapper<T> wrapper, Class<C> voClass) {
        List<T> list = this.selectList(wrapper);
        if (CollUtil.isEmpty(list)) {
            return CollUtil.newArrayList();
        }
        return BeanCopyUtils.copyList(list, voClass);
    }


    /**
     * 分页模糊查询
     *
     * @param page 分页
     * @return page
     */
    default IPage<T> selectPageLike(IPage<T> page, Wrapper<T> wrapper) {
        return this.selectPage(page, wrapper);
    }

    /**
     * 创建查询
     *
     * @param t 实体类
     * @return query
     */
    default QueryWrapper<T> buildQueryWrapper(T t) {
        return this.buildQueryWrapper(t, "");
    }

    /**
     * 创建查询
     *
     * @param t      实体类
     * @param prefix 查询条件前缀
     * @return query
     */
    default QueryWrapper<T> buildQueryWrapper(T t, String prefix) {
        if (StringUtils.isNotBlank(prefix)) {
            prefix += ".";
        }
        if (t == null) {
            return new QueryWrapper<>();
        }
        QueryWrapper<T> tQueryWrapper = new QueryWrapper<>();
        for (Field field : t.getClass().getDeclaredFields()) {
            field.setAccessible(true);
            try {
                if (field.get(t) == null && CommonUtil.isNull(field.get(t))) {
                    continue;
                }
                if (field.getAnnotation(Column.class) == null) {
                    continue;
                }
                if (field.getAnnotation(TableField.class) != null && !field.getAnnotation(TableField.class).exist()) {
                    continue;
                }
                /*驼峰转下划线*/
                String nameLower = CaseFormat.LOWER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, field.getName()).toLowerCase();
                if (field.getAnnotation(Like.class) != null) {
                    tQueryWrapper.like(prefix + nameLower, field.get(t));
                } else {
                    tQueryWrapper.eq(prefix + nameLower, field.get(t));
                }
            } catch (IllegalAccessException illegalAccessException) {
                illegalAccessException.printStackTrace();
                log.error("field读取内容失败!");
            }
        }
        return tQueryWrapper;
    }


    /**
     * 分页查询VO
     */
    default <C, P extends IPage<C>> P selectVoPage(IPage<T> page, Wrapper<T> wrapper, Class<C> voClass) {
        IPage<T> pageData = this.selectPage(page, wrapper);
        IPage<C> voPage = new Page<>(pageData.getCurrent(), pageData.getSize(), pageData.getTotal());
        if (CollUtil.isEmpty(pageData.getRecords())) {
            return (P) voPage;
        }
        voPage.setRecords(BeanCopyUtils.copyList(pageData.getRecords(), voClass));
        return (P) voPage;
    }

}
