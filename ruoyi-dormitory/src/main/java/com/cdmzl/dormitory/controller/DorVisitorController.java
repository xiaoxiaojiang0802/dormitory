package com.cdmzl.dormitory.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdmzl.common.core.controller.BaseController;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.utils.poi.ExcelUtil;
import com.cdmzl.dormitory.domain.DorVisitor;
import com.cdmzl.dormitory.service.DorVisitorService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 访客Controller
 *
 * @author xiaojiang
 * @date 2023-05-15
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/dormitory/visitor")
public class DorVisitorController extends BaseController {

    private final DorVisitorService dorVisitorService;

    /**
     * 查询访客列表
     */
    @GetMapping("/page")
    public R<Page> page(Page page, DorVisitor dorVisitor) {
        return R.ok(dorVisitorService.page(page, Wrappers.query(dorVisitor)));
    }

    /**
     * 导出访客列表
     */
    @PostMapping("/export")
    public void export(HttpServletResponse response, DorVisitor dorVisitor) {
        List<DorVisitor> list = dorVisitorService.list(Wrappers.query(dorVisitor));
        ExcelUtil.exportExcel(list, "访客列表", DorVisitor.class, response);
    }

    /**
     * 获取访客详细信息
     */
    @GetMapping(value = "getById/{visitorId}")
    public R getById(@PathVariable("visitorId") Long visitorId) {
        return R.ok(dorVisitorService.getById(visitorId));
    }

    /**
     * 新增访客
     */
    @PostMapping
    public R add(@RequestBody DorVisitor dorVisitor) {
        return R.ok(dorVisitorService.save(dorVisitor));
    }

    /**
     * 修改访客
     */
    @PutMapping
    public R edit(@RequestBody DorVisitor dorVisitor) {
        return R.ok(dorVisitorService.updateById(dorVisitor));
    }

    /**
     * 删除访客
     */
    @DeleteMapping("/removeByIds/{ids}")
    public R removeByIds(@PathVariable("ids") List<Long> ids) {
        return R.ok(dorVisitorService.removeByIds(ids));
    }
}
