<!DOCTYPE html>
<html>

<head>
<#include "../head_part.ftl" />
<#--<script src="/static/js/chart_part.js"></script>-->
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6">
            <div class="row" align="center">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-12">
                            <p class="map_title" style="font-size: 30px;position: relative;top:15px">古美路街道老人分布图</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                        <#include "map.ftl"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="position: relative;right: 5px;top:5px">
            <#--<#include "table.ftl"/>-->
            </div>
        </div>
        <div class="col-lg-6" style="position: relative;top:25px;right:10px">
            <div class="row">
                <div class="col-lg-6 box"  align="center">
                    <div class="zz"></div>
                    <div id="total_oldmanPie" class="tu_big"></div>
                </div>
                <div class="col-lg-6 box line">
                    <div class="zz"></div>
                    <div id="organ_sum_pie" class="tu_big"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 box">
                    <div class="zz"></div>
                    <div id="organ_jg_pie" class="tu"></div>
                </div>
                <div class="col-lg-4 box line">
                    <div class="zz"></div>
                    <div id="organ_sq_sub_pie" class="tu"></div>
                </div>
                <div class="col-lg-4 box" style="position: relative;left: 10px">
                    <div class="zz"></div>
                    <div id="organ_jj_pie" class="tu"></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var tu_w,tu_h,tu_big_w,tu_big_h;
        if(winWidth>=1700){
            //家里电脑的分辨率
            tu_w=winWidth/7;
            tu_h=winHeight/2.37;
            tu_big_w=winWidth/4.5;
            tu_big_h=winHeight/2;
        }else if(winWidth<1700 && winWidth>=1000){
            tu_w=winWidth/7;
            tu_h=winHeight/2.37;
            tu_big_w=winWidth/4.5;
            tu_big_h=winHeight/2;
        }else if(winWidth>1400 && winWidth<1700){
            tu_w=winWidth/7;
            tu_h=winHeight/2.37;
            tu_big_w=winWidth/4.5;
            tu_big_h=winHeight/2;

        }
        $(".tu").css('width',tu_w);
        $(".tu").css( 'height', tu_h);
        $(".tu_big").css('width',tu_big_w);
        $(".tu_big").css( 'height', tu_big_h);

        var organ_sq_sub_pie = echarts.init(document.getElementById('organ_sq_sub_pie'));
        var total_oldmanPie= echarts.init(document.getElementById('total_oldmanPie'));
        var organ_jg_pie = echarts.init(document.getElementById('organ_jg_pie'));
        var organ_jj_pie = echarts.init(document.getElementById('organ_jj_pie'));
        var organ_sum_pie = echarts.init(document.getElementById('organ_sum_pie'));
    </script>
</div>


