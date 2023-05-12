<template>
  <div>
    <el-row>
      <el-col :span="10">
        <img :src="item.imageUrls" class="image" alt="">
      </el-col>
      <el-col :span="14">
        <el-descriptions class="margin-top" style="margin-left: 15px" :title="item.name" :column="1">
          <el-descriptions-item label="用户名">kooriookami</el-descriptions-item>
          <el-descriptions-item label="手机号">18100000000</el-descriptions-item>
          <el-descriptions-item label="居住地" :span="2">苏州市</el-descriptions-item>
          <el-descriptions-item label="联系地址">江苏省苏州市吴中区吴中大道 1188 号</el-descriptions-item>
        </el-descriptions>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import {getCourse} from "@/api/system/course";

export default {
  name: 'Info',
  data() {
    return {
      item: {}
    }
  },
  created() {
    this.getInfo();
  },
  methods: {
    getInfo() {
      getCourse(this.$route.params.id).then(res => {
        this.item = res.data;
      })
    }
  }
}
</script>
