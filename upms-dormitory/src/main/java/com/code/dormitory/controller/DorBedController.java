package com.code.dormitory.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.security.access.prepost.PreAuthorize;
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
import com.code.dormitory.domain.DorBed;
import com.code.dormitory.service.DorBedService;
import com.code.common.utils.poi.ExcelUtil;
import lombok.RequiredArgsConstructor;

/**
 * 床位Controller
 *
 * @author xiaojiang
 * @date 2023-05-15
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/dormitory/bed")
public class DorBedController extends BaseController {

    private final DorBedService dorBedService;

    /**
     * 查询床位列表
     */
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPermi('dormitory:bed:list')")
    public R page(Page page, DorBed dorBed) {
        return R.ok(dorBedService.page(page, Wrappers.query(dorBed)));
    }

    /**
     * 导出床位列表
     */
    @PostMapping("/export")
    public void export(HttpServletResponse response, DorBed dorBed) {
        List<DorBed> list = dorBedService.list(Wrappers.query(dorBed));
        ExcelUtil<DorBed> util = new ExcelUtil<>(DorBed.class);
        util.exportExcel(response, list, "床位数据");
    }

    /**
     * 获取床位详细信息
     */
    @GetMapping(value = "getById/{id}")
    public R getById(@PathVariable("id") Long id) {
        return R.ok(dorBedService.getById(id));
    }

    /**
     * 新增床位
     */
    @PostMapping
    public R add(@RequestBody DorBed dorBed) {
        return R.ok(dorBedService.addBed(dorBed));
    }

    /**
     * 修改床位
     */
    @PutMapping
    public R edit(@RequestBody DorBed dorBed) {
        return R.ok(dorBedService.updateById(dorBed));
    }

    /**
     * 删除床位
     */
    @DeleteMapping("/removeByIds/{ids}")
    public R removeByIds(@PathVariable("ids") List<Long> ids) {
        return R.ok(dorBedService.removeByIds(ids));
    }
}
