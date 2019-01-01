<!DOCTYPE html>
<html>

<head>
<#include "../head.ftl" />
    <style>
        @media only screen and (min-width: 1700px){
            .zn_big,.zn,.jt{
                padding-top: 5%;
                padding-bottom: 2%;
            }
        }

        @media only screen and (min-width: 1300px) and ( max-width: 1400px){
            .zn_big,.zn,.jt{
                padding-top: 5%;
                padding-bottom: 2%;
            }
            .zn_new{
                padding-top: 5%;
                padding-bottom: 2%;
                /*max-width:100%;*/
            }
        }

        @media only screen and (min-width: 1401px) and ( max-width: 1699px){
            .zn_big,.zn,.jt{
                padding-top: 5%;
                padding-bottom: 2%;
            }
            .zn_new{
                padding-top: 5%;
                padding-bottom: 2%;
                max-width:200%;
                height:300px;
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
                    <p class="map_title" onclick="location.href='/visual/now/part/organ'" style="cursor: pointer;font-size: 30px">智能化应用配置</p>
                </div>
            </div>
            <div class="row" style="height: 339px">
                <div class="col-lg-6 box" style="height: 335px">
                    <div class="zz"></div>
                    <div id="zn_num_pie" class="zn_zb"></div>
                </div>
                <div class="col-lg-6 box"  style="height: 335px">
                    <div class="zz"></div>
                    <div id="zn_pie" class="zn_zb"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 box" style="height: 334px">
                    <div class="zz"></div>
                    <div id="zn_age_bar" class="zn_age"></div>
                </div>
                <div class="col-lg-4 box line" style="height: 334px;left:0px">
                    <div class="zz"></div>
                    <div id="zn_sex_pie" class="zn_sex"></div>
                </div>
                <div class="col-lg-4 box"  style="height: 334px;">
                    <div class="zz"></div>
                    <div id="zn_pq_bar" class="zn_sex"></div>
                </div>
            </div>
            <div class="row" >
                <#--<#include "table.ftl" />-->
            </div>
        </div>
        <div class="col-lg-6" >
            <div class="row" align="center">
                <div class="col-lg-12">
                    <p class="map_title" onclick="location.href='/visual/now/part/organ'" style="cursor: pointer;font-size: 30px">家庭医生</p>
                </div>
            </div>
            <div class="row" style="height: 405">
                <div class="col-lg-3 box" align="center" style="height: 300px">
                    <div class="zz"></div>
                    <div id="jt_ys_num_pie" class="jt2"></div>
                </div>
                <div class="col-lg-3 box" align="center" style="height: 300px">
                    <div class="zz"></div>
                    <div id="jt_ys_age_bar" class="jt_age"></div>
                </div>
                <div class="col-lg-3 box" align="center" style="height: 300px">
                    <div class="zz"></div>
                    <div id="jt_ys_pq_bar" class="jt2"></div>
                </div>
                <div class="col-lg-3 box" align="center" style="height: 300px">
                    <div class="zz"></div>
                    <div id="jt_ys_sex_pie" class="jt2"></div>
                </div>
            </div>
            <div class="row" align="center"  style="margin-top: 20px">
                <div class="col-lg-12">
                    <p class="map_title" onclick="location.href='/visual/now/part/organ'" style="cursor: pointer;font-size: 30px">家庭病床</p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 box" align="center" style="height: 300px">
                    <div class="zz"></div>
                    <div id="jt_bc_num_pie" class="jt2"></div>
                </div>
                <div class="col-lg-3 box" align="center" style="height: 300px">
                    <div class="zz"></div>
                    <div id="jt_bc_age_bar" class="jt_age"></div>
                </div>
                <div class="col-lg-3 box" align="center" style="height: 300px">
                    <div class="zz"></div>
                    <div id="jt_bc_pq_bar" class="jt2"></div>
                </div>
                <div class="col-lg-3 box" align="center" style="height: 300px">
                    <div class="zz"></div>
                    <div id="jt_bc_sex_pie" class="jt2"></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var zn_w,zn_h,zn_big_w,zn_big_h,jt_w,jt_h;
        if(winWidth>=1700){
            //家里电脑的分辨率
            zn_w=winWidth/7;
            zn_h=winHeight/3.37;
            zn_big_w=winWidth/4.5;
            zn_big_h=winHeight/3.37;
            jt_w=winWidth/10;
            jt_h=winHeight/2.55;
        }else if(winWidth<=1400 && winWidth>=1300){
            zn_w=winWidth/7;
            zn_h=winHeight/3.37;
            zn_big_w=winWidth/4.5;
            zn_big_h=winHeight/3.37;
            jt_w=winWidth/10;
            jt_h=winHeight/2.55;
        }else if(winWidth<1700 && winWidth>1400){
            zn_w=winWidth/7;
            zn_h=winHeight/3.37;
            zn_big_w=winWidth/4.5;
            zn_big_h=winHeight/3.37;
            jt_w=winWidth/10;
            jt_h=winHeight/2.55;
        }


        $(".zn").css('width',zn_w);
        $(".zn").css( 'height', zn_h);
        $(".zn_big").css('width',zn_big_w);
        $(".zn_big").css( 'height',zn_big_h);
        $(".jt").css('width',jt_w);
        $(".jt").css( 'height', jt_h);
        $(".jt2").css( 'height', jt_h);
        $(".jt2").css('width',winWidth/9);
        $(".jt_age").css( 'height', jt_h/1.0);
        $(".jt_age").css('width',jt_w);
        $(".zn_age").css('width',zn_w);
        $(".zn_age").css( 'height', zn_h/0.75);
        $(".zn_zb").css('width',zn_big_w);
        $(".zn_zb").css( 'height',zn_big_h/0.8);
        //$(".zn_sex").css('width',zn_w);
        $(".zn_sex").css( 'height', zn_h/0.8);

        var zn_num_pie = echarts.init(document.getElementById('zn_num_pie'));
        var zn_pie = echarts.init(document.getElementById('zn_pie'));
        var zn_age_bar= echarts.init(document.getElementById('zn_age_bar'));
        var zn_pq_bar= echarts.init(document.getElementById('zn_pq_bar'));
        var zn_sex_pie= echarts.init(document.getElementById('zn_sex_pie'));
        var jt_ys_age_bar = echarts.init(document.getElementById('jt_ys_age_bar'));
        var jt_ys_pq_bar = echarts.init(document.getElementById('jt_ys_pq_bar'));
        var jt_ys_sex_pie = echarts.init(document.getElementById('jt_ys_sex_pie'));
        var jt_bc_age_bar = echarts.init(document.getElementById('jt_bc_age_bar'));
        var jt_bc_pq_bar = echarts.init(document.getElementById('jt_bc_pq_bar'));
        var jt_bc_sex_pie = echarts.init(document.getElementById('jt_bc_sex_pie'));

        var jt_bc_num_pie = echarts.init(document.getElementById('jt_bc_num_pie'));
        var jt_ys_num_pie = echarts.init(document.getElementById('jt_ys_num_pie'));
    </script>
</div>

</body>
<script>
    $.ajax({
        url: "/visual/data/getVisualDataApartZNH",
        type: "get",
        success: function (result) {
            if (result.success == true) {

                var dataR = result.data;
                title_text = "人数占比";
                legend_data = [{name: '已使用的老人', textStyle: {color: legend_color, fontSize: 12}}, {
                    name: '未使用的老人',
                    textStyle: {color: legend_color, fontSize: 12}
                }];
                series = [
                    {
                        name: '',
                        type: 'pie',
                        radius: ['40%', '50%'],
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
                        center: ['50%', '60%'],
                        data: [
                            {value: dataR.NumZhiNengKeyOld-dataR.NumKeyAttendZhiNeng, name: '未使用的老人'},
                            {value: dataR.NumKeyAttendZhiNeng, name: '已使用的老人'}
                        ],
                        labelLine:{
                            normal:{
                                length:10
                            }
                        },
                    }
                ];
                var option_zn_num_pie = chartPie(title_text, legend_data, series);
                zn_num_pie.setOption(option_zn_num_pie);

                title_text = "人数占比";
                legend_data = [{name: '已参加', textStyle: {color: legend_color, fontSize: 12}}, {
                    name: '未参加',
                    textStyle: {color: legend_color, fontSize: 12}
                }];
                series = [
                    {
                        name: '',
                        type: 'pie',
                        radius: ['30%', '40%'],
                        avoidLabelOverlap: false,
                        label: {
                            normal: {
                                formatter: '{d}%\n({c})',
                                textStyle: {
                                    fontWeight: 'normal',
                                    fontSize: 8
                                },
                                // position:'inner'
                            },

                        },
                        labelLine:{
                            normal:{
                                length:1
                            }
                        },
                        data: [
                            {value: dataR.NumKeyOld-dataR.NumKeyAttendYiSheng, name: '未参加'},
                            {value: dataR.NumKeyAttendYiSheng, name: '已参加'}
                        ],
                        labelLine:{
                            normal:{
                                length:1
                            }
                        },
                    }
                ];
                var option_jt_ys_num = chartPie(title_text, legend_data, series);
                jt_ys_num_pie.setOption(option_jt_ys_num);

                title_text = "人数占比";
                legend_data = [{name: '已参加', textStyle: {color: legend_color, fontSize: 12}}, {
                    name: '未参加',
                    textStyle: {color: legend_color, fontSize: 12}
                }];
                series = [
                    {
                        name: '',
                        type: 'pie',
                        radius: ['30%', '40%'],
                        avoidLabelOverlap: false,
                        label: {
                            normal: {
                                formatter: '{d}%\n({c})',
                                textStyle: {
                                    fontWeight: 'normal',
                                    fontSize: 8
                                }
                            }
                        },
                        data: [
                            {value: dataR.NumKeyOld-dataR.NumKeyAttendBingChuang, name: '未参加'},
                            {value: dataR.NumKeyAttendBingChuang, name: '已参加'}
                        ]
                    }
                ];
                var option_jt_bc_num = chartPie(title_text, legend_data, series);
                jt_bc_num_pie.setOption(option_jt_bc_num);


                title_text = "产品服务人数";
                legend_data = [{name: '安康通', textStyle: {color: legend_color, fontSize: 12}}, {
                    name: '康乐福',
                    textStyle: {color: legend_color, fontSize: 12}
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
                                fontSize: 12
                            }
                        }
                    },
                    center: ['48%', '60%'],
                    data: [
                        {value: dataR.NumAnKang, name: '安康通'},
                        {value: dataR.NumKangLe, name: '康乐福'},
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_zn_pie = chartPie(title_text, legend_data, series);
                zn_pie.setOption(option_zn_pie);

                title_text = "服务人数性别";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 12}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 12}
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
                    center: ['48%', '60%'],
                    data: [
                        {value: dataR.NumZhiNengAndMale, name: '男'},
                        {value: dataR.NumZhiNengAndFemale, name: '女'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_zn_sex_pie = chartPie(title_text, legend_data, series);
                zn_sex_pie.setOption(option_zn_sex_pie);

                title_text = '服务人数年龄';
                legend_data = [
                    {
                        name: '男',
                        textStyle: {
                            color: '#fff',
                            fontSize: 12
                        }
                    },
                    {
                        name: '女',
                        textStyle: {
                            color: '#fff',
                            fontSize: 12
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
                                    fontSize: 12
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1,
                                fontSize: 12
                            }
                        },
                        barWidth : 35,
                        barCategoryGap:'50%',
                        center: ['50%', '50%'],
                        data: [dataR.NumZhiNengAnd90AboveM, dataR.NumZhiNengAnd80To90M, dataR.NumZhiNengAnd70To80M, dataR.NumZhiNengAnd60To70M]
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
                                    fontSize: 12
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_2,
                                fontSize: 18
                            }
                        },
                        center: ['50%', '60%'],
                        barWidth : 40,
                        barCategoryGap:'50%',
                        data: [dataR.NumZhiNengAnd90AboveF, dataR.NumZhiNengAnd80To90F, dataR.NumZhiNengAnd70To80F, dataR.NumZhiNengAnd60To70F]
                    }
                ];
                var option_zn_age_bar = chartBar3(title_text, legend_data, yAxis_data, series);
                zn_age_bar.setOption(option_zn_age_bar);

                //片区人数分布
                title_text = "户籍";
                legend_data = [{name: '户籍', textStyle: {color: legend_color, fontSize: 12}}, {
                    name: '非户籍',
                    textStyle: {color: legend_color, fontSize: 12}
                }];
                series = [{
                    name: '',
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
                    labelLine:{
                        normal:{
                            length:1
                        }
                    },
                    center: ['50%', '60%'],
                    data: [
                        {value: dataR.NumZhiNengAndHuJi, name: '户籍'},
                        {value: dataR.NumZhiNengAndFeiHuJi, name: '非户籍'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_jt_ys_sex_pie = chartPie(title_text, legend_data, series);
                zn_pq_bar.setOption(option_jt_ys_sex_pie);

                title_text = "性别";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 12}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 12}
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
                    center: ['50%', '50%'],
                    data: [
                        {value: dataR.NumYiShengAndMale, name: '男'},
                        {value: dataR.NumYiShengAndFemale, name: '女'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    },
                    labelLine:{
                        normal:{
                            length:5
                        }
                    },
                }];
                var option_jt_ys_sex_pie = chartPie(title_text, legend_data, series);
                jt_ys_sex_pie.setOption(option_jt_ys_sex_pie);

                title_text = '年龄';
                legend_data = [
                    {
                        name: '男',
                        textStyle: {
                            color: '#fff',
                            fontSize: 12
                        }
                    },
                    {
                        name: '女',
                        textStyle: {
                            color: '#fff',
                            fontSize: 12
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
                                    fontSize: 12
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1,
                            }
                        },
                        barWidth : 35,
                        data: [dataR.NumYiShengAnd90AboveM, dataR.NumNumYiShengAnd80To90M, dataR.NumYiShengAnd70To80M, dataR.NumYiShengAnd60To70M]
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
                                    fontSize: 12
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_2
                            }
                        },
                        barWidth : 20,
                        data: [dataR.NumYiShengAnd90AboveF, dataR.NumNumYiShengAnd80To90F, dataR.NumYiShengAnd70To80F, dataR.NumYiShengAnd60To70F]
                    }
                ];
                var option_jt_ys_age_bar = chartBar3(title_text, legend_data, yAxis_data, series);
                jt_ys_age_bar.setOption(option_jt_ys_age_bar);


                //片区人数分布
                title_text = "户籍";
                legend_data = [{name: '户籍', textStyle: {color: legend_color, fontSize: 12}}, {
                    name: '非户籍',
                    textStyle: {color: legend_color, fontSize: 12}
                }];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '40%',
                    label: {
                        normal: {
                            formatter: '{d}%\n{c}',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 8
                            }
                        }
                    },
                    center: ['50%', '50%'],
                    data: [
                        {value: dataR.NumYiShengAndHuJi, name: '户籍'},
                        {value: dataR.NumYiShengAndFeiHuJi, name: '非户籍'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    },
                    labelLine:{
                        normal:{
                            length:1
                        }
                    },
                }];
                var option_jt_bc_hj_pie = chartPie(title_text, legend_data, series);
                jt_ys_pq_bar.setOption(option_jt_bc_hj_pie);

                title_text = "性别";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 12}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 12}
                }];
                series = [{
                    name: '老人性别',
                    type: 'pie',
                    radius: '40%',
                    label: {
                        normal: {
                            formatter: '{d}%\n{c}',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 8
                            }
                        }
                    },
                    center: ['50%', '50%'],
                    data: [
                        {value: dataR.NumBingChuangAndMale, name: '男'},
                        {value: dataR.NumBingChuangAndFemale, name: '女'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    },
                    labelLine:{
                        normal:{
                            length:1
                        }
                    },
                }];
                var option_jt_bc_sex_pie = chartPie(title_text, legend_data, series);
                jt_bc_sex_pie.setOption(option_jt_bc_sex_pie);

                title_text = '年龄';
                legend_data = [
                    {
                        name: '男',
                        textStyle: {
                            color: '#fff',
                            fontSize: 12
                        }
                    },
                    {
                        name: '女',
                        textStyle: {
                            color: '#fff',
                            fontSize: 12
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
                                    fontSize: 12
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        barWidth : 35,

                        barCateGoryGap:-10,
                        data: [dataR.NumBingChuangAnd90AboveM, dataR.NumBingChuangAnd80To90M, dataR.NumBingChuangAnd70To80M, dataR.NumBingChuangAnd60To70M]
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
                                    fontSize: 12
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_2
                            }
                        },
                        barWidth : 35,

                        barCateGoryGap:-10,
                        data: [dataR.NumBingChuangAnd90AboveF, dataR.NumBingChuangAnd80To90F, dataR.NumBingChuangAnd70To80F, dataR.NumBingChuangAnd60To70F]
                    }
                ];
                var option_jt_bc_age_bar = chartBar3(title_text, legend_data, yAxis_data, series);
                jt_bc_age_bar.setOption(option_jt_bc_age_bar);

                //片区人数分布
                title_text = "户籍";
                legend_data = [{name: '户籍', textStyle: {color: legend_color, fontSize: 12}}, {
                    name: '非户籍',
                    textStyle: {color: legend_color, fontSize: 12}
                }];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '40%',
                    label: {
                        normal: {
                            formatter: '{d}%\n{c}',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 8
                            }
                        }
                    },
                    center: ['50%', '50%'],
                    data: [
                        {value: dataR.NumBingChuangAndHuJi, name: '户籍'},
                        {value: dataR.NumBingChuangAndFeiHuJi, name: '非户籍'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    },
                    labelLine:{
                        normal:{
                            length:1
                        }
                    },
                }];
                var option_jt_bc_hj_pie = chartPie(title_text, legend_data, series);
                jt_bc_pq_bar.setOption(option_jt_bc_hj_pie);
            }
        }
    });
</script>
</html>