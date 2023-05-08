package com.cdmzl.system.service.impl;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cdmzl.common.core.domain.R;
import com.cdmzl.common.utils.SecurityUtils;
import com.cdmzl.system.domain.SysOssFile;
import com.cdmzl.system.mapper.SysFileMapper;
import com.cdmzl.system.service.SysFileService;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 文件管理
 *
 * @author sclead
 * @date 2019-06-18 17:18:42
 */
@Slf4j
@Service
public class SysFileServiceImpl extends ServiceImpl<SysFileMapper, SysOssFile> implements SysFileService {

    /**
     * 上传文件
     *
     * @param file
     * @return
     */
    @Override
    public R uploadFile(MultipartFile file) {
        String fileName = IdUtil.simpleUUID() + StrUtil.DOT + FileUtil.extName(file.getOriginalFilename());
        Map<String, String> resultMap = new HashMap<>(4);
//        resultMap.put("bucketName", ossProperties.getBucketName());
        resultMap.put("fileName", fileName);
//        resultMap.put("url", String.format("/admin/sys-file/%s/%s", ossProperties.getBucketName(), fileName));
        try {
            // 文件管理数据记录,收集管理追踪文件
            fileLog(file, fileName);
        } catch (Exception e) {
            log.error("上传失败", e);
            return R.fail(e.getLocalizedMessage());
        }
        return R.ok(resultMap);
    }

    /**
     * 上传文件
     *
     * @param file
     * @return
     */
    @Override
    public R uploadFileDate(MultipartFile file) {
        String fileName = file.getResource().getFilename();
        Map<String, String> resultMap = new HashMap<>(4);
//        resultMap.put("bucketName", ossProperties.getBucketName());
        resultMap.put("fileName", fileName);
        resultMap.put("url", fileName);
        try {
//            minioTemplate.putObject(ossProperties.getBucketName(), fileName, file.getInputStream());
            fileLog(file, fileName);
        } catch (Exception e) {
            log.error("上传失败", e);
            return R.fail(e.getLocalizedMessage());
        }
        return R.ok(resultMap);
    }

    /**
     * 读取文件
     *
     * @param bucket
     * @param fileName
     * @param response
     */
    @Override
    public void getFile(String bucket, String fileName, HttpServletResponse response) {
//        try (S3Object s3Object = minioTemplate.getObject(bucket, fileName)) {
//            response.setContentType("application/octet-stream; charset=UTF-8");
//            IoUtil.copy(s3Object.getObjectContent(), response.getOutputStream());
//        } catch (Exception e) {
//            log.error("文件读取异常: {}", e.getLocalizedMessage());
//        }
    }

    /**
     * 读取文件
     */
    @Override
    public String getFileStr(String bucket, String fileName) {
//        try (S3Object s3Object = minioTemplate.getObject(bucket, fileName)) {
//            InputStream is = s3Object.getObjectContent();
//            if (is == null) {
//                return "";
//            }
//            StringBuilder sb = new StringBuilder();
//            try {
//                BufferedReader reader = new BufferedReader(new InputStreamReader(is, StringUtils.UTF8));
//                String line;
//                while ((line = reader.readLine()) != null) {
//                    sb.append(line);
//                }
//            } finally {
//                is.close();
//            }
//            return sb.toString();
//        } catch (Exception e) {
//            log.error("文件读取异常: {}", e.getLocalizedMessage());
//        }
        return null;
    }

    /**
     * 删除文件
     *
     * @param id
     * @return
     */
    @Override
    @SneakyThrows
    @Transactional(rollbackFor = Exception.class)
    public Boolean deleteFile(Long id) {
        SysOssFile file = this.getById(id);
//        minioTemplate.removeObject(ossProperties.getBucketName(), file.getFileName());
        return this.removeById(id);
    }

    /**
     * 文件管理数据记录,收集管理追踪文件
     *
     * @param file     上传文件格式
     * @param fileName 文件名
     */
    private void fileLog(MultipartFile file, String fileName) {
        SysOssFile sysOssFile = new SysOssFile();
        sysOssFile.setFileName(fileName);
        sysOssFile.setOriginal(file.getOriginalFilename());
        sysOssFile.setFileSize(file.getSize());
        sysOssFile.setType(FileUtil.extName(file.getOriginalFilename()));
//        sysOssFile.setBucketName(ossProperties.getBucketName());
        String userName = "";
        if (SecurityUtils.getLoginUser() != null) {
            userName = SecurityUtils.getUsername();
        }
        sysOssFile.setCreateBy(userName);
        this.save(sysOssFile);
    }

}
