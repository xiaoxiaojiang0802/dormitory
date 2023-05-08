package com.cdmzl.web.controller.system;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.cdmzl.common.core.controller.BaseController;
import com.cdmzl.common.core.domain.AjaxResult;
import com.cdmzl.common.core.domain.model.RegisterBody;
import com.cdmzl.common.utils.StringUtils;
import com.cdmzl.framework.web.service.SysRegisterService;
import com.cdmzl.system.service.ISysConfigService;

/**
 * 注册验证
 *
 * @author ruoyi
 */
@RestController
@RequiredArgsConstructor
public class SysRegisterController extends BaseController {
    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private ISysConfigService configService;

    @PostMapping("/register")
    public AjaxResult register(@RequestBody RegisterBody user) {
        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser")))) {
            return error("当前系统没有开启注册功能！");
        }
        String msg = registerService.register(user);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
}
