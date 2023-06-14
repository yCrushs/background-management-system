<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="utils/tools.jsp"%>

<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
  <title>后台管理系统-登录</title>
  <link rel="icon" href="${ctx}/static/bootstrap/images/favicon.ico" type="image/ico">
  <meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
  <meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
  <meta name="author" content="yinqi">
  <link rel="stylesheet" href="https://www.jq22.com/jquery/bootstrap-3.3.4.css">
  <link href="${ctx}/static/bootstrap/css/materialdesignicons.min.css" rel="stylesheet">
  <link href="${ctx}/static/bootstrap/css/style.min.css" rel="stylesheet">
  <style>
    .lyear-wrapper {
      position: relative;
    }
    .lyear-login {
      display: flex !important;
      min-height: 100vh;
      align-items: center !important;
      justify-content: center !important;
    }
    .login-center {
      background: #fff;
      min-width: 38.25rem;
      padding: 2.14286em 3.57143em;
      border-radius: 5px;
      margin: 2.85714em 0;
    }
    .login-header {
      margin-bottom: 1.5rem !important;
    }
    .login-center .has-feedback.feedback-left .form-control {
      padding-left: 38px;
      padding-right: 12px;
    }
    .login-center .has-feedback.feedback-left .form-control-feedback {
      left: 0;
      right: auto;
      width: 38px;
      height: 38px;
      line-height: 38px;
      z-index: 4;
      color: #dcdcdc;
    }
    .login-center .has-feedback.feedback-left.row .form-control-feedback {
      left: 15px;
    }
  </style>
</head>

<body>
<div class="row lyear-wrapper">

  <div class="modal fade" id="editMenu1" tabindex="-1" role="dialog"
       aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close"><span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="exampleModalLabel1">用户注册</h4>
        </div>
        <div class="modal-body">
          <form>
            <input type="hidden" id="id1">
            <div class="form-group">
              <label for="username1" class="control-label">用户名：</label>
              <input type="text" class="form-control" id="username1">
            </div>
            <div class="form-group">
              <label for="password1" class="control-label">password：</label>
              <input type="text" class="form-control" id="password1">
            </div>
            <div class="form-group">
              <label for="nickname1" class="control-label">nick_name：</label>
              <input type="text" class="form-control" id="nickname1">
            </div>
            <div>
              <label for="tel1" class="control-label">tel:</label>
              <input type="text" class="form-control" id="tel1">
            </div>
            <div>
              <label for="address1" class="control-label">address:</label>
              <input type="text" class="form-control" id="address1">
            </div>
            <label>性别</label>
            <div class="clearfix">
              <label class="lyear-radio radio-inline radio-primary">
                <input type="radio" name="sex" value="1" id="man"><span>男</span>
              </label>
              <label class="lyear-radio radio-inline radio-primary">
                <input type="radio" name="sex" value="0"
                       id="woman"><span>女</span>
              </label>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">
            关闭
          </button>
          <button type="button" class="btn btn-primary" onclick="saveUser()">
            保存
          </button>
        </div>
      </div>
    </div>
  </div>

  <div class="lyear-login">
    <div class="login-center">
      <div class="login-header text-center">
        <a href="index.html"> <img alt="light year admin" src="${ctx}/static/bootstrap/images/logo-sidebar.png"> </a>
      </div>
      <form onsubmit="return false" method="post">
        <div class="form-group has-feedback feedback-left">
          <input type="text" placeholder="请输入您的用户名" class="form-control" name="username" id="username" />
          <span class="mdi mdi-account form-control-feedback" aria-hidden="true"></span>
        </div>
        <div class="form-group has-feedback feedback-left">
          <input type="password" placeholder="请输入密码" class="form-control" id="password" name="password" />
          <span class="mdi mdi-lock form-control-feedback" aria-hidden="true"></span>
        </div>
        <div class="form-group has-feedback feedback-left row">
          <div class="col-xs-7">
            <input type="text" id="code" name="captcha" class="form-control"   placeholder="验证码">
            <span class="mdi mdi-check-all form-control-feedback" aria-hidden="true"></span>
          </div>
          <div class="col-xs-5">
            <img src="${ctx}/api/captcha/code" class="pull-right" id="captcha" style="cursor: pointer;" onclick="this.src=this.src+'?d='+Math.random();" title="点击刷新" alt="captcha">
          </div>
        </div>

        <div class="form-group">
          <button class="btn btn-block btn-primary" type="button" onclick="checkCode()">立即登录</button>
        </div>
        <%--<a data-toggle="modal" data-target="#editMenu"
           class="btn btn-xs btn-default" href="#!" title="编辑"
           data-toggle="tooltip"
           onclick="editUser(${user.id})"
        ><i class="mdi mdi-pencil"></i></a>--%>
        <div data-toggle="modal" data-target="#editMenu1">
          <button class="btn btn-block btn-primary" type="button" >注册</button>
        </div>

      </form>
      <hr>
    </div>
  </div>
