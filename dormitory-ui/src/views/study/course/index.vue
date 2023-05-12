<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="课程名称" prop="name">
        <el-select clearable v-model="queryParams.courseTypeId">
          <el-option v-for="item in courseTypeList" :key="item.id" :value="item.id">{{ item.name }}</el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="课程名称" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入课程名称" clearable
                  @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
                   v-hasPermi="['pm:course:add']">新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single"
                   @click="handleUpdate"
                   v-hasPermi="['pm:course:edit']">
          修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini"
                   :disabled="multiple" @click="handleDelete" v-hasPermi="['pm:course:remove']">
          删除
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="courseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="课程名称" align="center" prop="name"/>
      <el-table-column label="创建时间" align="center" prop="createTime"/>
      <el-table-column label="更新人" align="center" prop="updateBy"/>
      <el-table-column label="更新时间" align="center" prop="updateTime"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text"
                     icon="el-icon-user"
                     @click="courseUerView(scope.row)">
                     修读名单
          </el-button>
          <el-button size="mini" type="text"
                     icon="el-icon-edit"
                     @click="handleUpdate(scope.row)"
                     v-hasPermi="['pm:course:edit']">
                     修改
          </el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['pm:course:remove']">删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"/>

    <!-- 添加或修改课程对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1000px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="课程名称" prop="courseTypeId">
          <el-select clearable v-model="form.courseTypeId">
            <el-option v-for="item in courseTypeList" :key="item.id" :label="item.name" :value="item.id"/>
          </el-select>
        </el-form-item>
        <el-form-item label="课程名称" prop="name">
          <el-input v-model="form.name"/>
        </el-form-item>
        <el-form-item label="图片" prop="name">
          <image-upload ref="imageUpload" :value="form.imageUrls" :isShowTip="false" :limit="1"/>
        </el-form-item>
        <el-form-item label="描述">
          <editor v-model="form.description" :min-height="300"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
     <!-- 查看修读名单 -->
     <el-dialog :title="title" :visible.sync="courseOpen" width="200px" append-to-body>
      <el-table v-loading="loading" :data="courseUserList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center"/>
        <el-table-column label="姓名" align="center" prop="nickName"/>
     </el-table>
    </el-dialog>
  </div>
</template>

<script>
import {
  pageCourse,
  getCourse,
  delCourse,
  addCourse,
  updateCourse,listCourseUser
} from "@/api/system/course";
import {listType} from "@/api/system/type";

export default {
  name: "Course",
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      courseList: [],
      courseTypeList: [],
      courseUserList: [],
      title: "",
      open: false,
      courseOpen: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
      },
      form: {},
      rules: {}
    };
  },
  created() {
    this.init();
    this.getList();
  },
  methods: {
    init() {
      listType(this.queryParams).then(response => {
        this.courseTypeList = response.data;
      })
    },
    /** 查询课程列表 */
    getList() {
      this.loading = true;
      pageCourse(this.queryParams).then(response => {
        this.courseList = response.data.records;
        this.total = response.data.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        description: null,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加课程";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getCourse(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改课程";
      });
    },
    courseUerView(row){
      const id = row.id ;
      listCourseUser(id).then(response => {
        this.courseUserList = response.data;
        this.courseOpen = true;
        this.title = "修改课程";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
           var imageUrls="";
           this.$refs.imageUpload.fileList.forEach(file=>{
              if(imageUrls===''){
                imageUrls=file.url;
              }else{
                imageUrls+=","+file.url;
              }
           });
           this.form.imageUrls=imageUrls;
          if (this.form.id != null) {
            updateCourse(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCourse(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除课程编号为"' + ids + '"的数据项？').then(function () {
        return delCourse(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('pm/course/export', {
        ...this.queryParams
      }, `course_${new Date().getTime()}.xlsx`)
    }
  }
}
;
</script>
