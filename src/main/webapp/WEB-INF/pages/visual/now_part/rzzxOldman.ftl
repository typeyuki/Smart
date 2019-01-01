<!DOCTYPE html>
<html>

<head>
<#include "../head.ftl" />
    <style>
        @media only screen and (min-width: 1700px){
            .title{
                text-align: center;
                font-size: 28px;
                font-weight: bold;
                margin-top: 10px;
            }
        }

        @media only screen and (min-width: 1300px) and ( max-width: 1400px){
            .title{
                text-align: center;
                font-size: 15px;
                font-weight: bold;
                margin-top: 5px;
            }

        }
        @media only screen and (min-width: 1401px) and ( max-width: 1699px){
            .title{
                text-align: center;
                font-size: 15px;
                font-weight: bold;
                margin-top: 5px;
                font-weight:'normal'
            }

        }

        /*@media only screen and (min-width: 1401px) and ( max-width: 1699px){*/
            /*.title{*/
                /*text-align: center;*/
                /*font-size: 21px;*/
                /*font-weight: bold;*/
                /*margin-top: 7px;*/
            /*}*/

        /*}*/
    </style>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6">
            <div class="row" align="center">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-12">
                            <p class="map_title" onclick="location.href='/visual/now/part/organ'" style="cursor: pointer;font-size: 30px;position: relative;top:15px">日间照料中心</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                        <#include "map.ftl"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="position: relative;right: 10px">
                <#--<#include "table.ftl"/>-->
            </div>
        </div>
        <div class="col-lg-6"style="position: relative;top:35px;right:5px">
            <div class="row box a">
                <div class="zz"></div>
                <p class="title" style="font-size: 18px">古美路街道日照中心情况</p>
                <div class="col-lg-3">
                    <div id="rzzxOldman_jg_sub_pie" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="rzzxOldman_jg_sex_pie" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="rzzxOldman_jg_age_bar" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="rzzxOldman_jg_sub_wl" class="tu_big"></div>
                </div>
            </div>
            <div class="row box a">
                <div class="zz"></div>
                <p class="title" style="font-size: 18px">平南邻里中心</p>
                <div class="col-lg-3">
                    <div id="rzzxOldman_jg_1_pie" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="rzzxOldman_jg_1_sex" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="rzzxOldman_jg_1_age" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="rzzxOldman_jg_1_wl" class="tu_big"></div>
                </div>
            </div>
            <div class="row box a">
                <div class="zz"></div>
                <p class="title" style="font-size: 18px">平吉一村日托站</p>
                <div class="col-lg-3">
                    <div id="jg_2_pie" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="jg_2_sex" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="jg_2_age" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="jg_2_wl" class="tu_big"></div>
                </div>
            </div>
            <div class="row box a">
                <div class="zz"></div>
                <p class="title" style="font-size: 18px">平吉二村日托站</p>
                <div class="col-lg-3">
                    <div id="jg_3_pie" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="jg_3_sex" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="jg_3_age" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="jg_3_wl" class="tu_big"></div>
                </div>
            </div>
        </div>

    </div>
    <script type="text/javascript">
        var tu_big_w,tu_big_h;
        if(winWidth>=1700){
            //家里电脑的分辨率
            tu_big_w=winWidth/8.8;
            tu_big_h=winHeight/5.5;
        }else if(winWidth<=1400 && winWidth>=1300){
            tu_big_w=winWidth/8.8;
            tu_big_h=winHeight/5.5;
        }else if(winWidth<1700 && winWidth>1400) {
            tu_big_w = winWidth / 8.8;
            tu_big_h = winHeight / 5.5;
        }else if(winWidth>1400 && winWidth<1700){
            tu_big_w=winWidth/8.8;
            tu_big_h=winHeight/5.5;

        }
        $(".tu_big").css('width',tu_big_w);
        $(".tu_big").css( 'height', tu_big_h);


        var rzzxOldman_jg_sub_pie = echarts.init(document.getElementById('rzzxOldman_jg_sub_pie'));
        var rzzxOldman_jg_sub_wl= echarts.init(document.getElementById('rzzxOldman_jg_sub_wl'));
        var rzzxOldman_jg_1_pie= echarts.init(document.getElementById('rzzxOldman_jg_1_pie'));
        var rzzxOldman_jg_1_wl = echarts.init(document.getElementById('rzzxOldman_jg_1_wl'));
        var jg_2_pie= echarts.init(document.getElementById('jg_2_pie'));
        var jg_2_wl = echarts.init(document.getElementById('jg_2_wl'));
        var jg_3_pie= echarts.init(document.getElementById('jg_3_pie'));
        var jg_3_wl = echarts.init(document.getElementById('jg_3_wl'));

        var rzzxOldman_jg_sex_pie = echarts.init(document.getElementById('rzzxOldman_jg_sex_pie'));
        var rzzxOldman_jg_age_bar = echarts.init(document.getElementById('rzzxOldman_jg_age_bar'));
        var rzzxOldman_jg_1_age = echarts.init(document.getElementById('rzzxOldman_jg_1_age'));
        var rzzxOldman_jg_1_sex = echarts.init(document.getElementById('rzzxOldman_jg_1_sex'));
        var jg_2_age = echarts.init(document.getElementById('jg_2_age'));
        var jg_2_sex = echarts.init(document.getElementById('jg_2_sex'));
        var jg_3_age = echarts.init(document.getElementById('jg_3_age'));
        var jg_3_sex = echarts.init(document.getElementById('jg_3_sex'));
    </script>
