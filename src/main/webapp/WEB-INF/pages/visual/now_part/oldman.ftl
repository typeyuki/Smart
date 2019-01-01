<!DOCTYPE html>
<html>

<head>
<#include "../head.ftl" />
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6">
            <div class="row" align="center">
                <div class="col-lg-12">
                    <p class="map_title" onclick="clear_select()" style="font-size: 30px;position: relative;top:15px">古美路街道老人分布图</p>
                <#include "map.ftl"/>
                </div>
            </div>
            <div class="row" style="position: relative;right: 5px;top:5px">
            <#--<#include "table.ftl"/>-->
            </div>
        </div>
        <div class="col-lg-6" style="position: relative;top: 20px;right:10px">
            <div class="row" >
                <div class="col-lg-6 box">
                    <div class="zz"></div>
                    <div id="total_oldmanPie" class="tu"></div>
                </div>
                <div class="col-lg-6 box line">
                    <div class="zz"></div>
                    <div id="oldman_familyPie" class="tu"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 box">
                    <div class="zz"></div>
                    <div id="oldman_healthPie" class="tu"></div>
                </div>
                <div class="col-lg-6 box line">
                    <div class="zz"></div>
                    <div id="oldman_econmicPie" class="tu"></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var tu_w,tu_h;
        if(winWidth>=1700){
            //家里电脑的分辨率
            tu_w=winWidth/4.5;
            tu_h=winHeight/2.17;
        }else if(winWidth<1700 && winWidth>=1000){
            tu_w=winWidth/4.5;
            tu_h=winHeight/2.17;
        }
        $(".tu").css('width',tu_w);
        $(".tu").css( 'height', tu_h);
        var oldman_econmicPie= echarts.init(document.getElementById('oldman_econmicPie'));
        var total_oldmanPie= echarts.init(document.getElementById('total_oldmanPie'));
        var oldman_familyPie= echarts.init(document.getElementById('oldman_familyPie'));
        var oldman_healthPie= echarts.init(document.getElementById('oldman_healthPie'));
    </script>
    <script src="/static/js/chart_part.js"></script>
</div>


