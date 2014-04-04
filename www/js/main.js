$(document).ready(function() {
  var myChart = echarts.init(document.getElementById('main'));
    myChart.setOption({
        title : {
            text: '某站点用户访问来源',
            subtext: '纯属虚构',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient : 'vertical',
            x : 'left',
            data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
        },
        toolbox: {
            show : true,
            feature : {
                mark : {
                    show: true,
                    title : {
                        mark : 'Auxiliry Line Switch',
                        markUndo : 'Remove Auxiliry Line',
                        markClear : 'Clear All Auxiliry Lines',
                    }
                },
                dataView : {show: true, readOnly: false},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series : [
            {
                name:'访问来源',
                type:'pie',
                radius : '55%',
                center: ['50%', 225],
                data:[
                    {value:335, name:'直接访问'},
                    {value:310, name:'邮件营销'},
                    {value:234, name:'联盟广告'},
                    {value:135, name:'视频广告'},
                    {value:1548, name:'搜索引擎'}
                ]
            }
        ]
    });
    
    Shiny.addCustomMessageHandler("testHandler", function(data){
      alert(data);
      var temp = JSON.parse(data); // we must deserilize the JSON object into a javascript object
      myChart.restore();
      myChart.setSeries(temp["series"], true);
      // myChart.setOption(temp, true);
    })
    
    // --- 地图 ---
    var myChart2 = echarts.init(document.getElementById('mainMap'));
    myChart2.setOption({
        tooltip : {
            trigger: 'item',
            formatter: '{b}'
        },
        series : [
            {
                name: '中国',
                type: 'map',
                mapType: 'china',
                selectedMode : 'multiple',
                itemStyle:{
                    normal:{label:{show:true}},
                    emphasis:{label:{show:true}}
                },
                data:[
                    {name:'广东',selected:true}
                ]
            }
        ]
    }); 
});
