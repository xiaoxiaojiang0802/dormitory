package com.cdmzl.common.helper;

import com.cdmzl.common.constant.UserConstants;
import com.cdmzl.common.core.domain.model.LoginUser;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import static com.cdmzl.common.utils.SecurityUtils.getLoginUser;
import static com.cdmzl.common.utils.SecurityUtils.getUserId;

/**
 * 登录鉴权助手
 * <p>
 * user_type 为 用户类型 同一个用户表 可以有多种用户类型 例如 pc,app
 * deivce 为 设备类型 同一个用户类型 可以有 多种设备类型 例如 web,ios
 * 可以组成 用户类型与设备类型多对多的 权限灵活控制
 * <p>
 * 多用户体系 针对 多种用户类型 但权限控制不一致
 * 可以组成 多用户类型表与多设备类型 分别控制权限
 *

 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class LoginHelper {

    public static final String JOIN_CODE = ":";
    public static final String LOGIN_USER_KEY = "loginUser";

    private static final ThreadLocal<LoginUser> LOGIN_CACHE = new ThreadLocal<>();

    /**
     * 登录系统
     *
     * @param loginUser 登录用户信息
     */
    public static void login(LoginUser loginUser) {
        LOGIN_CACHE.set(loginUser);
//        StpUtil.login(loginUser.getLoginId());
//        setLoginUser(loginUser);
    }


    /**
     * 清除一级缓存 防止内存问题
     */
    public static void clearCache() {
        LOGIN_CACHE.remove();
    }


    /**
     * 获取部门ID
     */
    public static Long getDeptId() {
        return getLoginUser().getDeptId();
    }

    /**
     * 获取用户账户
     */
    public static String getUsername() {
        return getLoginUser().getUsername();
    }

    /**
     * 是否为管理员
     *
     * @param userId 用户ID
     * @return 结果
     */
    public static boolean isAdmin(Long userId) {
        return UserConstants.ADMIN_ID.equals(userId);
    }

    public static boolean isAdmin() {
        return isAdmin(getUserId());
    }

}
