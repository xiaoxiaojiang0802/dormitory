package com.cdmzl.dormitory.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdmzl.common.core.controller.BaseController;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.utils.poi.ExcelUtil;
import com.cdmzl.dormitory.domain.DorEntranceRecord;
import com.cdmzl.dormitory.service.DorEntranceRecordService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * 【请填写功能名称】Controller
 *
 * @author xiaojiang
 * @date 2023-05-15
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/dormitory/record")
public class DorEntranceRecordController extends BaseController {

    private final DorEntranceRecordService dorEntranceRecordService;

    /**
     * 查询【请填写功能名称】列表
     */
    @GetMapping("/page")
    public R page(Page page, DorEntranceRecord dorEntranceRecord) {
        return R.ok(dorEntranceRecordService.page(page, dorEntranceRecord));
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @PostMapping("/export")
    public void export(HttpServletResponse response, DorEntranceRecord dorEntranceRecord) {
        List<DorEntranceRecord> list = dorEntranceRecordService.list(Wrappers.query(dorEntranceRecord));
        ExcelUtil.exportExcel(list, "居住记录", DorEntranceRecord.class, response);
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @GetMapping(value = "getById/{entranceTime}")
    public R getById(@PathVariable("entranceTime") Date entranceTime) {
        return R.ok(dorEntranceRecordService.getById(entranceTime));
    }

    /**
     * 新增【请填写功能名称】
     */
    @PostMapping
    public R add(@RequestBody DorEntranceRecord dorEntranceRecord) {
        return dorEntranceRecordService.addEntranceRecord(dorEntranceRecord);
    }

    /**
     * 修改【请填写功能名称】
     */
    @PutMapping
    public R edit(@RequestBody DorEntranceRecord dorEntranceRecord) {
        return R.ok(dorEntranceRecordService.updateById(dorEntranceRecord));
    }

    /**
     * 删除【请填写功能名称】
     */
    @DeleteMapping("/removeByIds/{ids}")
    public R removeByIds(@PathVariable("ids") List<Long> ids) {
        return R.ok(dorEntranceRecordService.removeByIds(ids));
    }
}
