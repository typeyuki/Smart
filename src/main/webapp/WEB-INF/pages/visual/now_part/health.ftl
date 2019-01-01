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
                    <div class="row">
                        <div class="col-lg-12">
                            <p class="map_title" onclick="location.href='/visual/now/part/oldman'" style="cursor: pointer;font-size: 30px;position: relative;top:15px">古美路街道老人分布图</p>
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
        <div class="col-lg-6"style="position: relative;top: 20px;right:10px">
            <div class="row">
                <div class="col-lg-6 box"  align="center">
                    <div class="zz"></div>
                    <div id="healthPie" class="tu_big"></div>
                </div>
                <div class="col-lg-6 box line">
                    <div class="zz"></div>
                    <div id="healthLine" class="tu_big"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 box">
                    <div class="zz"></div>
                    <div id="hjPie" class="tu"></div>
                </div>
                <div class="col-lg-4 box line">
                    <div class="zz"></div>
                    <div id="sexPie" class="tu"></div>
                </div>
                <div class="col-lg-4 box" style="position: relative;left: 10px">
                    <div class="zz"></div>
                    <div id="ageBar" class="tu"></div>
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
        }else if(winWidth<=1400 && winWidth>=1300){
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

        var ageBar = echarts.init(document.getElementById('ageBar'));
        var sexPie= echarts.init(document.getElementById('sexPie'));
        var hjPie= echarts.init(document.getElementById('hjPie'));
        var healthLine = echarts.init(document.getElementById('healthLine'));
        var healthPie= echarts.init(document.getElementById('healthPie'));
    </script>
</div>


</body>
<script>
    $.ajax({
        url: "/visual/data/getVisualDataApartHealth",
        type: "get",
        success: function (result) {
            if (result.success == true) {

                dataR = result.data;
                pieOldNum = dataR.NumOld;
                pieAllNum = dataR.NumAll;
                pieOldNum80 = dataR.NumOld80;
                //健康状态
                title_text = "健康状态";
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
                                fontSize: 10
                            }
                        }
                    },

                    center: ['48%', '60%'],
                    data: [
                        {value: dataR.NumSN, name: '失能'},
                        {value: dataR.NumMB, name: '慢病'},
                        {value: dataR.NumZLS, name: '肿瘤史'},
                        {value: dataR.NumGZS, name: '骨折史'},
                        {value: dataR.NumSZ, name: '失智'},
                        {value: dataR.NumCHXPJ, name: '长护险评级'},
                        {value: dataR.NumQiTaHealth, name: '其他'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_health_pie = chartPie(title_text, legend_data, series);
                //家庭结构增长趋势图
                title_text = '健康状态变化趋势图';
                xAxis_data = ['2月', '3月', '4月', '今天', '6月', '7月', '8月'];
                series = [
                    {
                        name: '失能',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                lineStyle: {
                                    width: 1,
                                    color: series_color_1
                                },
                                label: {
                                    show: true
                                },
                                color: series_color_1
                            }
                        },
                        label: {
                            normal: {
                                textStyle: {
                                    fontSize: 10
                                }

                            }

                        },
                        markLine: {
                            itemStyle: {
                                normal: {
                                    lineStyle: {type: 'solid', color: 'orange'},
                                    label: {show: true, position: 'left', textStyle: {color: 'red', fontSize: 20}}
                                }
                            },
                            large: true,
                            symbol: "diamond",
                            symbolSize: 12,
                            effect: {
                                show: false,
                                loop: true,
                                period: 0,
                                scaleSize: 2,
                                color: null,
                                shadowColor: null,
                                shadowBlur: null
                            },
                            data: [
                                [
                                    {
                                        coord: [3, 0]
                                    },
                                    {
                                        coord: [3, 55]
                                    }
                                ]
                            ]
                        },
                        symbolSize: 8,
                        data: [40, 45, 50, {

                            value: 55,

                            symbol: 'circle', // 数据级个性化拐点图形

                            symbolSize: 20,

                            hoverAnimation: true,
                            label: {
                                show: true,
                                fontSize: 10
                            },
                            itemStyle: {

                                normal: {
                                    color: 'white'
                                }
                            }
                        }, 55, 55, 55]
                    },
                    {
                        name: '慢病',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                lineStyle: {
                                    width: 1,
                                    color: series_color_2
                                },
                                label: {
                                    show: true
                                },
                                color: series_color_2
                            }
                        },
                        label: {
                            normal: {
                                textStyle: {
                                    fontSize: 10
                                }

                            }

                        },

                        markLine: {
                            itemStyle: {
                                normal: {
                                    lineStyle: {type: 'solid', color: 'orange'},
                                    label: {show: true, position: 'left', textStyle: {color: 'red', fontSize: 20}}
                                }
                            },
                            large: true,
                            symbol: "diamond",
                            symbolSize: 12,
                            effect: {
                                show: false,
                                loop: true,
                                period: 0,
                                scaleSize: 2,
                                color: null,
                                shadowColor: null,
                                shadowBlur: null
                            },
                            data: [
                                [
                                    {
                                        coord: [3, 0]
                                    },
                                    {
                                        coord: [3, 10]
                                    }
                                ]
                            ]
                        },
                        symbolSize: 8,
                        data: [10, 15, 10, {

                            value: 10,

                            symbol: 'circle', // 数据级个性化拐点图形

                            symbolSize: 20,

                            hoverAnimation: true,
                            label: {
                                show: true,
                                fontSize: 10
                            },
                            itemStyle: {

                                normal: {
                                    color: 'white'
                                }
                            }
                        }, 10, 10, 10]
                    }
                    ,
                    {
                        name: '肿瘤史',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                lineStyle: {
                                    width: 1,
                                    color: series_color_3
                                },
                                label: {
                                    show: true
                                },
                                color: series_color_3
                            }
                        },
                        label: {
                            normal: {
                                textStyle: {
                                    fontSize: 10
                                }

                            }

                        },
                        markLine: {
                            itemStyle: {
                                normal: {
                                    lineStyle: {type: 'solid', color: 'orange'},
                                    label: {show: true, position: 'left', textStyle: {color: 'red', fontSize: 20}}
                                }
                            },
                            large: true,
                            symbol: "diamond",
                            symbolSize: 12,
                            effect: {
                                show: false,
                                loop: true,
                                period: 0,
                                scaleSize: 2,
                                color: null,
                                shadowColor: null,
                                shadowBlur: null
                            },
                            data: [
                                [
                                    {
                                        coord: [3, 0]
                                    },
                                    {
                                        coord: [3, 20]
                                    }
                                ]
                            ]
                        },
                        symbolSize: 8,
                        data: [20, 15, 10, {

                            value: 20,

                            symbol: 'circle', // 数据级个性化拐点图形

                            symbolSize: 20,

                            hoverAnimation: true,
                            label: {
                                show: true
                            },
                            itemStyle: {

                                normal: {
                                    color: 'white'
                                }
                            }
                        }, 21, 20, 20]
                    }
                    ,
                    {
                        name: '骨折史',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                lineStyle: {
                                    width: 1,
                                    color: series_color_4
                                },
                                label: {
                                    show: true
                                },
                                color: series_color_4
                            }
                        },
                        label: {
                            normal: {
                                textStyle: {
                                    fontSize: 10
                                }

                            }

                        },
                        markLine: {
                            itemStyle: {
                                normal: {
                                    lineStyle: {type: 'solid', color: 'orange'},
                                    label: {show: true, position: 'left', textStyle: {color: 'red', fontSize: 20}}
                                }
                            },
                            large: true,
                            symbol: "diamond",
                            symbolSize: 12,
                            effect: {
                                show: false,
                                loop: true,
                                period: 0,
                                scaleSize: 2,
                                color: null,
                                shadowColor: null,
                                shadowBlur: null
                            },
                            data: [
                                [
                                    {
                                        coord: [3, 0]
                                    },
                                    {
                                        coord: [3, 30]
                                    }
                                ]
                            ]
                        },
                        symbolSize: 8,
                        data: [12, 15, 10, {

                            value: 30,

                            symbol: 'circle', // 数据级个性化拐点图形

                            symbolSize: 20,

                            hoverAnimation: true,
                            label: {
                                show: true,
                                fontSize: 10
                            },
                            itemStyle: {

                                normal: {
                                    color: 'white'
                                }
                            }
                        }, 30, 30, 30]
                    }
                    ,
                    {
                        name: '失智',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                lineStyle: {
                                    width: 1,
                                    color: series_color_5
                                },
                                label: {
                                    show: true
                                },
                                color: series_color_5
                            }
                        },
                        label: {
                            normal: {
                                textStyle: {
                                    fontSize: 10
                                }

                            }

                        },
                        markLine: {
                            itemStyle: {
                                normal: {
                                    lineStyle: {type: 'solid', color: 'orange'},
                                    label: {show: true, position: 'left', textStyle: {color: 'red', fontSize: 20}}
                                }
                            },
                            large: true,
                            symbol: "diamond",
                            symbolSize: 12,
                            effect: {
                                show: false,
                                loop: true,
                                period: 0,
                                scaleSize: 2,
                                color: null,
                                shadowColor: null,
                                shadowBlur: null
                            },
                            data: [
                                [
                                    {
                                        coord: [3, 0]
                                    },
                                    {
                                        coord: [3, 25]
                                    }
                                ]
                            ]
                        },
                        symbolSize: 8,
                        data: [10, 15, 30, {

                            value: 25,

                            symbol: 'circle', // 数据级个性化拐点图形

                            symbolSize: 20,

                            hoverAnimation: true,
                            label: {
                                show: true,
                                fontSize: 10
                            },
                            itemStyle: {

                                normal: {
                                    color: 'white'
                                }
                            }
                        }, 40, 40, 40]
                    },
                    {
                        name: '长护险评级',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                lineStyle: {
                                    width: 1,
                                    color: series_color_6
                                },
                                label: {
                                    show: true
                                },
                                color: series_color_6
                            }
                        },
                        label: {
                            normal: {
                                textStyle: {
                                    fontSize: 10
                                }

                            }

                        },
                        markLine: {
                            itemStyle: {
                                normal: {
                                    lineStyle: {type: 'solid', color: 'orange'},
                                    label: {show: true, position: 'left', textStyle: {color: 'red', fontSize: 20}}
                                }
                            },
                            large: true,
                            symbol: "diamond",
                            symbolSize: 12,
                            effect: {
                                show: false,
                                loop: true,
                                period: 0,
                                scaleSize: 2,
                                color: null,
                                shadowColor: null,
                                shadowBlur: null
                            },
                            data: [
                                [
                                    {
                                        coord: [3, 0]
                                    },
                                    {
                                        coord: [3, 40]
                                    }
                                ]
                            ]
                        },
                        symbolSize: 8,
                        data: [10, 15, 30, {

                            value: 40,

                            symbol: 'circle', // 数据级个性化拐点图形

                            symbolSize: 20,

                            hoverAnimation: true,
                            label: {
                                show: true,
                                fontSize: 10
                            },
                            itemStyle: {

                                normal: {
                                    color: 'white'
                                }
                            }
                        }, 22, 22, 22]
                    }
                    ,
                    {
                        name: '其他',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                lineStyle: {
                                    width: 1,
                                    color: series_color_7
                                },
                                label: {
                                    show: true
                                },
                                color: series_color_7
                            }
                        },
                        label: {
                            normal: {
                                textStyle: {
                                    fontSize: 10
                                }

                            }

                        },
                        markLine: {
                            itemStyle: {
                                normal: {
                                    lineStyle: {type: 'solid', color: 'orange'},
                                    label: {show: true, position: 'left', textStyle: {color: 'red', fontSize: 20}}
                                }
                            },
                            large: true,
                            symbol: "diamond",
                            symbolSize: 12,
                            effect: {
                                show: false,
                                loop: true,
                                period: 0,
                                scaleSize: 2,
                                color: null,
                                shadowColor: null,
                                shadowBlur: null
                            },
                            data: [
                                [
                                    {
                                        coord: [3, 0]
                                    },
                                    {
                                        coord: [3, 40]
                                    }
                                ]
                            ]
                        },
                        symbolSize: 8,
                        data: [10, 15, 30, {

                            value: 40,

                            symbol: 'circle', // 数据级个性化拐点图形

                            symbolSize: 20,

                            hoverAnimation: true,
                            label: {
                                show: true,
                                fontSize: 10
                            },
                            itemStyle: {

                                normal: {
                                    color: 'white'
                                }
                            }
                        }, 32, 32, 32]
                    }
                ];
                var option_health_line = chartLine(title_text, legend_data, xAxis_data, series);

                title_text = "户籍";
                legend_data = [{name: '户籍', textStyle: {color: legend_color, fontSize: 18}}, {
                    name: '非户籍',
                    textStyle: {color: legend_color, fontSize: 18}
                }];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '35%',
                    center: ['48%', '60%'],
                    label: {
                        normal: {
                            formatter: '{d}%\n({c})',
                            textStyle: {
                                fontWeight: 'normal',
                                fontSize: 10
                            }
                        }
                    },
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
                var option_area_pie = chartPie(title_text, legend_data, series);

                //性别饼图
                title_text = "性别";
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 18}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 18}
                }];
                series = [{
                    name: '老人性别',
                    type: 'pie',
                    radius: '35%',
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


                //    年龄分布柱状图
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
                        data: [dataR.NumAbove90M, dataR.Num80To90M, dataR.Num70To80M, dataR.Num60To70M],
                        barWidth:30
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
                        data: [dataR.NumAbove90F, dataR.Num80To90F, dataR.Num70To80F, dataR.Num60To70F]
                    }
                ];
                var option_age_bar = chartBar(title_text, legend_data, yAxis_data, series);


                healthPie.setOption(option_health_pie);
                healthPie.on('legendselectchanged', function (params) {
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
                healthLine.setOption(option_health_line);
                hjPie.setOption(option_area_pie);
                hjPie.on('legendselectchanged',function(params){
                    var name=params.name;
                    if(name=='户籍'){
                        census.push(12);
                        //district.push(district_no);

                    }else if(name=='非户籍'){
                        census.push(13);
                        //  district.push(district_no);

                    }
                    getJwData();
                    

                });
                sexPie.setOption(option_sex_pie);
                sexPie.on('legendselectchanged', function (params) {
                    var name = params.name;
                    if(name=="男"){
                        sex=2;

                    }else if(name=="女"){
                        sex=1;

                    }
                    getJwData();
                    

                });
                ageBar.setOption(option_age_bar);
                ageBar.on('legendselectchanged', function (params) {
                    var name = params.name;
                    if(name=="男"){
                        sex=2;

                    }else if(name=="女"){
                        sex=1;

                    }
                    getJwData();
                    
                });
            }
        }
    });
    healthPie.on('legendselectchanged', function (params) {
        var name = params.name;
        if (name == "失能") {
            change_health_info(dataR.NumShiNengAndMale, dataR.NumShiNengAndFemale, dataR.NumShiNengAndHuJi, dataR.NumShiNengAndFeiHuJi,
                    dataR.NumShiNengAnd90AboveM, dataR.NumShiNengAnd80To90M, dataR.NumShiNengAnd70To80M, dataR.NumShiNengAnd60To70M,
                    dataR.NumShiNengAnd90AboveF, dataR.NumShiNengAnd80To90F, dataR.NumShiNengAnd70To80F, dataR.NumShiNengAnd60To70F);

        }else  if (name == "慢病") {
            change_health_info(dataR.NumManBingAndMale, dataR.NumManBingAndFemale, dataR.NumManBingAndHuJi, dataR.NumManBingAndFeiHuJi,
                    dataR.NumManBingAnd90AboveM, dataR.NumManBingAnd80To90M, dataR.NumManBingAnd70To80M, dataR.NumManBingAnd60To70M,
                    dataR.NumManBingAnd90AboveF, dataR.NumManBingAnd80To90F, dataR.NumManBingAnd70To80F, dataR.NumManBingAnd60To70F);

        }else if (name == "肿瘤史") {
            change_health_info(dataR.NumShiNengAndMale, dataR.NumShiNengAndFemale, dataR.NumShiNengAndHuJi, dataR.NumShiNengAndFeiHuJi,
                    dataR.NumShiNengAnd90AboveM, dataR.NumShiNengAnd80To90M, dataR.NumShiNengAnd70To80M, dataR.NumShiNengAnd60To70M,
                    dataR.NumShiNengAnd90AboveF, dataR.NumShiNengAnd80To90F, dataR.NumShiNengAnd70To80F, dataR.NumShiNengAnd60To70F);

        }else if (name == "骨折史") {
            change_health_info(dataR.NumGuZheAndMale, dataR.NumGuZheAndFemale, dataR.NumGuZheAndHuJi, dataR.NumGuZheAndFeiHuJi,
                    dataR.NumGuZheAnd90AboveM, dataR.NumGuZheAnd80To90M, dataR.NumGuZheAnd70To80M, dataR.NumGuZheAnd60To70M,
                    dataR.NumGuZheAnd90AboveF, dataR.NumGuZheAnd80To90F, dataR.NumGuZheAnd70To80F, dataR.NumGuZheAnd60To70F);

        }else if (name == "失智") {
            change_health_info(dataR.NumShiZhiAndMale, dataR.NumShiZhiAndFemale, dataR.NumShiZhiAndHuJi, dataR.NumShiZhiAndFeiHuJi,
                    dataR.NumShiZhiAnd90AboveM, dataR.NumShiZhiAnd80To90M, dataR.NumShiZhiAnd70To80M, dataR.NumShiZhiAnd60To70M,
                    dataR.NumShiZhiAnd90AboveF, dataR.NumShiZhiAnd80To90F, dataR.NumShiZhiAnd70To80F, dataR.NumShiZhiAnd60To70F);

        }else if (name == "长护险评级") {
            change_health_info(dataR.NumChangHuAndMale, dataR.NumChangHuAndFemale, dataR.NumChangHuAndHuJi, dataR.NumChangHuAndFeiHuJi,
                    dataR.NumChangHuAnd90AboveM, dataR.NumChangHuAnd80To90M, dataR.NumChangHuAnd70To80M, dataR.NumChangHuAnd60To70M,
                    dataR.NumChangHuAnd90AboveF, dataR.NumChangHuAnd80To90F, dataR.NumChangHuAnd70To80F, dataR.NumChangHuAnd60To70F);

        }else if (name == "其他") {
            change_health_info(dataR.NumQiTaHealthAndMale, dataR.NumQiTaHealthAndFemale, dataR.NumQiTaHealthAndHuJi, dataR.NumQiTaHealthAndFeiHuJi,
                    dataR.NumQiTaHealthAnd90AboveM, dataR.NumQiTaHealthAnd80To90M, dataR.NumQiTaHealthAnd70To80M, dataR.NumQiTaHealthAnd60To70M,
                    dataR.NumQiTaHealthAnd90AboveF, dataR.NumQiTaHealthAnd80To90F, dataR.NumQiTaHealthAnd70To80F, dataR.NumQiTaHealthAnd60To70F);

        }
    });
    function change_health_info(numMale,numFemale,numHuJi,numFeiHuJi,num90AboveM,num80To90M,num70To80M,num60To70M,
                                num90AboveF,num80To90F,num70To80F,num60To70F){
        title_text = "户籍";
        legend_data = [{name: '户籍', textStyle: {color: legend_color, fontSize: 18}}, {
            name: '非户籍',
            textStyle: {color: legend_color, fontSize: 18}
        }];
        series = [{
            name: '',
            type: 'pie',
            radius: '43%',
            center: ['48%', '60%'],
            label: {
                normal: {
                    formatter: '{d}%\n({c})',
                    textStyle: {
                        fontWeight: 'normal',
                        fontSize: 10
                    }
                }
            },
            data: [
                {value: numHuJi, name: '户籍'},
                {value: numFeiHuJi, name: '非户籍'}
            ],
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }];
        var option_area_pie = chartPie(title_text, legend_data, series);

        //性别饼图
        title_text = "性别";
        legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 18}}, {
            name: '女',
            textStyle: {color: legend_color, fontSize: 18}
        }];
        series = [{
            name: '老人性别',
            type: 'pie',
            radius: '43%',
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
                {value: numMale, name: '男'},
                {value: numFemale, name: '女'}
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


        //    年龄分布柱状图
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
                data: [num90AboveM, num80To90M, num70To80M, num60To70M]
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
                data: [num90AboveF, num80To90F, num70To80F, num60To70F]
            }
        ];
        var option_age_bar = chartBar(title_text, legend_data, yAxis_data, series);

        hjPie.setOption(option_area_pie);
        sexPie.setOption(option_sex_pie);
        ageBar.setOption(option_age_bar);

    }
</script>
</html>