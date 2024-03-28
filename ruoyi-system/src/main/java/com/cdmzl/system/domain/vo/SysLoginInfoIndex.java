package com.cdmzl.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @author mz
 * @date 2024/3/28 0028
 */
@Data
public class SysLoginInfoIndex {


    private String dateStr;

    private Integer loginSuccess;

    private Integer loginFailed;
}
