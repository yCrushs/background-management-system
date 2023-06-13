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
    <title>后台管理系统-用户列表</title>
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
                                    class="nav-item
                                        <c:if test="${not empty menu.list}">
                                        nav-item-has-subnav
                                        </c:if>
                                         <c:if
                                            test="${menu.id==2}">
                                            active open
                                         </c:if>"
                            ><a href="${not empty menu.href?(ctx.concat(menu.href)):"#！"}"><i
                                    class="${menu.icon}"></i>${menu.title}
                            </a>
                                <ul class=" nav nav-subnav">
                                    <c:if test="${not empty menu.list}">
                                        <c:forEach var="menuItem" items="${menu.list}">
                                            <li <c:if test="${menuItem.id==2}"> class="active"</c:if> ><a
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
                                            <input type="hidden" name="search_field" id="search-field" value="username">
                                            <button class="btn btn-default dropdown-toggle" id="search-btn"
                                                    data-toggle="dropdown" type="button" aria-haspopup="true"
                                                    aria-expanded="false">
                                                用户名<span class="caret"></span>
                                            </button>
                                        </div>
                                        <input type="text" class="form-control" value="${keyword}" name="keyword"
                                               placeholder="请输入用户名称">
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
                                                <h4 class="modal-title" id="exampleModalLabel1">新增用户</h4>
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
                                                    <%--<div class="form-group">
                                                      <div class="col-xs-2 control-label"
                                                           style="margin-top: 5px; margin-left: 0;padding-left: 0;font-weight: 700;">
                                                        状态
                                                      </div>

                                                      <div class="col-xs-6" style="margin-top: 5px;">
                                                        <label class="lyear-switch switch-solid switch-primary">
                                                          <input id="status1" type="checkbox" checked="">
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
                                                <button type="button" class="btn btn-primary" onclick="saveUser1()">
                                                    保存
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="toolbar-btn-action">
                                    <a class="btn btn-primary m-r-5" href="#!"
                                       data-toggle="modal" data-target="#editMenu1"
                                    ><i class="mdi mdi-plus"></i> 新增</a>
                                    <a class="btn btn-success m-r-5" href="#!"
                                       onclick="qiyong(${user.id})"
                                    ><i class="mdi mdi-check"
                                    ></i> 启用</a>
                                    <a class="btn btn-warning m-r-5" href="#!"><i class="mdi mdi-block-helper"></i> 禁用</a>
                                    <a class="btn btn-danger" href="#!"
                                    onclick="userDeleteBtn(${user.id})"
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
                                            <th>user_name</th>
                                            <th>password</th>
                                            <th>nick_name</th>
                                            <th>tel</th>
                                            <th>address</th>
                                            <th>sex</th>
                                            <th>avatar</th>
                                            <th>创建时间</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="user" items="${userList}" varStatus="status">
                                            <tr>
                                                <td>
                                                    <label class="lyear-checkbox checkbox-primary">
                                                        <input type="checkbox" name="ids[]"
                                                               value="${user.id}"><span></span>
                                                    </label>
                                                </td>
                                                <td> ${status.index+1}</td>
                                                <td>${user.userName}</td>
                                                <td>${user.password}</td>
                                                <td>${user.nickName}</td>
                                                <td>${user.tel}</td>
                                                <td>${user.address}</td>
                                                <td>
                                                    <c:if test="${user.sex == 1}">
                                                        男
                                                    </c:if>
                                                    <c:if test="${user.sex == 0}">
                                                        女
                                                    </c:if>
                                                </td>
                                                <td>${user.avatar}</td>
                                                <td><fmt:formatDate value="${user.createTime}" pattern="yyyy年MM月dd日 HH:mm:ss"></fmt:formatDate></td>
                                                <td>
                                                    <c:if test="${user.status==1}">
                                                        <font class="text-success">正常</font>
                                                    </c:if>
                                                    <c:if test="${user.status!=1}">
                                                        <font class="text-error">无效</font>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <div class="btn-group">
                                                        <a data-toggle="modal" data-target="#editMenu"
                                                           class="btn btn-xs btn-default" href="#!" title="编辑"
                                                           data-toggle="tooltip"
                                                           onclick="editUser(${user.id})"
                                                        ><i class="mdi mdi-pencil"></i></a>
                                                        <c:if test="${user.status==1}">
                                                            <a class="btn btn-xs btn-default" href="#!" title="删除"
                                                               data-toggle="tooltip"
                                                               onclick="deleteUser(${user.id})"
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
                                                    <h4 class="modal-title" id="exampleModalLabel">修改用户</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <input type="hidden" id="id">
                                                        <div class="form-group">
                                                            <label for="nickname" class="control-label">昵称：</label>
                                                            <input type="text" class="form-control" id="nickname">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="tel1" class="control-label">tel：</label>
                                                            <input type="text" class="form-control" id="tel">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="address1" class="control-label">address：</label>
                                                            <input type="text" class="form-control" id="address">
                                                        </div>
                                                        <%--<div class="form-group">
                                                            <label &lt;%&ndash;for="address1" class="control-label"&ndash;%&gt;>地址</label>
                                                            &lt;%&ndash;                              <input type="text" class="form-control" id="address1">&ndash;%&gt;
                                                            <select id="province" onchange="switchProvince()">
                                                                <option value="0">--请选择--</option>
                                                            </select>
                                                            <select id="city" onchange="switchCity()">
                                                                <option value="0">--请选择--</option>
                                                            </select>
                                                            <select id="district">
                                                                <option value="0">--请选择--</option>
                                                            </select>
                                                        </div>--%>
                                                        <%--<div class="form-group">
                                                          <label for="sex1" class="control-label">sex：</label>
                                                          <input type="text" class="form-control" id="sex1">
                                                        </div>--%>
                                                        <label>性别</label>
                                                        <div class="clearfix">
                                                            <label class="lyear-radio radio-inline radio-primary">
                                                                <input type="radio" name="sex" value="1" id="man1">
                                                                <span>男</span>
                                                            </label>
                                                            <label class="lyear-radio radio-inline radio-primary">
                                                                <input type="radio" name="sex" value="0" id="woman1">
                                                                <span>女</span>
                                                            </label>
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
                                                    <button type="button" class="btn btn-primary" onclick="saveUser()">
                                                        保存
                                                    </button>
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

    /**
     * 编辑的点击事件函数
     * @param id
     */
    function editUser(id) {

        $.ajax({
            url: "${ctx}/api/user/getUser",
            type: "get",
            dataType: "json",
            data: {
                id: id
            }, success(res) {
                if (res.code == 200) {
                    document.getElementById("nickname").value = res.data.nickName;
                    document.getElementById("tel1").value = res.data.tel;
                    document.getElementById("id").value=res.data.id;
                } else {
                    alert(res.msg)
                    //TODO 关闭模态框
                }
            }
        })
    }

    /**
     * 编辑用户的保存函数
     */
    function saveUser() {
        if (checkUser()) {
            let id = document.getElementById("id").value;
            let nickname = document.getElementById("nickname").value;
            let tel = document.getElementById("tel").value;
            let address = document.getElementById("address").value;
            let sex = document.querySelector('input[name="sex"]:checked').value;

            $.ajax({
                url: "${ctx}/api/user/edit",
                type: "post",
                dataType: "json",
                data: {
                    id: id,
                    nickname: nickname,
                    tel: tel,
                    address: address,
                    sex: sex
                }, success(res) {
                    if (res.code == 200) {
                        //成功
                        location.reload();
                    }
                }
            })
        } else {
            //错误提示
            alert("错误!!!")
        }

    }

    /**
     * 新增用户的函数
     */
    function saveUser1() {
        if (checkUser1()) {
            let sex = document.querySelector('input[name="sex"]:checked').value;
            let username = document.getElementById("username1").value;
            let password = document.getElementById("password1").value;
            let nickname = document.getElementById("nickname1").value;
            let tel = document.getElementById("tel1").value;
            let address = document.getElementById("address1").value;
            // let sex = document.getElementById("sex").value;
            $.ajax({
                url: "${ctx}/api/user/New",
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
                    }
                }
            })
        } else {
            //错误提示
            alert("错误!")
        }
    }

    /**
     * 新增用户的判断函数
     */
    function checkUser1() {
        let username = document.getElementById("username1");
        let password = document.getElementById("password1");
        if (username == null || username == "") {
            return false;
        }
        if (password == null || password == "") {
            return false;
        }
        return true;
    }

    /**
     * 编辑用户的判断函数
     */
    function checkUser() {
        let id = document.getElementById("id").value;
        if (id == null || id == "") {
            return false;
        }
        return true;
    }

    function userDeleteBtn(){
        let ids = document.getElementsByName("ids[]");
        let sz = "";
        for (let i = 0; i < ids.length; i++) {
            if (ids[i].checked) {
                sz += ids[i].value + ",";
            }
        }
        sz = sz.substring(0, sz.length - 1);
        // let id = $("input[type='checkbox']:checked").value;
        if (confirm("确认删除吗？")) {
            $.ajax({
                url: "${ctx}/api/user/userDeleteBtn",
                type: "post",
                dataType: "json",
                data: {
                    id: sz
                }, success(res) {
                    if (res.code == 200) {
                        location.reload();
                    } else {
                        alert(res.msg);
                    }
                }
            })
        }
    }

    function qiyong() {
        let ids = document.getElementsByName("ids[]");
        let sz = "";
        for (let i = 0; i < ids.length; i++) {
            if (ids[i].checked) {
                sz += ids[i].value + ",";
            }
        }
        sz = sz.substring(0, sz.length - 1);
        // let id = $("input[type='checkbox']:checked").value;
        if (confirm("确认启用吗？")) {
            $.ajax({
                url: "${ctx}/api/user/change",
                type: "post",
                dataType: "json",
                data: {
                    id: sz
                }, success(res) {
                    if (res.code == 200) {
                        location.reload();
                    } else {
                        alert(res.msg);
                    }
                }
            })
        }
    }

    function deleteUser(id) {
        if (confirm("确认删除吗？")) {
            $.ajax({
                url: "${ctx}/api/user/deleteUser",
                type: "post",
                dataType: "json",
                data: {
                    id: id
                }, success(res) {
                    if (res.code == 200) {
                        location.reload();
                    } else {
                        alert(res.msg);
                    }
                }
            })
        }
    }

    /*/!*省下拉框改变的时候 触发函数
      * 当省发生改变的时候 市要根据所选的省 去动态渲染（先清空 在渲染）
      *                   县区的下拉框要做清空处理
      * *!/
    function switchProvince() {
        //省下拉框对象
        let province = document.getElementById("province");
        let pid = province.value;
        // console.log("省id"+pid)
        //市下拉框对象
        let city = document.getElementById("city");
        //清除
        city.innerHTML = "<option value=\"0\">--请选择--</option>";
        //
        $.ajax({
            url: "getSysRegionByPid.do",
            type: "get",
            dataType: "json",
            data: {
                pid: pid
            },
            success(res) {
                if (res.code == 200) {
                    let list = res.data;
                    for (let address of list) {
                        let option = document.createElement("option");
                        option.value = address.regionId;
                        option.innerText = address.regionName;
                        city.appendChild(option);
                    }
                } else {
                    alert(res.msg)
                }
            }
        })
        //
        //区县下拉框对象
        let district = document.getElementById("district");
        //清除
        district.innerHTML = "<option value=\"0\">--请选择--</option>";
    }

    function switchCity() {
        //获取当前市下拉框里选中的值（value）
        let pid = document.getElementById("city").value;
        //获取区县的下拉框对象
        let district = document.getElementById("district");
        //做清空
        district.innerHTML = "<option value=\"0\">--请选择--</option>";
        $.ajax({
            url: "getSysRegionByPid.do",
            type: "get",
            dataType: "json",
            data: {
                pid: pid
            }, success(res) {
                if (res.code == 200) {

                    let list = res.data;
                    for (let address of list) {
                        //要进行渲染数据了，创建option标签，把创建好的 option 标签，放到曲线下拉框中
                        let option = document.createElement("option");
                        option.value = address.regionId;
                        option.innerText = address.regionName;
                        district.appendChild(option);
                    }
                } else {
                    alert(res.msg)
                }
            }
        })
    }*/
</script>
</body>
</html>
