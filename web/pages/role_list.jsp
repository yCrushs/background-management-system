<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2023/6/5
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/utils/tools.jsp" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>后台管理系统-角色列表</title>
    <link rel="icon" href="${ctx}/static/images/favicon.ico" type="image/ico">
    <meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
    <meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
    <meta name="author" content="yinqi">
    <link rel="stylesheet" href="https://www.jq22.com/jquery/bootstrap-3.3.4.css">
    <link href="${ctx}/static/bootstrap/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${ctx}/static/bootstrap/css/style.min.css" rel="stylesheet">
</head>

<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">

            <!-- logo -->
            <div id="logo" class="sidebar-header">
                <a href="index.html"><img src="${ctx}/static/bootstrap/images/logo-sidebar.png" title="LightYear"
                                          alt="LightYear"/></a>
            </div>
            <div class="lyear-layout-sidebar-scroll">

                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">

                        <c:forEach var="menu" items="${menuList}">

                            <li
                                    <c:if test="${not empty menu.list}">
                                        class="nav-item nav-item-has-subnav <c:if
                                            test="${menu.id==4}"> active open </c:if>"
                                    </c:if>
                            ><a href="${not empty menu.href?(ctx.concat(menu.href)):"#！"}"><i class="${menu.icon}"></i>${menu.title}
                            </a>
                                <ul class=" nav nav-subnav">
                                    <c:if test="${not empty menu.list}">
                                        <c:forEach var="menuItem" items="${menu.list}">
                                            <li <c:if test="${menuItem.id==6}"> class="active"</c:if> ><a
                                                    href="${ctx}${menuItem.href}">${menuItem.title}</a></li>
                                        </c:forEach>
                                    </c:if>
                                </ul>
                            </li>
                        </c:forEach>

                    </ul>
                </nav>

                <div class="sidebar-footer">
                </div>
            </div>

        </aside>
        <!--End 左侧导航-->

        <!--头部信息-->
        <header class="lyear-layout-header">

            <nav class="navbar navbar-default">
                <div class="topbar">

                    <div class="topbar-left">
                        <div class="lyear-aside-toggler">
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                        </div>
                        <span class="navbar-page-title"> 示例页面 - 文档列表 </span>
                    </div>

                    <ul class="topbar-right">
                        <li class="dropdown dropdown-profile">
                            <a href="javascript:void(0)" data-toggle="dropdown">
                                <img class="img-avatar img-avatar-48 m-r-10"
                                     src="${ctx}/static/bootstrap/images/users/avatar.jpg" alt="后台系统"/>
                                <span>${userInfo.nickName}  <span class="caret"></span></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="lyear_pages_profile.html"><i class="mdi mdi-account"></i> 个人信息</a></li>
                                <li><a href="lyear_pages_edit_pwd.html"><i class="mdi mdi-lock-outline"></i>
                                    修改密码</a></li>
                                <li><a href="javascript:void(0)"><i class="mdi mdi-delete"></i> 清空缓存</a></li>
                                <li class="divider"></li>
                                <li><a href="lyear_pages_login.html"><i class="mdi mdi-logout-variant"></i> 退出登录</a>
                                </li>
                            </ul>
                        </li>
                        <!--切换主题配色-->
                        <li class="dropdown dropdown-skin">
                            <span data-toggle="dropdown" class="icon-palette"><i class="mdi mdi-palette"></i></span>
                            <ul class="dropdown-menu dropdown-menu-right" data-stopPropagation="true">
                                <li class="drop-title"><p>主题</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="site_theme" value="default" id="site_theme_1" checked>
                    <label for="site_theme_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="site_theme" value="dark" id="site_theme_2">
                    <label for="site_theme_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="site_theme" value="translucent" id="site_theme_3">
                    <label for="site_theme_3"></label>
                  </span>
                                </li>
                                <li class="drop-title"><p>LOGO</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="logo_bg" value="default" id="logo_bg_1" checked>
                    <label for="logo_bg_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_2" id="logo_bg_2">
                    <label for="logo_bg_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_3" id="logo_bg_3">
                    <label for="logo_bg_3"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_4" id="logo_bg_4">
                    <label for="logo_bg_4"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_5" id="logo_bg_5">
                    <label for="logo_bg_5"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_6" id="logo_bg_6">
                    <label for="logo_bg_6"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_7" id="logo_bg_7">
                    <label for="logo_bg_7"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_8" id="logo_bg_8">
                    <label for="logo_bg_8"></label>
                  </span>
                                </li>
                                <li class="drop-title"><p>头部</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="header_bg" value="default" id="header_bg_1" checked>
                    <label for="header_bg_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_2" id="header_bg_2">
                    <label for="header_bg_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_3" id="header_bg_3">
                    <label for="header_bg_3"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_4" id="header_bg_4">
                    <label for="header_bg_4"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_5" id="header_bg_5">
                    <label for="header_bg_5"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_6" id="header_bg_6">
                    <label for="header_bg_6"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_7" id="header_bg_7">
                    <label for="header_bg_7"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_8" id="header_bg_8">
                    <label for="header_bg_8"></label>
                  </span>
                                </li>
                                <li class="drop-title"><p>侧边栏</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="sidebar_bg" value="default" id="sidebar_bg_1" checked>
                    <label for="sidebar_bg_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_2" id="sidebar_bg_2">
                    <label for="sidebar_bg_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_3" id="sidebar_bg_3">
                    <label for="sidebar_bg_3"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_4" id="sidebar_bg_4">
                    <label for="sidebar_bg_4"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_5" id="sidebar_bg_5">
                    <label for="sidebar_bg_5"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_6" id="sidebar_bg_6">
                    <label for="sidebar_bg_6"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_7" id="sidebar_bg_7">
                    <label for="sidebar_bg_7"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_8" id="sidebar_bg_8">
                    <label for="sidebar_bg_8"></label>
                  </span>
                                </li>
                            </ul>
                        </li>
                        <!--切换主题配色-->
                    </ul>

                </div>
            </nav>

        </header>
        <!--End 头部信息-->

        <!--页面主要内容-->
        <main class="lyear-layout-content">

            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-toolbar clearfix">
                                <form class="pull-right search-bar" method="get" action="#!" role="form">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <input type="hidden" name="search_field" id="search-field" value="rolesname">
                                            <button class="btn btn-default dropdown-toggle" id="search-btn"
                                                    data-toggle="dropdown" type="button" aria-haspopup="true"
                                                    aria-expanded="false">
                                                角色名<span class="caret"></span>
                                            </button>
                                        </div>
                                        <input type="text" class="form-control" value="${keyword}" name="keyword"
                                               placeholder="请输入角色名">
                                    </div>
                                </form>
                                <div class="modal fade" id="editMenu1" tabindex="-1" role="dialog"
                                     aria-labelledby="exampleModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close"><span aria-hidden="true">&times;</span>
                                                </button>
                                                <h4 class="modal-title" id="exampleModalLabel1">新增菜单</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form>
                                                    <input type="hidden" id="id1">
                                                    <div class="form-group">
                                                        <label for="name" class="control-label">角色名：</label>
                                                        <input type="text" class="form-control" id="name1">
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                                    关闭
                                                </button>
                                                <button type="button" class="btn btn-primary" onclick="saverole1()">保存</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="toolbar-btn-action">
                                    <a class="btn btn-primary m-r-5" href="#!"
                                       data-toggle="modal" data-target="#editMenu1"
                                    ><i class="mdi mdi-plus"></i> 新增</a>
                                    <a class="btn btn-success m-r-5" href="#!"
                                       onclick="qiyong(${role.id})"
                                    ><i class="mdi mdi-check"
                                    ></i> 启用</a>
                                    <a class="btn btn-warning m-r-5" href="#!"
                                    ><i class="mdi mdi-block-helper"></i> 禁用</a>
                                    <a class="btn btn-danger" href="#!"
                                    onclick="roleDeleteBtn(${role.id})"
                                    ><i class="mdi mdi-window-close"></i> 删除</a>
                                </div>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>
                                                <label class="lyear-checkbox checkbox-primary">
                                                    <input type="checkbox" id="check-all"><span></span>
                                                </label>
                                            </th>
                                            <th>编号</th>
                                            <th>角色名</th>
                                            <th>创建时间</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="role" items="${roleList}" varStatus="status">
                                            <tr>
                                                <td>
                                                    <label class="lyear-checkbox checkbox-primary">
                                                        <input type="checkbox" name="ids[]" value="${role.id}"><span></span>
                                                    </label>
                                                </td>
                                                <td> ${status.index+1}</td>
                                                <td>${role.name}</td>
                                                <td><fmt:formatDate value="${role.createTime}" pattern="yyyy年MM月dd日 HH:mm:ss"></fmt:formatDate> </td>
                                                <td>
                                                    <c:if test="${role.status==1}">
                                                        <font class="text-success">正常</font>
                                                    </c:if>
                                                    <c:if test="${role.status!=1}">
                                                        <font class="text-error">无效</font>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <div class="btn-group">
                                                        <a data-toggle="modal" data-target="#editMenu"
                                                           class="btn btn-xs btn-default" href="#!" title="编辑"
                                                           data-toggle="tooltip"
                                                           onclick="editRole(${role.id})"
                                                        ><i class="mdi mdi-pencil"></i></a>
                                                        <c:if test="${role.status==1}">
                                                            <a class="btn btn-xs btn-default" href="#!" title="删除"
                                                               data-toggle="tooltip"
                                                               onclick="deleteRole(${role.id})"
                                                            ><i
                                                                    class="mdi mdi-window-close"></i></a>
                                                        </c:if>

                                                    </div>
                                                </td>
                                            </tr>


                                        </c:forEach>


                                        </tbody>
                                    </table>


                                    <div class="modal fade" id="editMenu" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close"><span aria-hidden="true">&times;</span>
                                                    </button>
                                                    <h4 class="modal-title" id="exampleModalLabel">修改角色</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <input type="hidden" id="id">
                                                        <div class="form-group">
                                                            <label for="name" class="control-label">角色名：</label>
                                                            <input type="text" class="form-control" id="name">
                                                        </div>
                                                       <%-- <div class="form-group">
                                                            <div class="col-xs-2 control-label"
                                                                 style="margin-left: 0;padding-left: 0;font-weight: 700;">
                                                                状态
                                                            </div>

                                                            <div class="col-xs-6">
                                                                <label class="lyear-switch switch-solid switch-primary">
                                                                    <input id="status" type="checkbox" checked="">
                                                                    <span></span>
                                                                </label>
                                                            </div>
                                                        </div>--%>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                                        关闭
                                                    </button>
                                                    <button type="button" class="btn btn-primary" onclick="saveRole()">保存</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--<ul class="pagination">
                                    <li class="disabled"><span>«</span></li>
                                    <li class="active"><span>1</span></li>
                                    <li><a href="#1">2</a></li>
                                    <li><a href="#1">3</a></li>
                                    <li><a href="#1">4</a></li>
                                    <li><a href="#1">5</a></li>
                                    <li><a href="#1">6</a></li>
                                    <li><a href="#1">7</a></li>
                                    <li><a href="#1">8</a></li>
                                    <li class="disabled"><span>...</span></li>
                                    <li><a href="#!">14452</a></li>
                                    <li><a href="#!">14453</a></li>
                                    <li><a href="#!">»</a></li>
                                </ul>--%>

                                <%--<div>
                                    当前第${pageIndex}页:共${pageCount}页 总记录数:${count}记录 <br>
                                    跳转到<input type="number" id="page" onkeyup="page(event)">页
                                    <div style="display: flex">
                                        <button id="home_page" onclick="home(1)">首页</button>
                                        <button id="up" onclick="paging(1)">上一页</button>

                                        <div id="skip_box">
                                        </div>

                                        <button id="down" onclick="paging(2)">下一页</button>
                                        <button id="nohome" onclick="home(2)">尾页</button>
                                    </div>
                                </div>--%>

                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </main>
        <!--End 页面主要内容-->
    </div>