</div>
<script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="https://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
<script type="text/javascript">

    /**
     * 注册的保存函数
     */
    function saveUser() {
    if (checkUser()) {
      let sex = document.querySelector('input[name="sex"]:checked').value;
      let username = document.getElementById("username1").value;
      let password = document.getElementById("password1").value;
      let nickname = document.getElementById("nickname1").value;
      let tel = document.getElementById("tel1").value;
      let address = document.getElementById("address1").value;
      $.ajax({
        url: "${ctx}/api/user/register",
        type: "post",
        dataType: "json",
        data: {
          username: username,
          password: password,
          nickname: nickname,
          tel: tel,
          address: address,
          sex: sex
        }, success(res) {
          if (res.code == 200) {
            //成功
            location.reload();
          }else {
            alert(res.msg);
          }
        }
      })
    }
  }

    /**
     * 注册的判断函数
     */
  function checkUser() {
    let username = document.getElementById("username1").value;
    let password = document.getElementById("password1").value;
    let nickname = document.getElementById("nickname1").value;
    let tel = document.getElementById("tel1").value;
    let address = document.getElementById("address1").value;
    if (username == null || username == "") {
      alert("用户名不能为空！")
        return false;
    }
    if (password == null || password == "") {
      alert("密码不能为空！")
        return false;
    }else {
        let pswReg=/^[a-zA-Z]\w{5,17}$/
        if (!pswReg.test(password)){
            alert("密码格式不正确(以字母开头，长度在6~18之间，只能包含字母、数字和下划线)")
            return false;
        }
    }

    if (nickname==""||nickname==null){
      alert("昵称不能为空!")
        return false;
    }
    if (tel == null || tel == "") {
      alert("手机号不能为空")
        return false;
    } else {
      let telReg = /^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|(19[0-9])|166|198|199|(147))\d{8}$/
      if (!telReg.test(tel)){
        alert("手机号格式不合法")
          return false;
      }
    }
    if (address==null||address==""){
      alert("地址不能为空")
        return false;
    }
    return true;
  }

  function checkCode(){
    let code = document.getElementById("code").value;

    if (code==null||code==""){
      alert("请输入验证码")
    }else {
      $.ajax({
        url:"${ctx}/api/captcha/check",
        type:"post",
        dataType: "json",
        data: {
          code:code
        },success(res){
          if (res.code==200){
            //如果返回的code是200 说明验证码校验通过，开始做登录操作
            login();
          }else {
            alert(res.msg);
          }
        }
      })
    }
  }

  function login(){
    let userName = document.getElementById("username").value;
    let password = document.getElementById("password").value;

    if (checkInput()){
      $.ajax({
        url:"${ctx}/api/user/login",
        type:"post",
        dataType:"json",
        data:{
          userName:userName,
          password:password
        },success(res){
          if (res.code==200){
            //登录成功，跳转主页
            location.href="${ctx}/api/menu/showMenuTree";
          }else {
            alert(res.msg);
          }
        }

      })
    }
  }

  function checkInput(){
    let userName = document.getElementById("username").value;
    let password = document.getElementById("password").value;
    if (userName==null||userName==""){
      alert("账号不能为空")
      return false;
    }
    if (password==null||password==""){
      alert("密码不能为空")
      return false;
    }
    return true;
  }
</script>
</body>
</html>
