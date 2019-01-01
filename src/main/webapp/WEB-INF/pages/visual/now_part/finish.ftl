<!DOCTYPE html>
<html>

<head>
<#include "../head.ftl" />
<script type="text/javascript" src="../../../static/js/echarts.js"></script>
</head>

<body>
<div class="container-fluid">
    <div class="row" align="center"  style="margin-top: 10px;font-size: 30px">
        <div class="col-lg-12">
            <p class="map_title" >完成情况</p>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6 box">
            <div class="zz"></div>
            <div id="finish_pq_bar" class="tu"></div>
        </div>
        <div class="col-lg-6 box" style="position: relative;left: 5px;margin-bottom: 5px">
            <div class="zz"></div>
            <div id="finish_jw_bar" class="tu"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 box">
            <div class="zz"></div>
            <div id="jw_all_bar" class="tu_big"></div>
        </div>
    </div>
    <script type="text/javascript">
        var tu_w,tu_h,tu_big_w,tu_big_h;
        if(winWidth>=1700){
            //家里电脑的分辨率
            tu_w=winWidth/2.2;
            tu_h=winHeight/2.7;
            tu_big_w=winWidth;
            tu_big_h=winHeight/2;
        }else if(winWidth<=1400 && winWidth>=1300){
            tu_w=winWidth/4.5;
            tu_h=winHeight/4.1;
            tu_big_w=winWidth/4.5;
            tu_big_h=winHeight/2.2;
        }else if(winWidth>1400 && winWidth<1700){
            tu_w=winWidth/2.2;
            tu_h=winHeight/2.7;
            tu_big_w=winWidth;
            tu_big_h=winHeight/2;

        }
        $(".tu").css('width',tu_w);
        $(".tu").css( 'height', tu_h);
        $(".tu_big").css('width',tu_big_w);
        $(".tu_big").css( 'height', tu_big_h);


        var finish_pq_bar=echarts.init(document.getElementById('finish_pq_bar'));
        var finish_jw_bar = echarts.init(document.getElementById('finish_jw_bar'));
        var jw_all_bar = echarts.init(document.getElementById('jw_all_bar'));
    </script>
</div>


