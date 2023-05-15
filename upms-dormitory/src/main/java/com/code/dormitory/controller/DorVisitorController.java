package com.code.dormitory.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.code.common.core.controller.BaseController;
import com.code.common.core.domain.R;
import com.code.dormitory.domain.DorVisitor;
import com.code.dormitory.service.DorVisitorService;
import com.code.common.utils.poi.ExcelUtil;
import lombok.RequiredArgsConstructor;

/**
 * 【请填写功能名称】Controller
 *
 * @author xiaojiang
 * @date 2023-05-15
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/pm/visitor" )
public class DorVisitorController extends BaseController {

    private final  DorVisitorService dorVisitorService;

    /**
     * 查询【请填写功能名称】列表
     */
    @GetMapping("/page" )

    /**
     * 导出【请填写功能名称】列表
     */
    @PostMapping("/export" )
    public void export(HttpServletResponse response, DorVisitor dorVisitor) {
        List<DorVisitor> list = dorVisitorService.list(Wrappers.query(dorVisitor));
        ExcelUtil<DorVisitor> util = new ExcelUtil<DorVisitor>(DorVisitor. class);
        util.exportExcel(response, list, "【请填写功能名称】数据" );
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @GetMapping(value = "getById/{visitorId}" )
    public R getById(@PathVariable("visitorId" ) Long visitorId) {
        return R.ok(dorVisitorService.getById(visitorId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @PostMapping
    public R add(@RequestBody DorVisitor dorVisitor) {
        return R.ok(dorVisitorService.save(dorVisitor));
    }

    /**
     * 修改【请填写功能名称】
     */
    @PutMapping
    public R edit(@RequestBody DorVisitor dorVisitor) {
        return R.ok(dorVisitorService.updateById(dorVisitor));
    }

    /**
     * 删除【请填写功能名称】
     */
    @DeleteMapping("/removeByIds/{ids}" )
    public R removeByIds(@PathVariable("ids" ) List<Long> ids) {
        return R.ok(dorVisitorService.removeByIds(ids));
    }
}
