<template>
  <a-layout id="components-layout-demo-side" style="min-height: 100vh">
    <a-layout-sider theme="light" v-model="collapsed" :trigger="null" collapsible width="170">
      <div class="logo">
        <span style="color: #0ee5a9">热源监控系统</span>
      </div>
      <a-menu theme="light" :defaultOpenKeys="defaultOpenKeys" mode="inline">
        <a-sub-menu v-for="i in list" :key="i.index">
          <span slot="title">
            <a-icon type="down-circle"/>
            <span>{{ i.name }}</span>
          </span>
          <a-menu-item :to="x.path" v-for="x in i.lists" :key="x.index"
                       @click="saveState(x.index);$router.push('/'+x.path)">
            {{ x.name }}
          </a-menu-item>
        </a-sub-menu>
      </a-menu>
    </a-layout-sider>
    <a-layout>
      <a-layout-header style="background: #fff; padding: 0">
        <a-row :gutter="[16,16]">
          <a-col :span="1">
            <a-icon
                class="trigger"
                :type="collapsed ? 'menu-unfold' : 'menu-fold'"
                @click="() => (collapsed = !collapsed)"
            />
          </a-col>
          <a-col :span="1" :offset="21">
            <a-button
                shape="circle" icon="logout"
                @click="logout"
            />
          </a-col>
        </a-row>
      </a-layout-header>
      <a-layout-content style="margin: 0 16px">
        <a-breadcrumb style="margin: 16px 0">
          <!--          <a-breadcrumb-item>User</a-breadcrumb-item>-->
          <!--          <a-breadcrumb-item>Bill</a-breadcrumb-item>-->
        </a-breadcrumb>
        <div :style="{ padding: '24px', background: '#fdfdfd', minHeight: '360px' }">
          <router-view></router-view>
        </div>
      </a-layout-content>
      <a-layout-footer style="text-align: center">
        <a href="https://github.com/syisbest?tab=repositories">
          sy
        </a>
      </a-layout-footer>
    </a-layout>
  </a-layout>
</template>


<script>
export default {
  name: "Main",
  data: function () {
    return {
      collapsed: false,
      activePath: [],
      defaultOpenKeys: [],
      list: []
    }
  },
  methods: {
    onCollapse(collapsed, type) {
      console.log(collapsed, type);
    },
    logout(){
      this.$router.push("/login");
      window.sessionStorage.clear();
    },
    onBreakpoint(broken) {
      console.log(broken);
    },
    toggleCollapse: function () {
      this.collapse = !this.collapse;
    },
    saveState: function (path) {
      window.sessionStorage.setItem("path", path);
      this.activePath = path;
    }
  },
  created() {
    const that = this;
    this.$http.get("getMenu").then(function (res) {
      that.list = res.data.result;
    }).catch()
    this.activePath = window.sessionStorage.getItem("path");
    this.defaultOpenKeys = window.sessionStorage.getItem("open");
  }
}
</script>

<style lang="less" scoped>
#components-layout-demo-side .logo {
  height: 32px;
  font-family: Georgia, serif;
  font-size: medium;
  //background: rgb(0, 0, 0);
  margin: 16px;
}

.a-menu-item {
  align-content: center;
}
#components-layout-demo-side .trigger {
  font-size: 18px;
  line-height: 64px;
  padding: 0 24px;
  cursor: pointer;
  transition: color 0.3s;
}

#components-layout-demo-side .trigger:hover {
  color: #1890ff;
}
</style>

