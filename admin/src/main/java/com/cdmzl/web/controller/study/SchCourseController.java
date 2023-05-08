package com.cdmzl.web.controller.study;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdmzl.common.core.controller.BaseController;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.utils.poi.ExcelUtil;
import com.cdmzl.system.entity.SchCourse;
import com.cdmzl.system.service.SchCourseService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 课程Controller
 *
 * @date 2023-04-21
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/study/course")
public class SchCourseController extends BaseController {

    private final SchCourseService schCourseService;

    /**
     * 查询课程列表
     */
    @GetMapping("/page")
    public R page(Page page, SchCourse schCourse) {
        return R.ok(schCourseService.page(page, Wrappers.query(schCourse)));
    }

    /**
     * 导出课程列表
     */
    @PostMapping("/export")
    public void export(HttpServletResponse response, SchCourse schCourse) {
        List<SchCourse> list = schCourseService.list(Wrappers.query(schCourse));
        ExcelUtil<SchCourse> util = new ExcelUtil<SchCourse>(SchCourse.class);
        util.exportExcel(response, list, "课程数据");
    }

    /**
     * 获取课程详细信息
     */
    @GetMapping(value = "getById/{id}")
    public R getById(@PathVariable("id") Long id) {
        return R.ok(schCourseService.getById(id));
    }

    /**
     * 新增课程
     */
    @PostMapping
    public R add(@RequestBody SchCourse schCourse) {
        return R.ok(schCourseService.save(schCourse));
    }

    /**
     * 修改课程
     */
    @PutMapping
    public R edit(@RequestBody SchCourse schCourse) {
        return R.ok(schCourseService.updateById(schCourse));
    }

    /**
     * 删除课程
     */
    @DeleteMapping("/removeByIds/{ids}")
    public R removeByIds(@PathVariable("ids") List<Long> ids) {
        return R.ok(schCourseService.removeByIds(ids));
    }
}
