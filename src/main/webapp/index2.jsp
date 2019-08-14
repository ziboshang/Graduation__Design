<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="static/plugins/echarts/echarts.min.js"></script>
</head>

<body>
<div id="main" style="width:600px;height:400px;"></div>
<script src="${ctx}/static/plugins/jquery/jquery-3.4.0.min.js"></script>
<script type="text/javascript">
    // 关于城市分布的变量
    var myChart = echarts.init(document.getElementById('main'));
    // 关于城市分布饼状图的变量
    var option = {
        title: {
            text: 'ECharts 入门示例'
        },
        tooltip: {},
        legend: {
            data:['销量']
        },
        xAxis: {
            data: []
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: []
        }]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    var nums=[];
    var names=[];

    $(function () {
        $('#b1').click(function(){
            $.ajax({
                url:"${ctx}/table/t1",
                type:"post",
                success:function(result)
                {
                    myChart.showLoading();
                    for(var i=0;i<result.length;i++){
                        nums.push(result[i].number);    //挨个取出销量并填入销量数组
                        names.push(result[i].name);
                    }
                    myChart.setOption({        //加载数据图表
                        xAxis: {
                            data: names
                        },
                        series: [{
                            // 根据名字对应到相应的系列
                            data: nums
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

<button id="b1"  style="width: 100px;height: 50px">开始分析数据</button>
<script>

</script>

</body>
</html>
