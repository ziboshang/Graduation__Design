<%--
  Created by IntelliJ IDEA.
  User: louis
  Date: 2019/4/29
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>人才招聘数据分析系统</title>
        <link rel="stylesheet" href="${ctx}/static/plugins/layui-v2.4.5/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
        <div class="layui-header">
                <div class="layui-logo">人才招聘数据分析系统</div>
                <!-- 头部区域（可配合layui已有的水平导航） -->
                <ul class="layui-nav layui-layout-left">
                        <li class="layui-nav-item"><a href="">数据展示</a></li>
                </ul>
                <ul class="layui-nav layui-layout-right">
                        <li class="layui-nav-item">
                                <a href="javascript:;">
                                        <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                                        贤心
                                </a>
                                <dl class="layui-nav-child">
                                        <dd><a href="">基本资料</a></dd>
                                        <dd><a href="">安全设置</a></dd>
                                </dl>
                        </li>
                        <li class="layui-nav-item"><a href="">退了</a></li>
                </ul>
        </div>

        <div class="layui-side layui-bg-black">
                <div class="layui-side-scroll">
                        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                                <li class="layui-nav-item layui-nav-itemed">
                                        <a class="" href="javascript:;">所有商品</a>

                                </li>
                                <li class="layui-nav-item">
                                        <a href="javascript:;">解决方案</a>
                                        <dl class="layui-nav-child">
                                                <dd><a href="javascript:;">列表一</a></dd>
                                                <dd><a href="javascript:;">列表二</a></dd>
                                                <dd><a href="">超链接</a></dd>
                                        </dl>
                                </li>
                                <li class="layui-nav-item"><a href="">云市场</a></li>
                                <li class="layui-nav-item"><a href="">发布商品</a></li>
                        </ul>
                </div>
        </div>

        <div class="layui-body">
                <!-- 内容主体区域 -->
                <table class="layui-table">
                        <tr>
                                <th><b>当前职位全部信息</b></th>
                        </tr>
                        <tr>
                                <th>
                                        职位名称:${job.jobname}<br>
                                        公司名称:${job.companyname}<br>
                                        所属行业:${job.industry}<br>
                                        所需学历:${job.education}<br>
                                        工资:${job.money}<br>
                                        职责:${job.rule}<br>
                                        任职资格:${job.need}<br>
                                        语言:${job.language}<br>
                                        年龄要求:${job.age}<br>
                                        工作经验要求:${job.exp}<br>
                                        <input type="button" name="Submit" onclick="javascript:history.back(-1);" value="返回上一页">
                                </th>
                                </tr>
                </table>




        </div>

</div>
<script src="${ctx}/static/plugins/layui-v2.4.5/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>







