<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="楼栋" prop="buildingId">
        <el-select clearable v-model="queryParams.buildingId" placeholder="请选择楼栋">
          <el-option v-for="item in buildingList" :key="item.buildingId"
                     :label="item.name" :value="item.buildingId"/>
        </el-select>
      </el-form-item>
      <el-form-item label="宿舍类型" prop="dormitoryType">
        <el-select clearable v-model="queryParams.dormitoryType" placeholder="请选择类型">
          <el-option v-for="item in dict.type.dor_dormitory_type" :key="item.dictId"
                     :label="item.label" :value="item.value"/>
        </el-select>
      </el-form-item>
      <el-form-item label="宿舍编号" prop="dormitoryNumber">
        <el-input
          v-model="queryParams.dormitoryNumber"
          placeholder="请输入宿舍编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="楼层" prop="floor">
        <el-input v-model="queryParams.floor" placeholder="请输入楼层" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="是否满员" prop="full">
        <el-select v-model="queryParams.full" clearable>
          <el-option v-for="item in dict.type.sys_yes_no" :key="item.full"
                     :label="item.label" :value="item.value"/>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
                   v-hasPermi="['dormitory:dormitory:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single"
                   @click="handleUpdate"
                   v-hasPermi="['dormitory:dormitory:edit']">
          修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini"
                   :disabled="multiple" @click="handleDelete" v-hasPermi="['dormitory:dormitory:remove']">
          删除
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dormitoryList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="楼栋" align="center" prop="buildingId">
        <template slot-scope="scope">
          <span v-for="item in buildingList" v-if="item.buildingId===scope.row.buildingId">
            {{ item.name }}
          </span>
        </template>
      </el-table-column>
      <el-table-column label="宿舍类型" align="center" prop="dormitoryType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.dor_dormitory_type" :value="scope.row.dormitoryType"/>
        </template>
      </el-table-column>
      <el-table-column label="宿舍编号" align="center" prop="dormitoryNumber"/>
      <el-table-column label="楼层" align="center" prop="floor"/>
      <el-table-column label="是否满员" align="center" prop="full">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_yes_no" :value="scope.row.full"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['dormitory:dormitory:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['dormitory:dormitory:remove']"
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

    <!-- 添加或修改宿舍对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="楼栋" prop="buildingId">
          <el-select v-model="form.buildingId" placeholder="请选择楼栋">
            <el-option v-for="item in buildingList" :key="item.buildingId"
                       :label="item.name" :value="item.buildingId"/>
          </el-select>
        </el-form-item>
        <el-form-item label="宿舍类型" prop="dormitoryType">
          <el-select v-model="form.dormitoryType" placeholder="请选择类型">
            <el-option v-for="item in this.dict.type.dor_dormitory_type" :key="item.dictId"
                       :label="item.label" :value="item.value"/>
          </el-select>
        </el-form-item>
        <el-form-item label="楼层" prop="floor">
          <el-input v-model="form.floor" placeholder="请输入楼层"/>
        </el-form-item>
        <el-form-item label="宿舍编号" prop="dormitoryNumber">
          <el-input v-model="form.dormitoryNumber" placeholder="请输入宿舍编号"/>
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
  pageDormitory,
  getDormitory,
  delDormitory,
  addDormitory,
  updateDormitory
} from "@/api/dormitory/dormitory";
import {listBuilding} from "@/api/dormitory/building";

export default {
  name: "Dormitory",
  dicts: ['dor_dormitory_type', 'sys_yes_no'],
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      dormitoryList: [],
      buildingList: [],
      title: "",
      open: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        dormitoryNumber: null,
        dormitoryType: null,
        floor: null,
        buildingId: null
      },
      form: {},
      rules: {}
    };
  },
  created() {
    this.getList();
    listBuilding().then(res => {
      this.buildingList = res.data;
    })
  },
  methods: {
    /** 查询宿舍列表 */
    getList() {
      this.loading = true;
      pageDormitory(this.queryParams).then(response => {
        this.dormitoryList = response.data.records;
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
        dormitoryNumber: null,
        dormitoryType: null,
        floor: null,
        buildingId: null
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
      this.title = "添加宿舍";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const dormitoryId = row.dormitoryId;
      getDormitory(dormitoryId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改宿舍";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.dormitoryId != null) {
            updateDormitory(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDormitory(this.form).then(response => {
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
      const dormitoryId = row.dormitoryId || this.ids;
      this.$modal.confirm('是否确认删除宿舍编号为"' + dormitoryId + '"的数据项？').then(function () {
        return delDormitory(dormitoryId);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
  }
}
;
</script>
