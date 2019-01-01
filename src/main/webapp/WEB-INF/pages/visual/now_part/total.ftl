<!DOCTYPE html>
<html>

<head>
<#include "../head.ftl" />
    <script src="../../../static/js/echarts.js"></script>
    <link href="/static/css/visual/part/total.css" rel="stylesheet">
    <script type="text/javascript">
        window.onload=function(){
            setInterval(function(){
                var date=new Date();
                // alert(JSON.stringify(date));
                var year=date.getFullYear(); //获取当前年份
                var mon=date.getMonth(); //获取当前月份
                var da=date.getDate(); //获取当前日
                var d=document.getElementById('Date');
               // d.innerHTML=;
                },1000)
        }
    </script>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6">
            <div class="row" align="center">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-3">
                            <div id="Date" style="color:#ffffff;text-align: center;padding-top: 2%;"></div>
                        </div>
                        <div class="col-lg-8">
                            <p style="font-size: 30px;position: relative;top: 15px;right: 50px">古美路街道老人数量分布热力图</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                        <#include "map.ftl"/>
                        </div>
                    </div>
                    <div class="row" style="position: relative;right: 5px;top:5px">
                    <#--<#include "table.ftl"/>-->
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6" style="position: relative;top: 10px;right:10px">
            <div class="row">
                <div class="col-lg-6 box text" style="position: relative;bottom: 0px;">
                    <div class="zz"></div>
                    <div style="position: relative;top:60px">
                    <p style="text-align: center;font-size: 30px;">街道人口总数：</p>
                    <p style="text-align: center;font-size: 40px;line-height: 5px" class="number" id="pNumAll"></br>16万人</p>                    <#--<p style="text-align: center" id="pNum60"><span class="title">60岁及以上老人总数：</br></span><span class="number"  id="oldNum60"><font face="STFangsong" color="yellow" style="font-size: 40px">31666</font> </span><span class="title">人</span></p>-->
                    <p style="text-align: center;font-size: 30px;">60岁及以上老人总数：</p>
                    <p style="text-align: center;font-size: 40px;line-height: 5px" class="number" id="pNum60"></br>31666人</p>
                    <p style="text-align: center;font-size: 30px;">80岁及以上老人总数：</p>
                    <p style="text-align: center;font-size: 40px;line-height: 5px" class="number" id="pNum80"></br>3783</p>
                    </div>
                </div>
                <div class="col-lg-6" style="position: relative;left: 5px">
                    <div class="row">
                        <div class="col-lg-12  box" style="margin-bottom: 5px">
                            <div class="zz"></div>
                            <div id="total_oldmanPie" class="tu"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12  box">
                            <div class="zz"></div>
                            <div id="oldman_zbPie" class="tu"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px">
                <div class="col-lg-6 box">
                    <div class="zz"></div>
                    <div id="total_pqBar" class="tu_big"></div>
                </div>
                <div class="col-lg-6 box" style="position: relative;left: 5px">
                    <div class="zz"></div>
                    <div id="total_statusPie" class="tu_big"></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var tu_w,tu_h,tu_big_w,tu_big_h,text_h;
        if(winWidth>=1700){
            //家里电脑的分辨率
            tu_w=winWidth/4.5;
            tu_h=winHeight/5;
            tu_big_w=winWidth/4.5;
            tu_big_h=winHeight/2.2;
            text_h=winHeight/2.46;
        }else if(winWidth<=1650 && winWidth>=1300){
            // tu_w=winWidth/4.5;
            // tu_h=winHeight/4.1;
            // tu_big_w=winWidth/4.5;
            // tu_big_h=winHeight/2.2;
            // text_h=winHeight/2.02;
            tu_w=winWidth/4.5;
            tu_h=winHeight/4.1;
            tu_big_w=winWidth/4.5;
            tu_big_h=winHeight/2.2;
            text_h=winHeight/2.02;
        }else if(winWidth<1700 && winWidth>1400){
            tu_w=winWidth/4.5;
            tu_h=winHeight/4.3;
            tu_big_w=winWidth/4.5;
            tu_big_h=winHeight/2.2;
            text_h=winHeight/2.22;
        }

        $(".tu").css('width',tu_w);
        $(".tu").css( 'height', tu_h);
        $(".text").css( 'height', text_h);
        $(".tu_big").css('width',tu_big_w);
        $(".tu_big").css( 'height', tu_big_h);
        var total_pqBar= echarts.init(document.getElementById('total_pqBar'));
        var total_statusPie= echarts.init(document.getElementById('total_statusPie'));
        var total_oldmanPie=echarts.init(document.getElementById('total_oldmanPie'));
        var oldman_zbPie=echarts.init(document.getElementById('oldman_zbPie'));
    </script>
