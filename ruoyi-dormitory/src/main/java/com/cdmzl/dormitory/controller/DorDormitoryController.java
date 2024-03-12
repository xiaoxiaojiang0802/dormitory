package com.cdmzl.dormitory.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdmzl.common.core.controller.BaseController;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.utils.poi.ExcelUtil;
import com.cdmzl.dormitory.domain.DorDormitory;
import com.cdmzl.dormitory.service.DorDormitoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 【请填写功能名称】Controller
 *
 * @author xiaojiang
 * @date 2023-05-15
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/dormitory/dormitory")
public class DorDormitoryController extends BaseController {

    private final DorDormitoryService dorDormitoryService;

    /**
     * 查询【请填写功能名称】列表
     */
    @GetMapping("/page")
    public R page(Page page, DorDormitory dorDormitory) {
        return R.ok(dorDormitoryService.page(page, Wrappers.query(dorDormitory)));
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @GetMapping("/list")
    public R list(DorDormitory dorDormitory) {
        return R.ok(dorDormitoryService.list(Wrappers.query(dorDormitory)));
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @PostMapping("/export")
    public void export(HttpServletResponse response, DorDormitory dorDormitory) {
        List<DorDormitory> list = dorDormitoryService.list(Wrappers.query(dorDormitory));
        ExcelUtil.exportExcel(list, "宿舍", DorDormitory.class, response);
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @GetMapping(value = "getById/{id}")
    public R getById(@PathVariable("id") Long id) {
        return R.ok(dorDormitoryService.getById(id));
    }

    /**
     * 新增【请填写功能名称】
     */
    @PostMapping
    public R add(@RequestBody DorDormitory dorDormitory) {
        dorDormitoryService.addDormitory(dorDormitory);
        return R.ok();
    }

    /**
     * 修改【请填写功能名称】
     */
    @PutMapping
    public R edit(@RequestBody DorDormitory dorDormitory) {
        return R.ok(dorDormitoryService.updateById(dorDormitory));
    }

    /**
     * 删除【请填写功能名称】
     */
    @DeleteMapping("/removeByIds/{ids}")
    public R removeByIds(@PathVariable("ids") List<Long> ids) {
        return R.ok(dorDormitoryService.removeByIds(ids));
    }
}
