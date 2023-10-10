package com.cdmzl.dormitory.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdmzl.common.core.controller.BaseController;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.utils.poi.ExcelUtil;
import com.cdmzl.dormitory.domain.DorRepairOrder;
import com.cdmzl.dormitory.service.DorRepairOrderService;
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
@RequestMapping("/dormitory/order")
public class DorRepairOrderController extends BaseController {

    private final DorRepairOrderService dorRepairOrderService;

    /**
     * 查询【请填写功能名称】列表
     */
    @GetMapping("/page")
    public R<Page> page(Page page, DorRepairOrder repairOrder) {
        return R.ok(dorRepairOrderService.page(page, Wrappers.query(repairOrder)));
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @PostMapping("/export")
    public void export(HttpServletResponse response, DorRepairOrder dorRepairOrder) {
        List<DorRepairOrder> list = dorRepairOrderService.list(Wrappers.query(dorRepairOrder));
        ExcelUtil.exportExcel(list, "维修记录", DorRepairOrder.class, response);
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @GetMapping(value = "getById/{repairId}")
    public R getById(@PathVariable("repairId") Long repairId) {
        return R.ok(dorRepairOrderService.getById(repairId));
    }

    /**
     * 新增【请填写功能名称】
     */
    @PostMapping
    public R add(@RequestBody DorRepairOrder dorRepairOrder) {
        return R.ok(dorRepairOrderService.save(dorRepairOrder));
    }

    /**
     * 修改【请填写功能名称】
     */
    @PutMapping
    public R edit(@RequestBody DorRepairOrder dorRepairOrder) {
        return R.ok(dorRepairOrderService.updateById(dorRepairOrder));
    }

    /**
     * 删除【请填写功能名称】
     */
    @DeleteMapping("/removeByIds/{ids}")
    public R removeByIds(@PathVariable("ids") List<Long> ids) {
        return R.ok(dorRepairOrderService.removeByIds(ids));
    }
}
