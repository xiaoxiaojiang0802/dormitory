<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="地址" prop="address">
        <el-input
          v-model="queryParams.address"
          placeholder="请输入地址"
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
                   v-hasPermi="['pm:building:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single"
                   @click="handleUpdate"
                   v-hasPermi="['pm:building:edit']">
          修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini"
                   :disabled="multiple" @click="handleDelete" v-hasPermi="['pm:building:remove']">
          删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini"
                   @click="handleExport" v-hasPermi="['pm:building:export']">
          导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="buildingList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="名称" align="center" prop="name"/>
      <el-table-column label="楼层数量" align="center" prop="numberFloors"/>
      <el-table-column label="房间数量" align="center" prop="totalRooms"/>
      <el-table-column label="可用房间数量" align="center" prop="availableRooms"/>
      <el-table-column label="已使用房间数量" align="center" prop="occupiedRooms"/>
      <el-table-column label="地址" align="center" prop="address"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['pm:building:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['pm:building:remove']"
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

    <!-- 添加或修改楼栋信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入名称"/>
        </el-form-item>
        <el-form-item label="楼层数量" prop="numberFloors">
          <el-input v-model="form.numberFloors" placeholder="请输入楼层数量"/>
        </el-form-item>
        <el-form-item label="房间数量" prop="totalRooms">
          <el-input v-model="form.totalRooms" placeholder="请输入房间数量"/>
        </el-form-item>
        <el-form-item label="可用房间数量" prop="availableRooms">
          <el-input v-model="form.availableRooms" placeholder="请输入可用房间数量"/>
        </el-form-item>
        <el-form-item label="已使用房间数量" prop="occupiedRooms">
          <el-input v-model="form.occupiedRooms" placeholder="请输入已使用房间数量"/>
        </el-form-item>
        <el-form-item label="地址" prop="address">
          <el-input v-model="form.address" placeholder="请输入地址"/>
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
  pageBuilding,
  getBuilding,
  delBuilding,
  addBuilding,
  updateBuilding
} from "@/api/dormitory/building";

export default {
  name: "Building",
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      buildingList: [],
      title: "",
      open: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        numberFloors: null,
        totalRooms: null,
        availableRooms: null,
        occupiedRooms: null,
        address: null,
      },
      form: {},
      rules: {
        createTime: [
          {
            required: true, message: "不能为空", trigger: "blur"
          }
        ],
        updateTime: [
          {
            required: true, message: "不能为空", trigger: "blur"
          }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询楼栋信息列表 */
    getList() {
      this.loading = true;
      pageBuilding(this.queryParams).then(response => {
        this.buildingList = response.data.records;
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
        buildingId: null,
        name: null,
        numberFloors: null,
        totalRooms: null,
        availableRooms: null,
        occupiedRooms: null,
        address: null,
        createTime: null,
        updateTime: null,
        createBy: null,
        updateBy: null
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
      this.ids = selection.map(item => item.buildingId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加楼栋信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const buildingId = row.buildingId || this.ids
      getBuilding(buildingId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改楼栋信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.buildingId != null) {
            updateBuilding(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addBuilding(this.form).then(response => {
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
      const buildingIds = row.buildingId || this.ids;
      this.$modal.confirm('是否确认删除楼栋信息编号为"' + buildingIds + '"的数据项？').then(function () {
        return delBuilding(buildingIds);
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
