package com.cdmzl.system.listener;

import cn.dev33.satoken.secure.BCrypt;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.cdmzl.common.core.domain.entity.SysUser;
import com.cdmzl.common.enums.UserType;
import com.cdmzl.common.excel.ExcelListener;
import com.cdmzl.common.excel.ExcelResult;
import com.cdmzl.common.exception.ServiceException;
import com.cdmzl.common.helper.LoginHelper;
import com.cdmzl.common.utils.ValidatorUtils;
import com.cdmzl.common.utils.spring.SpringUtils;
import com.cdmzl.system.domain.vo.SysStudentImportVo;
import com.cdmzl.system.domain.vo.SysUserImportVo;
import com.cdmzl.system.service.ISysConfigService;
import com.cdmzl.system.service.ISysUserService;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

/**
 * 系统用户自定义导入
 *
 * @author ruoyi
 */
@Slf4j
public class SysStudentImportListener extends AnalysisEventListener<SysStudentImportVo> implements ExcelListener<SysStudentImportVo> {

    private final ISysUserService userService;

    private final String password;

    private final Boolean isUpdateSupport;

    private final String operName;

    private int successNum = 0;
    private int failureNum = 0;
    private final StringBuilder successMsg = new StringBuilder();
    private final StringBuilder failureMsg = new StringBuilder();

    public SysStudentImportListener() {
        String initPassword = SpringUtils.getBean(ISysConfigService.class).selectConfigByKey("sys.user.initPassword");
        this.userService = SpringUtils.getBean(ISysUserService.class);
        this.password = BCrypt.hashpw(initPassword);
        this.isUpdateSupport = false;
        this.operName = LoginHelper.getUsername();
    }

    @Override
    public void invoke(SysStudentImportVo userVo, AnalysisContext context) {
        SysUser user = this.userService.selectUserByUserName(userVo.getUserName());
        try {
            // 验证是否存在这个用户
            if (ObjectUtil.isNull(user)) {
                user = BeanUtil.toBean(userVo, SysUser.class);
                ValidatorUtils.validate(user);
                user.setPassword(password);
                user.setCreateBy(operName);
                user.setUserType(UserType.SYS_USER.getUserType());
                user.setUserCategory("1");
                userService.insertUser(user);
                successNum++;
                successMsg.append("<br/>").append(successNum).append("、账号 ").append(user.getUserName()).append(" 导入成功");
            } else if (isUpdateSupport) {
                Long userId = user.getUserId();
                user = BeanUtil.toBean(userVo, SysUser.class);
                user.setUserId(userId);
                ValidatorUtils.validate(user);
                user.setUpdateBy(operName);
                userService.updateUser(user);
                successNum++;
                successMsg.append("<br/>").append(successNum).append("、账号 ").append(user.getUserName()).append(" 更新成功");
            } else {
                failureNum++;
                failureMsg.append("<br/>").append(failureNum).append("、账号 ").append(user.getUserName()).append(" 已存在");
            }
        } catch (Exception e) {
            failureNum++;
            String msg = "<br/>" + failureNum + "、账号 " + user.getUserName() + " 导入失败：";
            failureMsg.append(msg).append(e.getMessage());
            log.error(msg, e);
        }
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {

    }

    @Override
    public ExcelResult<SysStudentImportVo> getExcelResult() {
        return new ExcelResult<SysStudentImportVo>() {

            @Override
            public String getAnalysis() {
                if (failureNum > 0) {
                    failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
                    throw new ServiceException(failureMsg.toString());
                } else {
                    successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
                }
                return successMsg.toString();
            }

            @Override
            public List<SysStudentImportVo> getList() {
                return null;
            }

            @Override
            public List<String> getErrorList() {
                return null;
            }
        };
    }
}