</div>

<script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="https://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
<script type="text/javascript" src="${ctx}/static/bootstrap/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${ctx}/static/bootstrap/js/main.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('.search-bar .dropdown-menu a').click(function () {
            var field = $(this).data('field') || '';
            $('#search-field').val(field);
            $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
        });
    });

    function editRole(id) {
        $.ajax({
            url: "${ctx}/api/role/getRole",
            type: "get",
            dataType: "json",
            data: {
                id: id
            }, success(res) {
                if (res.code == 200) {
                    document.getElementById("id").value = res.data.id;
                    document.getElementById("name").value = res.data.name;
                } else {
                    alert(res.msg)
                    //TODO 关闭模态框
                }
            }
        })
    }


    function saveRole(){
        if (checkRole()){
            let id = document.getElementById("id").value;
            let name = document.getElementById("name").value;

            $.ajax({
                url: "${ctx}/api/role/edit",
                type: "post",
                dataType: "json",
                data: {
                    id:id,
                    name:name
                },success(res) {
                    if (res.code==200){
                        //成功
                        location.reload();
                    }
                }
            })
        }else {
            //错误提示
            alert("错误!")
        }

    }
    function saverole1(){
        if (checkRole1()){
            let name = document.getElementById("name1").value;
            $.ajax({
                url: "${ctx}/api/role/New",
                type: "post",
                dataType: "json",
                data: {
                    name:name
                },success(res) {
                    if (res.code==200){
                        //成功
                        location.reload();
                    }
                }
            })
        }else {
            //错误提示
            alert("错误!")
        }
    }

    function checkRole1(){
        let name1 = document.getElementById("name1");
        if (name1==null||name1==""){
            return false;
        }
        return true;
    }



    function checkRole(){
        let id = document.getElementById("id").value;
        if (id==null||id==""){
            return false;
        }
        let name = document.getElementById("name").value;
        if (name==null|| name==""){
            return false;
        }
        return true;
    }

    function roleDeleteBtn(){
        let ids = document.getElementsByName("ids[]");
        let sz="";
        for (let i = 0; i < ids.length; i++) {
            if (ids[i].checked) {
                sz+= ids[i].value+",";
            }
        } sz=sz.substring(0,sz.length-1);
        // let id = $("input[type='checkbox']:checked").value;
        if (confirm("确认删除吗？")){
            $.ajax({
                url:"${ctx}/api/role/roleDeleteBtn" ,
                type:"post",
                dataType:"json",
                data:{
                    id:sz
                },success(res){
                    if (res.code==200){
                        location.reload();
                    }else {
                        alert(res.msg);
                    }
                }
            })
        }
    }

    function qiyong(){
        let ids = document.getElementsByName("ids[]");
        let sz="";
        for (let i = 0; i < ids.length; i++) {
            if (ids[i].checked) {
                  sz+= ids[i].value+",";
            }
        } sz=sz.substring(0,sz.length-1);
        // let id = $("input[type='checkbox']:checked").value;
        if (confirm("确认启用吗？")){
            $.ajax({
                url:"${ctx}/api/role/change" ,
                type:"post",
                dataType:"json",
                data:{
                    id:sz
                },success(res){
                    if (res.code==200){
                        location.reload();
                    }else {
                        alert(res.msg);
                    }
                }
            })
        }
    }

    function deleteRole(id){
        if (confirm("确认删除吗？")) {
            $.ajax({
                url:"${ctx}/api/role/deleteRole",
                type:"post",
                dataType:"json",
                data:{
                    id:id
                },success(res){
                    if (res.code==200){
                        location.reload();
                    }else {
                        alert(res.msg);
                    }
                }
            })
        }
    }

    /*    window.onload = function () {
            let up = document.getElementById("up");
            let down = document.getElementById("down");
            let homePage = document.getElementById("home_page");
            let lastPage = document.getElementById("nohome");
            let pageIndex = ${pageIndex};
        if (pageIndex <= 1) {
            up.style.display = "none";
            homePage.style.display = "none";
        }
        if (pageIndex >=${pageCount}) {
            down.style.display = "none";
            lastPage.style.display = "none";
        }
        showSkip();
    }


    function paging(type) {
        let pageIndex = ${pageIndex};
        if (type == 1) {
            pageIndex--;
        } else {
            pageIndex++;
        }
        location.href = "paging.do?pageIndex=" + pageIndex;
    }

    function showSkip() {
        let pageCount = ${pageCount};
        let pageIndex =${pageIndex};
        let skipBox = document.getElementById("skip_box");
        let a;
        if (pageCount <= 9) {
            a = pageCount;
            aaa(a, skipBox);
        } else {
            a = 9;
            if (pageIndex > 5) {
                bbb(pageCount, pageIndex, skipBox);
            } else {
                aaa(a, skipBox);
            }

        }
    }

    function aaa(count, skipBox) {
        for (let i = 1; i <= count; i++) {
            if (i ==${pageIndex}) {
                addBth(i, skipBox, 1)
            } else {
                addBth(i, skipBox)
            }
        }
    }

    function bbb(pageCount, pageIndex, skipBox) {
        let mid = 5;
        if (pageIndex >= mid) {
            mid = pageIndex;
        }
        skipBox.innerText = "";
        for (let i = 4; i >= 1; i--) {
            addBth((mid - i), skipBox);
        }
        addBth(mid, skipBox, 1);
        for (let i = 1; i <= 4; i++) {
            if (mid + i > pageCount) {
                break;
            }
            addBth((mid + i), skipBox);
        }
    }

    function addBth(value, skipBox, gl) {
        let btn = document.createElement("button");
        btn.innerText = value;
        if (gl) {
            btn.style.backgroundColor = "red";
            btn.style.color = "#fff";
        }
        btn.onclick = function () {
            location.href = "paging.do?pageIndex=" + value;
        }
        skipBox.appendChild(btn);
    }

    //首页按钮
    function home(type) {
        if (type == 1) {
            location.href = "paging.do?pageIndex=" + 1;
        }
        if (type == 2) {
            location.href = "paging.do?pageIndex=" +
            ${pageCount}
        }
    }

    //实现页面跳转
    //获取键盘回车，然后跳转到相应页
    function page(event) {
        let value = document.getElementById("page").value;//获取输入框的值
        if (event.keyCode == "13") {//回车触发事件
            if (value > 0 && value <=${pageCount}) {//只有值<总页数才能跳转到相应的页面
                location.href = "paging.do?pageIndex=" + value;
            } else if (value >${pageCount}) {
                location.href = "paging.do?pageIndex=" +${pageCount};
            } else if (value > 1) {
                location.href = "paging.do?pageIndex=" + 1;
            } else {
                location.href = "paging.do?pageIndex=" + 20;
            }
        }
    }
*/
</script>
</body>
</html>
