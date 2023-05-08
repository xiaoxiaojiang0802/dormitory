package com.cdmzl;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * 启动程序
 *
 * @author ruoyi
 */
@ComponentScan(value = "com.cdmzl.*")
@EnableScheduling
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  **启动成功   ლ(´ڡ`ლ)ﾞ  ");
    }
}
