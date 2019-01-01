<!DOCTYPE html>
<html>

<head>
<#include "../head.ftl" />
    <style>
      #num_pie{
            padding-top: 5%;
            padding-bottom: 2%;
        }
    </style>
</head>

<body>
<div class="container-fluid">
    <div class="row" style="position: relative">
        <div class="col-lg-6">
            <div class="row" align="center">
                <div class="col-lg-12">
                    <p class="map_title" onclick="location.href='/visual/now/part/organ'" style="cursor: pointer;font-size: 30px">长护险</p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box" align="center"  style="">
                    <div class="zz" ></div>
                    <div id="num_pie" align="center" class="chx_left"></div>
                </div>
            </div>
            <#--<div class="row">-->
                <#--<#include "table.ftl"/>-->
            <#--</div>-->
        </div>

        <div class="col-lg-6" style="position: relative;left: 7px;top:0px">
            <div class="row">
                <div class="col-lg-4 box"style="position: relative;right: 0px">
                    <div class="zz"></div>
                    <div id="pj_jb_bar" class="tu_new"></div>
                </div>
                <div class="col-lg-4 box line" >
                    <div class="zz"></div>
                    <div id="pj_age_bar" class="tu"></div>
                </div>
                <div class="col-lg-4 box" style="position: relative;left: 10px">
                    <div class="zz"></div>
                    <div id="pj_pq_bar" class="tu"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 box">
                    <div class="zz"></div>
                    <div id="pj_sex_pie" class="tu_pie"></div>
                </div>
                <div class="col-lg-6 box" style="position: relative;left: 5px;margin-bottom: 5px">
                    <div class="zz"></div>
                    <div id="pj_hj_pie" class="tu_pie"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 box">
                    <div class="zz"></div>
                    <div id="fw_jb_bar" class="tu"></div>
                </div>
                <div class="col-lg-4 box line">
                    <div class="zz"></div>
                    <div id="fw_age_bar" class="tu"></div>
                </div>
                <div class="col-lg-4 box" style="position: relative;left: 10px;margin-bottom: 5px">
                    <div class="zz"></div>
                    <div id="fw_pq_bar" class="tu"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 box">
                    <div class="zz"></div>
                    <div id="fw_sex_pie" class="tu_pie"></div>
                </div>
                <div class="col-lg-6 box" style="position: absolute;right: -5px;">
                    <div class="zz"></div>
                    <div id="fw_hj_pie" class="tu_pie"></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var tu_w,tu_h,tu_pie_w,tu_pie_h,num_pie_w,num_pie_h;
        if(winWidth>=1700){
            //家里电脑的分辨率
            tu_w=winWidth/7;
            tu_h=winHeight/4.35;
            tu_pie_w=winWidth/4.5;
            tu_pie_h=winHeight/4.35;
            num_pie_w=winWidth/3;
            num_pie_h=winHeight/1.65;
        }else if(winWidth<=1400 && winWidth>=1300){
            tu_w=winWidth/7;
            tu_h=winHeight/4.35;
            tu_pie_w=winWidth/4.5;
            tu_pie_h=winHeight/4.35;
            num_pie_w=winWidth/3;
            num_pie_h=winHeight/1.65;
        }else if(winWidth<1700 && winWidth>1400){
            tu_w=winWidth/7;
            tu_h=winHeight/4.35;
            tu_pie_w=winWidth/4.5;
            tu_pie_h=winHeight/4.35;
            num_pie_w=winWidth/3;
            num_pie_h=winHeight/1.65;
        }


        $(".tu").css('width',tu_w);
        $(".tu").css( 'height',tu_h);

        $(".tu_pie").css('width',tu_pie_w);
        $(".tu_pie").css( 'height', tu_pie_h);

        $("#num_pie").css('width',num_pie_w);
        // $("#num_pie").css( 'height', num_pie_h);
        $("#num_pie").css( 'height', winWidth/2.3);

        $(".tu_new").css('width',tu_w/0.95);
        $(".tu_new").css( 'height',tu_h);

       // $(".chx_left").css('width',);
        $(".chx_left").css( 'height',(tu_h+2*tu_pie_h+tu_h-37)+"px");

        var num_pie=echarts.init(document.getElementById('num_pie'));

        var pj_jb_bar = echarts.init(document.getElementById('pj_jb_bar'));
        var pj_pq_bar = echarts.init(document.getElementById('pj_pq_bar'));
        var pj_age_bar= echarts.init(document.getElementById('pj_age_bar'));
        var pj_sex_pie= echarts.init(document.getElementById('pj_sex_pie'));
        var pj_hj_pie = echarts.init(document.getElementById('pj_hj_pie'));

        var fw_jb_bar = echarts.init(document.getElementById('fw_jb_bar'));
        var fw_pq_bar = echarts.init(document.getElementById('fw_pq_bar'));
        var fw_age_bar= echarts.init(document.getElementById('fw_age_bar'));
        var fw_sex_pie= echarts.init(document.getElementById('fw_sex_pie'));
        var fw_hj_pie = echarts.init(document.getElementById('fw_hj_pie'));
    </script>
