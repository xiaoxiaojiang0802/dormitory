<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
                  <el-form-item label="报修位置" prop="location">
                    <el-input
                        v-model="queryParams.location"
                        placeholder="请输入报修位置"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="报修情况" prop="description">
                    <el-input
                        v-model="queryParams.description"
                        placeholder="请输入报修情况"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="维修状态" prop="state">
                    <el-input
                        v-model="queryParams.state"
                        placeholder="请输入维修状态"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="维修人" prop="repairUser">
                    <el-input
                        v-model="queryParams.repairUser"
                        placeholder="请输入维修人"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="确认人" prop="confirmUser">
                    <el-input
                        v-model="queryParams.confirmUser"
                        placeholder="请输入确认人"
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
            v-hasPermi="['dormitory:order:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['dormitory:order:edit']">
          修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini"
            :disabled="multiple" @click="handleDelete" v-hasPermi="['dormitory:order:remove']">
          删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini"
            @click="handleExport" v-hasPermi="['dormitory:order:export']">
          导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
              <el-table-column label="报修位置" align="center" prop="location"/>
              <el-table-column label="报修情况" align="center" prop="description"/>
              <el-table-column label="维修状态" align="center" prop="state"/>
              <el-table-column label="维修人" align="center" prop="repairUser"/>
              <el-table-column label="确认人" align="center" prop="confirmUser"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['dormitory:order:edit']"
          >修改
          </el-button>
          <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['dormitory:order:remove']"
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

    <!-- 添加或修改维修工单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
                        <el-form-item label="报修位置" prop="location">
                          <el-input v-model="form.location" placeholder="请输入报修位置"/>
                        </el-form-item>
                        <el-form-item label="报修情况" prop="description">
                          <el-input v-model="form.description" placeholder="请输入报修情况"/>
                        </el-form-item>
                        <el-form-item label="维修状态" prop="state">
                          <el-input v-model="form.state" placeholder="请输入维修状态"/>
                        </el-form-item>
                        <el-form-item label="维修人" prop="repairUser">
                          <el-input v-model="form.repairUser" placeholder="请输入维修人"/>
                        </el-form-item>
                        <el-form-item label="确认人" prop="confirmUser">
                          <el-input v-model="form.confirmUser" placeholder="请输入确认人"/>
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
    pageOrder,
    getOrder,
    delOrder,
    addOrder,
    updateOrder
  } from "@/api/dormitory/order";

  export default {
    name: "Order",
    data() {
      return {
        loading: true,
        ids: [],
        single: true,
        multiple: true,
        showSearch: true,
        total: 0,
              orderList: [],
        title: "",
        open: false,
        queryParams: {
          pageNum: 1,
          pageSize: 10,
                        location: null,
                        description: null,
                        state: null,
                        repairUser: null,
                        confirmUser: null
        },
        form: {},
        rules: {
        }
      };
    },
    created() {
      this.getList();
    },
  methods: {
    /** 查询维修工单列表 */
    getList() {
      this.loading = true;
      pageOrder(this.queryParams).then(response => {
        this.orderList = response.data.records;
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
                      location: null,
                      description: null,
                      state: null,
                      repairUser: null,
                      confirmUser: null
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
      this.title = "添加维修工单";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const createBy = row.createBy || this.ids
      getOrder(createBy).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改维修工单";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.createBy!=null){
            updateOrder (this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          }
        else
          {
            addOrder(this.form).then(response => {
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
      const createBys = row.createBy||this.ids;
      this.$modal.confirm('是否确认删除维修工单编号为"' + createBys + '"的数据项？').then(function () {
        return delOrder(createBys);}).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
  /** 导出按钮操作 */
  handleExport(){
    this.download('pm/order/export', {
      ...this.queryParams
    }, `order_${new Date().getTime()}.xlsx`)
  }
  }
  }
  ;
</script>
