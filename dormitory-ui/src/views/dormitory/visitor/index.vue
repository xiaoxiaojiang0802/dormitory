<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="访客姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入访客姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系电话" prop="phone">
        <el-input
          v-model="queryParams.phone"
          placeholder="请输入联系电话"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
                   v-hasPermi="['dormitory:visitor:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single"
                   @click="handleUpdate"
                   v-hasPermi="['dormitory:visitor:edit']">
          修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini"
                   :disabled="multiple" @click="handleDelete" v-hasPermi="['dormitory:visitor:remove']">
          删除
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="visitorList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="访客" align="center" prop="name"/>
      <el-table-column label="电话" align="center" prop="phone"/>
      <el-table-column label="来访时间" align="center" prop="visitDate"/>
      <el-table-column label="离开时间" align="center" prop="leaveDate"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['dormitory:visitor:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['dormitory:visitor:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改访客对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="访客" prop="name">
          <el-input v-model="form.name" placeholder="请输入访客"/>
        </el-form-item>
        <el-form-item label="联系电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入联系电话"/>
        </el-form-item>
        <el-form-item label="来访时间" prop="visitDate">
          <el-date-picker
            v-model="form.visitDate"
            align="right"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="选择来访时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="离开时间" prop="leaveDate">
          <el-date-picker
            v-model="form.leaveDate"
            align="right"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="选择离开时间">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  pageVisitor,
  getVisitor,
  delVisitor,
  addVisitor,
  updateVisitor
} from "@/api/dormitory/visitor";

export default {
  name: "Visitor",
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      visitorList: [],
      title: "",
      open: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        phone: null
      },
      form: {},
      rules: {}
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询访客列表 */
    getList() {
      this.loading = true;
      pageVisitor(this.queryParams).then(response => {
        this.visitorList = response.data.records;
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
        createBy: null,
        updateBy: null,
        name: null,
        phone: null
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
      this.ids = selection.map(item => item.createBy)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加访客";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const visitorId = row.visitorId || this.ids
      getVisitor(visitorId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改访客";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.visitorId != null) {
            updateVisitor(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addVisitor(this.form).then(response => {
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
      const visitorId = row.visitorId || this.ids;
      this.$modal.confirm('是否确认删除访客编号为"' + visitorId + '"的数据项？').then(function () {
        return delVisitor(visitorId);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('pm/visitor/export', {
        ...this.queryParams
      }, `visitor_${new Date().getTime()}.xlsx`)
    }
  }
}
;
</script>