</body>
<script>
    $.ajax({
        url: "/visual/data/getVisualDataApartFinish",
        type: "get",
        success: function (result) {
            if (result.success == true) {
                var dataR = result.data;
                option = {
                    title: {
                        text: '各片区完成度对比',
                        textStyle: {
                            fontWeight: 'normal',      //标题颜色
                            color: '#FFFFFF',
                            fontSize: 26
                        },
                        x: 'center',
                        textAlign: 'right'
                    },
                    angleAxis: {
                        type: 'category',
                        data: ['平阳', '东兰', '古龙', '平吉', '平南', '古美'],
                        z: 10,
                        //textSize:20,
                        axisLine: {
                            lineStyle: {
                                color: 'white',
                                fontSize: 80
                            }
                        },
                    },
                    radiusAxis: {},
                    polar: {},
                    series: [{
                        type: 'bar',
                        data: [(dataR.NumPingYangFinish/dataR.NumPingYangFinishAll*100).toFixed(2), (dataR.NumDongLanFinish/dataR.NumDongLanFinishAll*100).toFixed(2), (dataR.NumGuLongFinish/dataR.NumGuLongFinishAll*100).toFixed(2), (dataR.NumPingJiFinish/dataR.NumPingJiFinishAll*100).toFixed(2), (dataR.NumPingNanFinish/dataR.NumPingNanFinishAll*100).toFixed(2), (dataR.NumGuMeiFinish/dataR.NumGuMeiFinishAll*100).toFixed(2)],

                        // data: [dataR.NumPingYangFinish, dataR.NumDongLanFinish, dataR.NumGuLongFinish, dataR.NumPingJiFinish, dataR.NumPingNanFinish, dataR.NumGuMeiFinish],
                        coordinateSystem: 'polar',
                        name: '已完成',
                        fontSize: 40,
                        color: series_color_5,
                        stack: 'a'
                    }],
                    legend: {
                        show: true,
                        data: ['已完成'],
                        x: 'right',
                        textStyle: {
                            color: 'white',
                        },

                    }
                };
                //使用制定的配置项和数据显示图表
                var finish_pq_bar = echarts.init(document.getElementById('finish_pq_bar'));
                finish_pq_bar.setOption(option);

                title_text = '平阳片区居委完成度对比';
                legend_data = [];
                xAxis_data = ['平阳一村', '平阳二村', '平阳三村', '平阳四村', '平阳五村', '平阳六村'];
                series = [
                    {
                        name: '已安排',
                        type: 'bar',
                        label: {
                            normal: {
                                show: true,
                                position: 'top',
                                textStyle: {
                                    fontSize: 20
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [(dataR.NumPingYang1Finish/dataR.NumPingYang1FinishAll*100).toFixed(2), (dataR.NumPingYang2Finish/dataR.NumPingYang2FinishAll*100).toFixed(2), (dataR.NumPingYang3Finish/dataR.NumPingYang3FinishAll*100).toFixed(2), (dataR.NumPingYang4Finish/dataR.NumPingYang4FinishAll*100).toFixed(2), (dataR.NumPingYang5Finish/dataR.NumPingYang5FinishAll*100).toFixed(2), (dataR.NumPingYang6Finish/dataR.NumPingYang6FinishAll*100).toFixed(2)],
                        barWidth: 30,//柱图宽度
                    }
                ];
                var option_jw_bar = chartBarHei(title_text, legend_data, xAxis_data, series);
                finish_jw_bar.setOption(option_jw_bar);

                var organs=[{name: "平阳一村", finish: dataR.NumPingYang1WCD},
                    {name: "平阳二村", finish: dataR.NumPingYang2WCD},
                    {name: "平阳三村", finish: dataR.NumPingYang3WCD},
                    {name: "平阳四村", finish: dataR.NumPingYang4WCD},
                    {name: "平阳五村", finish: dataR.NumPingYang5WCD},
                    {name: "平阳六村", finish: dataR.NumPingYang6WCD},
                    {name: "平南一居", finish: dataR.NumPingNan1WCD},
                    {name: "平南二居", finish: dataR.NumPingNan2WCD},
                    {name: "平南三居", finish: dataR.NumPingNan3WCD},
                    {name: "华一新城", finish: dataR.NumHuaYiWCD},
                    {name: "华梅花苑", finish: dataR.NumHuaMeiWCD},
                    {name: "梅莲苑", finish: dataR.NumMeiLianWCD},
                    {name: "万源一居", finish: dataR.NumWanYuan1WCD},
                    {name: "万源二居", finish: dataR.NumWanYuan2WCD},
                    {name: "万源三居", finish: dataR.NumWanYuan3WCD},
                    {name: "万源四居", finish: dataR.NumWanYuan4WCD},
                    {name: "平吉一村", finish: dataR.NumPingJi1WCD},
                    {name: "平吉二村", finish: dataR.NumPingJi2WCD},
                    {name: "平吉一三村", finish: dataR.NumPingJi13WCD},
                    {name: "平吉四村", finish: dataR.NumPingJi4WCD},
                    {name: "平吉五村", finish: dataR.NumPingJi5WCD},
                    {name: "平吉六村", finish: dataR.NumPingJi6WCD},
                    {name: "古美一村", finish: dataR.NumGuMei1WCD},
                    {name: "古美三村", finish: dataR.NumGuMei3WCD},
                    {name: "古美四村", finish: dataR.NumGuMei4WCD},
                    {name: "古美七村", finish: dataR.NumGuMei7WCD},
                    {name: "古美一八村", finish: dataR.NumGuMei18WCD},
                    {name: "古美九村", finish: dataR.NumGuMei9WCD},
                    {name: "古美十村", finish: dataR.NumGuMei10WCD},
                    {name: "东兰一居", finish: dataR.NumDongLan1WCD},
                    {name: "东兰二居", finish: dataR.NumDongLan2WCD},
                    {name: "东兰三居", finish: dataR.NumDongLan3WCD},
                    {name: "东兰四居", finish: dataR.NumDongLan4WCD},
                    {name: "古龙一村", finish: dataR.NumGuLong1WCD},
                    {name: "古龙二村", finish: dataR.NumGuLong2WCD},
                    {name: "古龙三村", finish: dataR.NumGuLong3WCD},
                    {name: "古龙四村", finish: dataR.NumGuLong4WCD},
                    {name: "古龙五村", finish: dataR.NumGuLong5WCD},
                    {name: "古龙六村", finish: dataR.NumGuLong6WCD}
                ];
                var compare = function (obj1, obj2) {
                    var val1 = obj1.finish;
                    var val2 = obj2.finish;
                    if (val1 < val2) {
                        return 1;
                    } else if (val1 > val2) {
                        return -1;
                    } else {
                        return 0;
                    }
                }
                organs.sort(compare);
                //alert(organs[0].finish+"  "+organs[1].finish+"  "+organs[2].finish);
                //fill finish realdata
                for(var i=0;i<organs.length;i++)
                {
                    if(organs[i].finish==null)
                        organs[i].finish=0;
                }
                var colors = ['#5793f3', '#d14a61', '#675bba'];
                option = {
                    title: {
                        text: '街道三十九个居委会完成度对比',
                        textStyle:{
                            color:'#fff',
                            fontSize:26,
                            fontWeight:'normal'
                        },
                        x:'0%',
                        y:'-3%'

                    },
                    color: colors,

                    tooltip: {
                        trigger: 'none',
                        axisPointer: {
                            type: 'cross'
                        }
                    },
                    legend: {
                        data:[{name:'本月',textStyle:{color:colors[0],fontSize:18}},{name:'上月',textStyle:{color:'#FFC125',fontSize:18}}],
                        x:'80%',
                        y:'-3%'

                    },
                    grid: {
                        top: 120,
                        bottom: 50
                    },
                    xAxis: [
                        {
                            type: 'category',
                            axisTick: {
                                alignWithLabel: true
                            },
                            axisLine: {
                                onZero: false,
                                lineStyle: {
                                    color: '#FFC125'
                                }
                            },
                            axisPointer: {
                                label: {
                                    formatter: function (params) {
                                        return '' + params.value
                                                + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
                                    }
                                }
                            },
                            axisLabel: {
                                interval:0,
                                rotate:60
                            },
                            data:[organs[0].name,organs[1].name,organs[2].name,organs[3].name,organs[4].name,organs[5].name,organs[6].name,organs[7].name,
                                organs[8].name,organs[9].name,organs[10].name,organs[11].name,organs[12].name,organs[13].name,organs[14].name,organs[15].name,
                                organs[16].name,organs[17].name,organs[18].name,organs[19].name,organs[20].name,organs[21].name,organs[22].name,organs[23].name,
                                organs[24].name,organs[25].name,organs[26].name,organs[27].name,organs[28].name,organs[29].name,organs[30].name,organs[31].name,organs[32].name,
                                organs[33].name,organs[34].name,organs[35].name,organs[36].name,organs[37].name,organs[38].name]                        },
                        {
                            type: 'category',
                            axisTick: {
                                alignWithLabel: true
                            },
                            axisLine: {
                                onZero: false,
                                lineStyle: {
                                    color: colors[0]
                                }
                            },
                            axisPointer: {
                                label: {
                                    formatter: function (params) {
                                        return '' + params.value
                                                + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
                                    }
                                }
                            },
                            axisLabel: {
                                interval:0,
                                rotate:60
                            },
                            data:['平阳一村','平阳二村','平阳三村','平阳四村','平阳五村','平阳六村','平南一居','平南二居','平南三居','华一新城','华梅花苑','梅莲苑','万源一居','万源二居','万源三居','万源四居','平吉一村','平吉二村','平吉一三村','平吉四村','平吉五村','平吉六村','古美一村','古美三村','古美四村','古美七村','古美一八村','古美九村','古美十村','东兰一居','东兰二居','东兰三居','东兰四居','古龙一村','古龙二村','古龙三村','古龙四村','古龙五村','古龙六村'],

                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            axisLabel:{
                                textStyle: {
                                    color: '#fff',
                                    fontSize:14,
                                    fontWeight:100
                                }
                            },
                            max:100
                        }
                    ],
                    series: [
                        {
                            name:'本月',
                            type:'line',
                            xAxisIndex: 1,
                            smooth: true,
                            data:[organs[0].finish,organs[1].finish,organs[2].finish,organs[3].finish,organs[4].finish,organs[5].finish,organs[6].finish,organs[7].finish,
                                organs[8].finish,organs[9].finish,organs[10].finish,organs[11].finish,organs[12].finish,organs[13].finish,organs[14].finish,organs[15].finish,
                                organs[16].finish,organs[17].finish,organs[18].finish,organs[19].finish,organs[20].finish,organs[21].finish,organs[22].finish,organs[23].finish,
                                organs[24].finish,organs[25].finish,organs[26].finish,organs[27].finish,organs[28].finish,organs[29].finish,organs[30].finish,organs[31].finish,organs[32].finish,
                                organs[33].finish,organs[34].finish,organs[35].finish,organs[36].finish,organs[37].finish,organs[38].finish]
                        },
                        {
                            name:'上月',
                            type:'line',
                            smooth: true,
                            data: [82,32,57,73,14,27,88,11,88,5,67,23,11,2,54,23,34,12,6,32,12,77,45,14,78,21,57,16,93,23,63,31,11,6,23,72,23,12],
                            itemStyle : {
                                normal : {
                                    lineStyle:{
                                        color:'#FFC125'
                                    }
                                }
                            },
                        }
                    ]
                };
                jw_all_bar.setOption(option);

                finish_pq_bar.on('click', function (param) {
                    var name = param.name;
                    //alert(param.name);
                    var title_text= name+'片区居委完成度对比';
                    var legend_data=[];
                    var series;
                    if(name =='平阳'){
                        title_text='平阳片区居委完成度对比';
                        xAxis_data=['平阳一村','平阳二村','平阳三村','平阳四村','平阳五村','平阳六村'];
                        series=[
                            {
                                name: '已安排',
                                type: 'bar',
                                label:{
                                    normal:{
                                        show:true,
                                        position:'top',
                                        textStyle:{
                                            fontSize:20
                                        }
                                    }
                                },
                                itemStyle:{
                                    normal: {
                                        color:series_color_1
                                    }
                                },
                                data: [(dataR.NumPingYang1Finish/dataR.NumPingYang1FinishAll*100).toFixed(2), (dataR.NumPingYang2Finish/dataR.NumPingYang2FinishAll*100).toFixed(2), (dataR.NumPingYang3Finish/dataR.NumPingYang3FinishAll*100).toFixed(2), (dataR.NumPingYang4Finish/dataR.NumPingYang4FinishAll*100).toFixed(2), (dataR.NumPingYang5Finish/dataR.NumPingYang5FinishAll*100).toFixed(2), (dataR.NumPingYang6Finish/dataR.NumPingYang6FinishAll*100).toFixed(2)],
                                barWidth : 30,//柱图宽度
                            }
                        ];


                    }else if(name =='古美'){
                        title_text='古美片区居委完成度对比';
                        xAxis_data=['古美一村','古美三村','古美四村','古美七村','古美一八村','古美九村','古美十村'];
                        series=[
                            {
                                name: '已安排',
                                type: 'bar',
                                label:{
                                    normal:{
                                        show:true,
                                        position:'top',
                                        textStyle:{
                                            fontSize:20
                                        }
                                    }
                                },
                                itemStyle:{
                                    normal: {
                                        color:series_color_1
                                    }
                                },
                                data: [(dataR.NumGuMei1Finish/dataR.NumGuMei1FinishAll*100).toFixed(2), (dataR.NumGuMei3Finish/dataR.NumGuMei3FinishAll*100).toFixed(2), (dataR.NumGuMei4Finish/dataR.NumGuMei4FinishAll*100).toFixed(2), (dataR.NumGuMei7Finish/dataR.NumGuMei7FinishAll*100).toFixed(2), (dataR.NumGuMei18Finish/dataR.NumGuMei18FinishAll*100).toFixed(2), (dataR.NumGuMei9Finish/dataR.NumGuMei9FinishAll*100).toFixed(2), (dataR.NumGuMei10Finish/dataR.NumGuMei10FinishAll*100).toFixed(2)],
                                barWidth : 30,//柱图宽度
                            }
                        ];

                    }else if(name =='古龙'){
                        title_text='古龙片区居委完成度对比';
                        xAxis_data=['古龙一村','古龙二村','古龙三村','古龙四村','古龙五村','古龙六村'];
                        series=[
                            {
                                name: '已安排',
                                type: 'bar',
                                label:{
                                    normal:{
                                        show:true,
                                        position:'top',
                                        textStyle:{
                                            fontSize:20
                                        }
                                    }
                                },
                                itemStyle:{
                                    normal: {
                                        color:series_color_1
                                    }
                                },
                                data: [(dataR.NumGuLong1Finish/dataR.NumGuLong1FinishAll*100).toFixed(2), (dataR.NumGuLong2Finish/dataR.NumGuLong2FinishAll*100).toFixed(2), (dataR.NumGuLong3Finish/dataR.NumGuLong3FinishAll*100).toFixed(2), (dataR.NumGuLong4Finish/dataR.NumGuLong4FinishAll*100).toFixed(2), (dataR.NumGuLong5Finish/dataR.NumGuLong5FinishAll*100).toFixed(2), (dataR.NumGuLong6Finish/dataR.NumGuLong6FinishAll*100).toFixed(2)],
                                barWidth : 30,//柱图宽度
                            }
                        ];

                    }else if(name =='平吉'){
                        title_text='平吉片区居委完成度对比';
                        xAxis_data=['平吉一村','平吉二村','平吉一三村','平吉四村','平吉五村','平吉六村'];
                        series=[
                            {
                                name: '已安排',
                                type: 'bar',
                                label:{
                                    normal:{
                                        show:true,
                                        position:'top',
                                        textStyle:{
                                            fontSize:20
                                        }
                                    }
                                },
                                itemStyle:{
                                    normal: {
                                        color:series_color_1
                                    }
                                },
                                data: [(dataR.NumPingJi1Finish/dataR.NumPingJi1FinishAll*100).toFixed(2), (dataR.NumPingJi2Finish/dataR.NumPingJi2FinishAll*100).toFixed(2), (dataR.NumPingJi3Finish/dataR.NumPingJi3FinishAll*100).toFixed(2), (dataR.NumPingJi4Finish/dataR.NumPingJi4FinishAll*100).toFixed(2), (dataR.NumPingJi5Finish/dataR.NumPingJi5FinishAll*100).toFixed(2), (dataR.NumPingJi6Finish/dataR.NumPingJi6FinishAll*100).toFixed(2)],
                                barWidth : 30,//柱图宽度
                            }
                        ];

                    }else if(name =='东兰'){
                        title_text='东兰片区居委完成度对比';
                        xAxis_data=['东兰一居','东兰二居','东兰三居','东兰四居'];
                        series=[
                            {
                                name: '已安排',
                                type: 'bar',
                                label:{
                                    normal:{
                                        show:true,
                                        position:'top',
                                        textStyle:{
                                            fontSize:20
                                        }
                                    }
                                },
                                itemStyle:{
                                    normal: {
                                        color:series_color_1
                                    }
                                },
                                data: [(dataR.NumDongLan1Finish/dataR.NumDongLan1FinishAll*100).toFixed(2), (dataR.NumDongLan2Finish/dataR.NumDongLan2FinishAll*100).toFixed(2), (dataR.NumDongLan3Finish/dataR.NumDongLan3FinishAll*100).toFixed(2), (dataR.NumDongLan4Finish/dataR.NumDongLan4FinishAll*100).toFixed(2)],
                                barWidth : 30,//柱图宽度
                            }
                        ];

                    }else if(name =='平南'){
                        title_text='平南片区居委完成度对比';
                        xAxis_data=['平南一居','平南二居','平南三居','华一新城','华梅花苑','梅莲苑','万源一居','万源二居','万源三居','万源四居'];
                        series=[
                            {
                                name: '已安排',
                                type: 'bar',
                                label:{
                                    normal:{
                                        show:true,
                                        position:'top',
                                        textStyle:{
                                            fontSize:20
                                        }
                                    }
                                },
                                itemStyle:{
                                    normal: {
                                        color:series_color_1
                                    }
                                },
                                data: [(dataR.NumPingNan1Finish/dataR.NumPingNan1FinishAll*100).toFixed(2), (dataR.NumPingNan2Finish/dataR.NumPingNan2FinishAll*100).toFixed(2), (dataR.NumPingNan3Finish/dataR.NumPingNan3FinishAll*100).toFixed(2), (dataR.NumHuaYiFinish/dataR.NumHuaYiFinishAll*100).toFixed(2), (dataR.NumHuaMeiFinish/dataR.NumHuaMeiFinishAll*100).toFixed(2), (dataR.NumMeiLianFinish/dataR.NumMeiLianFinishAll*100).toFixed(2), (dataR.NumWanYuan1Finish/dataR.NumWanYuan1FinishAll*100).toFixed(2), (dataR.NumWanYuan2Finish/dataR.NumWanYuan2FinishAll*100).toFixed(2), (dataR.NumWanYuan3Finish/dataR.NumWanYuan3FinishAll*100).toFixed(2), (dataR.NumWanYuan4Finish/dataR.NumWanYuan4FinishAll*100).toFixed(2)],
                                barWidth : 30,//柱图宽度
                            }
                        ];

                    }
                    var finish_option_jw_bar=chartBarHei(title_text,legend_data,xAxis_data,series);
                    finish_jw_bar.setOption(finish_option_jw_bar);
                });
            }
        }
    });



</script>
</html>