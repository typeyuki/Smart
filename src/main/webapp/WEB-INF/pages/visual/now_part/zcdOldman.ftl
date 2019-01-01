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
                            <p class="map_title" onclick="location.href='/visual/now/part/organ'" style="cursor: pointer;font-size: 30px;position: relative;top:15px">助餐点</p>
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
                <p class="title" style="font-size: 18px">古美路街道助餐点情况</p>
                <div class="col-lg-3">
                    <div id="jg_sub_pie" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="jg_sex_pie" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="jg_age_bar" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="jg_sub_wl" class="tu_big"></div>
                </div>
            </div>
            <div class="row box a">
                <div class="zz"></div>
                <p class="title" style="font-size: 18px">平吉助餐点</p>
                <div class="col-lg-3">
                    <div id="jg_1_pie" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="jg_1_sex" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="jg_1_age" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="jg_1_wl" class="tu_big"></div>
                </div>
            </div>
            <div class="row box a">
                <div class="zz"></div>
                <p class="title" style="font-size: 18px">平南助餐点</p>
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
                <p class="title" style="font-size: 18px">古美助餐点</p>
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
        }else if(winWidth>1400 && winWidth<1700){
            tu_big_w=winWidth/8.8;
            tu_big_h=winHeight/5.5;

        }
        $(".tu_big").css('width',tu_big_w);
        $(".tu_big").css( 'height', tu_big_h);


        var jg_sub_pie = echarts.init(document.getElementById('jg_sub_pie'));
        var jg_sub_wl= echarts.init(document.getElementById('jg_sub_wl'));
        var jg_1_pie= echarts.init(document.getElementById('jg_1_pie'));
        var jg_1_wl = echarts.init(document.getElementById('jg_1_wl'));
        var jg_2_pie= echarts.init(document.getElementById('jg_2_pie'));
        var jg_2_wl = echarts.init(document.getElementById('jg_2_wl'));
        var jg_3_pie= echarts.init(document.getElementById('jg_3_pie'));
        var jg_3_wl = echarts.init(document.getElementById('jg_3_wl'));

        var jg_sex_pie = echarts.init(document.getElementById('jg_sex_pie'));
        var jg_age_bar = echarts.init(document.getElementById('jg_age_bar'));
        var jg_1_age = echarts.init(document.getElementById('jg_1_age'));
        var jg_1_sex = echarts.init(document.getElementById('jg_1_sex'));
        var jg_2_age = echarts.init(document.getElementById('jg_2_age'));
        var jg_2_sex = echarts.init(document.getElementById('jg_2_sex'));
        var jg_3_age = echarts.init(document.getElementById('jg_3_age'));
        var jg_3_sex = echarts.init(document.getElementById('jg_3_sex'));
    </script>
</div>


