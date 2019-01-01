<!DOCTYPE html>
<html>

<head>
<#include "../head.ftl" />
    <style>
        @media only screen and (min-width: 1700px){
            .tu_middle{
                padding-top: 5%;
                padding-bottom: 2%;
            }
        }

        @media only screen and (min-width: 1300px) and ( max-width: 1400px){
            .tu_middle{
                padding-top: 5%;
                padding-bottom: 2%;

            }
        }
    </style>

</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="row" align="center">
            <div class="col-lg-12">
                <p class="map_title" onclick="location.href='/visual/now/part/organ'" style="cursor: pointer;font-size: 30px;">家庭养老</p>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="row">
                <div class="col-lg-6 box" style=";" align="center">
                    <div class="zz" style="padding:0px"></div>
                    <div id="num_pie" class="tu_middle" style="width: 270px"></div>
                </div>
                <div class="col-lg-6 box" style=";position:relative;" align="center">
                    <div class="zz"></div>
                    <div id="pq_bar" class="tu_middle"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box" style=";position:relative;" align="center">
                    <div class="zz"></div>
                    <div id="jj_pie" class="tu_jj"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-6" style="position: relative;top:0px">
            <div class="row">
                <div class="col-lg-6 box" style="">
                    <div class="zz"></div>
                    <div id="sex_pie" class="tu_right"></div>
                </div>
                <div class="col-lg-6 box" style="position: relative;">
                    <div class="zz"></div>
                    <div id="age_bar" class="tu_right"></div>
                </div>
            </div>
            <div class="row">
                <#include "table.ftl"/>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var tu_w,tu_h,tu_big_w,tu_big_h,tu_middle_w,tu_middle_h;
        if(winWidth>=1700){
            //家里电脑的分辨率
            tu_w=winWidth/4.5;
            tu_h=winHeight/1.485;
            tu_big_w=winWidth/3;
            tu_big_h=winHeight/2.3;
            tu_middle_w=winWidth/6;
            tu_middle_h=winHeight/2.3;
        }else if(winWidth<=1400 && winWidth>=1300){
            tu_w=winWidth/4.5;
            tu_h=winHeight/1.485;
            tu_big_w=winWidth/3;
            tu_big_h=winHeight/2.3;
            tu_middle_w=winWidth/6;
            tu_middle_h=winHeight/2.3;
        }else if(winWidth>1400 && winWidth<1700){
            tu_w=winWidth/4.5;
            tu_h=winHeight/1.485;
            tu_big_w=winWidth/3;
            tu_big_h=winHeight/2.3;
            tu_middle_w=winWidth/6;
            tu_middle_h=winHeight/2.3;
        }
        $(".tu_right").css('width',tu_w);
        $(".tu_right").css( 'height', tu_middle_h+tu_big_h);
        $(".tu_big").css('width',tu_big_w);
        $(".tu_big").css( 'height', tu_big_h);
        $(".tu_middle").css('width',tu_middle_w/0.75);
        $(".tu_middle").css( 'height', tu_middle_h);
        $(".tu_jj").css('width',tu_big_w/0.8);
        $(".tu_jj").css( 'height', tu_big_h);


        var num_pie=echarts.init(document.getElementById('num_pie'));
        var pq_bar=echarts.init(document.getElementById('pq_bar'));
        var jj_pie = echarts.init(document.getElementById('jj_pie'));
        var age_bar= echarts.init(document.getElementById('age_bar'));
        var sex_pie= echarts.init(document.getElementById('sex_pie'));

    </script>
</div>


