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
                    <div id="familyPie" class="tu_big"></div>
                </div>
                <div class="col-lg-6 box line">
                    <div class="zz"></div>
                    <div id="familyLine" class="tu_big"></div>
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
        var familyLine = echarts.init(document.getElementById('familyLine'));
        var familyPie= echarts.init(document.getElementById('familyPie'));
    </script>
</div>


</body>
<script>
    $.ajax({
        url: "/visual/data/getVisualDataApartFamily",
        type: "get",
        success: function (result) {
            if (result.success == true) {

                dataR = result.data;
                pieOldNum = dataR.NumOld;
                pieAllNum = dataR.NumAll;
                pieOldNum80 = dataR.NumOld80;

                //家庭结构
                var title_text = "家庭结构";
                var legend_data = [{name: '纯老', textStyle: {color: legend_color, fontSize: 10}}, {
                    name: '独居',
                    textStyle: {color: legend_color, fontSize: 10}
                }
                    , {name: '失独', textStyle: {color: legend_color, fontSize: 10}}, {
                        name: '一老养一老',
                        textStyle: {color: legend_color, fontSize: 10}
                    },
                    {name: '孤老', textStyle: {color: legend_color, fontSize: 10}}, {
                        name: '三支人员',
                        textStyle: {color: legend_color, fontSize: 10}
                    }, {name: '其他', textStyle: {color: legend_color, fontSize: 10}}];
                var series = [{
                    name: '老人家庭结构',
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
                        {value: dataR.NumChunLao, name: '纯老'},
                        {value: dataR.NumDuJu, name: '独居'},
                        {value: dataR.NumShiDu, name: '失独'},
                        {value: dataR.NumYiLaoYYL, name: '一老养一老'},
                        {value: dataR.NumGuLao, name: '孤老'},
                        {value: dataR.NumSanZhiRY, name: '三支人员'},
                        {value: dataR.NumQiTaFamily, name: '其他'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                var option_family_pie = chartPie(title_text, legend_data, series);
                //家庭结构增长趋势图
                title_text = '家庭结构变化趋势';
                xAxis_data = ['2月', '3月', '4月', '今天', '6月', '7月', '8月'];
                series = [
                    {
                        name: '纯老',
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
                        name: '独居',
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
                        name: '失独',
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
                        name: '一老养一老',
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
                        name: '孤老',
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
                    },
                    {
                        name: '三支人员',
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
                var option_family_line = chartLine(title_text, legend_data, xAxis_data, series);

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


                familyPie.setOption(option_family_pie);
                familyLine.setOption(option_family_line);
                hjPie.setOption(option_area_pie);
                sexPie.setOption(option_sex_pie);
                ageBar.setOption(option_age_bar);
            }
        }
    });
    familyPie.on('legendselectchanged', function (params) {
        var name = params.name;
        if (name == "纯老") {
            change_family_info(dataR.NumChunLaoAndMale,dataR.NumChunLaoAndFemale,dataR.NumChunLaoAndHuJi,dataR.NumChunLaoAndFeiHuJi,
                    dataR.NumChunLaoAnd90AboveM,dataR.NumChunLaoAnd80To90M,dataR.NumChunLaoAnd70To80M,dataR.NumChunLaoAnd60To70M,
                    dataR.NumChunLaoAnd90AboveF,dataR.NumChunLaoAnd80To90F,dataR.NumChunLaoAnd70To80F,dataR.NumChunLaoAnd60To70F);
            family.push(1);
        }else if (name == "独居") {
            change_family_info(dataR.NumDuJuAndMale,dataR.NumDuJuAndFemale,dataR.NumDuJuAndHuJi,dataR.NumDuJuAndFeiHuJi,
                    dataR.NumDuJuAnd90AboveM,dataR.NumDuJuAnd80To90M,dataR.NumDuJuAnd70To80M,dataR.NumDuJuAnd60To70M,
                    dataR.NumDuJuAnd90AboveF,dataR.NumDuJuAnd80To90F,dataR.NumDuJuAnd70To80F,dataR.NumDuJuAnd60To70F);
            family.push(2);
        }else if (name == "失独") {
            change_family_info(dataR.NumShiDuAndMale,dataR.NumShiDuAndFemale,dataR.NumShiDuAndHuJi,dataR.NumShiDuAndFeiHuJi,
                    dataR.NumShiDuAnd90AboveM,dataR.NumShiDuAnd80To90M,dataR.NumShiDuAnd70To80M,dataR.NumShiDuAnd60To70M,
                    dataR.NumShiDuAnd90AboveF,dataR.NumShiDuAnd80To90F,dataR.NumShiDuAnd70To80F,dataR.NumShiDuAnd60To70F);
            family.push(18);
        }else if (name == "一老养一老") {
            change_family_info(dataR.NumYiLaoAndMale,dataR.NumYiLaoAndFemale,dataR.NumYiLaoAndHuJi,dataR.NumYiLaoAndFeiHuJi,
                    dataR.NumYiLaoAnd90AboveM,dataR.NumYiLaoAnd80To90M,dataR.NumYiLaoAnd70To80M,dataR.NumYiLaoAnd60To70M,
                    dataR.NumYiLaoAnd90AboveF,dataR.NumYiLaoAnd80To90F,dataR.NumYiLaoAnd70To80F,dataR.NumYiLaoAnd60To70F);
            family.push(17);
        }else if (name == "孤老") {
            change_family_info(dataR.NumGuLaoAndMale,dataR.NumGuLaoAndFemale,dataR.NumGuLaoAndHuJi,dataR.NumGuLaoAndFeiHuJi,
                    dataR.NumGuLaoAnd90AboveM,dataR.NumGuLaoAnd80To90M,dataR.NumGuLaoAnd70To80M,dataR.NumGuLaoAnd60To70M,
                    dataR.NumGuLaoAnd90AboveF,dataR.NumGuLaoAnd80To90F,dataR.NumGuLaoAnd70To80F,dataR.NumGuLaoAnd60To70F);
            family.push(19);
        }else if (name == "三支人员") {
            change_family_info(dataR.NumSanZhiAndMale,dataR.NumSanZhiAndFemale,dataR.NumSanZhiAndHuJi,dataR.NumSanZhiAndFeiHuJi,
                    dataR.NumSanZhiAnd90AboveM,dataR.NumSanZhiAnd80To90M,dataR.NumSanZhiAnd70To80M,dataR.NumSanZhiAnd60To70M,
                    dataR.NumSanZhiAnd90AboveF,dataR.NumSanZhiAnd80To90F,dataR.NumSanZhiAnd70To80F,dataR.NumSanZhiAnd60To70F);
            family.push(20);

        }else if (name == "其他") {
            change_family_info(dataR.NumQiTaFamilyAndMale,dataR.NumQiTaFamilyAndFemale,dataR.NumQiTaFamilyAndHuJi,dataR.NumQiTaFamilyAndFeiHuJi,
                    dataR.NumQiTaFamilyAnd90AboveM,dataR.NumQiTaFamilyAnd80To90M,dataR.NumQiTaFamilyAnd70To80M,dataR.NumQiTaFamilyAnd60To70M,
                    dataR.NumQiTaFamilyAnd90AboveF,dataR.NumQiTaFamilyAnd80To90F,dataR.NumQiTaFamilyAnd70To80F,dataR.NumQiTaFamilyAnd60To70F);
            family.push(21);
        }
        getJwData();
        
    });
    function change_family_info(numMale,numFemale,numHuJi,numFeiHuJi,num90AboveM,num80To90M,num70To80M,num60To70M,
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
        hjPie.on('legendselectchanged',function(params){
            var name=params.name;
            if(name=="户籍"){
                census.push(12);
                //district.push(district_no);

            }else if(name=="非户籍"){
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

</script>
</html>