</div>


</body>
<script>
    $.ajax({
        url: "/visual/data/getVisualDataApartRZ",
        type: "get",
        success: function (result) {
            if (result.success == true) {
                var dataR = result.data;
                title_text = "床位数";
                legend_data = [{name: '已入住', textStyle: {color: legend_color, fontSize: 8}}, {
                    name: '剩余',
                    textStyle: {color: legend_color, fontSize: 8}
                }];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '40%',
                    center: ['40%', '60%'],
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 8
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    data:[
                        {value:dataR.NumPingJi2RZLive+dataR.NumPingJi1RZLive+dataR.NumPingNanRZLive, name:'已入住'},
                        {value:dataR.NumPingJi2RZRemain+dataR.NumPingJi1RZRemain+dataR.NumPingNanRZRemain, name:'剩余'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var rzzxOldman_option_sub_pie = chartPie2(title_text,legend_data,series);

                rzzxOldman_jg_sub_pie.setOption(rzzxOldman_option_sub_pie);

                title_text = "健康状态";
                legend_data = [{name: '失能', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '失智',
                    textStyle: {color: legend_color, fontSize:8}
                },{name: '自理', textStyle: {color: legend_color, fontSize:8}}];
                series = [{
                    name: '老人健康状态',
                    type: 'pie',
                    radius: '40%',
                    center: ['40%', '60%'],
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize:8
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    data: [
                        {value: dataR.NumPingNanRZAndShiNeng+dataR.NumPingJi1RZAndShiNeng+dataR.NumPingJi2RZAndShiNeng, name: '失能'},
                        {value: dataR.NumPingNanRZAndShiZhi+dataR.NumPingJi1RZAndShiZhi+dataR.NumPingJi2RZAndShiZhi, name: '失智'},
                        {value: dataR.NumPingNanRZAndZiLi+dataR.NumPingJi1RZAndZiLi+dataR.NumPingJi2RZAndZiLi, name: '自理'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var rzzxOldman_option_sub_wl =chartPie2(title_text, legend_data, series);
                rzzxOldman_jg_sub_wl.setOption(rzzxOldman_option_sub_wl);

                title_text = "床位数";
                legend_data = [{name: '已入住', textStyle: {color: legend_color, fontSize: 18}}, {
                    name: '剩余',
                    textStyle: {color: legend_color, fontSize: 8}
                }];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '40%',
                    center: ['40%', '60%'],
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 8
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    data:[
                        {value:dataR.NumPingNanRZLive, name:'已入住'},
                        {value:dataR.NumPingNanRZRemain, name:'剩余'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var rzzxOldman_option_1_pie = chartPie2(title_text,legend_data,series);

                title_text = "健康状态";
                legend_data = [{name: '失能', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '失智',
                    textStyle: {color: legend_color, fontSize:8}
                },{name: '自理', textStyle: {color: legend_color, fontSize:8}}];
                series = [{
                    name: '老人健康状态',
                    type: 'pie',
                    radius: '40%',
                    center: ['40%', '60%'],
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize:8
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    data: [
                        {value: dataR.NumPingNanRZAndShiNeng, name: '失能'},
                        {value: dataR.NumPingNanRZAndShiZhi, name: '失智'},
                        {value: dataR.NumPingNanRZAndZiLi, name: '自理'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var rzzxOldman_option_1_wl =chartPie2(title_text, legend_data, series);
                rzzxOldman_jg_1_wl.setOption(rzzxOldman_option_1_wl);
                title_text = "床位数";
                legend_data = [{name: '已入住', textStyle: {color: legend_color, fontSize: 8}}, {
                    name: '剩余',
                    textStyle: {color: legend_color, fontSize: 8}
                }];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '40%',
                    center: ['40%', '60%'],
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 8
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    data:[
                        {value:dataR.NumPingJi1RZLive, name:'已入住'},
                        {value:dataR.NumPingJi1RZRemain, name:'剩余'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_2_pie = chartPie2(title_text, legend_data, series);

                title_text = "健康状态";
                legend_data = [{name: '失能', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '失智',
                    textStyle: {color: legend_color, fontSize:8}
                },{name: '自理', textStyle: {color: legend_color, fontSize:8}}];
                series = [{
                    name: '老人健康状态',
                    type: 'pie',
                    radius: '40%',
                    center: ['40%', '60%'],
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize:8
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    data: [
                        {value: dataR.NumPingJi1RZAndShiNeng, name: '失能'},
                        {value: dataR.NumPingJi1RZAndShiZhi, name: '失智'},
                        {value: dataR.NumPingJi1RZAndZiLi, name: '自理'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_2_wl =chartPie2(title_text, legend_data, series);

                title_text = "床位数";
                legend_data = [{name: '已入住', textStyle: {color: legend_color, fontSize: 8}}, {
                    name: '剩余',
                    textStyle: {color: legend_color, fontSize: 8}
                }];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '40%',
                    center: ['40%', '60%'],
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 8
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    data:[
                        {value:dataR.NumPingJi2RZLive, name:'已入住'},
                        {value:dataR.NumPingJi2RZRemain, name:'剩余'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_3_pie = chartPie2(title_text, legend_data, series);

                title_text = "健康状态";
                legend_data = [{name: '失能', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '失智',
                    textStyle: {color: legend_color, fontSize:8}
                },{name: '自理', textStyle: {color: legend_color, fontSize:8}}];
                series = [{
                    name: '老人健康状态',
                    type: 'pie',
                    radius: '40%',
                    center: ['40%', '60%'],
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize:8
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    data: [
                        {value: dataR.NumPingJi2RZAndShiNeng, name: '失能'},
                        {value: dataR.NumPingJi2RZAndShiZhi, name: '失智'},
                        {value: dataR.NumPingJi2RZAndZiLi, name: '自理'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_3_wl =chartPie2(title_text, legend_data, series);

                rzzxOldman_jg_sub_pie.setOption(rzzxOldman_option_sub_pie);
                rzzxOldman_jg_sub_wl.setOption(rzzxOldman_option_sub_wl);
                rzzxOldman_jg_1_pie.setOption(rzzxOldman_option_1_pie);
                rzzxOldman_jg_1_wl.setOption(rzzxOldman_option_1_wl);
                jg_2_pie.setOption(option_2_pie);
                jg_2_wl.setOption(option_2_wl);
                jg_3_pie.setOption(option_3_pie);
                jg_3_wl.setOption(option_3_wl);

                //性别饼图
                title_text = "性别";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 8}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 8}
                }];
                series = [{
                    name: '老人性别',
                    type: 'pie',
                    radius: '40%',
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 8
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    center: ['40%', '60%'],
                    data:[
                        {value:dataR.NumPingNanRZAndMale+dataR.NumPingJi1RZAndMale+dataR.NumPingJi2RZAndMale, name:'男'},
                        {value:dataR.NumPingNanRZAndFemale+dataR.NumPingJi1RZAndFemale+dataR.NumPingJi2RZAndFemale, name:'女'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var rzzxOldman_option_jg_sex_pie = chartPie2(title_text,legend_data,series);
                rzzxOldman_jg_sex_pie.setOption(rzzxOldman_option_jg_sex_pie);
                //性别饼图
                title_text = "性别";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 8}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 8}
                }];
                series = [{
                    name: '老人性别',
                    type: 'pie',
                    radius: '40%',
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 8
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    center: ['40%', '60%'],
                    data:[
                        {value:dataR.NumPingNanRZAndMale, name:'男'},
                        {value:dataR.NumPingNanRZAndFemale, name:'女'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_jg_1_sex = chartPie2(title_text, legend_data, series);
                rzzxOldman_jg_1_sex.setOption(option_jg_1_sex);
                //性别饼图
                title_text = "性别";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 8}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 8}
                }];
                series = [{
                    name: '老人性别',
                    type: 'pie',
                    radius: '40%',
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 8
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    center: ['40%', '60%'],
                    data:[
                        {value:dataR.NumPingJi1RZAndMale, name:'男'},
                        {value:dataR.NumPingJi1RZAndFemale, name:'女'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_jg_2_sex = chartPie2(title_text, legend_data, series);
                jg_2_sex.setOption(option_jg_2_sex);
                //性别饼图
                title_text = "性别";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 8}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 8}
                }];
                series = [{
                    name: '老人性别',
                    type: 'pie',
                    radius: '40%',
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 8
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    center: ['40%', '60%'],
                    data:[
                        {value:dataR.NumPingJi2RZAndMale, name:'男'},
                        {value:dataR.NumPingJi2RZAndFemale, name:'女'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_jg_3_sex = chartPie2(title_text, legend_data, series);
                jg_3_sex.setOption(option_jg_3_sex);

                title_text = '年龄';
                legend_data = [
                    {
                        name: '男',
                        textStyle: {
                            color: '#fff',
                            fontSize: 8
                        }
                    },
                    {
                        name: '女',
                        textStyle: {
                            color: '#fff',
                            fontSize: 8
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
                                    fontSize: 8
                                }

                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumPingNanRZAnd90AboveM+dataR.NumPingJi1RZAnd90AboveM+dataR.NumPingJi2RZAnd90AboveM,dataR.NumPingNanRZAnd80To90M+dataR.NumPingJi1RZAnd80To90M+dataR.NumPingJi2RZAnd80To90M,dataR.NumPingNanRZAnd70To80M+dataR.NumPingJi1RZAnd70To80M+dataR.NumPingJi2RZAnd70To80M,dataR.NumPingNanRZAnd60To70M+dataR.NumPingJi1RZAnd60To70M+dataR.NumPingJi2RZAnd60To70M]

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
                                    fontSize: 8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_2
                            }
                        },
                        data: [dataR.NumPingNanRZAnd90AboveF+dataR.NumPingJi1RZAnd90AboveF+dataR.NumPingJi2RZAnd90AboveF,dataR.NumPingNanRZAnd80To90F+dataR.NumPingJi1RZAnd80To90F+dataR.NumPingJi2RZAnd80To90F,dataR.NumPingNanRZAnd70To80F+dataR.NumPingJi1RZAnd70To80F+dataR.NumPingJi2RZAnd70To80F,dataR.NumPingNanRZAnd60To70F+dataR.NumPingJi1RZAnd60To70F+dataR.NumPingJi2RZAnd60To70F]
                    }
                ];
                var option_jg_age_bar = chartBar(title_text, legend_data, yAxis_data, series);
                rzzxOldman_jg_age_bar.setOption(option_jg_age_bar);
                title_text = '年龄';
                legend_data = [
                    {
                        name: '男',
                        textStyle: {
                            color: '#fff',
                            fontSize: 8
                        }
                    },
                    {
                        name: '女',
                        textStyle: {
                            color: '#fff',
                            fontSize: 8
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
                                    fontSize: 8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumPingNanRZAnd90AboveM,dataR.NumPingNanRZAnd80To90M,dataR.NumPingNanRZAnd70To80M,dataR.NumPingNanRZAnd60To70M]
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
                                    fontSize: 8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_2
                            }
                        },
                        data: [dataR.NumPingNanRZAnd90AboveF,dataR.NumPingNanRZAnd80To90F,dataR.NumPingNanRZAnd70To80F,dataR.NumPingNanRZAnd60To70F]
                    }
                ];
                var option_jg_1_age = chartBar(title_text, legend_data, yAxis_data, series);
                rzzxOldman_jg_1_age.setOption(option_jg_1_age);
                title_text = '年龄';
                legend_data = [
                    {
                        name: '男',
                        textStyle: {
                            color: '#fff',
                            fontSize: 8
                        }
                    },
                    {
                        name: '女',
                        textStyle: {
                            color: '#fff',
                            fontSize: 8
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
                                    fontSize: 8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumPingJi1RZAnd90AboveM,dataR.NumPingJi1RZAnd80To90M,dataR.NumPingJi1RZAnd70To80M,dataR.NumPingJi1RZAnd60To70M]
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
                                    fontSize: 8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_2
                            }
                        },
                        data: [dataR.NumPingJi1RZAnd90AboveF,dataR.NumPingJi1RZAnd80To90F,dataR.NumPingJi1RZAnd70To80F,dataR.NumPingJi1RZAnd60To70F]
                    }
                ];
                var option_jg_2_age = chartBar(title_text, legend_data, yAxis_data, series);
                jg_2_age.setOption(option_jg_2_age);
                title_text = '年龄';
                legend_data = [
                    {
                        name: '男',
                        textStyle: {
                            color: '#fff',
                            fontSize: 8
                        }
                    },
                    {
                        name: '女',
                        textStyle: {
                            color: '#fff',
                            fontSize: 8
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
                                    fontSize: 8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumPingJi2RZAnd90AboveM,dataR.NumPingJi2RZAnd80To90M,dataR.NumPingJi2RZAnd70To80M,dataR.NumPingJi2RZAnd60To70M]
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
                                    fontSize: 8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_2
                            }
                        },
                        data: [dataR.NumPingJi2RZAnd90AboveF,dataR.NumPingJi2RZAnd80To90F,dataR.NumPingJi2RZAnd70To80F,dataR.NumPingJi2RZAnd60To70F]
                    }
                ];
                var option_jg_3_age = chartBar(title_text, legend_data, yAxis_data, series);
                jg_3_age.setOption(option_jg_3_age);


            }
        }
    });


</script>
</html>