<template>
  <div class="container">
    <el-container>
      <el-header>
        <el-row>
          <el-col :span="22">
            <el-tabs v-model="activeName" @tab-click="handleClick">
              <el-tab-pane label="首页" name="/main"/>
              <el-tab-pane label="课程中心" name="/user/profile"/>
            </el-tabs>
          </el-col>
          <el-col :span="2">
            <div class="right-menu" v-if="getToken()">
              <el-dropdown class="avatar-container right-menu-item hover-effect" trigger="click">
                <div class="avatar-wrapper">
                  <img :src="avatar" style="height: 40px" class="user-avatar" alt="">
                  <i class="el-icon-caret-bottom"/>
                </div>
                <el-dropdown-menu slot="dropdown">
                  <router-link to="/user/profile">
                    <el-dropdown-item>个人中心</el-dropdown-item>
                  </router-link>
                  <el-dropdown-item divided @click.native="logout">
                    <span>退出登录</span>
                  </el-dropdown-item>
                </el-dropdown-menu>
              </el-dropdown>
            </div>
            <div class="right-menu" v-else>
              <router-link to="/login?redirect=/main">
                <el-dropdown-item>去登录</el-dropdown-item>
              </router-link>
            </div>
          </el-col>
        </el-row>
      </el-header>
      <el-main>
        <router-view v-if="!$route.meta.link" :key="key"/>
      </el-main>
    </el-container>
  </div>
</template>

<script>
import {mapGetters} from "vuex";
import {getToken} from "@/utils/auth";
import {listType} from "@/api/system/type";
import {pageCourse} from "@/api/system/course";
import store from "@/store";

export default {
  name: "Main",
  data() {
    return {
      activeName: 'second',
      courseTypeList: [],
      courseList: [],
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
    ]),
    key() {
      return this.$route.path;
    },
    setting: {
      get() {
        return this.$store.state.settings.showSettings
      },
      set(val) {
        this.$store.dispatch('settings/changeSetting', {
          key: 'showSettings',
          value: val
        })
      }
    },
    topNav: {
      get() {
        return this.$store.state.settings.topNav
      }
    }
  },
  watch: {},
  created() {
    this.init();
    this.getCourseList();
  },
  methods: {
    logout(){
      store.dispatch('LogOut').then(() => {
        this.$router.push({ path: '/login' })
      })
    },
    getToken,
    handleClick(tab, event) {
      this.$router.push({ path: tab.name })
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
    init() {
      listType().then(res => {
        this.courseTypeList = res.data;
      })
    }
  }
};
</script>

<style rel="stylesheet/scss" lang="scss">
.navbar {
  height: 50px;
  overflow: hidden;
  position: relative;
  background: #fff;
  box-shadow: 0 1px 4px rgba(0, 21, 41, .08);

  .hamburger-container {
    line-height: 46px;
    height: 100%;
    float: left;
    cursor: pointer;
    transition: background .3s;
    -webkit-tap-highlight-color: transparent;

    &:hover {
      background: rgba(0, 0, 0, .025)
    }
  }

  .breadcrumb-container {
    float: left;
  }

  .topmenu-container {
    position: absolute;
    left: 50px;
  }

  .errLog-container {
    display: inline-block;
    vertical-align: top;
  }

  .right-menu {
    float: right;
    height: 40px;
    line-height: 50px;

    &:focus {
      outline: none;
    }

    .right-menu-item {
      display: inline-block;
      padding: 0 8px;
      height: 40px;
      font-size: 18px;
      color: #5a5e66;
      vertical-align: text-bottom;

      &.hover-effect {
        cursor: pointer;
        transition: background .3s;

        &:hover {
          background: rgba(0, 0, 0, .025)
        }
      }
    }

    .avatar-container {
      margin-right: 30px;

      .avatar-wrapper {
        margin-top: 5px;
        position: relative;


        .el-icon-caret-bottom {
          cursor: pointer;
          position: absolute;
          right: -20px;
          top: 25px;
          font-size: 12px;
        }
      }
    }
  }

  .user-avatar {
    cursor: pointer;
    width: 40px;
    height: 40px;
    border-radius: 10px;
  }
}

.time {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.button {
  padding: 0;
  float: right;
}

.image {
  min-height: 220px;
  width: 100%;
  display: block;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both
}
</style>
