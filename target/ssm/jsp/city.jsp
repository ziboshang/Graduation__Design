<%--
  Created by IntelliJ IDEA.
  User: louis
  Date: 2019/4/29
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>数据可视化</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui-v2.4.5/layui/css/layui.css">
    <script src="${ctx}/static/plugins/echarts/echarts.min.js"></script>
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

        <div id="main" style="margin:0 auto;border:1px solid #000;width:600px;height:400px" ></div>
        <button id="b1"  style="width: 100px;margin-top:20px;height: 50px">分析</button>

        <script src="${ctx}/static/plugins/jquery/jquery-3.4.0.min.js"></script>
        <script type="text/javascript">
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('main'));
            // 指定图表的配置项和数据
            option = {
                title : {
                    text: '招聘职位城市分布',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: []
                },
                series : [
                    {
                        name: '访问来源',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:[],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);

            $(function () {
                $('#b1').click(function(){
                    $.ajax({
                        url:"${ctx}/jobs/area",
                        type:"post",
                        success:function(result)
                        {
                            var names=[];
                            var city_and_num=[];
                            myChart.showLoading();
                            for(var k in result)
                            {
                                names.push(k);
                                var row2 = {value:result[k],name:k};
                                city_and_num.push(row2);
                            }
                            myChart.setOption({        //加载数据图表
                                legend:[{
                                    data:names
                                }],
                                series: [{
                                    data: city_and_num
                                }]
                            });
                            myChart.hideLoading();
                        },
                        error:function() {
                            alert("error");
                        }
                    })
                })
            })
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







