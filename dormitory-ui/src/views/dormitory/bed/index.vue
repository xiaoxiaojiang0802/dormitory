<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="宿舍" prop="dormitoryId">
        <el-select v-model="queryParams.dormitoryId" clearable>
          <el-option v-for="item in dormitoryList" :label="item.dormitoryNumber" :key="item.dormitoryId"
                     :value="item.dormitoryId">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="床位编号" prop="bedNumber">
        <el-input v-model="queryParams.bedNumber" placeholder="请输入床位编号"
                  clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
                   v-hasPermi="['dormitory:bed:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single"
                   @click="handleUpdate"
                   v-hasPermi="['dormitory:bed:edit']">
          修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini"
                   :disabled="multiple" @click="handleDelete" v-hasPermi="['dormitory:bed:remove']">
          删除
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="bedList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="宿舍" align="center" prop="dormitoryId">
        <template slot-scope="scope">
          <span v-for="item in dormitoryList"
                v-if="item.dormitoryId===scope.row.dormitoryId">{{ item.dormitoryNumber }}</span>
        </template>
      </el-table-column>
      <el-table-column label="床位编号" align="center" prop="bedNumber"/>
      <el-table-column label="床位状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.dor_bed_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" @click="checkInOpen(scope.row)">
            入住
          </el-button>
          <el-button size="mini" type="text" @click="handleUpdate(scope.row)"
                     v-hasPermi="['dormitory:bed:edit']">修改
          </el-button>
          <el-button size="mini" type="text" @click="handleDelete(scope.row)"
                     v-hasPermi="['dormitory:bed:remove']">删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum"
                :limit.sync="queryParams.pageSize" @pagination="getList"/>

    <!-- 添加或修改床位对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="宿舍" prop="dormitoryId">
          <el-input v-model="form.dormitoryId" placeholder="请输入宿舍"/>
        </el-form-item>
        <el-form-item label="床位编号" prop="bedNumber">
          <el-input v-model="form.bedNumber" placeholder="请输入床位编号"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 添加或修改床位对话框 -->
    <el-dialog title="办理入住" :visible.sync="checkOpen" width="700px" append-to-body>
      <el-form :model="userParams" ref="userForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
        <el-form-item label="" prop="searchValue">
          <el-input v-model="userParams.searchValue" placeholder="请输入姓名或者学号"/>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="userQuery">搜索</el-button>
        </el-form-item>
      </el-form>
      <el-table v-loading="loading" :data="studentList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="50" align="center"/>
        <el-table-column label="学号" align="center" key="cardNo" prop="cardNo"/>
        <el-table-column label="学生名称" align="center" key="nickName" prop="nickName"
                         :show-overflow-tooltip="true"/>
        <el-table-column label="性别" align="center" key="sex" prop="sex"
                         :show-overflow-tooltip="true"/>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope" v-if="scope.row.userId !== 1">
            <el-button size="mini" type="text" @click="inDormitory(scope.row)">
              入住
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="cancelCheckOpen">确 定</el-button>
        <el-button @click="cancelCheckOpen">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  pageBed,
  getBed,
  delBed,
  addBed,
  updateBed
} from "@/api/dormitory/bed";
import {listDormitory} from "@/api/dormitory/dormitory";
import {listStudent} from "@/api/dormitory/student";
import {addRecord} from "@/api/dormitory/record";

export default {
  name: "Bed",
  dicts: ['dor_bed_status'],
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      bedList: [],
      dormitoryList: [],
      studentList: [],
      title: "",
      open: false,
      checkOpen: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        dormitoryId: undefined,
        bedNumber: null,
        status: null
      },
      inForm: {},
      userParams: {
        searchValue: undefined
      },
      form: {},
      record: {},
      rules: {}
    };
  },
  created() {
    this.init();
    this.getList();
  },
  methods: {
    init() {
      const dormitoryId = this.$route.params.dormitoryId;
      if (dormitoryId !== undefined && dormitoryId !== '') {
        this.queryParams.dormitoryId = dormitoryId
      }
      listDormitory().then(res => {
        this.dormitoryList = res.data;
      });
    },
    inDormitory(row) {
      this.record.userId = row.userId;
      addRecord(this.record).then(res => {
        this.$message.success("入住成功");
      })
    },
    getList() {
      this.loading = true;
      pageBed(this.queryParams).then(response => {
        this.bedList = response.data.records;
        this.total = response.data.total;
        this.loading = false;
      });
    },
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        createBy: null,
        updateBy: null,
        dormitoryId: null,
        bedNumber: null,
        status: null
      };
      this.resetForm("form");
    },
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    userQuery() {
      listStudent(this.userParams).then(res => {
        this.studentList = res.data;
      })
    },
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
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加床位";
    },
    handleUpdate(row) {
      this.reset();
      const bedId = row.bedId || this.ids
      getBed(bedId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改床位";
      });
    },
    checkInOpen(row) {
      this.record = row;
      this.userQuery();
      this.checkOpen = true;
    },
    cancelCheckOpen() {
      this.checkOpen = false;
      this.getList();
    },
    submitForm() {
      this.form.dormitoryId = this.queryParams.dormitoryId;
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.createBy != null) {
            updateBed(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addBed(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    submitInForm() {
      this.form.dormitoryId = this.queryParams.dormitoryId;
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.createBy != null) {
            updateBed(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addBed(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    handleDelete(row) {
      const ids = row.bedId || this.ids;
      this.$modal.confirm('是否确认删除床位编号为"' + ids + '"的数据项？').then(function () {
        return delBed(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
  }
}
</script>
