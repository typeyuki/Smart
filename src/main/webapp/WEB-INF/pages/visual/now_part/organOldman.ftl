<!DOCTYPE html>
<html>

<head>
<#include "../head.ftl" />
<script src="/static/js/echarts.js"></script>
    <script src="../../../static/js/echarts.js"></script>
    <script src="../../../static/js/chart_part.js"></script>
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
                            <p class="map_title" onclick="location.href='/visual/now/part/organ'" style="cursor: pointer;font-size: 30px;position: relative;top:15px">机构养老</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                        <#include "mapOrgan.ftl"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="position: relative;right: 10px">
            <#--<#include "table.ftl"/>-->
            </div>
        </div>
        <div class="col-lg-6" style="position: relative;top:35px;right:5px">
            <div class="row box a">
                <div class="zz"></div>
                <p class="title" style="font-size: 18px">古美路街道机构养老情况</p>
                <div class="col-lg-3">
                    <div id="organOldman_jg_sub_pie" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="organOldman_jg_sex_pie" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="organOldman_jg_age_bar" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="organOldman_jg_sub_wl" class="tu_big"></div>
                </div>
            </div>
            <div class="row box a">
                <div class="zz"></div>
                <p class="title" style="font-size: 18px">上海闵行区莲花敬老院</p>
                <div class="col-lg-3">
                    <div id="organOldman_jg_3_pie" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="organOldman_jg_3_sex" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="organOldman_jg_3_age" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="organOldman_jg_3_wl" class="tu_big"></div>
                </div>
            </div>
            <div class="row box a">
                <div class="zz"></div>
                <p class="title" style="font-size: 18px">上海闵行区古美敬老院</p>
                <div class="col-lg-3">
                    <div id="organOldman_jg_2_pie" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="organOldman_jg_2_sex" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="organOldman_jg_2_age" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="organOldman_jg_2_wl" class="tu_big"></div>
                </div>
            </div>
            <div class="row box a">
                <div class="zz"></div>
                <p class="title" style="font-size: 18px">上海闵行区平阳敬老院</p>
                <div class="col-lg-3">
                    <div id="organOldman_jg_1_pie" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="organOldman_jg_1_sex" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="organOldman_jg_1_age" class="tu_big"></div>
                </div>
                <div class="col-lg-3">
                    <div id="organOldman_jg_1_wl" class="tu_big"></div>
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
        }else if(winWidth<1700 && winWidth>=1000){
            tu_big_w=winWidth/8.8;
            tu_big_h=winHeight/5.5;
        }else if(winWidth>1400 && winWidth<1700){
            tu_big_w=winWidth/8.8;
            tu_big_h=winHeight/5.5;
        }
        $(".tu_big").css('width',tu_big_w);
        $(".tu_big").css( 'height', tu_big_h);


        var organOldman_jg_sub_pie = echarts.init(document.getElementById('organOldman_jg_sub_pie'));
        var organOldman_jg_sub_wl= echarts.init(document.getElementById('organOldman_jg_sub_wl'));
        var organOldman_jg_1_pie= echarts.init(document.getElementById('organOldman_jg_1_pie'));
        var organOldman_jg_1_wl = echarts.init(document.getElementById('organOldman_jg_1_wl'));
        var organOldman_jg_2_pie= echarts.init(document.getElementById('organOldman_jg_2_pie'));
        var organOldman_jg_2_wl = echarts.init(document.getElementById('organOldman_jg_2_wl'));
        var organOldman_jg_3_pie= echarts.init(document.getElementById('organOldman_jg_3_pie'));
        var organOldman_jg_3_wl = echarts.init(document.getElementById('organOldman_jg_3_wl'));

        var organOldman_jg_sex_pie = echarts.init(document.getElementById('organOldman_jg_sex_pie'));
        var organOldman_jg_age_bar = echarts.init(document.getElementById('organOldman_jg_age_bar'));
        var organOldman_jg_1_age = echarts.init(document.getElementById('organOldman_jg_1_age'));
        var organOldman_jg_1_sex = echarts.init(document.getElementById('organOldman_jg_1_sex'));
        var organOldman_jg_2_age = echarts.init(document.getElementById('organOldman_jg_2_age'));
        var organOldman_jg_2_sex = echarts.init(document.getElementById('organOldman_jg_2_sex'));
        var organOldman_jg_3_age = echarts.init(document.getElementById('organOldman_jg_3_age'));
        var organOldman_jg_3_sex = echarts.init(document.getElementById('organOldman_jg_3_sex'));
    </script>