</div>

</body>
<script>
    $.ajax({
        url: "/visual/data/getVisualDataApartCHX",
        type: "get",
        success: function (result) {
            if (result.success == true) {

                var dataR = result.data;
                //    级别分布柱状图
                var title_text = '已评级老人的级别分布';
                var legend_data = [];
                var yAxis_data = ['2级', '3级', '4级', '5级', '6级'];
                var series = [
                    {
                        name: '',
                        type: 'bar',
                        stack: '总量',

                        label: {
                            normal: {
                                show: true,
                                position: 'middle',
                                textStyle: {
                                    fontSize: 12,
                                    color:'white',
                                    fontWeight:'normal'

                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumAllLeveled2, dataR.NumAllLeveled3, dataR.NumAllLeveled4, dataR.NumAllLeveled5, dataR.NumAllLeveled6]
                    }
                ];
                var option_pj_jb_bar = chartBar(title_text, legend_data, yAxis_data, series);
                pj_jb_bar.setOption(option_pj_jb_bar);

                //数量饼图
                title_text = "";
                legend_data = [{name: '获得服务', textStyle: {color: legend_color, fontSize: 12}}, {
                    name: '未评级',
                    textStyle: {color: legend_color, fontSize: 12}
                }, {name: '已经评级', textStyle: {color: legend_color, fontSize: 12}}];
                series = [
                    {
                        name: '',
                        type: 'pie',
                        radius: ['40%', '60%'],
                        center: ['50%', '55%'],
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
                        labelLine: {
                            show: true,
                            length:40,
                            length2:60,
                            length3:80
                        },
                        data: [
                            {value: dataR.NumServed, name: '获得服务'},
                            {value: dataR.NumOld-dataR.NumLeveled, name: '未评级'},
                            {value: dataR.NumLeveled, name: '已经评级'},

                        ]
                    }
                ];
                var option_num_pie = chartPie_1(title_text, legend_data, series);
                num_pie.setOption(option_num_pie);

                //片区人数分布
                legend_data = "";
                title_text = '已评级老人片区分布';
                yAxis_data = ['东兰', '古龙', '平南', '平阳', '平吉', '古美'];
                series = [
                    {
                        name: '',
                        type: 'bar',
                        stack: '总量',
                        label: {
                            normal: {
                                show: true,
                                position: 'middle',
                                textStyle: {
                                    fontSize: 8,
                                    color:'white',
                                    fontWeight:'normal'

                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumDongLanLeveled, dataR.NumGuLongLeveled, dataR.NumPingNanLeveled, dataR.NumPingYangLeveled, dataR.NumPingJiLeveled, dataR.NumGuMeiLeveled]
                    }
                ];
                var option_pj_hj_pie = chartBar(title_text, legend_data, yAxis_data, series);
                pj_pq_bar.setOption(option_pj_hj_pie);



                //    已评级年龄分布柱状图
                title_text = '已评级老人年龄分布';
                legend_data = [];
                yAxis_data = ['90-   ', '80-90', '70-80', '60-70'];
                series = [
                    {
                        name: '',
                        type: 'bar',
                        stack: '总量',
                        label: {
                            normal: {
                                show: true,
                                position: 'middle',
                                textStyle: {
                                    fontSize: 12,
                                    color:'white',
                                    fontWeight:'normal'

                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumAllLeveled90Above, dataR.NumAllLeveled80To90, dataR.NumAllLeveled70To80, dataR.NumAllLeveled60To70]
                    }
                ];
                var option_pj_age_bar = chartBar(title_text, legend_data, yAxis_data, series);
                pj_age_bar.setOption(option_pj_age_bar);


                title_text = "已评级老人的户籍分布";
                legend_data = [{name: '户籍', textStyle: {color: legend_color, fontSize: 18}}, {
                    name: '非户籍',
                    textStyle: {color: legend_color, fontSize: 18}
                }];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '45%',
                    center: ['48%', '60%'],
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 12
                            }
                        }
                    },
                    data: [
                        {value: dataR.NumAllLeveledHuJi, name: '户籍'},
                        {value: dataR.NumAllLeveledFeiHuJi, name: '非户籍'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_pj_hj_pie = chartPie(title_text, legend_data, series);
                pj_hj_pie.setOption(option_pj_hj_pie);

                //性别饼图
                title_text = "已评级老人性别分布";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 18}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 18}
                }];
                series = [{
                    name: '老人性别',
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
                        {value: dataR.NumAllLeveledMale, name: '男'},
                        {value: dataR.NumAllLeveledFemale, name: '女'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_pj_sex_pie = chartPie(title_text, legend_data, series);
                pj_sex_pie.setOption(option_pj_sex_pie);


                //    级别分布柱状图
                title_text = '获得服务老人的级别分布';
                legend_data = [];
                yAxis_data = ['2级', '3级', '4级', '5级', '6级'];
                series = [
                    {
                        name: '',
                        type: 'bar',
                        stack: '总量',
                        label: {
                            normal: {
                                show: true,
                                position: 'right',
                                textStyle: {
                                    fontSize: 8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumAllServedLeve2, dataR.NumAllServedLeve3, dataR.NumAllServedLeve4, dataR.NumAllServedLeve5, dataR.NumAllServedLeve6]
                    }
                ];
                var option_fw_jb_bar = chartBar(title_text, legend_data, yAxis_data, series);
                fw_jb_bar.setOption(option_fw_jb_bar);

                //片区人数分布
                legend_data = "";
                title_text = '获得服务老人片区分布';
                yAxis_data = ['东兰', '古龙', '平南', '平阳', '平吉', '古美'];
                series = [
                    {
                        name: '',
                        type: 'bar',
                        stack: '总量',
                        label: {
                            normal: {
                                show: true,
                                position: 'right',
                                textStyle: {
                                    fontSize: 8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumDongLanServed, dataR.NumGuLongServed, dataR.NumPingNanServed, dataR.NumPingYangServed, dataR.NumPingJiServed, dataR.NumGuMeiServed]
                    }
                ];
                var option_pj_hj_pie = chartBar(title_text, legend_data, yAxis_data, series);
                fw_pq_bar.setOption(option_pj_hj_pie);

                // var option_pj_hj_pie = chartPie(title_text, legend_data, series);
                // fw_pq_bar.setOption(option_pj_hj_pie);

                //    已评级年龄分布柱状图
                title_text = '获得服务老人的年龄分布';
                legend_data = [];
                yAxis_data = ['90-   ', '80-90', '70-80', '60-70'];
                series = [
                    {
                        name: '',
                        type: 'bar',
                        stack: '总量',
                        label: {
                            normal: {
                                show: true,
                                position: 'right',
                                textStyle: {
                                    fontSize: 12
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumAllServed90Above, dataR.NumAllServed80To90, dataR.NumAllServed70To80, dataR.NumAllServed60To70]
                    }
                ];
                var option_fw_age_bar = chartBar(title_text, legend_data, yAxis_data, series);
                fw_age_bar.setOption(option_fw_age_bar);


                title_text = "获得服务老人的户籍分布";
                legend_data = [{name: '户籍', textStyle: {color: legend_color, fontSize: 18}}, {
                    name: '非户籍',
                    textStyle: {color: legend_color, fontSize: 18}
                }];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '45%',
                    center: ['48%', '60%'],
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 12
                            }
                        }
                    },
                    data: [
                        {value: dataR.NumAllServedHuJi, name: '户籍'},
                        {value: dataR.NumAllServedFeiHuJi, name: '非户籍'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_fw_hj_pie = chartPie(title_text, legend_data, series);
                fw_hj_pie.setOption(option_fw_hj_pie);

                //性别饼图
                title_text = "获得服务老人的性别分布";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 18}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 18}
                }];
                series = [{
                    name: '老人性别',
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
                        {value: dataR.NumAllServedMale, name: '男'},
                        {value: dataR.NumAllServedFemale, name: '女'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_fw_sex_pie = chartPie(title_text, legend_data, series);
                fw_sex_pie.setOption(option_fw_sex_pie);
            }
        }
    });


</script>
</html>