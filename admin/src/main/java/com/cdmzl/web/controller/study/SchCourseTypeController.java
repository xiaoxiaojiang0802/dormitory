package com.cdmzl.web.controller.study;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdmzl.common.core.controller.BaseController;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.utils.poi.ExcelUtil;
import com.cdmzl.system.entity.SchCourseType;
import com.cdmzl.system.service.SchCourseTypeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 类别Controller
 *

 * @date 2023-04-21
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/study/type")
public class SchCourseTypeController extends BaseController {

    private final SchCourseTypeService schCourseTypeService;

    /**
     * 查询类别列表
     */
    @GetMapping("/page")
    public R page(Page page, SchCourseType schCourseType) {
        return R.ok(schCourseTypeService.page(page, Wrappers.query(schCourseType)));
    }

    /**
     * 查询类别列表
     */
    @GetMapping("/list")
    public R list(SchCourseType schCourseType) {
        return R.ok(schCourseTypeService.list(Wrappers.query(schCourseType)));
    }

    /**
     * 导出类别列表
     */
    @PostMapping("/export")
    public void export(HttpServletResponse response, SchCourseType schCourseType) {
        List<SchCourseType> list = schCourseTypeService.list(Wrappers.query(schCourseType));
        ExcelUtil<SchCourseType> util = new ExcelUtil<SchCourseType>(SchCourseType.class);
        util.exportExcel(response, list, "类别数据");
    }

    /**
     * 获取类别详细信息
     */
    @GetMapping(value = "getById/{id}")
    public R getById(@PathVariable("id") Long id) {
        return R.ok(schCourseTypeService.getById(id));
    }

    /**
     * 新增类别
     */
    @PostMapping
    public R add(@RequestBody SchCourseType schCourseType) {
        return R.ok(schCourseTypeService.save(schCourseType));
    }

    /**
     * 修改类别
     */
    @PutMapping
    public R edit(@RequestBody SchCourseType schCourseType) {
        return R.ok(schCourseTypeService.updateById(schCourseType));
    }

    /**
     * 删除类别
     */
    @DeleteMapping("/removeByIds/{ids}")
    public R removeByIds(@PathVariable("ids") List<Long> ids) {
        return R.ok(schCourseTypeService.removeByIds(ids));
    }
}
