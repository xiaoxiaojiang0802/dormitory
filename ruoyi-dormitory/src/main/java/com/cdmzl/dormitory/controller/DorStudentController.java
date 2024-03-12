package com.cdmzl.dormitory.controller;

import com.cdmzl.common.core.controller.BaseController;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.core.domain.entity.SysUser;
import com.cdmzl.dormitory.service.DorStudentService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author 小江
 * @date 2023/5/21 7:54
 **/
@RequiredArgsConstructor
@RestController
@RequestMapping("/dormitory/student")
public class DorStudentController extends BaseController {

    private final DorStudentService studentService;


    @GetMapping("/listStudent")
    public R<List<SysUser>> listStudent(String searchValue) {
        return R.ok(studentService.listStudent(searchValue));
    }
}
