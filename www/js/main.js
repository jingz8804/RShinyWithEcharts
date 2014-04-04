$(document).ready(function() {
  var myChart = echarts.init(document.getElementById('main'));
    
    Shiny.addCustomMessageHandler("testHandler", function(data){
      // alert(data);
      var temp = JSON.parse(data); // we must deserilize the JSON object into a javascript object
      // myChart.restore();
      // myChart.setSeries(temp["series"], true);
      myChart.setOption(temp, true);
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
