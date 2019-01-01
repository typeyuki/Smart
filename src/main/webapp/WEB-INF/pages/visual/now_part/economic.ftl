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
                    <div id="econmicPie" class="tu_big"></div>
                </div>
                <div class="col-lg-6 box line">
                    <div class="zz"></div>
                    <div id="econmicLine" class="tu_big"></div>
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
        var econmicLine = echarts.init(document.getElementById('econmicLine'));
        var econmicPie= echarts.init(document.getElementById('econmicPie'));
    </script>
</div>

</body>
<script>
    $.ajax({
        url: "/visual/data/getVisualDataApartEconomic",
        type: "get",
        success: function (result) {
            if (result.success == true) {

                dataR = result.data;
                pieOldNum = dataR.NumOld;
                pieAllNum = dataR.NumAll;
                pieOldNum80 = dataR.NumOld80;
                //经济条件
                title_text = "经济条件";
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
                                fontSize: 10
                            }
                        }
                    },
                    center: ['48%', '60%'],
                    data: [
                        {value: dataR.NumBangKun, name: '帮困'},
                        {value: dataR.NumDiBao, name: '低保'},
                        {value: dataR.NumYangLaoBX, name: '养老保险'},
                        {value: dataR.NumYiLiaoJZJ, name: '医疗救助金'},
                        {value: dataR.NumChengZhenYB, name: '城镇医保'},
                        {value: dataR.NumQiTaEco, name: '其他'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_econmic_pie = chartPie(title_text, legend_data, series);
                //经济条件增长趋势图
                title_text = '经济条件变化趋势';
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
                xAxis_data = ['2月', '3月', '4月', '今天', '6月', '7月', '8月'];
                series = [
                    {
                        name: '帮困',
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
                                color: "yellow"
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
                                    label: {show: true, position: 'left', textStyle: {color: 'red', fontSize: 10}}
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
                                fontSize: 18
                            },
                            itemStyle: {

                                normal: {
                                    color: 'white'
                                }
                            }
                        }, 55, 55, 55]
                    },
                    {
                        name: '低保',
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
                                color: "yellow"
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
                                    label: {show: true, position: 'left', textStyle: {color: 'red', fontSize: 10}}
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
                                fontSize: 18
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
                        name: '养老保险',
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
                                color: "yellow"
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
                                    label: {show: true, position: 'left', textStyle: {color: 'red', fontSize: 10}}
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
                                show: true,
                                fontSize: 10
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
                        name: '医疗救助金',
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
                                color: "yellow"
                            }
                        },
                        label: {
                            normal: {
                                textStyle: {
                                    fontSize: 20
                                }

                            }

                        },
                        markLine: {
                            itemStyle: {
                                normal: {
                                    lineStyle: {type: 'solid', color: 'orange'},
                                    label: {show: true, position: 'left', textStyle: {color: 'red', fontSize: 10}}
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
                        name: '城镇医保',
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
                                color: "yellow"
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
                                    label: {show: true, position: 'left', textStyle: {color: 'red', fontSize: 10}}
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
                        }, 40, 40, 40]
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
                                color: "yellow"
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
                                    label: {show: true, position: 'left', textStyle: {color: 'red', fontSize: 10}}
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
                var option_econmic_line = chartLine(title_text, legend_data, xAxis_data, series);

                title_text = "户籍";
                legend_data = [{name: '户籍', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '非户籍',
                    textStyle: {color: legend_color, fontSize: 10}
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
                legend_data = [{name: '男', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '女',
                    textStyle: {color: legend_color, fontSize: 10}
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


                econmicPie.setOption(option_econmic_pie);
                econmicLine.setOption(option_econmic_line);
                hjPie.setOption(option_area_pie);
                sexPie.setOption(option_sex_pie);
                ageBar.setOption(option_age_bar);
            }
        }
    });
    econmicPie.on('legendselectchanged', function (params) {
        var name = params.name;
        if (name == "帮困") {
            change_economic_info(dataR.NumBangKunAndMale,dataR.NumBangKunAndFemale,dataR.NumBangKunAndHuJi,dataR.NumBangKunAndFeiHuJi,
                    dataR.NumBangKunAnd90AboveM,dataR.NumBangKunAnd80To90M,dataR.NumBangKunAnd70To80M,dataR.NumBangKunAnd60To70M,
                    dataR.NumBangKunAnd90AboveF,dataR.NumBangKunAnd80To90F,dataR.NumBangKunAnd70To80F,dataR.NumBangKunAnd60To70F);
        }else  if (name == "低保") {
            change_economic_info(dataR.NumDiBaoAndMale,dataR.NumDiBaoAndFemale,dataR.NumDiBaoAndHuJi,dataR.NumDiBaoAndFeiHuJi,
                    dataR.NumDiBaoAnd90AboveM,dataR.NumDiBaoAnd80To90M,dataR.NumDiBaoAnd70To80M,dataR.NumDiBaoAnd60To70M,
                    dataR.NumDiBaoAnd90AboveF,dataR.NumDiBaoAnd80To90F,dataR.NumDiBaoAnd70To80F,dataR.NumDiBaoAnd60To70F);
        } if (name == "养老保险") {
            change_economic_info(dataR.NumYangLaoAndMale,dataR.NumYangLaoAndFemale,dataR.NumYangLaoAndHuJi,dataR.NumYangLaoAndFeiHuJi,
                    dataR.NumYangLaoAnd90AboveM,dataR.NumYangLaoAnd80To90M,dataR.NumYangLaoAnd70To80M,dataR.NumYangLaoAnd60To70M,
                    dataR.NumYangLaoAnd90AboveF,dataR.NumYangLaoAnd80To90F,dataR.NumYangLaoAnd70To80F,dataR.NumYangLaoAnd60To70F);
        } if (name == "医疗救助金") {
            change_economic_info(dataR.NumYiLiaoAndMale,dataR.NumYiLiaoAndFemale,dataR.NumYiLiaoAndHuJi,dataR.NumYiLiaoAndFeiHuJi,
                    dataR.NumYiLiaoAnd90AboveM,dataR.NumYiLiaoAnd80To90M,dataR.NumYiLiaoAnd70To80M,dataR.NumYiLiaoAnd60To70M,
                    dataR.NumYiLiaoAnd90AboveF,dataR.NumYiLiaoAnd80To90F,dataR.NumYiLiaoAnd70To80F,dataR.NumYiLiaoAnd60To70F);
        } if (name == "城镇低保") {
            change_economic_info(dataR.NumChenZhenAndMale,dataR.NumChenZhenAndFemale,dataR.NumChenZhenAndHuJi,dataR.NumChenZhenAndFeiHuJi,
                    dataR.NumChenZhenAnd90AboveM,dataR.NumChenZhenAnd80To90M,dataR.NumChenZhenAnd70To80M,dataR.NumChenZhenAnd60To70M,
                    dataR.NumChenZhenAnd90AboveF,dataR.NumChenZhenAnd80To90F,dataR.NumChenZhenAnd70To80F,dataR.NumChenZhenAnd60To70F);
        } if (name == "其他") {
            change_economic_info(dataR.NumQiTaEconomicAndMale,dataR.NumQiTaEconomicAndFemale,dataR.NumQiTaEconomicAndHuJi,dataR.NumQiTaEconomicAndFeiHuJi,
                    dataR.NumQiTaEconomicAnd90AboveM,dataR.NumQiTaEconomicAnd80To90M,dataR.NumQiTaEconomicAnd70To80M,dataR.NumQiTaEconomicAnd60To70M,
                    dataR.NumQiTaEconomicAnd90AboveF,dataR.NumQiTaEconomicAnd80To90F,dataR.NumQiTaEconomicAnd70To80F,dataR.NumQiTaEconomicAnd60To70F);
        }
    });
    function change_economic_info(numMale,numFemale,numHuJi,numFeiHuJi,num90AboveM,num80To90M,num70To80M,num60To70M,
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