</div>
<#--<#include "../set.ftl" />-->

</body>
<script src="/static/js/visual/mapData.js"></script>
<script>

    // var posList = [
    //     'left', 'right', 'top', 'bottom',
    //     'inside',
    //     'insideTop', 'insideLeft', 'insideRight', 'insideBottom',
    //     'insideTopLeft', 'insideTopRight', 'insideBottomLeft', 'insideBottomRight'
    // ];
    //
    // pqBar.configParameters = {
    //     rotate: {
    //         min: -90,
    //         max: 90
    //     },
    //     align: {
    //         options: {
    //             left: 'left',
    //             center: 'center',
    //             right: 'right'
    //         }
    //     },
    //     verticalAlign: {
    //         options: {
    //             top: 'top',
    //             middle: 'middle',
    //             bottom: 'bottom'
    //         }
    //     },
    //     position: {
    //         options: echarts.util.reduce(posList, function (map, pos) {
    //             map[pos] = pos;
    //             return map;
    //         }, {})
    //     },
    //     distance: {
    //         min: 0,
    //         max: 100
    //     }
    // };
    //
    // pqBar.config = {
    //     rotate: 90,
    //     align: 'left',
    //     verticalAlign: 'middle',
    //     position: 'insideBottom',
    //     distance: 15,
    //     onChange: function () {
    //         var labelOption = {
    //             normal: {
    //                 rotate: pqBar.config.rotate,
    //                 align: pqBar.config.align,
    //                 verticalAlign: pqBar.config.verticalAlign,
    //                 position: pqBar.config.position,
    //                 distance: pqBar.config.distance
    //             }
    //         };
    //         pqBar.setOption({
    //             series: [{
    //                 label: labelOption
    //             }, {
    //                 label: labelOption
    //             }, {
    //                 label: labelOption
    //             }, {
    //                 label: labelOption
    //             }]
    //         });
    //     }
    // };
    //
    //
    // var labelOption = {
    //     normal: {
    //         show: true,
    //         position: pqBar.config.position,
    //         distance: pqBar.config.distance,
    //         align: pqBar.config.align,
    //         verticalAlign: pqBar.config.verticalAlign,
    //         rotate: pqBar.config.rotate,
    //         formatter: '{c}',
    //         fontSize: 16,
    //         rich: {
    //             name: {
    //                 textBorderColor: '#fff'
    //             }
    //         }
    //     }
    // };
    //
    // option = {
    //     //color: ['#003366', '#006699', '#4cabce', '#e5323e'],
    //     title: {
    //         text:'片区老年人口分布柱状',
    //         textStyle:{
    //             color:'#fff',
    //             fontSize:title_fontSize,
    //             fontWeight:100
    //         },
    //         x:'0%',
    //         y:'0%',
    //     },
    //     color: ['#ffd289'],
    //     tooltip: {
    //         trigger: 'axis',
    //         axisPointer: {
    //             type: 'shadow'
    //         }
    //     },
    //     legend: {
    //         data: ['']
    //     },
    //     toolbox: {
    //         show: true,
    //         orient: 'vertical',
    //         left: 'right',
    //         top: 'center',
    //         feature: {
    //             mark: {show: true},
    //             dataView: {show: true, readOnly: false},
    //             magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
    //             restore: {show: true},
    //             saveAsImage: {show: true}
    //         }
    //     },
    //     calculable: true,
    //     xAxis: [
    //         {
    //             type: 'category',
    //             axisTick: {show: false},
    //             data: ['东兰','古龙','平南','平阳','平吉','古美'],
    //             axisLine:{
    //                 lineStyle:{
    //                     color:'white',
    //                     fontSize: 20
    //                 }
    //             },
    //         }
    //     ],
    //     yAxis: [
    //         {
    //             type: 'value',
    //             axisLine:{
    //                 lineStyle:{
    //                     color:'white',
    //                     fontSize: 20
    //                 }
    //             },
    //         }
    //     ],
    //     series: [
    //         {
    //             type: 'bar',
    //             barGap: 0,
    //             label: labelOption,
    //             data: [320, 332, 301, 334, 390,440],
    //             barWidth: 20,//柱图宽度
    //             itemStyle: {
    //                 normal: {
    //                     barBorderRadius: 20,
    //                     color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
    //                         offset: 0,
    //                         color: '#99d9ea'
    //                     }, {
    //                         offset: 1,
    //                         color: 'rgba(0,188,226, 0.5)'
    //                     }]),
    //                     shadowColor: 'rgba(0, 0, 0, 0.4)',
    //                     shadowBlur: 20,
    //                 }
    //             }
    //
    //         },
    //
    //     ]
    // };
    // pqBar.setOption(option);
    //
    // //养老状态
    // title_text="养老状态分布饼图";
    // legend_data=[{name:'机构养老',textStyle:{color:legend_color,fontSize:legand_fontSize}},{name:'社区养老',textStyle:{color:legend_color,fontSize:legand_fontSize}},{name:'居家养老',textStyle:{color:legend_color,fontSize:legand_fontSize}}];
    // series=[{
    //     name: '',
    //     type: 'pie',
    //     radius : '45%',
    //     label : {
    //         normal : {
    //             formatter: '{d}%\n({c})',
    //             textStyle : {
    //                 fontWeight : 'normal',
    //                 fontSize : series_lebel_fontSize
    //             }
    //         }
    //     },
    //     center: ['48%', '60%'],
    //     data:[
    //         {value:476, name:'机构养老'},
    //         {value:376, name:'社区养老'},
    //         {value:276, name:'居家养老'}
    //     ],
    //     itemStyle: {
    //         emphasis: {
    //             shadowBlur: 10,
    //             shadowOffsetX: 0,
    //             shadowColor: 'rgba(0, 0, 0, 0.5)'
    //         }
    //     }
    // }];
    // var option_status_pie = chartPie(title_text,legend_data,series);
    //
    //
    // //60岁老人占比
    // title_text="老人\n\n比例";
    // legend_data=[{name:'老人',textStyle:{color:legend_color,fontSize:legand_fontSize}},{name:'非老人',textStyle:{color:legend_color,fontSize:legand_fontSize}}];
    // series=[
    //     {
    //         name:'',
    //         type:'pie',
    //         radius: ['50%', '70%'],
    //         avoidLabelOverlap: false,
    //         label: {
    //             normal : {
    //                 formatter: '{d}%\n({c})',
    //                 textStyle : {
    //                     fontWeight : 'normal',
    //                     fontSize : series_lebel_fontSize
    //                 }
    //             }
    //         },
    //         data:[
    //             {value:15360, name:'非老人'},
    //             {value:4310, name:'老人'}
    //         ]
    //     }
    // ];
    // var option_oldman_pie = chartPie(title_text,legend_data,series);
    //
    // //重点老人占比
    // title_text="80岁及\n\n以上\n\n老人比例";
    // legend_data=[{name:'80岁及以上',textStyle:{color:legend_color,fontSize:legand_fontSize}},{name:'80岁以下',textStyle:{color:legend_color,fontSize:legand_fontSize}}];
    // series=[
    //     {
    //         name:'',
    //         type:'pie',
    //         radius: ['50%', '70%'],
    //         avoidLabelOverlap: false,
    //         label: {
    //             normal : {
    //                 formatter: '{d}%\n({c})',
    //                 textStyle : {
    //                     fontWeight : 'normal',
    //                     fontSize : 15
    //                 }
    //             }
    //         },
    //         data:[
    //             {value:1360, name:'80岁以下'},
    //             {value:234, name:'80岁及以上'}
    //         ]
    //     }
    // ];
    // var option_zd_pie = chartPie(title_text,legend_data,series);
    //
    //
    // statusPie.setOption(option_status_pie);
    // oldmanPie.setOption(option_oldman_pie);
    // zdPie.setOption(option_zd_pie);

    //new
    var dataR;
    $.ajax({
        url: "/visual/data/getVisualDataApartTotal",
        type: "get",
        success: function (result) {
            if (result.success == true) {

                dataR = result.data;
                document.getElementById("pNumAll").innerHTML = dataR.NumJieDaoPeople;
                document.getElementById("pNum60").innerHTML = dataR.NumOld;
                document.getElementById("pNum80").innerHTML = dataR.NumOld80;
               // var temp={dd:123};
               // Object.assign(dataR,temp);
                pieOldNum = dataR.NumOld;
                pieAllNum = dataR.NumAll;
                pieOldNum80 = dataR.NumOld80;
                organOldNum = dataR.NumOrganOld;
                familyOldNum = dataR.NumFamilyOld;
                communityOldNum = dataR.NumCommunityOld;
                var dataOldStatus=[
                    {value:organOldNum, name:'机构养老'},
                    {value:communityOldNum, name:'社区养老'},
                    {value:familyOldNum, name:'居家养老'}
                ];

                //60岁老人占比
                title.text="老年人数占比";
                title.textStyle.fontWeight='normal';
                //title.link="javascript: change('child_oldman','child_base')";
                title.link = "javascript: location.href='/visual/now/part/base'";
                legend_data=[{name:'老人',textStyle:{color:legend_color,fontSize:legand_fontSize}},{name:'非老人',textStyle:{color:legend_color,fontSize:legand_fontSize}}];
                series=[
                    {
                        name:'',
                        type:'pie',
                        radius: ['30%', '40%'],
                        center : ['50%', '55%'],
                        avoidLabelOverlap: false,
                        label: {
                            normal : {
                                formatter: '{d}%\n({c})',
                                textStyle : {
                                    fontWeight : 'normal',
                                    fontSize : series_lebel_fontSize
                                }
                            }
                        },
                        data: [{value:dataR.NumJieDaoPeople-dataR.NumOld, name:'非老人'},
                            {value:dataR.NumOld, name:'老人'}]
                    }
                ];
                var total_option_oldman_pie = chartPieClick(title,legend_data,series);
                total_oldmanPie.setOption(total_option_oldman_pie);
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

                title.text="80岁及以上老人占比";
                title.link="javascript: change('child_oldman','child_base')";
                title.textStyle.fontWeight='normal';
                legend_data=[{name:'>=80岁',textStyle:{color:legend_color,fontSize:10}},{name:'60-80岁',textStyle:{color:legend_color,fontSize:10}}];
                series=[
                    {
                        name:'',
                        type:'pie',
                        radius: ['30%', '40%'],
                        center : ['50%', '55%'],
                        avoidLabelOverlap: false,
                        label: {
                            normal : {
                                formatter: '{d}%\n({c})',
                                textStyle : {
                                    fontWeight : 'normal',
                                    fontSize : 10
                                }
                            }
                        },
                        data:[
                            {value:dataR.NumOld80, name:'>=80岁'},
                            {value:dataR.NumOld60, name:'60-80岁'}
                        ]
                    }
                ];
                var oldman_option_zb_pie = chartPieClick(title,legend_data,series);
                oldman_zbPie.setOption(oldman_option_zb_pie);
                oldman_zbPie.on('legendselectchanged', function (params) {
                    var name = params.name;
                    if(name==">=80岁"){
                        ageStart=80;
                        ageEnd=120;

                    }else if(name=="60-80岁"){
                        ageStart=60;
                        ageEnd=80;

                    }
                    getJwData();
                    
                });

                var posList = [
                    'left', 'right', 'top', 'bottom',
                    'inside',
                    'insideTop', 'insideLeft', 'insideRight', 'insideBottom',
                    'insideTopLeft', 'insideTopRight', 'insideBottomLeft', 'insideBottomRight'
                ];

                total_pqBar.configParameters = {
                    rotate: {
                        min: -90,
                        max: 90
                    },
                    align: {
                        options: {
                            left: 'left',
                            center: 'center',
                            right: 'right'
                        }
                    },
                    verticalAlign: {
                        options: {
                            top: 'top',
                            middle: 'middle',
                            bottom: 'bottom'
                        }
                    },
                    position: {
                        options: echarts.util.reduce(posList, function (map, pos) {
                            map[pos] = pos;
                            return map;
                        }, {})
                    },
                    distance: {
                        min: 0,
                        max: 100
                    }
                };

                total_pqBar.config = {
                    rotate: 90,
                    align: 'left',
                    verticalAlign: 'middle',
                    position: 'insideBottom',
                    distance: 15,
                    onChange: function () {
                        var labelOption = {
                            normal: {
                                rotate: total_pqBar.config.rotate,
                                align: total_pqBar.config.align,
                                verticalAlign: total_pqBar.config.verticalAlign,
                                position: total_pqBar.config.position,
                                distance: total_pqBar.config.distance
                            }
                        };
                        total_pqBar.setOption({
                            series: [{
                                label: labelOption
                            }, {
                                label: labelOption
                            }, {
                                label: labelOption
                            }, {
                                label: labelOption
                            }]
                        });
                    }
                };


                var labelOption = {
                    normal: {
                        show: true,
                        position: total_pqBar.config.position,
                        distance: total_pqBar.config.distance,
                        align: total_pqBar.config.align,
                        verticalAlign: total_pqBar.config.verticalAlign,
                        rotate: total_pqBar.config.rotate,
                        formatter: '{c}',
                        fontSize: 16,
                        rich: {
                            name: {
                                textBorderColor: '#fff'
                            }
                        }
                    }
                };

                option = {
                    //color: ['#003366', '#006699', '#4cabce', '#e5323e'],
                    title: {
                        text:'片区老年人口分布',
                        textStyle:{
                            color:'#fff',
                            fontSize:title_fontSize,
                            fontWeight:'normal'
                        },
                        x:'0%',
                        y:'0%',
                    },
                    color: ['#ffd289'],
                    // tooltip: {
                    //     trigger: 'axis',
                    //     axisPointer: {
                    //         type: 'shadow'
                    //     }
                    // },
                    legend: {
                        data: ['']
                    },
                    // toolbox: {
                    //     show: true,
                    //     orient: 'vertical',
                    //     left: 'right',
                    //     top: 'center',
                    //     feature: {
                    //         mark: {show: true},
                    //         dataView: {show: true, readOnly: false},
                    //         magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                    //         restore: {show: true},
                    //         saveAsImage: {show: true}
                    //     }
                    // },
                    calculable: true,
                    xAxis: [
                        {
                            type: 'category',
                            axisTick: {show: false},
                            data: ['东兰','古龙','平南','平阳','平吉','古美'],
                            axisLine:{
                                lineStyle:{
                                    color:'white',
                                    fontSize: 20
                                }
                            },
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            axisLine:{
                                lineStyle:{
                                    color:'white',
                                    fontSize: 15
                                }
                            },
                        }
                    ],
                    series: [
                        {
                            type: 'bar',
                            barGap: 0,
                            label: labelOption,
                            data: [dataR.NumDongLan, dataR.NumGuLong, dataR.NumPingNan, dataR.NumPingYang, dataR.NumPingJi,dataR.NumGuMei],
                            barWidth: 20,//柱图宽度
                            itemStyle: {
                                normal: {
                                    barBorderRadius: 20,
                                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                        offset: 0,
                                        color: '#99d9ea'
                                    }, {
                                        offset: 1,
                                        color: 'rgba(0,188,226, 0.5)'
                                    }]),
                                    shadowColor: 'rgba(0, 0, 0, 0.4)',
                                    shadowBlur: 20,
                                }
                            },
                            barWidth:20,

                        },

                    ]
                };
                //pqBar.setOption(option);
                total_pqBar.setOption(option);

                var title_text="养老状态分布";
                var legend_data=[{name:'机构养老',textStyle:{color:legend_color,fontSize:legand_fontSize}},{name:'社区养老',textStyle:{color:legend_color,fontSize:legand_fontSize}},{name:'居家养老',textStyle:{color:legend_color,fontSize:legand_fontSize}}];
                var series=[{
                    name: '',
                    type: 'pie',
                    radius : '45%',
                    label : {
                        normal : {
                            formatter: '{d}%\n({c})',
                            textStyle : {
                                fontWeight : 'normal',
                                fontSize : series_lebel_fontSize
                            }
                        }
                    },
                    center: ['48%', '60%'],
                    data:dataOldStatus,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var total_option_status_pie = chartPie(title_text,legend_data,series);
                total_statusPie.setOption(total_option_status_pie);
                total_statusPie.on('legendselectchanged', function (params) {
                    var name = params.name;
                    if(name=="机构养老"){
                        oldStatus.push(1);

                    }else if(name=="社区养老"){
                        oldStatus.push(2);

                    }else if(name=="居家养老"){
                        oldStatus.push(3);

                    }
                    getJwData();
                    
                });
            }
        }
    });
    var average=26000;
    total_pqBar.on('click', function (param) {
        var name = param.name;
        if(name =='古美') {
            change_total_info(dataR.NumGuMeiAnd60Above,dataR.NumGuMeiAnd60Below,dataR.NumGuMeiAnd80Above,
                    dataR.NumGuMeiAnd60To80,dataR.NumGuMeiAndOrganOld,dataR.NumGuMeiAndCommunityOld,dataR.NumGuMeiAndFamilyOld);

        }else if(name =='古龙') {
            change_total_info(dataR.NumGuLongAnd60Above,dataR.NumGuLongAnd60Below,dataR.NumGuLongAnd80Above,
                    dataR.NumGuLongAnd60To80,dataR.NumGuLongAndOrganOld,dataR.NumGuLongAndCommunityOld,dataR.NumGuLongAndFamilyOld);

        }else if(name =='东兰') {
            change_total_info(dataR.NumDongLanAnd60Above,dataR.NumDongLanAnd60Below,dataR.NumDongLanAnd80Above,
                    dataR.NumDongLanAnd60To80,dataR.NumDongLanAndOrganOld,dataR.NumDongLanAndCommunityOld,dataR.NumDongLanAndFamilyOld);

        }else if(name =='平吉') {
            change_total_info(dataR.NumPingJiAnd60Above,dataR.NumPingJiAnd60Below,dataR.NumPingJiAnd80Above,
                    dataR.NumPingJiAnd60To80,dataR.NumPingJiAndOrganOld,dataR.NumPingJiAndCommunityOld,dataR.NumPingJiAndFamilyOld);

        }else if(name =='平阳') {
            change_total_info(dataR.NumPingYangAnd60Above,dataR.NumPingYangAnd60Below,dataR.NumPingYangAnd80Above,
                    dataR.NumPingYangAnd60To80,dataR.NumPingYangAndOrganOld,dataR.NumPingYangAndCommunityOld,dataR.NumPingYangAndFamilyOld);

        }else if(name =='平南') {
            change_total_info(dataR.NumPingNanAnd60Above,dataR.NumPingNanAnd60Below,dataR.NumPingNanAnd80Above,
                    dataR.NumPingNanAnd60To80,dataR.NumPingNanAndOrganOld,dataR.NumPingNanAndCommunityOld,dataR.NumPingNanAndFamilyOld);

        }
    });
    function change_total_info(numOld,numNoneOld,num80Above,num60To80,numOrganOld,numCommunityOld,numFamilyOld){
        //60岁老人占比
        title.text="老年人数占比";
        //title.link="javascript: change('child_oldman','child_base')";
        title.link = "javascript: location.href='/visual/now/part/base'";
        legend_data=[{name:'老人',textStyle:{color:legend_color,fontSize:legand_fontSize}},{name:'非老人',textStyle:{color:legend_color,fontSize:legand_fontSize}}];
        series=[
            {
                name:'',
                type:'pie',
                radius: ['30%', '40%'],
                center : ['50%', '55%'],
                avoidLabelOverlap: false,
                label: {
                    normal : {
                        formatter: '{d}%\n({c})',
                        textStyle : {
                            fontWeight : 'normal',
                            fontSize : series_lebel_fontSize
                        }
                    }
                },
                data: [{value:average-numOld, name:'非老人'},
                    {value:numOld, name:'老人'}]
            }
        ];
        var total_option_oldman_pie = chartPieClick(title,legend_data,series);
        total_oldmanPie.setOption(total_option_oldman_pie);

        title.text="80岁及以上老人占比";
        title.link="javascript: change('child_oldman','child_base')";
        legend_data=[{name:'>=80岁',textStyle:{color:legend_color,fontSize:10}},{name:'60-80岁',textStyle:{color:legend_color,fontSize:10}}];
        series=[
            {
                name:'',
                type:'pie',
                radius: ['30%', '40%'],
                center : ['50%', '55%'],
                avoidLabelOverlap: false,
                label: {
                    normal : {
                        formatter: '{d}%\n({c})',
                        textStyle : {
                            fontWeight : 'normal',
                            fontSize : 10
                        }
                    }
                },
                data:[
                    {value:num80Above, name:'>=80岁'},
                    {value:num60To80, name:'60-80岁'}
                ]
            }
        ];
        var oldman_option_zb_pie = chartPieClick(title,legend_data,series);
        oldman_zbPie.setOption(oldman_option_zb_pie);

        var title_text="养老状态分布";
        var legend_data=[{name:'机构养老',textStyle:{color:legend_color,fontSize:legand_fontSize}},{name:'社区养老',textStyle:{color:legend_color,fontSize:legand_fontSize}},{name:'居家养老',textStyle:{color:legend_color,fontSize:legand_fontSize}}];
        var series=[{
            name: '',
            type: 'pie',
            radius : '45%',
            label : {
                normal : {
                    formatter: '{d}%\n({c})',
                    textStyle : {
                        fontWeight : 'normal',
                        fontSize : series_lebel_fontSize
                    }
                }
            },
            center: ['48%', '60%'],
            data:[
                {value:numOrganOld, name:'机构养老'},
                {value:numCommunityOld, name:'社区养老'},
                {value:numFamilyOld, name:'居家养老'}
            ],
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }];
        var total_option_status_pie = chartPie(title_text,legend_data,series);
        total_statusPie.setOption(total_option_status_pie);

    }


</script>
</html>