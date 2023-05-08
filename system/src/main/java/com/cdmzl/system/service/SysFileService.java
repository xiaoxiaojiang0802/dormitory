/*
 *    Copyright (c) 2018-2025, sclead All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the sclead.com developer nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * Author: sclead
 */

package com.cdmzl.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.system.domain.SysOssFile;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

/**
 * 文件管理
 *
 * @author Luckly
 * @date 2019-06-18 17:18:42
 */
public interface SysFileService extends IService<SysOssFile> {

	/**
	 * 上传文件
	 * @param file
	 * @return
	 */
	R uploadFile(MultipartFile file);

	R uploadFileDate(MultipartFile file);

	/**
	 * 读取文件
	 * @param bucket 桶名称
	 * @param fileName 文件名称
	 * @param response 输出流
	 */
	void getFile(String bucket, String fileName, HttpServletResponse response);

	String getFileStr(String bucket, String fileName);

	/**
	 * 删除文件
	 * @param id
	 * @return
	 */
	Boolean deleteFile(Long id);

}