</div>


</body>
<script>

    //    title_text="";
    //    legend_data=[{name:'已入住',textStyle:{color:legend_color,fontSize:8}},{name:'剩余',textStyle:{color:legend_color,fontSize:8}}];
    //    series=[{
    //        name: '',
    //        type: 'pie',
    //        radius : '45%',
    //        center: ['48%', '50%'],
    //        label : {
    //            normal : {
    //                formatter: '{d}%\n({c})',
    //                textStyle : {
    //                    fontWeight : 'normal',
    //                    fontSize : 8
    //                }
    //            }
    //        },
    //        data:[
    //            {value:476, name:'已入住'},
    //            {value:376, name:'剩余'}
    //        ],
    //        itemStyle: {
    //            emphasis: {
    //                shadowBlur: 10,
    //                shadowOffsetX: 0,
    //                shadowColor: 'rgba(0, 0, 0, 0.5)'
    //            }
    //        }
    //    }];
    //    var option_sub_pie = chartPie2(title_text,legend_data,series);
    //
    //    title_text="";
    //    // legend_data=[];
    //    // series=[
    //    //     {
    //    //         name:'未来空余',
    //    //         type:'pie',
    //    //         radius: ['50%', '65%'],
    //    //         avoidLabelOverlap: false,
    //    //         label: {
    //    //             normal : {
    //    //                 position:"center",
    //    //                 formatter: '{a}\n{c}',
    //    //                 textStyle : {
    //    //                     fontWeight : 'normal',
    //    //                     fontSize : 18,
    //    //                     color:"#f2f989"
    //    //                 }
    //    //             }
    //    //         },
    //    //         data:[
    //    //             {value:40, name:'未来空余'}
    //    //         ]
    //    //     }
    //    // ];
    //    var option_sub_wl = gauge(title_text);
    //    title_text="";
    //    legend_data=[{name:'已入住',textStyle:{color:legend_color,fontSize:8}},{name:'剩余',textStyle:{color:legend_color,fontSize:8}}];
    //    series=[{
    //        name: '',
    //        type: 'pie',
    //        radius : '45%',
    //        center: ['48%', '50%'],
    //        label : {
    //            normal : {
    //                formatter: '{d}%\n({c})',
    //                textStyle : {
    //                    fontWeight : 'normal',
    //                    fontSize : 8
    //                }
    //            }
    //        },
    //        data:[
    //            {value:476, name:'已入住'},
    //            {value:376, name:'剩余'}
    //        ],
    //        itemStyle: {
    //            emphasis: {
    //                shadowBlur: 10,
    //                shadowOffsetX: 0,
    //                shadowColor: 'rgba(0, 0, 0, 0.5)'
    //            }
    //        }
    //    }];
    //    var option_1_pie = chartPie2(title_text,legend_data,series);
    //
    //    // title_text="";
    //    // legend_data=[];
    //    // series=[
    //    //     {
    //    //         name:'未来空余',
    //    //         type:'pie',
    //    //         radius: ['50%', '65%'],
    //    //         avoidLabelOverlap: false,
    //    //         label: {
    //    //             normal : {
    //    //                 position:"center",
    //    //                 formatter: '{a}\n{c}',
    //    //                 textStyle : {
    //    //                     fontWeight : 'normal',
    //    //                     fontSize : 18,
    //    //                     color:"#f2f989"
    //    //                 }
    //    //             }
    //    //         },
    //    //         data:[
    //    //             {value:40, name:'未来空余'}
    //    //         ]
    //    //     }
    //    // ];
    //    var option_1_wl = gauge(title_text);
    //
    //    title_text="";
    //    legend_data=[{name:'已入住',textStyle:{color:legend_color,fontSize:8}},{name:'剩余',textStyle:{color:legend_color,fontSize:8}}];
    //    series=[{
    //        name: '',
    //        type: 'pie',
    //        radius : '45%',
    //        center: ['48%', '50%'],
    //        label : {
    //            normal : {
    //                formatter: '{d}%\n({c})',
    //                textStyle : {
    //                    fontWeight : 'normal',
    //                    fontSize : 8
    //                }
    //            }
    //        },
    //        data:[
    //            {value:476, name:'已入住'},
    //            {value:376, name:'剩余'}
    //        ],
    //        itemStyle: {
    //            emphasis: {
    //                shadowBlur: 10,
    //                shadowOffsetX: 0,
    //                shadowColor: 'rgba(0, 0, 0, 0.5)'
    //            }
    //        }
    //    }];
    //    var option_2_pie = chartPie2(title_text,legend_data,series);
    //
    //    // title_text="";
    //    // legend_data=[];
    //    // series=[
    //    //     {
    //    //         name:'未来空余',
    //    //         type:'pie',
    //    //         radius: ['50%', '65%'],
    //    //         avoidLabelOverlap: false,
    //    //         label: {
    //    //             normal : {
    //    //                 position:"center",
    //    //                 formatter: '{a}\n{c}',
    //    //                 textStyle : {
    //    //                     fontWeight : 'normal',
    //    //                     fontSize : 18,
    //    //                     color:"#f2f989"
    //    //                 }
    //    //             }
    //    //         },
    //    //         data:[
    //    //             {value:40, name:'未来空余'}
    //    //         ]
    //    //     }
    //    // ];
    //    var option_2_wl = gauge(title_text);
    //    title_text="";
    //    legend_data=[{name:'已入住',textStyle:{color:legend_color,fontSize:8}},{name:'剩余',textStyle:{color:legend_color,fontSize:8}}];
    //    series=[{
    //        name: '',
    //        type: 'pie',
    //        radius : '45%',
    //        center: ['48%', '50%'],
    //        label : {
    //            normal : {
    //                formatter: '{d}%\n({c})',
    //                textStyle : {
    //                    fontWeight : 'normal',
    //                    fontSize : 10
    //                }
    //            }
    //        },
    //        data:[
    //            {value:476, name:'已入住'},
    //            {value:376, name:'剩余'}
    //        ],
    //        itemStyle: {
    //            emphasis: {
    //                shadowBlur: 10,
    //                shadowOffsetX: 0,
    //                shadowColor: 'rgba(0, 0, 0, 0.5)'
    //            }
    //        }
    //    }];
    //    var option_3_pie = chartPie2(title_text,legend_data,series);
    //
    //    // title_text="";
    //    // legend_data=[];
    //    // series=[
    //    //     {
    //    //         name:'未来空余',
    //    //         type:'pie',
    //    //         radius: ['50%', '65%'],
    //    //         avoidLabelOverlap: false,
    //    //         label: {
    //    //             normal : {
    //    //                 position:"center",
    //    //                 formatter: '{a}\n{c}',
    //    //                 textStyle : {
    //    //                     fontWeight : 'normal',
    //    //                     fontSize : 18,
    //    //                     color:"#f2f989"
    //    //                 }
    //    //             }
    //    //         },
    //    //         data:[
    //    //             {value:40, name:'未来空余'}
    //    //         ]
    //    //     }
    //    // ];
    //    var option_3_wl = gauge(title_text);
    //
    //    jg_sub_pie.setOption(option_sub_pie);
    //    jg_sub_wl.setOption(option_sub_wl);
    //    jg_1_pie.setOption(option_1_pie);
    //    jg_1_wl.setOption(option_1_wl);
    //    jg_2_pie.setOption(option_2_pie);
    //    jg_2_wl.setOption(option_2_wl);
    //    jg_3_pie.setOption(option_3_pie);
    //    jg_3_wl.setOption(option_3_wl);
    //
    //    //性别饼图
    //    title_text="性别";
    //    legend_data=[{name:'男',textStyle:{color:legend_color,fontSize:8}},{name:'女',textStyle:{color:legend_color,fontSize:8}}];
    //        series=[{
    //        name: '老人性别',
    //        type: 'pie',
    //        radius : '45%',
    //        label : {
    //            normal : {
    //                formatter: '{d}%\n({c})',
    //                textStyle : {
    //                    fontWeight : 'normal',
    //                    fontSize : 8
    //                }
    //            }
    //        },
    //        center: ['48%', '50%'],
    //        data:[
    //            {value:476, name:'男'},
    //            {value:376, name:'女'}
    //        ],
    //        itemStyle: {
    //            emphasis: {
    //                shadowBlur: 10,
    //                shadowOffsetX: 0,
    //                shadowColor: 'rgba(0, 0, 0, 0.5)'
    //            }
    //        }
    //    }];
    //    var option_jg_sex_pie = chartPie2(title_text,legend_data,series);
    //    jg_sex_pie.setOption(option_jg_sex_pie);
    //    //性别饼图
    //    title_text="性别";
    //    legend_data=[{name:'男',textStyle:{color:legend_color,fontSize:8}},{name:'女',textStyle:{color:legend_color,fontSize:8}}];
    //    series=[{
    //        name: '老人性别',
    //        type: 'pie',
    //        radius : '45%',
    //        label : {
    //            normal : {
    //                formatter: '{d}%\n({c})',
    //                textStyle : {
    //                    fontWeight : 'normal',
    //                    fontSize : 8
    //                }
    //            }
    //        },
    //        center: ['48%', '50%'],
    //        data:[
    //            {value:476, name:'男'},
    //            {value:376, name:'女'}
    //        ],
    //        itemStyle: {
    //            emphasis: {
    //                shadowBlur: 10,
    //                shadowOffsetX: 0,
    //                shadowColor: 'rgba(0, 0, 0, 0.5)'
    //            }
    //        }
    //    }];
    //    var option_jg_1_sex = chartPie2(title_text,legend_data,series);
    //    jg_1_sex.setOption(option_jg_1_sex);
    //    //性别饼图
    //    title_text="性别";
    //    legend_data=[{name:'男',textStyle:{color:legend_color,fontSize:8}},{name:'女',textStyle:{color:legend_color,fontSize:8}}];
    //    series=[{
    //        name: '老人性别',
    //        type: 'pie',
    //        radius : '45%',
    //        label : {
    //            normal : {
    //                formatter: '{d}%\n({c})',
    //                textStyle : {
    //                    fontWeight : 'normal',
    //                    fontSize : 10
    //                }
    //            }
    //        },
    //        center: ['48%', '50%'],
    //        data:[
    //            {value:476, name:'男'},
    //            {value:376, name:'女'}
    //        ],
    //        itemStyle: {
    //            emphasis: {
    //                shadowBlur: 10,
    //                shadowOffsetX: 0,
    //                shadowColor: 'rgba(0, 0, 0, 0.5)'
    //            }
    //        }
    //    }];
    //    var option_jg_2_sex = chartPie2(title_text,legend_data,series);
    //    jg_2_sex.setOption(option_jg_2_sex);
    //    //性别饼图
    //    title_text="性别";
    //    legend_data=[{name:'男',textStyle:{color:legend_color,fontSize:8}},{name:'女',textStyle:{color:legend_color,fontSize:8}}];
    //    series=[{
    //        name: '老人性别',
    //        type: 'pie',
    //        radius : '45%',
    //        label : {
    //            normal : {
    //                formatter: '{d}%\n({c})',
    //                textStyle : {
    //                    fontWeight : 'normal',
    //                    fontSize : 8
    //                }
    //            }
    //        },
    //        center: ['48%', '50%'],
    //        data:[
    //            {value:476, name:'男'},
    //            {value:376, name:'女'}
    //        ],
    //        itemStyle: {
    //            emphasis: {
    //                shadowBlur: 10,
    //                shadowOffsetX: 0,
    //                shadowColor: 'rgba(0, 0, 0, 0.5)'
    //            }
    //        }
    //    }];
    //    var option_jg_3_sex = chartPie2(title_text,legend_data,series);
    //    jg_3_sex.setOption(option_jg_3_sex);
    //
    //    title_text='年龄';
    //    legend_data=[
    //        {
    //            name:'男',
    //            textStyle:{
    //                color:'#fff',
    //                fontSize:10
    //            }
    //        },
    //        {
    //            name:'女',
    //            textStyle:{
    //                color:'#fff',
    //                fontSize:10
    //            }}
    //    ];
    //    yAxis_data=['90-   ','80-90','70-80','60-70'];
    //    series=[
    //        {
    //            name: '男',
    //            type: 'bar',
    //            stack: '总量',
    //            label: {
    //                normal: {
    //                    show: true,
    //                    position: 'insideLeft',
    //                    textStyle:{
    //                        fontSize:10
    //                    }
    //
    //                }
    //            },
    //            itemStyle:{
    //                normal: {
    //                    color:series_color_1
    //                }
    //            },
    //            data: [67,134,234,534]
    //        },
    //        {
    //            name: '女',
    //            type: 'bar',
    //            stack: '总量',
    //            label: {
    //                normal: {
    //                    show: true,
    //                    position: 'insideRight',
    //                    textStyle:{
    //                        fontSize:10
    //                    }
    //                }
    //            },
    //            itemStyle:{
    //                normal: {
    //                    color:series_color_2
    //                }
    //            },
    //            data: [7,34,134,234]
    //        }
    //    ];
    //    var option_jg_age_bar=chartBar2(title_text,legend_data,yAxis_data,series);
    //    jg_age_bar.setOption(option_jg_age_bar);
    //    title_text='年龄';
    //    legend_data=[
    //        {
    //            name:'男',
    //            textStyle:{
    //                color:'#fff',
    //                fontSize:8
    //            }
    //        },
    //        {
    //            name:'女',
    //            textStyle:{
    //                color:'#fff',
    //                fontSize:8
    //            }}
    //    ];
    //    yAxis_data=['90-   ','80-90','70-80','60-70'];
    //    series=[
    //        {
    //            name: '男',
    //            type: 'bar',
    //            stack: '总量',
    //            label: {
    //                normal: {
    //                    show: true,
    //                    position: 'insideLeft',
    //                    textStyle:{
    //                        fontSize:8
    //                    }
    //                }
    //            },
    //            itemStyle:{
    //                normal: {
    //                    color:series_color_1
    //                }
    //            },
    //            data: [67,134,234,534]
    //        },
    //        {
    //            name: '女',
    //            type: 'bar',
    //            stack: '总量',
    //            label: {
    //                normal: {
    //                    show: true,
    //                    position: 'insideRight',
    //                    textStyle:{
    //                        fontSize:10
    //                    }
    //                }
    //            },
    //            itemStyle:{
    //                normal: {
    //                    color:series_color_2
    //                }
    //            },
    //            data: [7,34,134,234]
    //        }
    //    ];
    //    var option_jg_1_age=chartBar2(title_text,legend_data,yAxis_data,series);
    //    jg_1_age.setOption(option_jg_1_age);
    //    title_text='年龄';
    //    legend_data=[
    //        {
    //            name:'男',
    //            textStyle:{
    //                color:'#fff',
    //                fontSize:8
    //            }
    //        },
    //        {
    //            name:'女',
    //            textStyle:{
    //                color:'#fff',
    //                fontSize:8
    //            }}
    //    ];
    //    yAxis_data=['90-   ','80-90','70-80','60-70'];
    //    series=[
    //        {
    //            name: '男',
    //            type: 'bar',
    //            stack: '总量',
    //            label: {
    //                normal: {
    //                    show: true,
    //                    position: 'insideLeft',
    //                    textStyle:{
    //                        fontSize:8
    //                    }
    //                }
    //            },
    //            itemStyle:{
    //                normal: {
    //                    color:series_color_1
    //                }
    //            },
    //            data: [67,134,234,534]
    //        },
    //        {
    //            name: '女',
    //            type: 'bar',
    //            stack: '总量',
    //            label: {
    //                normal: {
    //                    show: true,
    //                    position: 'insideRight',
    //                    textStyle:{
    //                        fontSize:10
    //                    }
    //                }
    //            },
    //            itemStyle:{
    //                normal: {
    //                    color:series_color_2
    //                }
    //            },
    //            data: [7,34,134,234]
    //        }
    //    ];
    //    var option_jg_2_age=chartBar2(title_text,legend_data,yAxis_data,series);
    //    jg_2_age.setOption(option_jg_2_age);
    //    title_text='年龄';
    //    legend_data=[
    //        {
    //            name:'男',
    //            textStyle:{
    //                color:'#fff',
    //                fontSize:8
    //            }
    //        },
    //        {
    //            name:'女',
    //            textStyle:{
    //                color:'#fff',
    //                fontSize:8
    //            }}
    //    ];
    //    yAxis_data=['90-   ','80-90','70-80','60-70'];
    //    series=[
    //        {
    //            name: '男',
    //            type: 'bar',
    //            stack: '总量',
    //            label: {
    //                normal: {
    //                    show: true,
    //                    position: 'insideLeft',
    //                    textStyle:{
    //                        fontSize:8
    //                    }
    //                }
    //            },
    //            itemStyle:{
    //                normal: {
    //                    color:series_color_1
    //                }
    //            },
    //            data: [67,134,234,534]
    //        },
    //        {
    //            name: '女',
    //            type: 'bar',
    //            stack: '总量',
    //            label: {
    //                normal: {
    //                    show: true,
    //                    position: 'insideRight',
    //                    textStyle:{
    //                        fontSize:8
    //                    }
    //                }
    //            },
    //            itemStyle:{
    //                normal: {
    //                    color:series_color_2
    //                }
    //            },
    //            data: [7,34,134,234]
    //        }
    //    ];
    //    var option_jg_3_age=chartBar2(title_text,legend_data,yAxis_data,series);
    //    jg_3_age.setOption(option_jg_3_age);

    //new
    $.ajax({
        url: "/visual/data/getVisualDataApartYLY",
        type: "get",
        success: function (result) {
            if (result.success == true) {
                var dataR = result.data;
                title_text = "床位数";
                legend_data = [{name: '已入住', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '剩余',
                    textStyle: {color: legend_color, fontSize:8}
                }];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '30%',
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
                        length:0.0001
                    },
                    data: [
                        {value: dataR.NumPingYangJLLive + dataR.NumGuMeiJLLive + dataR.NumLianHuaJLLive, name: '已入住'},
                        {value: dataR.NumPingYangJLRemain + dataR.NumGuMeiJLRemain + dataR.NumLianHuaJLRemain, name: '剩余'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var organOldman_option_sub_pie = chartPie2(title_text, legend_data, series);

                title_text = "健康状态";
                legend_data = [{name: '失能', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '失智',
                    textStyle: {color: legend_color, fontSize:8}
                },{name: '自理', textStyle: {color: legend_color, fontSize:8}}];
                series = [{
                    name: '老人健康状态',
                    type: 'pie',
                    radius: '30%',
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
                        length:0.0001
                    },
                    data: [
                        {value: dataR.NumPingYangJLAndShiNeng+dataR.NumGuMeiJLAndShiNeng+dataR.NumLianHuaJLAndShiNeng, name: '失能'},
                        {value: dataR.NumPingYangJLAndShiZhi+dataR.NumGuMeiJLAndShiZhi+dataR.NumLianHuaJLAndShiZhi, name: '失智'},
                        {value: dataR.NumPingYangJLAndZiLi+dataR.NumGuMeiJLAndZiLi+dataR.NumLianHuaJLAndZiLi, name: '自理'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var organOldman_option_sub_wl =chartPie2(title_text, legend_data, series);

                title_text = "床位数";
                legend_data = [{name: '已入住', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '剩余',
                    textStyle: {color: legend_color, fontSize:8}
                }];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '30%',
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
                        {value: dataR.NumPingYangJLLive, name: '已入住'},
                        {value: dataR.NumPingYangJLRemain, name: '剩余'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var organOldman_option_1_pie = chartPie2(title_text, legend_data, series);


                title_text = "健康状态";
                legend_data = [{name: '失能', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '失智',
                    textStyle: {color: legend_color, fontSize:8}
                },{name: '自理', textStyle: {color: legend_color, fontSize:8}}];
                series = [{
                    name: '老人健康状态',
                    type: 'pie',
                    radius: '30%',
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
                        {value: dataR.NumPingYangJLAndShiNeng, name: '失能'},
                        {value: dataR.NumPingYangJLAndShiZhi, name: '失智'},
                        {value: dataR.NumPingYangJLAndZiLi, name: '自理'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var organOldman_option_1_wl = chartPie2(title_text, legend_data, series);
                title_text = "床位数";
                legend_data = [{name: '已入住', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '剩余',
                    textStyle: {color: legend_color, fontSize:8}
                }];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '30%',
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
                    data: [
                        {value: dataR.NumGuMeiJLLive, name: '已入住'},
                        {value: dataR.NumGuMeiJLRemain, name: '剩余'}
                    ],
                    labelLine: {
                        show: true,
                        length:0.001
                    },
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var organOldman_option_2_pie = chartPie2(title_text, legend_data, series);

                title_text = "健康状态";
                legend_data = [{name: '失能', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '失智',
                    textStyle: {color: legend_color, fontSize:8}
                },{name: '自理', textStyle: {color: legend_color, fontSize:8}}];
                series = [{
                    name: '老人健康状态',
                    type: 'pie',
                    radius: '30%',
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
                        {value: dataR.NumGuMeiJLAndShiNeng, name: '失能'},
                        {value: dataR.NumGuMeiJLAndShiZhi, name: '失智'},
                        {value: dataR.NumGuMeiJLAndZiLi, name: '自理'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var organOldman_option_2_wl =chartPie2(title_text, legend_data, series);

                title_text = "床位数";
                legend_data = [{name: '已入住', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '剩余',
                    textStyle: {color: legend_color, fontSize:8}
                }];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '30%',
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
                        {value: dataR.NumLianHuaJLLive, name: '已入住'},
                        {value: dataR.NumLianHuaJLRemain, name: '剩余'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var organOldman_option_3_pie = chartPie2(title_text, legend_data, series);

                title_text = "健康状态";
                legend_data = [{name: '失能', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '失智',
                    textStyle: {color: legend_color, fontSize:8}
                },{name: '自理', textStyle: {color: legend_color, fontSize:8}}];
                series = [{
                    name: '老人健康状态',
                    type: 'pie',
                    radius: '30%',
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
                        {value: dataR.NumLianHuaJLAndShiNeng, name: '失能'},
                        {value: dataR.NumLianHuaJLAndShiZhi, name: '失智'},
                        {value: dataR.NumLianHuaJLAndZiLi, name: '自理'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var organOldman_option_3_wl =chartPie2(title_text, legend_data, series);

                organOldman_jg_sub_pie.setOption(organOldman_option_sub_pie);
                organOldman_jg_sub_wl.setOption(organOldman_option_sub_wl);
                organOldman_jg_1_pie.setOption(organOldman_option_1_pie);
                organOldman_jg_1_wl.setOption(organOldman_option_1_wl);
                organOldman_jg_2_pie.setOption(organOldman_option_2_pie);
                organOldman_jg_2_wl.setOption(organOldman_option_2_wl);
                organOldman_jg_3_pie.setOption(organOldman_option_3_pie);
                organOldman_jg_3_wl.setOption(organOldman_option_3_wl);

                //性别饼图
                title_text = "性别";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize:8}
                }];
                series = [{
                    name: '老人性别',
                    type: 'pie',
                    radius: '30%',
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
                    center: ['40%', '60%'],
                    data: [
                        {
                            value: dataR.NumPingYangJLAndMale + dataR.NumGuMeiJLAndMale + dataR.NumLianHuaJLAndMale,
                            name: '男'
                        },
                        {
                            value: dataR.NumPingYangJLAndFemale + dataR.NumGuMeiJLAndFemale + dataR.NumLianHuaJLAndFemale,
                            name: '女'
                        }
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var organOldman_option_jg_sex_pie = chartPie2(title_text, legend_data, series);
                organOldman_jg_sex_pie.setOption(organOldman_option_jg_sex_pie);
                //性别饼图
                title_text = "性别";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize:8}
                }];
                series = [{
                    name: '老人性别',
                    type: 'pie',
                    radius: '30%',
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
                    center: ['40%', '60%'],
                    data: [
                        {value: dataR.NumPingYangJLAndMale, name: '男'},
                        {value: dataR.NumPingYangJLAndFemale, name: '女'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var organOldman_option_jg_1_sex = chartPie2(title_text, legend_data, series);
                organOldman_jg_1_sex.setOption(organOldman_option_jg_1_sex);
                //性别饼图
                title_text = "性别";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize:8}
                }];
                series = [{
                    name: '老人性别',
                    type: 'pie',
                    radius: '30%',
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
                    center: ['40%', '60%'],
                    data: [
                        {value: dataR.NumGuMeiJLAndMale, name: '男'},
                        {value: dataR.NumGuMeiJLAndFemale, name: '女'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var organOldman_option_jg_2_sex = chartPie2(title_text, legend_data, series);
                organOldman_jg_2_sex.setOption(organOldman_option_jg_2_sex);
                //性别饼图
                title_text = "性别";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize:8}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize:8}
                }];
                series = [{
                    name: '老人性别',
                    type: 'pie',
                    radius: '30%',
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
                    center: ['40%', '60%'],
                    data: [
                        {value: dataR.NumLianHuaJLAndMale, name: '男'},
                        {value: dataR.NumLianHuaJLAndFemale, name: '女'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var organOldman_option_jg_3_sex = chartPie2(title_text, legend_data, series);
                organOldman_jg_3_sex.setOption(organOldman_option_jg_3_sex);

                title_text = '年龄';
                legend_data = [
                    {
                        name: '男',
                        textStyle: {
                            color: '#fff',
                            fontSize:8
                        }
                    },
                    {
                        name: '女',
                        textStyle: {
                            color: '#fff',
                            fontSize:8
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
                                    fontSize:8
                                }

                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumPingYangJLAnd90AboveM + dataR.NumGuMeiJLAnd90AboveM + dataR.NumLianHuaJLAnd90AboveM,
                            dataR.NumPingYangJLAnd80To90M + dataR.NumGuMeiJLAnd80To90M + dataR.NumLianHuaJLAnd80To90M,
                            dataR.NumPingYangJLAnd70To80M + dataR.NumGuMeiJLAnd70To80M + dataR.NumLianHuaJLAnd70To80M,
                            dataR.NumPingYangJLAnd60To70M + dataR.NumGuMeiJLAnd60To70M + dataR.NumLianHuaJLAnd60To70M],
                        barWidth:16
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
                                    fontSize:8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_2
                            }
                        },
                        data: [dataR.NumPingYangJLAnd90AboveF + dataR.NumGuMeiJLAnd90AboveF + dataR.NumLianHuaJLAnd90AboveF,
                            dataR.NumPingYangJLAnd80To90F + dataR.NumGuMeiJLAnd80To90F + dataR.NumLianHuaJLAnd80To90F,
                            dataR.NumPingYangJLAnd70To80F + dataR.NumGuMeiJLAnd70To80F + dataR.NumLianHuaJLAnd70To80F,
                            dataR.NumPingYangJLAnd60To70F + dataR.NumGuMeiJLAnd60To70F + dataR.NumLianHuaJLAnd60To70F]
                    }
                ];
                var organOldman_option_jg_age_bar = chartBar2(title_text, legend_data, yAxis_data, series);
                organOldman_jg_age_bar.setOption(organOldman_option_jg_age_bar);
                title_text = '年龄';
                legend_data = [
                    {
                        name: '男',
                        textStyle: {
                            color: '#fff',
                            fontSize:8
                        }
                    },
                    {
                        name: '女',
                        textStyle: {
                            color: '#fff',
                            fontSize:8
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
                                    fontSize:8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumPingYangJLAnd90AboveM, dataR.NumPingYangJLAnd80To90M, dataR.NumPingYangJLAnd70To80M, dataR.NumPingYangJLAnd60To70M],
                        barWidth:16
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
                                    fontSize:8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_2
                            }
                        },
                        data: [dataR.NumPingYangJLAnd90AboveF, dataR.NumPingYangJLAnd80To90F, dataR.NumPingYangJLAnd70To80F, dataR.NumPingYangJLAnd60To70F]
                    }
                ];
                var organOldman_option_jg_1_age = chartBar2(title_text, legend_data, yAxis_data, series);
                organOldman_jg_1_age.setOption(organOldman_option_jg_1_age);
                title_text = '年龄';
                legend_data = [
                    {
                        name: '男',
                        textStyle: {
                            color: '#fff',
                            fontSize:8
                        }
                    },
                    {
                        name: '女',
                        textStyle: {
                            color: '#fff',
                            fontSize:8
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
                                    fontSize:8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumGuMeiJLAnd90AboveM, dataR.NumGuMeiJLAnd80To90M, dataR.NumGuMeiJLAnd70To80M, dataR.NumGuMeiJLAnd60To70M],
                        barWidth:16
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
                                    fontSize:8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_2
                            }
                        },
                        data: [dataR.NumGuMeiJLAnd90AboveF, dataR.NumGuMeiJLAnd80To90F, dataR.NumGuMeiJLAnd70To80F, dataR.NumGuMeiJLAnd60To70F]
                    }
                ];
                var organOldman_option_jg_2_age = chartBar2(title_text, legend_data, yAxis_data, series);
                organOldman_jg_2_age.setOption(organOldman_option_jg_2_age);
                title_text = '年龄';
                legend_data = [
                    {
                        name: '男',
                        textStyle: {
                            color: '#fff',
                            fontSize:8
                        }
                    },
                    {
                        name: '女',
                        textStyle: {
                            color: '#fff',
                            fontSize:8
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
                                    fontSize:8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumLianHuaJLAnd90AboveM, dataR.NumLianHuaJLAnd80To90M, dataR.NumLianHuaJLAnd70To80M, dataR.NumLianHuaJLAnd60To70M],
                        barWidth:16
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
                                    fontSize:8
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_2
                            }
                        },
                        data: [dataR.NumLianHuaJLAnd90AboveF, dataR.NumLianHuaJLAnd80To90F, dataR.NumLianHuaJLAnd70To80F, dataR.NumLianHuaJLAnd60To70F]
                    }
                ];
                var organOldman_option_jg_3_age = chartBar2(title_text, legend_data, yAxis_data, series);
                organOldman_jg_3_age.setOption(organOldman_option_jg_3_age);
                //alert(dataR.NumGuMeiJLAnd90AboveM);
            }
        }
    });

</script>
</html>