</body>
<script src="/static/js/visual/mapData.js"></script>
<script>
    $.ajax({
        url: "/visual/data/getVisualDataApartOrgan",
        type: "get",
        success: function (result) {
            if (result.success == true) {

                dataR = result.data;

                title_text = "老人比例";
                legend_data = [{name: '老人', textStyle: {color: legend_color, fontSize: 12}}, {
                    name: '非老人',
                    textStyle: {color: legend_color, fontSize: 12}
                }];
                series = [
                    {
                        name: '',
                        type: 'pie',
                        radius: ['35%', '50%'],
                        avoidLabelOverlap: false,
                        label: {
                            normal: {
                                formatter: '{d}%\n({c})',
                                textStyle: {
                                    fontWeight: 'normal',
                                    fontSize: 12
                                }
                            }
                        },
                        data:  [{value:dataR.NumJieDaoPeople-dataR.NumOld, name:'非老人'},
                            {value:dataR.NumOld, name:'老人'}]
                    }
                ];
                var option_zb_pie = chartPie(title_text, legend_data, series);
                total_oldmanPie.setOption(option_zb_pie);
                total_oldmanPie.on('legendselectchanged', function (params) {
                    var name = params.name;
                    if(name=="老人"){
                        ageStart=60;
                        ageEnd=120;

                    }else if(name=="非老人"){
                        ageStart=0;
                        ageEnd=59;

                    }
                    getJwData();
                });


                title.text = "机构养老";
                title.textStyle.fontSize=18;
                title.textStyle.fontWeight= 'normal';
                title.link = "javascript: location.href='/visual/now/part/organOldman'";
                legend_data=[{name:'上海闵行区\n平阳敬老院',textStyle:{color:legend_color,fontSize:8}},{name:'上海闵行区\n古美敬老院',textStyle:{color:legend_color,fontSize:8}},{name:'上海闵行区\n莲花敬老院',textStyle:{color:legend_color,fontSize:8}}];

                var data=[
                    {value:dataR.NumPingYangJLLive, name:'上海闵行区\n平阳敬老院'},
                    {value:dataR.NumGuMeiJLLive, name:'上海闵行区\n古美敬老院'},
                    {value:dataR.NumLianHuaJLLive, name:'上海闵行区\n莲花敬老院'}
                ];

                //
                var option_jg_pie = {
                    title : title,
                    tooltip : {
                        trigger: 'item',
                        formatter: ""
                    },

                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },

                    visualMap: {
                        show: false,
                        min: 80,
                        max: 600,
                        inRange: {
                            colorLightness: [0, 1]
                        }
                    },
                    legend: {
                        // left:'0',
                        // top:'6%',
                        orient: 'vertical',
                        // right: '0',
                        top:"20",
                        data:legend_data,
                        itemGap:0,
                        y: 'center',    //延Y轴居中
                        x: 'right' //居右显示
                    },
                    series : [
                        {
                            name:'',
                            type:'pie',
                            radius : '55%',
                            center: ['50%', '70%'],
                            data:data.sort(function (a, b) { return a.value - b.value; }),
                            roseType: 'radius',
                            label: {
                                normal: {
                                    textStyle: {
                                        fontWeight: 'normal',      //标题颜色
                                        color: '#FFFFFF',
                                        fontSize: 8
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    lineStyle: {
                                        color: 'rgba(255, 255, 255, 0.3)'
                                    },
                                    smooth: 0.1,
                                    length: 1,
                                    length2: 1
                                }
                            },
                            itemStyle: {
                                normal: {
                                    color: series_color_5,
                                    shadowBlur: 200,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            },

                            animationType: 'scale',
                            animationEasing: 'elasticOut',
                            animationDelay: function (idx) {
                                return Math.random() * 200;
                            }
                        }
                    ]
                };
                //
                //var option_jg_pie = customizedPieClick(title, data);
                organ_jg_pie.setOption(option_jg_pie);
                organ_jg_pie.on('legendselectchanged', function (params) {
                    var name = params.name;
                    if(name=="上海闵行区莲花敬老院"){
                        organIdArray.push(79);

                    }else if(name=="上海闵行区平阳敬老院"){
                        organIdArray.push(114);

                    }else if(name=="上海闵行区古美敬老院"){
                        organIdArray.push(115);

                    }
                    getJwData();
                });


                title_text = "社区养老";
                data=[
                    {value:dataR.NumZhiHuiZZLive, name:'长者照护之家'},
                    {value:0, name:'日照中心'},
                    {value:0, name:'助餐点'},
                ];

                //
                legend_data=[{name:'长者照护之家',textStyle:{color:legend_color,fontSize:8}},{name:'日照中心',textStyle:{color:legend_color,fontSize:8}},{name:'助餐点',textStyle:{color:legend_color,fontSize:8}}];

                var option_sq_sub_pie = {

                    title : {
                        text:title_text,
                        textStyle:{
                            color:title_color,
                            fontSize:18,
                            fontWeight:'normal'
                        },
                        x:'0%',
                        y:'0%'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: ""
                    },
                    legend: {
                        // left:'0',
                        // top:'6%',
                        orient: 'vertical',
                        // right: '0',
                        top:"20",
                        data:legend_data,
                        y: 'center',    //延Y轴居中
                        x: 'right' //居右显示
                    },

                    visualMap: {
                        show: false,
                        min: 80,
                        max: 600,
                        inRange: {
                            colorLightness: [0, 1]
                        }
                    },
                    series : [
                        {
                            name:'',
                            type:'pie',
                            radius : '55%',
                            center: ['50%', '70%'],
                            // data:[
                            //     {value:335, name:dataName1},
                            //     {value:310, name:dataName2},
                            //     {value:400, name:dataName3},
                            // ].sort(function (a, b) { return a.value - b.value; }),
                            data:data,
                            roseType: 'radius',
                            label: {
                                normal: {
                                    textStyle: {
                                        fontWeight: 'normal',      //标题颜色
                                        color: '#FFFF',
                                        fontSize: 8
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    lineStyle: {
                                        color: 'rgba(255, 255, 255, 0.3)'
                                    },
                                    smooth: 0.2,
                                    length: 3,
                                    length2: 3
                                }
                            },
                            itemStyle: {
                                normal: {
                                    color: series_color_4,
                                    shadowBlur: 200,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            },

                            animationType: 'scale',
                            animationEasing: 'elasticOut',
                            animationDelay: function (idx) {
                                return Math.random() * 200;
                            }
                        }
                    ]
                };
                //
                //var option_sq_sub_pie = customizedPie2(title_text, data);
                organ_sq_sub_pie.setOption(option_sq_sub_pie);


                organ_sq_sub_pie.on('legendselectchanged', function (params) {
                    var name = params.name;
                    if (name == "助餐点") {
                        location.href = '/visual/now/part/zcdOldman';
                    } else if (name == "日照中心") {
                        location.href = '/visual/now/part/rzzxOldman';
                    } else if (name == "长者照护之家") {
                        location.href = '/visual/now/part/zzzhOldman';
                    }
                });
                //re

                title_text = "居家养老";
                data=[
                    {value:dataR.NumFuWu, name:'家庭养老'},
                    {value:dataR.NumChangHu, name:'长护险'},
                    {value:dataR.NumZhiNeng, name:'智能化应用'},
                    {value:dataR.NumYiSheng, name:'家庭医生'},
                    {value:dataR.NumBingChuang, name:'家庭病床'}
                ];
                legend_data=[{name:'家庭养老',textStyle:{color:legend_color,fontSize:8}},{name:'长护险',textStyle:{color:legend_color,fontSize:8}},{name:'智能化应用',textStyle:{color:legend_color,fontSize:8}},{name:'家庭医生',textStyle:{color:legend_color,fontSize:8}},{name:'家庭病床',textStyle:{color:legend_color,fontSize:8}}];


                //
                var option_jj_pie = {

                    title : {
                        text:title_text,
                        textStyle:{
                            color:title_color,
                            fontSize:18,
                            fontWeight:'normal'
                        },
                        x:'0%',
                        y:'0%'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: ""
                    },
                    legend: {
                        orient: 'vertical',
                        // right: '0',
                        top:"20",
                        data:legend_data,
                        y: 'center',    //延Y轴居中
                        x: 'right' //居右显示
                    },

                    visualMap: {
                        show: false,
                        min: 80,
                        max: 600,
                        inRange: {
                            colorLightness: [0, 1]
                        }
                    },
                    series : [
                        {
                            name:'',
                            type:'pie',
                            radius : '55%',
                            center: ['50%', '70%'],
                            data:data,
                            roseType: 'radius',
                            label: {
                                normal: {
                                    textStyle: {
                                        fontWeight: 'normal',      //标题颜色
                                        color: '#FFFF',
                                        fontSize: 8
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    lineStyle: {
                                        color: 'rgba(255, 255, 255, 0.3)'
                                    },
                                    smooth: 0.2,
                                    length: 3,
                                    length2: 3
                                }
                            },
                            itemStyle: {
                                normal: {
                                    color: series_color_1,
                                    shadowBlur: 200,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            },

                            animationType: 'scale',
                            animationEasing: 'elasticOut',
                            animationDelay: function (idx) {
                                return Math.random() * 200;
                            }
                        }
                    ]
                };
                //
                //var option_jj_pie = customizedPie(title_text, data);
                organ_jj_pie.setOption(option_jj_pie);
                organ_jj_pie.on('legendselectchanged', function (params) {
                    var name = params.name;
                    if (name == "家庭养老") {
                        location.href = '/visual/now/part/homeOldman';
                    } else if (name == "长护险") {
                        location.href = '/visual/now/part/chxOldman';
                    } else if (name == "智能化应用") {
                        location.href = '/visual/now/part/otherOldman';
                    } else if (name == "家庭医生") {
                        location.href = '/visual/now/part/otherOldman';
                    } else if (name == "家庭病床") {
                        location.href = '/visual/now/part/otherOldman';
                    }
                });

                title_text = "养老服务覆盖率";
                legend_data = [{
                    name: '机构养老',
                    textStyle: {color: legend_color, fontSize: 12}
                }, {name: '社区居家养老', textStyle: {color: legend_color, fontSize: 12}}
                    , {name: '社区养老', textStyle: {color: legend_color, fontSize: 12}}
                    , {name: '居家养老', textStyle: {color: legend_color, fontSize: 12}}
                    , {name: '其它', textStyle: {color: legend_color, fontSize: 12}}];
                series = [
                    {
                        name: '',
                        type: 'pie',
                        selectedMode: 'single',
                        radius: ['0%', '30%'],

                        label: {
                            normal: {
                                formatter: '{d}%\n',
                                position: 'inner',
                                fontSize: 10
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data:[

                            {value:dataR.NumOrganOld, name:'机构养老'},
                            {value:dataR.NumSqJjOld, name:'社区居家养老',selected:true},
                            {value:dataR.NumAll-dataR.NumSqJjOld-dataR.NumOrganOld, name:'其它'},
                        ]
                    },
                    {
                        name: '',
                        type: 'pie',
                        radius: ['40%', '55%'],
                        label: {
                            normal: {
                                fontSize: 20,
                                formatter: '{d}%\n({c})',
                                backgroundColor: '#eee',
                                borderColor: '#aaa',
                                borderWidth: 1,
                                borderRadius: 4,
                                rich: {
                                    a: {
                                        color: '#999',
                                        lineHeight: 22,
                                        align: 'center'
                                    },
                                    hr: {
                                        borderColor: '#aaa',
                                        width: '100%',
                                        borderWidth: 0.5,
                                        height: 0
                                    },
                                    b: {
                                        fontSize: 20,
                                        lineHeight: 33
                                    },
                                    per: {
                                        color: '#eee',
                                        backgroundColor: '#334455',
                                        padding: [2, 4],
                                        borderRadius: 2
                                    }
                                }
                            }
                        },
                        data:[
                            {value:dataR.NumCommunityOld+dataR.NumSqJjOldOnly, name:'社区养老'},
                            {value:dataR.NumFamilyOld, name:'居家养老'}
                        ]
                    }
                ];
                var option_sum_pie = chartPie(title_text, legend_data, series);
                organ_sum_pie.setOption(option_sum_pie);
                organ_sum_pie.on('legendselectchanged', function (params) {
                    var name = params.name;
                    if(name=="机构养老"){
                        oldStatus.push(1);

                    }else if(name=="社区养老"){
                        oldStatus.push(2);

                    }else if(name=="居家养老"){
                        oldStatus.push(3);

                    }else if(name=="社区居家养老"){
                        oldStatus.push(4);

                    }else if(name=="总人数"){
                        for(var i=0;i<=3;i++)
                            oldStatus.push(i);

                    }
                    getJwData();
                });
            }
        }
    });
</script>
</html>