</body>
<script src="/static/js/visual/mapData.js"></script>
<script>
    $.ajax({
        url: "/visual/data/getVisualDataApartOldman",
        type: "get",
        success: function (result) {
            if (result.success == true) {
                var dataR = result.data;
                pieOldNum = dataR.NumOld;
                pieAllNum = dataR.NumAll;
                var dataOldAndNoneOld=[
                    {value:dataR.NumJieDaoPeople-dataR.NumOld, name:'非老人'},
                    {value:dataR.NumOld, name:'老人'}
                ];

                //家庭结构

                title.text = "家庭结构";
                title.link = "javascript: location.href='/visual/now/part/family'";
                title.textStyle.fontWeight='normal';
                legend_data = [{name: '纯老', textStyle: {color: legend_color, fontSize: legand_fontSize}}, {
                    name: '独居',
                    textStyle: {color: legend_color, fontSize: legand_fontSize}
                }
                    , {name: '失独', textStyle: {color: legend_color, fontSize: legand_fontSize}}, {
                        name: '一老养一老',
                        textStyle: {color: legend_color, fontSize: legand_fontSize}
                    },
                    {name: '孤老', textStyle: {color: legend_color, fontSize: legand_fontSize}}, {
                        name: '三支人员',
                        textStyle: {color: legend_color, fontSize: legand_fontSize}
                    }, {name: '其他', textStyle: {color: legend_color, fontSize: legand_fontSize}}];
                series = [{
                    name: '老人家庭结构',
                    type: 'pie',
                    radius: '45%',
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 12
                            }
                        }
                    },
                    center: ['48%', '60%'],
                    data: [
                        {value: dataR.NumChunLao, name: '纯老'},
                        {value: dataR.NumDuJu, name: '独居'},
                        {value: dataR.NumShiDu, name: '失独'},
                        {value: dataR.NumYiLaoYYL, name: '一老养一老'},
                        {value: dataR.NumGuLao, name: '孤老'},
                        {value: dataR.NumSanZhiRY, name: '三支人员'},
                        {value: 0, name: '其他'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_family_pie = chartPieClick(title, legend_data, series);


                oldman_familyPie.setOption(option_family_pie);
                oldman_familyPie.on('legendselectchanged', function (params) {
                    var name = params.name;
                    if(name=="纯老"){
                        family.push(1);

                    }else if(name=="独居"){
                        family.push(2);

                    }
                    else if(name=="失独"){
                        family.push(18);

                    }
                    else if(name=="一老养一老"){
                        family.push(17);

                    }
                    else if(name=="孤老"){
                        family.push(19);

                    }
                    else if(name=="三支人员"){
                        family.push(20);

                    }
                    else if(name=="其他"){
                        family.push(21);

                    }
                    getJwData();
                });

                title.text = "老人比例";
                title.link = "javascript: location.href='/visual/now/part/base'";
                title.textStyle.fontWeight='normal';
                legend_data = [{name: '老人', textStyle: {color: legend_color, fontSize: 18}}, {
                    name: '非老人',
                    textStyle: {color: legend_color, fontSize: 18}
                }];
                series = [
                    {
                        name: '',
                        type: 'pie',
                        radius: ['30%', '50%'],
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
                        data: dataOldAndNoneOld
                    }
                ];
                var option_zb_pie = chartPieClick(title, legend_data, series);
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

                title.text = "健康状态";
                title.link = "javascript: location.href='/visual/now/part/health'";
                title.textStyle.fontWeight='normal';
                legend_data = [{name: '失能', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '慢病',
                    textStyle: {color: legend_color, fontSize: 10}
                }
                    , {name: '肿瘤史', textStyle: {color: legend_color, fontSize: 10}}, {
                        name: '骨折史',
                        textStyle: {color: legend_color, fontSize: 10}
                    },
                    {name: '失智', textStyle: {color: legend_color, fontSize: 10}}, {
                        name: '长护险评级',
                        textStyle: {color: legend_color, fontSize: 10}
                    }, {name: '其他', textStyle: {color: legend_color, fontSize: 10}}];
                series = [{
                    name: '健康状态',
                    type: 'pie',
                    radius: '45%',
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 12
                            }
                        }
                    },
                    center: ['48%', '60%'],
                    data:[
                        {value:dataR.NumSN, name:'失能'},
                        {value:dataR.NumMB, name:'慢病'},
                        {value:dataR.NumZLS, name:'肿瘤史'},
                        {value:dataR.NumGZS, name:'骨折史'},
                        {value:dataR.NumSZ, name:'失智'},
                        {value:dataR.NumCHXPJ, name:'长护险评级'},
                        {value:dataR.NumQiTaHealth, name:'其他'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_health_pie = chartPieClick(title, legend_data, series);
                oldman_healthPie.setOption(option_health_pie);
                oldman_healthPie.on('legendselectchanged', function (params) {
                    var name = params.name;
                    if(name=="失能"){
                        health.push(2);

                    }else if(name=="慢病"){
                        health.push(1);

                    }
                    else if(name=="肿瘤史"){
                        health.push(4);

                    }
                    else if(name=="骨折史"){
                        health.push(5);

                    }
                    else if(name=="失智"){
                        health.push(30);

                    }
                    else if(name=="长护险评级"){
                        health.push(27);

                    }
                    else if(name=="其他"){
                        health.push(27);

                    }
                    getJwData();
                    

                });

                title.text = "经济条件";
                title.link = "javascript: location.href='/visual/now/part/economic'";
                title.textStyle.fontWeight='normal';
                legend_data = [{name: '帮困', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '低保',
                    textStyle: {color: legend_color, fontSize: 10}
                }
                    , {name: '养老保险', textStyle: {color: legend_color, fontSize: 10}}, {
                        name: '医疗救助金',
                        textStyle: {color: legend_color, fontSize: 10}
                    },
                    {name: '城镇医保', textStyle: {color: legend_color, fontSize: 10}}, {
                        name: '其他',
                        textStyle: {color: legend_color, fontSize: 10}
                    }];
                series = [{
                    name: '老人经济条件',
                    type: 'pie',
                    radius: '45%',
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 12
                            }
                        }
                    },
                    center: ['48%', '60%'],
                    data:[
                        {value:dataR.NumBangKun, name:'帮困'},
                        {value:dataR.NumDiBao, name:'低保'},
                        {value:dataR.NumYangLaoBX, name:'养老保险'},
                        {value:dataR.NumYiLiaoJZJ, name:'医疗救助金'},
                        {value:dataR.NumChengZhenYB, name:'城镇医保'},
                        {value:dataR.NumQiTaEco, name:'其他'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_econmic_pie = chartPieClick(title, legend_data, series);
                oldman_econmicPie.setOption(option_econmic_pie);
                oldman_econmicPie.on('legendselectchanged', function (params) {
                    var name = params.name;
                    if(name=="帮困"){
                        economic.push(22);

                    }else if(name=="低保"){
                        economic.push(23);

                    }
                    else if(name=="养老保险"){
                        economic.push(24);

                    }
                    else if(name=="医疗救助金"){
                        economic.push(25);

                    }
                    else if(name=="城镇医保"){
                        economic.push(26);

                    }
                    else if(name=="其他"){
                        economic.push(27);

                    }
                    getJwData();
                    

                });

                //new
                //60岁老人占比
                // title.text="老年人数占比";
                // title.link="javascript: change('child_oldman','child_base')";
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
                //         data:dataOldAndNoneOld
                //     }
                // ];
                // var total_option_oldman_pie = chartPieClick(title,legend_data,series);
                // total_oldmanPie.setOption(total_option_oldman_pie);
                //
                // //家庭结构
                // title.text="家庭结构";
                // title.link="javascript: change('child_oldman','child_family')";
                //
                // legend_data=[{name:'纯老',textStyle:{color:legend_color,fontSize:18}},{name:'独居',textStyle:{color:legend_color,fontSize:18}}
                //     ,{name:'失独',textStyle:{color:legend_color,fontSize:18}},{name:'一老养一老',textStyle:{color:legend_color,fontSize:18}},
                //     {name:'孤老',textStyle:{color:legend_color,fontSize:18}},{name:'三支人员',textStyle:{color:legend_color,fontSize:18}},{name:'其他',textStyle:{color:legend_color,fontSize:18}}];
                // series=[{
                //     name: '老人家庭结构',
                //     type: 'pie',
                //     radius : '45%',
                //     label : {
                //         normal : {
                //             formatter: '{d}%\n({c})',
                //             textStyle : {
                //                 fontWeight : 'normal',
                //                 fontSize : 20
                //             }
                //         }
                //     },
                //     center: ['48%', '60%'],
                //     data:[
                //         {value:dataR.NumChunLao, name:'纯老'},
                //         {value:dataR.NumDuJu, name:'独居'},
                //         {value:dataR.NumShiDu, name:'失独'},
                //         {value:dataR.NumYiLaoYYL, name:'一老养一老'},
                //         {value:dataR.NumGuLao, name:'孤老'},
                //         {value:dataR.NumSanZhiRY, name:'三支人员'},
                //         {value:dataR.NumQiTaFamily, name:'其他'}
                //     ],
                //     itemStyle: {
                //         emphasis: {
                //             shadowBlur: 10,
                //             shadowOffsetX: 0,
                //             shadowColor: 'rgba(0, 0, 0, 0.5)'
                //         }
                //     }
                // }];
                // var oldman_option_family_pie = chartPieClick(title,legend_data,series);
                // oldman_familyPie.setOption(oldman_option_family_pie);
                //
                // //健康状态
                //
                // title.text="健康状态";
                // title.link="javascript: change('child_oldman','child_health')";
                // legend_data=[{name:'失能',textStyle:{color:legend_color,fontSize:18}},{name:'慢病',textStyle:{color:legend_color,fontSize:18}}
                //     ,{name:'肿瘤史',textStyle:{color:legend_color,fontSize:18}},{name:'骨折史',textStyle:{color:legend_color,fontSize:18}},
                //     {name:'失智',textStyle:{color:legend_color,fontSize:18}},{name:'长护险评级',textStyle:{color:legend_color,fontSize:18}},{name:'其他',textStyle:{color:legend_color,fontSize:18}}];
                // series=[{
                //     name: '健康状态',
                //     type: 'pie',
                //     radius : '45%',
                //     label : {
                //         normal : {
                //             formatter: '{d}%\n({c})',
                //             textStyle : {
                //                 fontWeight : 'normal',
                //                 fontSize : 20
                //             }
                //         }
                //     },
                //
                //     center: ['48%', '60%'],
                //     data:[
                //         {value:dataR.NumSN, name:'失能'},
                //         {value:376, name:'慢病'},
                //         {value:dataR.NumZLS, name:'肿瘤史'},
                //         {value:dataR.NumGZS, name:'骨折史'},
                //         {value:dataR.NumSZ, name:'失智'},
                //         {value:dataR.NumCHXPJ, name:'长护险评级'},
                //         {value:dataR.NumQiTaHealth, name:'其他'}
                //     ],
                //     itemStyle: {
                //         emphasis: {
                //             shadowBlur: 10,
                //             shadowOffsetX: 0,
                //             shadowColor: 'rgba(0, 0, 0, 0.5)'
                //         }
                //     }
                // }];
                // var oldman_option_health_pie = chartPieClick(title,legend_data,series);
                // oldman_healthPie.setOption(oldman_option_health_pie);
                //
                //
                //
                // title.text="经济条件";
                // title.link="javascript: change('child_oldman','child_economic')";
                // legend_data=[{name:'帮困',textStyle:{color:legend_color,fontSize:18}},{name:'低保',textStyle:{color:legend_color,fontSize:18}}
                //     ,{name:'养老保险',textStyle:{color:legend_color,fontSize:18}},{name:'医疗救助金',textStyle:{color:legend_color,fontSize:18}},
                //     {name:'城镇医保',textStyle:{color:legend_color,fontSize:18}},{name:'其他',textStyle:{color:legend_color,fontSize:18}}];
                // series=[{
                //     name: '老人经济条件',
                //     type: 'pie',
                //     radius : '45%',
                //     label : {
                //         normal : {
                //             formatter: '{d}%\n({c})',
                //             textStyle : {
                //                 fontWeight : 'normal',
                //                 fontSize : 20
                //             }
                //         }
                //     },
                //     center: ['48%', '60%'],
                //     data:[
                //         {value:dataR.NumBangKun, name:'帮困'},
                //         {value:dataR.NumDiBao, name:'低保'},
                //         {value:dataR.NumYangLaoBX, name:'养老保险'},
                //         {value:dataR.NumYiLiaoJZJ, name:'医疗救助金'},
                //         {value:dataR.NumChengZhenYB, name:'城镇医保'},
                //         {value:dataR.NumQiTaEco, name:'其他'}
                //     ],
                //     itemStyle: {
                //         emphasis: {
                //             shadowBlur: 10,
                //             shadowOffsetX: 0,
                //             shadowColor: 'rgba(0, 0, 0, 0.5)'
                //         }
                //     }
                // }];
                // var oldman_option_econmic_pie = chartPieClick(title,legend_data,series);
                // oldman_econmicPie.setOption(oldman_option_econmic_pie);


            }
        }
    });
</script>
</html>