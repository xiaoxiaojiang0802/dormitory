package com.code.framework.config;

import com.github.xiaoymin.knife4j.spring.annotations.EnableKnife4j;
import com.github.xiaoymin.knife4j.spring.extension.OpenApiExtensionResolver;
import com.code.common.utils.StringUtils;
import com.code.common.utils.spring.SpringUtils;
import com.code.framework.config.properties.SwaggerProperties;
import io.swagger.models.auth.In;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.ReflectionUtils;
import org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.spring.web.plugins.WebFluxRequestHandlerProvider;
import springfox.documentation.spring.web.plugins.WebMvcRequestHandlerProvider;

import javax.annotation.PostConstruct;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * Swagger2的接口配置
 *
 * @author MZL
 */
@RequiredArgsConstructor
@Configuration
@EnableKnife4j
public class SwaggerConfig {

    private final SwaggerProperties swaggerProperties;
    private final OpenApiExtensionResolver openApiExtensionResolver;

    /**
     * 用于适配springboot 2.6
     */
    @Bean
    @SuppressWarnings("all")
    public BeanPostProcessor springfoxHandlerProviderBeanPostProcessor() {
        return new BeanPostProcessor() {
            @Override
            public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
                if (bean instanceof WebMvcRequestHandlerProvider || bean instanceof WebFluxRequestHandlerProvider) {
                    customizeSpringfoxHandlerMappings(getHandlerMappings(bean));
                }
                return bean;
            }

            private <T extends RequestMappingInfoHandlerMapping> void customizeSpringfoxHandlerMappings(List<T> mappings) {
                mappings.removeIf(mapping -> mapping.getPatternParser() != null);
            }

            private List<RequestMappingInfoHandlerMapping> getHandlerMappings(Object bean) {
                try {
                    Field field = ReflectionUtils.findField(bean.getClass(), "handlerMappings");
                    field.setAccessible(true);
                    return (List<RequestMappingInfoHandlerMapping>) field.get(bean);
                } catch (IllegalArgumentException | IllegalAccessException e) {
                    throw new IllegalStateException(e);
                }
            }
        };
    }


    /**
     * 创建API
     */
    @PostConstruct
    public void createRestApi() {
        for (SwaggerProperties.Groups group : swaggerProperties.getGroups()) {
            String basePackage = group.getBasePackage();
            Docket docket = new Docket(DocumentationType.OAS_30)
                    .enable(swaggerProperties.getEnabled())
                    .apiInfo(apiInfo())
                    .select()
                    // 扫描指定包中的swagger注解
                    .apis(RequestHandlerSelectors.basePackage(basePackage))
                    .paths(PathSelectors.any())
                    .build()
                    .groupName(group.getName())
                    .securitySchemes(securitySchemes())
                    .securityContexts(securityContexts())
                    .extensions(openApiExtensionResolver.buildExtensions(group.getName()))
                    .pathMapping(swaggerProperties.getPathMapping());
            String beanName = StringUtils.replace(basePackage, ".", "_") + "Docket";
            SpringUtils.registerBean(beanName, docket);
        }
    }

    /**
     * 安全模式，这里指定token通过Authorization头请求头传递
     */
    private List<SecurityScheme> securitySchemes() {
        List<SecurityScheme> apiKeyList = new ArrayList<>();
        apiKeyList.add(new ApiKey("Authorization", "Authorization", In.HEADER.toValue()));
        return apiKeyList;
    }

    /**
     * 安全上下文
     */
    private List<SecurityContext> securityContexts() {
        List<SecurityContext> securityContexts = new ArrayList<>();
        securityContexts.add(
                SecurityContext.builder()
                        .securityReferences(defaultAuth())
                        .operationSelector(o -> o.requestMappingPattern().matches("/.*"))
                        .build());
        return securityContexts;
    }

    /**
     * 默认的安全上引用
     */
    private List<SecurityReference> defaultAuth() {
        AuthorizationScope authorizationScope = new AuthorizationScope("global", "accessEverything");
        AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
        authorizationScopes[0] = authorizationScope;
        List<SecurityReference> securityReferences = new ArrayList<>();
        securityReferences.add(new SecurityReference("Authorization", authorizationScopes));
        return securityReferences;
    }

    /**
     * 添加摘要信息
     */
    private ApiInfo apiInfo() {
        // 用ApiInfoBuilder进行定制
        SwaggerProperties.Contact contact = swaggerProperties.getContact();
        return new ApiInfoBuilder()
                .title(swaggerProperties.getTitle())
                .description(swaggerProperties.getDescription())
                .contact(new Contact(contact.getName(), contact.getUrl(), contact.getEmail()))
                .version(swaggerProperties.getVersion())
                .build();
    }
}
