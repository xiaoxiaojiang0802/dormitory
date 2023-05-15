package com.code.dormitory.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.code.common.core.controller.BaseController;
import com.code.common.core.domain.R;
import com.code.common.utils.poi.ExcelUtil;
import com.code.dormitory.domain.DorDormitory;
import com.code.dormitory.service.DorDormitoryService;
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
@RequestMapping("/pm/dormitory" )
public class DorDormitoryController extends BaseController {

    private final  DorDormitoryService dorDormitoryService;

    /**
     * 查询【请填写功能名称】列表
     */
    @GetMapping("/page" )

    /**
     * 导出【请填写功能名称】列表
     */
    @PostMapping("/export" )
    public void export(HttpServletResponse response, DorDormitory dorDormitory) {
        List<DorDormitory> list = dorDormitoryService.list(Wrappers.query(dorDormitory));
        ExcelUtil<DorDormitory> util = new ExcelUtil<DorDormitory>(DorDormitory. class);
        util.exportExcel(response, list, "【请填写功能名称】数据" );
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @GetMapping(value = "getById/{id}" )
    public R getById(@PathVariable("id" ) Long id) {
        return R.ok(dorDormitoryService.getById(id));
    }

    /**
     * 新增【请填写功能名称】
     */
    @PostMapping
    public R add(@RequestBody DorDormitory dorDormitory) {
        return R.ok(dorDormitoryService.save(dorDormitory));
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
    @DeleteMapping("/removeByIds/{ids}" )
    public R removeByIds(@PathVariable("ids" ) List<Long> ids) {
        return R.ok(dorDormitoryService.removeByIds(ids));
    }
}
