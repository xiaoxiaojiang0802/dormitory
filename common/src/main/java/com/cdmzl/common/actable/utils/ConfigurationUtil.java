package com.cdmzl.common.actable.utils;

import com.cdmzl.common.actable.constants.AcTableConstants;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.PropertyResourceConfigurer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.core.io.support.PropertiesLoaderSupport;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.Properties;

@Component
public class ConfigurationUtil implements ApplicationContextAware {

	private static ApplicationContext applicationContext;

	private static Properties properties = null;

	/**
	 * 旧的配置key，兼容老版本用的
	 */
	@Value(AcTableConstants.TABLE_AUTO_KEY_VALUE)
	private String tableAuto;

	/**
	 * 旧的配置key，兼容老版本用的
	 */
	@Value(AcTableConstants.MODEL_PACK_KEY_VALUE)
	private String modelPack;

	/**
	 * 旧的配置key，兼容老版本用的
	 */
	@Value(AcTableConstants.DATABASE_TYPE_KEY_VALUE)
	private String databaseType;

	/**
	 * 新的配置key
	 */
	@Value(AcTableConstants.ACTABLE_TABLE_AUTO_KEY_VALUE)
	private String actableAuto;

	/**
	 * 新的配置key
	 */
	@Value(AcTableConstants.ACTABLE_MODEL_PACK_KEY_VALUE)
	private String acmodelPack;

	/**
	 * 新的配置key
	 */
	@Value(AcTableConstants.ACTABLE_DATABASE_TYPE_KEY_VALUE)
	private String acdatabaseType;

	/**
	 * 指定生成索引前缀
	 */
	@Value(AcTableConstants.TABLE_INDEX_KEY_VALUE)
	private String actableIndex;

	/**
	 * 指定生成唯一约束前缀
	 */
	@Value(AcTableConstants.TABLE_UNIQUE_KEY_VALUE)
	private String actableUnique;

	/**
	 * 实现ApplicationContextAware接口的回调方法，设置上下文环境
	 */
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) {
		ConfigurationUtil.applicationContext = applicationContext;
	}

	/**
	 * 获得spring上下文
	 *
	 * @return ApplicationContext spring上下文
	 */
	public ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	/**
	 * 获取bean
	 *
	 * @param name
	 *            service注解方式name为小驼峰格式
	 * @return Object bean的实例对象
	 */
	public Object getBean(String name) throws BeansException {
		return applicationContext.getBean(name);
	}

	/**
	 * 获取配置文件的值，兼容传统spring项目和springboot项目
	 *
	 * @param key
	 *            properties
	 * @return
	 */
	public String getConfig(String key) {
		if(AcTableConstants.ACTABLE_DATABASE_TYPE_KEY.equals(key) || AcTableConstants.DATABASE_TYPE_KEY.equals(key)) {
			if (!AcTableConstants.NULL.equals(databaseType)){
				return databaseType;
			}else if(!AcTableConstants.NULL.equals(acdatabaseType)){
				return acdatabaseType;
			}
		}
		if(AcTableConstants.ACTABLE_MODEL_PACK_KEY.equals(key) || AcTableConstants.MODEL_PACK_KEY.equals(key)) {
			if (!AcTableConstants.NULL.equals(modelPack)){
				return modelPack;
			}else if(!AcTableConstants.NULL.equals(acmodelPack)){
				return acmodelPack;
			}
		}
		if(AcTableConstants.ACTABLE_TABLE_AUTO_KEY.equals(key) || AcTableConstants.TABLE_AUTO_KEY.equals(key)) {
			if (!AcTableConstants.NULL.equals(tableAuto)){
				return tableAuto;
			}else if(!AcTableConstants.NULL.equals(actableAuto)){
				return actableAuto;
			}
		}
		if(AcTableConstants.TABLE_INDEX_KEY.equals(key) && !AcTableConstants.NULL.equals(actableIndex)) {
			return actableIndex;
		}
		if (AcTableConstants.TABLE_UNIQUE_KEY.equals(key) && !AcTableConstants.NULL.equals(actableUnique)){
			return actableUnique;
		}
		if(properties == null) {
			initProperties();
		}
		Object object = null;
		if(AcTableConstants.ACTABLE_DATABASE_TYPE_KEY.equals(key) || AcTableConstants.DATABASE_TYPE_KEY.equals(key)) {
			object = properties.get(AcTableConstants.DATABASE_TYPE_KEY);
			if (null == object){
				object = properties.get(AcTableConstants.ACTABLE_DATABASE_TYPE_KEY);
			}
		}
		if(AcTableConstants.ACTABLE_MODEL_PACK_KEY.equals(key) || AcTableConstants.MODEL_PACK_KEY.equals(key)) {
			object = properties.get(AcTableConstants.MODEL_PACK_KEY);
			if (null == object){
				object = properties.get(AcTableConstants.ACTABLE_MODEL_PACK_KEY);
			}
		}
		if(AcTableConstants.ACTABLE_TABLE_AUTO_KEY.equals(key) || AcTableConstants.TABLE_AUTO_KEY.equals(key)) {
			object = properties.get(AcTableConstants.TABLE_AUTO_KEY);
			if (null == object){
				object = properties.get(AcTableConstants.ACTABLE_TABLE_AUTO_KEY);
			}
		}
		if(AcTableConstants.TABLE_INDEX_KEY.equals(key)) {
			object = properties.get(AcTableConstants.TABLE_INDEX_KEY);
		}
		if (AcTableConstants.TABLE_UNIQUE_KEY.equals(key)){
			object = properties.get(AcTableConstants.TABLE_UNIQUE_KEY);
		}
		return object == null ? null : (String)object;
	}

	private void initProperties() {

		properties = new Properties();
		try {
			String[] postProcessorNames = applicationContext.getBeanNamesForType(BeanFactoryPostProcessor.class, true,
					true);
			for (String ppName : postProcessorNames) {
				BeanFactoryPostProcessor beanProcessor = applicationContext.getBean(ppName,
						BeanFactoryPostProcessor.class);
				if (beanProcessor instanceof PropertyResourceConfigurer) {
					PropertyResourceConfigurer propertyResourceConfigurer = (PropertyResourceConfigurer) beanProcessor;
					Method mergeProperties = PropertiesLoaderSupport.class.getDeclaredMethod("mergeProperties");
					mergeProperties.setAccessible(true);
					Properties props = (Properties) mergeProperties.invoke(propertyResourceConfigurer);

					// get the method convertProperties
					// in class PropertyResourceConfigurer
					Method convertProperties = PropertyResourceConfigurer.class.getDeclaredMethod("convertProperties",
							Properties.class);
					// convert properties
					convertProperties.setAccessible(true);
					convertProperties.invoke(propertyResourceConfigurer, props);

					properties.putAll(props);
				}
			}

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}