</body>
<script>
    var dataR;
    $.ajax({
        url: "/visual/data/getVisualDataApartZC",
        type: "get",
        success: function (result) {
            if (result.success == true) {

                dataR = result.data;
                var live_all=dataR.NumPingJiZCLive+dataR.NumPingNanZCLive+dataR.NumGuMeiZCLive,
                remain_all=dataR.NumPingJiZCRemain+dataR.NumPingNanZCRemain+dataR.NumGuMeiZCRemain,
                male_all=dataR.NumPingJiZCAndMale+dataR.NumPingNanZCAndMale+dataR.NumGuMeiZCAndMale,
                female_all=dataR.NumPingJiZCAndFemale+dataR.NumPingNanZCAndFemale+dataR.NumGuMeiZCAndFemale,
                age60To70M_all=dataR.NumPingJiZCAnd60To70M+dataR.NumPingNanZCAnd60To70M+dataR.NumGuMeiZCAnd60To70M,
                age70To80M_all=dataR.NumPingJiZCAnd70To80M+dataR.NumPingNanZCAnd70To80M+dataR.NumGuMeiZCAnd70To80M,
                age80To90M_all=dataR.NumPingJiZCAnd80To90M+dataR.NumPingNanZCAnd80To90M+dataR.NumGuMeiZCAnd80To90M,
                age90AboveM_all=dataR.NumPingJiZCAnd90AboveM+dataR.NumPingNanZCAnd90AboveM+dataR.NumGuMeiZCAnd90AboveM,

                age60To70F_all=dataR.NumPingJiZCAnd60To70F+dataR.NumPingNanZCAnd60To70F+dataR.NumGuMeiZCAnd60To70F,
                age70To80F_all=dataR.NumPingJiZCAnd70To80F+dataR.NumPingNanZCAnd70To80F+dataR.NumGuMeiZCAnd70To80F,
                age80To90F_all=dataR.NumPingJiZCAnd80To90F+dataR.NumPingNanZCAnd80To90F+dataR.NumGuMeiZCAnd80To90F,
                age90AboveF_all=dataR.NumPingJiZCAnd90AboveF+dataR.NumPingNanZCAnd90AboveF+dataR.NumGuMeiZCAnd90AboveF,

                sn_all=dataR.NumPingJiZCAndShiNeng+dataR.NumPingNanZCAndShiNeng+dataR.NumGuMeiZCAndShiNeng,
                sz_all=dataR.NumPingJiZCAndShiZhi+dataR.NumPingNanZCAndShiZhi+dataR.NumGuMeiZCAndShiZhi,
                zl_all=dataR.NumPingJiZCAndZiLi+dataR.NumPingNanZCAndZiLi+dataR.NumGuMeiZCAndZiLi;
                title_text = "床位数";
                legend_data = [{name: '已入住', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '剩余',
                    textStyle: {color: legend_color, fontSize: 10}
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
                                fontSize: 10
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    data: [
                        {value: live_all, name: '已入住'},
                        {value: remain_all, name: '剩余'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_sub_pie = chartPie2(title_text, legend_data, series);

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
                        {value: sn_all, name: '失能'},
                        {value: sz_all, name: '失智'},
                        {value: zl_all, name: '自理'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_sub_wl =chartPie2(title_text, legend_data, series);
                title_text = "床位数";
                legend_data = [{name: '已入住', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '剩余',
                    textStyle: {color: legend_color, fontSize: 10}
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
                                fontSize: 10
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    data: [
                        {value: dataR.NumPingJiZCLive, name: '已入住'},
                        {value: dataR.NumPingJiZCRemain, name: '剩余'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_1_pie = chartPie2(title_text, legend_data, series);

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
                        {value: dataR.NumPingJiZCAndShiNeng, name: '失能'},
                        {value: dataR.NumPingJiZCAndShiZhi, name: '失智'},
                        {value: dataR.NumPingJiZCAndZiLi, name: '自理'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_1_wl =chartPie2(title_text, legend_data, series);

                title_text = "床位数";
                legend_data = [{name: '已入住', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '剩余',
                    textStyle: {color: legend_color, fontSize: 10}
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
                                fontSize: 10
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    data: [
                        {value:dataR.NumPingNanZCLive, name: '已入住'},
                        {value: dataR.NumPingNanZCRemain, name: '剩余'}
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
                        {value: dataR.NumPingNanZCAndShiNeng, name: '失能'},
                        {value: dataR.NumPingNanZCAndShiZhi, name: '失智'},
                        {value: dataR.NumPingNanZCAndZiLi, name: '自理'}
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
                legend_data = [{name: '已入住', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '剩余',
                    textStyle: {color: legend_color, fontSize: 10}
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
                                fontSize: 10
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    data: [
                        {value: dataR.NumGuMeiZCLive, name: '已入住'},
                        {value: dataR.NumGuMeiZCRemain, name: '剩余'}
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
                        {value: dataR.NumGuMeiZCAndShiNeng, name: '失能'},
                        {value: dataR.NumGuMeiZCAndShiZhi, name: '失智'},
                        {value: dataR.NumGuMeiZCAndZiLi, name: '自理'}
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

                jg_sub_pie.setOption(option_sub_pie);
                jg_sub_wl.setOption(option_sub_wl);
                jg_1_pie.setOption(option_1_pie);
                jg_1_wl.setOption(option_1_wl);
                jg_2_pie.setOption(option_2_pie);
                jg_2_wl.setOption(option_2_wl);
                jg_3_pie.setOption(option_3_pie);
                jg_3_wl.setOption(option_3_wl);

                //性别饼图
                title_text = "性别";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 10}
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
                                fontSize: 10
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    center: ['40%', '60%'],
                    data: [
                        {value:male_all, name: '男'},
                        {value: female_all, name: '女'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_jg_sex_pie = chartPie2(title_text, legend_data, series);
                jg_sex_pie.setOption(option_jg_sex_pie);
                //性别饼图
                title_text = "性别";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 10}
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
                                fontSize: 10
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    center: ['40%', '60%'],
                    data: [
                        {value:dataR.NumPingJiZCAndMale, name: '男'},
                        {value: dataR.NumPingJiZCAndFemale, name: '女'}
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
                jg_1_sex.setOption(option_jg_1_sex);
                //性别饼图
                title_text = "性别";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 10}
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
                                fontSize: 10
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    center: ['40%', '60%'],
                    data: [
                        {value: dataR.NumPingNanZCAndMale, name: '男'},
                        {value: dataR.NumPingNanZCAndFemale, name: '女'}
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
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 10}
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
                                fontSize: 10
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    center: ['40%', '60%'],
                    data: [
                        {value:dataR.NumGuMeiZCAndMale, name: '男'},
                        {value: dataR.NumGuMeiZCAndFemale, name: '女'}
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
                                color: series_color_1
                            }
                        },
                        // data: [dataR.NumPingJiZCAnd90AboveM, dataR.NumPingJiZCAnd80To90M, dataR.NumPingJiZCAnd70To80M, dataR.NumPingJiZCAnd60To70M]
                        data: [age90AboveM_all, age80To90M_all,age70To80M_all ,age60To70M_all ]
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
                        data: [age90AboveF_all, age80To90F_all,age70To80F_all ,age60To70F_all ]
                    }
                ];
                var option_jg_age_bar = chartBar(title_text, legend_data, yAxis_data, series);
                jg_age_bar.setOption(option_jg_age_bar);
                title_text = '年龄';
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
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumPingJiZCAnd90AboveM, dataR.NumPingJiZCAnd80To90M,dataR.NumPingJiZCAnd70To80M ,dataR.NumPingJiZCAnd60To70M ]
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
                        data: [dataR.NumPingJiZCAnd90AboveF, dataR.NumPingJiZCAnd80To90F,dataR.NumPingJiZCAnd70To80F,dataR.NumPingJiZCAnd60To70F]
                    }
                ];
                var option_jg_1_age = chartBar(title_text, legend_data, yAxis_data, series);
                jg_1_age.setOption(option_jg_1_age);
                title_text = '年龄';
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
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumPingNanZCAnd90AboveM, dataR.NumPingNanZCAnd80To90M,dataR.NumPingNanZCAnd70To80M ,dataR.NumPingNanZCAnd60To70M ]
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
                        data: [dataR.NumPingNanZCAnd90AboveF, dataR.NumPingNanZCAnd80To90F,dataR.NumPingNanZCAnd70To80F ,dataR.NumPingNanZCAnd60To70F]
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
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumGuMeiZCAnd90AboveM, dataR.NumGuMeiZCAnd80To90M,dataR.NumGuMeiZCAnd70To80M ,dataR.NumGuMeiZCAnd60To70M ]
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
                        data: [dataR.NumGuMeiZCAnd90AboveF, dataR.NumGuMeiZCAnd80To90F,dataR.NumGuMeiZCAnd70To80F ,dataR.NumGuMeiZCAnd60To70F]
                    }
                ];
                var option_jg_3_age = chartBar(title_text, legend_data, yAxis_data, series);
                jg_3_age.setOption(option_jg_3_age);
            }
        }
    });

</script>
</html>