package com.cdmzl.dormitory.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdmzl.common.core.controller.BaseController;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.utils.poi.ExcelUtil;
import com.cdmzl.dormitory.domain.DorBuilding;
import com.cdmzl.dormitory.service.DorBuildingService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 
 * @description TODO
 * @date 2023/5/19 16:21
 **/
@RequiredArgsConstructor
@RestController
@RequestMapping("/dormitory/building")
public class DorBuildingController extends BaseController {

    private final DorBuildingService dorBuildingService;

    /**
     * 查询楼栋列表
     */
    @GetMapping("/page")
    public R page(Page page, DorBuilding dorBuilding) {
        return R.ok(dorBuildingService.page(page, Wrappers.query(dorBuilding)));
    }

    /**
     * 查询楼栋列表
     */
    @GetMapping("/list")
    public R list() {
        return R.ok(dorBuildingService.list());
    }

    /**
     * 导出楼栋列表
     */
    @PostMapping("/export")
    public void export(HttpServletResponse response, DorBuilding dorBuilding) {
        List<DorBuilding> list = dorBuildingService.list(Wrappers.query(dorBuilding));
        ExcelUtil.exportExcel(list, "楼栋数据", DorBuilding.class, response);
    }

    /**
     * 获取楼栋详细信息
     */
    @GetMapping(value = "getById/{id}")
    public R getById(@PathVariable("id") Long id) {
        return R.ok(dorBuildingService.getById(id));
    }

    /**
     * 新增楼栋
     */
    @PostMapping
    public R add(@RequestBody DorBuilding dorBuilding) {
        return R.ok(dorBuildingService.save(dorBuilding));
    }

    /**
     * 修改楼栋
     */
    @PutMapping
    public R edit(@RequestBody DorBuilding dorBuilding) {
        return R.ok(dorBuildingService.updateById(dorBuilding));
    }

    /**
     * 删除楼栋
     */
    @DeleteMapping("/removeByIds/{ids}")
    public R removeByIds(@PathVariable("ids") List<Long> ids) {
        return R.ok(dorBuildingService.removeByIds(ids));
    }

}
