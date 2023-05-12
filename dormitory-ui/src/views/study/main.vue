<template>
  <div>
    <el-row>
      <el-col :span="1">分类</el-col>
      <el-col :span="23">
        <div class="source">
          <el-tag v-for="item in courseTypeList" class="ml5" :key="item.id" effect="plain">
            {{ item.name }}
          </el-tag>
        </div>
      </el-col>
    </el-row>
    <el-divider></el-divider>
    <el-row>
      <el-col :span="8" v-for="(item, index) in courseList" :offset="index > 0 ? 4 : 0">
        <el-card :body-style="{ padding: '0px' }">
          <img :src="item.imageUrls" class="image" alt="">
          <div style="padding: 14px;">
            <span>{{ item.name }}</span>
            <div class="bottom clearfix">
              <time class="time">{{ item.name }}</time>
              <router-link type="text" class="button" :to="'/study/info/'+item.id">
                <el-dropdown-item>立即学习</el-dropdown-item>
              </router-link>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import {mapGetters} from "vuex";
import {getToken} from "@/utils/auth";
import {listType} from "@/api/system/type";
import {pageCourse} from "@/api/system/course";

export default {
  name: "Main",
  data() {
    return {
      activeName: 'second',
      courseTypeList: [],
      courseList: undefined,
      queryParams: {
        pageNum: 1,
        pageSize: 12,
        courseTypeId: null,
      },
    };
  },
  computed: {
    ...mapGetters([
      'sidebar',
      'avatar',
      'device'
    ])
  },
  watch: {},
  created() {
    this.init();
    this.getCourseList();
  },
  methods: {
    getToken,
    handleClick(tab, event) {
      console.log(tab, event);
    },
    /** 查询课程列表 */
    getCourseList() {
      this.loading = true;
      pageCourse(this.queryParams).then(response => {
        this.courseList = response.data.records;
        this.total = response.data.total;
        this.loading = false;
      });
    },
    startLearn(row) {

    },
    init() {
      listType().then(res => {
        this.courseTypeList = res.data;
      })
    }
  }
};
</script>

<style rel="stylesheet/scss" lang="scss">
.el-tag--medium {
  height: 28px;
  line-height: 26px;
  margin-left: 8px;
}

.source {
  margin-left: 5px;
}
</style>
