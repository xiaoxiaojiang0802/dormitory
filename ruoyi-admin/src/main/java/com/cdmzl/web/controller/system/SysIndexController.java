package com.cdmzl.web.controller.system;

import com.cdmzl.common.annotation.Anonymous;
import com.cdmzl.common.config.RuoYiConfig;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.utils.StringUtils;
import com.cdmzl.dormitory.service.ISysIndexService;
import com.cdmzl.system.service.ISysDeptService;
import com.cdmzl.system.service.ISysLogininforService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 首页
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@RestController
public class SysIndexController {

    /**
     * 系统基础配置
     */
    private final RuoYiConfig ruoyiConfig;

    private final ISysDeptService sysDeptService;
    private final ISysIndexService sysIndexService;
    private final ISysLogininforService sysLogininforService;

    /**
     * 访问首页，提示语
     */
    @Anonymous
    @GetMapping("/index")
    public String index() {
        return StringUtils.format("欢迎使用{}后台管理框架，当前版本：v{}，请通过前端地址访问。", ruoyiConfig.getName(), ruoyiConfig.getVersion());
    }

    /**
     * 访问首页，提示语
     */
    @Anonymous
    @GetMapping("/getVersion")
    public RuoYiConfig getVersion() {
        RuoYiConfig config = new RuoYiConfig();
        config.setCopyrightYear(ruoyiConfig.getCopyrightYear());
        config.setVersion(ruoyiConfig.getVersion());
        return config;
    }


    /**
     * 系统info
     */
    @Anonymous
    @GetMapping("/getIndex")
    public String getIndex() {
        return sysDeptService.getInfo();
    }

    @GetMapping("/selectIndex")
    public R selectIndex() {
        return R.ok(sysIndexService.selectIndex());
    }

    @GetMapping("/listLoginInfoIndex")
    public R listLoginInfoIndex() {
        return R.ok(sysLogininforService.listLoginInfoIndex());
    }


}
