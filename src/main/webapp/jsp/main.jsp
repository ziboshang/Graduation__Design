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
            <li class="layui-nav-item"><a href="${ctx}/jobs/main">数据展示</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">职位信息</a></dd>
                    <dd><a href="">可视化</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item">
                    <a href="${ctx}/jobs/main?page=1">数据展示</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">数据可视化</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${ctx}/jsp/city.jsp">城市分布</a></dd>
                        <dd><a href="${ctx}/jsp/industry.jsp">行业分布</a></dd>
                        <dd><a href="${ctx}/jsp/edu.jsp">学历分布</a></dd>
                        <dd><a href="${ctx}/jsp/divide_result.jsp">类别分布</a></dd>
                        <dd><a href="${ctx}/jsp/wordcloud.jsp">关键词</a></dd>
                    </dl>
                </li>


            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div>
            <br>
            <form class="layui-form" action="${ctx}/jobs/query/title">
                <input type="hidden" name="nowpage" value="1">
                <div class="layui-form-item">
                    <label class="layui-form-label">职位搜索</label>
                    <input type="text" style="width:200px" name="title" required  lay-verify="required" placeholder="输入搜索关键词" autocomplete="off" class="layui-input">
                </div>
                <!--<input type="hidden" name="page" value="1">-->
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
        <table class="layui-table">
            <thead>
            <tr>
                <th>职位</th>
                <th>公司</th>
                <th>工资</th>
                <th>学历</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${jobs}" var="obj">
                <tr>

                    <td>${obj.jobname}</td>
                    <td>${obj.companyname}</td>
                    <td>${obj.education}</td>
                    <td>${obj.money}</td>
                    <td>
                        <a href="${ctx}/jobs/detail/${obj.id}">详细信息</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <label>当前第${nowpage}页</label>
        <a href="${ctx}/jobs/query/title?nowpage=${nowpage-1}&title=${title}">上一页</a>
        <a href="${ctx}/jobs/query/title?nowpage=${nowpage+1}&title=${title}">下一页</a>
        跳转到
        <input type="text" id="turnPage" style="width:30px" />页
        <input type="button" onclick="startTurn()" value="跳转" />

        <script>
            function startTurn(){
                var turnPage=document.getElementById("turnPage").value;
                var shref="${ctx}/jobs/query/title?nowpage="+turnPage+"&title=${title}";
                window.location=shref;
            }
        </script>


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




