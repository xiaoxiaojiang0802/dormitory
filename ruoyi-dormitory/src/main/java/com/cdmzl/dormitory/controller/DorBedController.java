package com.cdmzl.dormitory.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdmzl.common.core.controller.BaseController;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.dormitory.domain.DorBed;
import com.cdmzl.dormitory.service.DorBedService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
    @SaCheckPermission("@ss.hasPermi('dormitory:bed:list')")
    public R page(Page page, DorBed dorBed) {
        return R.ok(dorBedService.page(page, Wrappers.query(dorBed)));
    }

//    /**
//     * 导出床位列表
//     */
//    @PostMapping("/export")
//    public void export(HttpServletResponse response, DorBed dorBed) {
//        List<DorBed> list = dorBedService.list(Wrappers.query(dorBed));
//        ExcelUtil<DorBed> util = new ExcelUtil<>(DorBed.class);
//        util.exportExcel(response, list, "床位数据");
//    }

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