</body>
<script>
    $.ajax({
        url: "/visual/data/getVisualDataApartFuWu",
        type: "get",
        success: function (result) {
            if (result.success == true) {
                var dataR = result.data;

                title_text = "人数占比";
                legend_data = [{name: '已参加的老人', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '未参加的老人',
                    textStyle: {color: legend_color, fontSize: 10}
                }];
                series = [
                    {
                        name: '',
                        type: 'pie',
                        radius: ['40%', '55%'],
                        avoidLabelOverlap: false,
                        label: {
                            normal: {
                                formatter: '{d}%\n({c})',
                                textStyle: {
                                    fontWeight: 'normal',
                                    fontSize: 10
                                }
                            },
                            position:'right'
                        },
                        data: [
                            {value: dataR.NumKeyOld-dataR.NumKeyAttend, name: '未参加的老人'},
                            {value: dataR.NumKeyAttend, name: '已参加的老人'}
                        ]
                    }
                ];
                var option_num = chartPie(title_text, legend_data, series);
                num_pie.setOption(option_num);
                //片区人数分布
                title_text = "户籍";
                legend_data = [{name: '户籍', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '非户籍',
                    textStyle: {color: legend_color, fontSize: 10}
                }];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '55%',
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 10
                            }
                        }
                    },
                    center: ['50%', '50%'],
                    data: [
                        {value: dataR.NumHuJi, name: '户籍'},
                        {value: dataR.NumFeiHuJi, name: '非户籍'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_pq_bar = chartPie(title_text, legend_data, series);
                pq_bar.setOption(option_pq_bar);

                //    已评级年龄分布柱状图
                title_text = '年龄分布';
                legend_data = [
                    {
                        name: '男',
                        textStyle: {
                            color: '#fff',
                            fontSize: 10
                        }
                    },
                    {
                        name: '女',
                        textStyle: {
                            color: '#fff',
                            fontSize: 10
                        }
                    }
                ];
                yAxis_data = ['90-   ', '80-90', '70-80', '60-70'];
                series = [
                    {
                        name: '男',
                        type: 'bar',
                        stack: '总量',
                        label: {
                            normal: {
                                show: true,
                                position: 'insideLeft',
                                textStyle: {
                                    fontSize: 10
                                }

                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1,


                            }
                        },
                        barWidth : 45,
                        data: [dataR.NumAbove90M, dataR.Num80To90M, dataR.Num70To80M, dataR.Num60To70M]
                    },
                    {
                        name: '女',
                        type: 'bar',
                        stack: '总量',
                        label: {
                            normal: {
                                show: true,
                                position: 'insideRight',
                                textStyle: {
                                    fontSize: 10
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_2
                            }
                        },
                        barWidth : 50,
                        data: [dataR.NumAbove90F, dataR.Num80To90F, dataR.Num70To80F, dataR.Num60To70F]
                    }
                ];
                var option_age_bar = chartBar(title_text, legend_data, yAxis_data, series);
                age_bar.setOption(option_age_bar);


                //性别饼图
                title_text = "性别分布";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 10}
                }];
                series = [{
                    name: '老人性别',
                    type: 'pie',
                    radius: '55%',
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 10
                            }
                        }
                    },
                    center: ['48%', '60%'],
                    data: [
                        {value: dataR.NumMale, name: '男'},
                        {value: dataR.NumFemale, name: '女'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_sex_pie = chartPie(title_text, legend_data, series);
                sex_pie.setOption(option_sex_pie);


                title_text = "服务内容";
                legend_data = [{name: '助餐', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '助洁',
                    textStyle: {color: legend_color, fontSize: 10}
                }, {name: '助急', textStyle: {color: legend_color, fontSize: 10}}
                    , {name: '助浴', textStyle: {color: legend_color, fontSize: 10}}, {
                        name: '助行',
                        textStyle: {color: legend_color, fontSize: 10}
                    }, {name: '助医', textStyle: {color: legend_color, fontSize: 10}}
                    , {name: '洗衣服', textStyle: {color: legend_color, fontSize: 10}}, {
                        name: '相谈',
                        textStyle: {color: legend_color, fontSize: 10}
                    }, {name: '康复辅助', textStyle: {color: legend_color, fontSize: 10}}
                    , {name: '生活护理', textStyle: {color: legend_color, fontSize: 10}}];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '40%',
                    center: ['48%', '50%'],
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 10
                            }
                        }
                    },
                    data:[
                        {value:dataR.NumZhuCan, name:'助餐'},
                        {value:dataR.NumZhuJie, name:'助洁'},
                        {value:dataR.NumZhuYu, name:'助浴'},
                        {value:dataR.NumZhuXing, name:'助行'},
                        {value:dataR.NumZhuYi, name:'助医'},
                        {value:dataR.NumXiYi, name:'洗衣服'},
                        {value:dataR.NumXiangTan, name:'相谈'},
                        {value:dataR.NumKangFu, name:'康复辅助'},
                        {value:dataR.NumShengHuo, name:'生活护理'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_jj_pie = chartPie(title_text, legend_data, series);
                jj_pie.setOption(option_jj_pie);
            }
        }
    });
</script>
</html>