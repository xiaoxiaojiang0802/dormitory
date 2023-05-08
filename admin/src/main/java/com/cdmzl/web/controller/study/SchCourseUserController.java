package com.cdmzl.web.controller.study;

import com.cdmzl.common.core.controller.BaseController;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.core.domain.entity.SysUser;
import com.cdmzl.system.service.SchCourseUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 【请填写功能名称】Controller
 *

 * @date 2023-04-21
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/study/user")
public class SchCourseUserController extends BaseController {

    private final SchCourseUserService schCourseUserService;

    /**
     * 查询修读名单
     *
     * @param courseId 课程id
     * @return list
     */
    @GetMapping("/listCourseUser/{courseId}")
    public R<List<SysUser>> listCourseUser(@PathVariable("courseId") Long courseId) {
        return R.ok(schCourseUserService.listCourseUser(courseId));
    }
}
