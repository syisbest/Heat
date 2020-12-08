<template>
  <div class="login-container">
    <h2 class="login-title">热源监控系统</h2>
    <div class="login-box">
      <a-avatar :src="'https://cube.elemecdn.com/6/94/4d3ea53c084bad6931a56d5158a48jpeg.jpeg'"
                class="avatar-box"></a-avatar>

      <a-form-model :model="loginForm" ref="loginFormRef" :rules="loginFormRules" label-width="0px" class="login-form"
                    v-bind="layout">
        <h2 class="title">用户登录 LOGIN</h2>

        <a-form-model-item prop="username" label="  ">
          <a-input placeholder="请输入用户名" allow-clear v-model=loginForm.username prefix-icon="el-icon-user"></a-input>
        </a-form-model-item>

        <a-form-model-item prop="password" label="  ">
          <a-input-password type="password" placeholder="请输入密码" allow-clear v-on:keyup.enter.native="login" v-model=loginForm.password
                   prefix-icon="el-icon-lock"></a-input-password>
        </a-form-model-item>

        <a-form-model-item class="btns" :wrapper-col="{ span: 14, offset: 4 }">
          <a-button type="info" ghost @click="login()">登录</a-button>
          <a-button type="info" ghost style="margin-left: 10px" @click="resetLoginForm()">重置</a-button>
        </a-form-model-item>
      </a-form-model>

    </div>
  </div>
</template>

<script>
import md5 from "md5";

export default {
  name: "login",
  data() {
    return {
      //表单数据绑定
      loginForm: {},
      //表单验证规则
      loginFormRules: {
        username: [
          {required: true, message: '请输入用户名', trigger: 'change'},
          {min: 3, max: 10, message: '长度在 3 到 10 个字符', trigger: 'change'}
        ],
        password: [
          {required: true, message: '请输入密码', trigger: 'blur'},
          {min: 6, max: 15, message: '长度在 6 到 15 个字符', trigger: 'change'}
        ],
      },
      layout: {
        labelCol: {span: 4},
        wrapperCol: {span: 18},
      }
    }
  },
  methods: {
    resetLoginForm() {
      this.$refs.loginFormRef.resetFields();
    },
    login() {
      const that = this;
      this.$refs.loginFormRef.validate(valid => {
        if (!valid) return;
        let pass = this.loginForm.password;
        for (let i = 0; i < 10; i++) {
          pass = md5(pass)
        }
        this.$http.post('login', {username: this.loginForm.username, password: pass}).then(function (result) {
          if (result.data.code === "-1") {
            return that.$message.error("登陆失败，账户名或密码错误！");
          } else {
            window.sessionStorage.setItem("token", result.data.result);
            that.$message.success("登录成功");
            that.$router.push("/");
          }
        }).catch();
      })
    },

  }
}
</script>

<style lang="less" scoped>
.login-container {
  position: absolute;
  width: 100%;
  height: 100%;
  background: url("../assets/houTaiBg.png");
}

.login-box {
  color: #00a7f6;
  width: 450px;
  height: 300px;
  border-radius: 3px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
.login-title {
  color: #eef4f5;
  position: absolute;
  left: 50%;
  top: 15%;
  transform: translate(-50%, -50%);
  font-size: 48px;
  font-family: Microsoft Yahei;
}
.title {
  color: white;
}

.avatar-box {
  height: 100px;
  width: 100px;
  left: 50%;
  position: absolute;

  transform: translate(-50%, -50%);
  align-content: center;
}

.btns {
  display: flex;
  justify-content: flex-end;
}

.login-form {
  position: absolute;
  //top: auto;
  bottom: 0;
  width: 100%;
  padding: 0 20px;
  box-sizing: border-box;
  background: url("../assets/houTaiKuang.png");
}
</style>
