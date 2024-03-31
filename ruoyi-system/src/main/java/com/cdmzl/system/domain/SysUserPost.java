package com.cdmzl.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.cdmzl.common.actable.annotation.Column;
import com.cdmzl.common.actable.annotation.Index;
import com.cdmzl.common.actable.annotation.Unique;
import lombok.Data;

/**
 * 用户和岗位关联 sys_user_post
 *
 * @author ruoyi
 */

@Data
@TableName("sys_user_post")
public class SysUserPost {

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 岗位ID
     */
    private Long postId;

}
