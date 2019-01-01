<!DOCTYPE html>
<html>
<head>
<#include "../head.ftl" />
    <style>
        @media only screen and (min-width: 1700px){
            .map_title{
                font-size: 28px;
                color: white;
            }

            .title{
                text-align: center;
                font-size: 20px;
                font-weight: bold;
            }
            .ta {
                margin-top: 150%;
                font-size: 30px;
                position: relative;
                left: 60%;
            }
            .secTitle{
                text-align: center;
                font-size: 20px;
                font-weight: bold;
                margin-top: 10px;
            }
            .label{
                font-size: 18px;
                padding:10px!important;
                margin: 5px!important;
                line-height: 3!important;
            }
            .select{
                opacity: 0.5;
            }
            .qk{
                font-size: 18px;
                background-color:#6cbdfc ;
                padding:10px 30px;
                color: white;
                border: none;
                border-radius: 10px;
                margin-bottom: 10px;
                /*position: fixed;*/
                /*bottom: 5%;*/
                /*left:20%*/
            }
            .qk_1{
                font-size: 18px;
                padding:10px 30px;
                color: white;
                border: none;
                border-radius: 10px;
                margin: 10px;
                width: 100%;
            }
            .bl{
                display: inline-block;
                line-height: 1!important;
            }
        }

        @media only screen and (min-width: 1300px) and ( max-width: 1400px){
            .map_title{
                font-size: 28px;
                color: white;
            }

            .title{
                text-align: center;
                font-size: 20px;
                font-weight: bold;
            }
            .ta {
                margin-top: 150%;
                font-size: 30px;
                position: relative;
                left: 60%;
            }
            .secTitle{
                text-align: center;
                font-size: 20px;
                font-weight: bold;
                margin-top: 10px;
            }
            .label{
                font-size: 18px;
                padding:10px!important;
                margin: 5px!important;
                line-height: 3!important;
            }
            .select{
                opacity: 0.5;
            }
            .qk{
                font-size: 18px;
                background-color:#6cbdfc ;
                padding:10px 30px;
                color: white;
                border: none;
                border-radius: 10px;
                margin-bottom: 10px;
                /*position: fixed;*/
                /*bottom: 5%;*/
                /*left:20%*/
            }
            .qk_1{
                font-size: 18px;
                padding:10px 30px;
                color: white;
                border: none;
                border-radius: 10px;
                margin: 10px;
                width: 100%;
            }
            .bl{
                display: inline-block;
                line-height: 1!important;
            }
        }

        @media only screen and (min-width: 1401px) and ( max-width: 1699px){
            .map_title{
                font-size: 28px;
                color: white;
            }

            .title{
                text-align: center;
                font-size: 20px;
                font-weight: bold;
            }
            .ta {
                margin-top: 150%;
                font-size: 30px;
                position: relative;
                left: 60%;
            }
            .secTitle{
                text-align: center;
                font-size: 20px;
                font-weight: bold;
                margin-top: 10px;
            }
            .label{
                font-size: 18px;
                padding:10px!important;
                margin: 5px!important;
                line-height: 3!important;
            }
            .select{
                opacity: 0.5;
            }
            .qk{
                font-size: 18px;
                background-color:#6cbdfc ;
                padding:10px 30px;
                color: white;
                border: none;
                border-radius: 10px;
                margin-bottom: 10px;
                /*position: fixed;*/
                /*bottom: 5%;*/
                /*left:20%*/
            }
            .qk_1{
                font-size: 18px;
                padding:10px 30px;
                color: white;
                border: none;
                border-radius: 10px;
                margin: 10px;
                width: 100%;
            }
            .bl{
                display: inline-block;
                line-height: 1!important;
            }
        }


        .color_1{
            background-color:#6cbdfc!important;;
        }
        .color_2{
            background-color:#dc88a9!important;;
        }
        .color_4{
            background-color:#48e8dc!important;;
        }
        .color_5{
            background-color:yellowgreen!important;;
        }
        .color_6{
            background-color:orange!important;;
        }
        .color_7{
            background-color:rgb(139, 182, 93)!important;;
        }
        #label3{
            display: none;
            margin-top: 10%;
        }
        .daohang{
            font-size: 150%;
            color: white;
            background-color: transparent;
            border:8px solid #47e3d8;
            padding: 10px 20px;
            border-radius: 100%;
            font-weight: bold;
        }
        #label .ta{
            margin-top: 55%;
            font-size: 50px;
            position: relative;
            left: 20%;
        }
        #label .title{
            text-align: center;
            font-size: 35px;
            font-weight: bold;
        }
    </style>
</head>

<body>



<div class="container-fluid">
    <div class="row" style="position: relative;left: 2% ;top: 10px">
        <div class="col-lg-1" style="width: 1%"></div>
        <div class="col-lg-3">
            <div class="row">
                <div class="col-lg-9 box">
                    <div class="zz"></div>
                    <div class="row">
                        <div class="col-lg-3"></div>
                        <div class="col-lg-6" align="center">
                            <button class="daohang" onclick="picChange(1)" >老有<br>所养</button>
                        </div>
                        <div class="col-lg-5"></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-5" align="left" style="margin-top:-3% ;left:3%">
                            <button class="daohang" onclick="picChange(2)">老有<br>所医</button>
                        </div>
                        <div class="col-lg-6" align="right" style="margin-top:-3% ;left:5%">
                            <button class="daohang" onclick="picChange(3)">老有<br>所为</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-1"></div>
                        <div class="col-lg-5" align="right" style="margin-top:5%">
                            <button class="daohang" onclick="picChange(4)">老有<br>所学</button>
                        </div>

                        <div class="col-lg-5" align="left" style="margin-top:5%">
                            <button class="daohang" onclick="picChange(5)">老有<br>所乐</button>
                        </div>
                        <div class="col-lg-1"></div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 5px" id="label1">
                <div class="col-lg-9 box" style="border-bottom: 0px solid white;margin: 0!important;">
                    <div class="zz"></div>
                    <div class="col-lg-3" >
                        <p class="title ta"  onclick="ChangeMap()">身</br>份</br>标</br>签</p>
                    </div>
                    <div class="col-lg-9" style="left:15%">
                        <div class="row">
                            <div class="col-lg-11" align="center" style="right:5%">
                                <button class="qk_1 color_2" style="height: 50px" onclick="label3Show(1)">基 本 信 息</button>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-lg-11" align="right" style="right:5%">
                                <button class="qk_1 color_2" style="height: 50px" onclick="label3Show(2)">健 康 档 案</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-11" align="right" style="right:5%">
                                <button class="qk_1 color_2" style="height: 50px" onclick="label3Show(3)">经 济 条 件</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-11" align="right" style="right:5%">
                                <button class="qk_1 color_2" style="height: 50px" onclick="label3Show(4)">家 庭 结 构</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-11" align="right" style="right:5%">
                                <button class="qk_1 color_2" style="height: 50px" onclick="label3Show(5)">养 老 状 态</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

                <div class="row" id="label3" style="margin-top: 5px">
                  <div class="col-lg-9 box">
                    <div class="zz"></div>
                      <div id="label31" class="aa" style="display: none">
                         <span class="label color_1">男</span>
                         <span class="label color_1">女</span>
                         <span class="label color_1">60-70岁</span>
                         <span class="label color_1">70-80岁</span>
                         <span class="label color_1">80-90岁</span>
                         <span class="label color_1">90岁以上</span>
                         <span class="label color_1">东兰</span>
                         <span class="label color_1">平阳</span>
                         <span class="label color_1">古美</span>
                          <span class="label color_1">平吉</span>
                         <span class="label color_1">平南</span>
                         <span class="label color_1">古龙</span>
                         <span class="label color_1">户籍</span>
                         <span class="label color_1">非户籍</span>
                         <span class="label color_1">人户分离</span>
                         <span class="label color_1">群众</span>
                         <span class="label color_1">党员</span>
                </div>
            <div id="label32" class="aa" style="display: none">

                    <span class="label color_2">智力正常</span>
                    <span class="label color_2">痴呆</span>
                    <span class="label color_2">智障</span>
                    <span class="label color_2">视力正常</span>
                    <span class="label color_2">失明</span>
                    <span class="label color_2">有光感</span>
                    <span class="label color_2">严重障碍</span>
                    <span class="label color_2">一般障碍</span>
                    <span class="label color_2">有慢病</span>
                    <span class="label color_2">有失能情况</span>
                    <span class="label color_2">有药物反应</span>
                    <span class="label color_2">有恶性肿瘤史</span>
                    <span class="label color_2">有骨折史</span>
                    <span class="label color_2">有残疾史</span>
                </div>
            <div id="label33" class="aa" style="display: none">

                    <span class="label color_3">帮困人员</span>
                    <span class="label color_3">低保</span>
                    <span class="label color_3">城乡居民养老保险</span>
                    <span class="label color_3">医疗救助金</span>
                    <span class="label color_3">城镇居民基本医疗保险</span>
                    <span class="label color_3">其他</span>
                </div>
            <div id="label34" class="aa" style="display: none">

                    <span class="label color_4">纯老</span>
                    <span class="label color_4">独居</span>
                    <span class="label color_4">孤老</span>
                    <span class="label color_4">一老养一老</span>
                    <span class="label color_4">失独家庭</span>
                    <span class="label color_4">三支人员</span>
                    <span class="label color_4">独生子女家庭</span>
                    <span class="label color_4">军属</span>
                    <span class="label color_4">烈士家庭</span>
                    <span class="label color_4">离休干部</span>
                    <span class="label color_4">侨属</span>
                </div>
            <div id="label35" class="aa" style="display: none">
                    <span class="label color_5">莲花老年公寓</span>
                    <span class="label color_5">古美养老院</span>
                    <span class="label color_5">平阳养老院</span>
                    <span class="label color_5">平南艾为</span>
                    <span class="label color_5">平阳智汇坊</span>
                    <span class="label color_5">平阳乐健</span>
                    <span class="label color_5">平南日间照料中心</span>
                    <span class="label color_5">平吉助餐点</span>
                    <span class="label color_5">古美助餐点</span>
                    <span class="label color_5">古龙助餐点</span>
                    <span class="label color_5">平南助餐点</span>
                    <span class="label color_5">2-3级</span>
                    <span class="label color_5">4级</span>
                    <span class="label color_5">5级</span>
                    <span class="label color_5">6级</span>
                    <span class="label color_5">7级</span>
                    <span class="label color_5">2-3级</span>
                    <span class="label color_5">4级</span>
                    <span class="label color_5">5级</span>
                    <span class="label color_5">6级</span>
                    <span class="label color_5">7级</span>
                    <span class="label color_5">助餐</span>
                    <span class="label color_5">助洁</span>
                    <span class="label color_5">助急</span>
                    <span class="label color_5">助浴</span>
                    <span class="label color_5">助行</span>
                    <span class="label color_5">康复辅助</span>
                    <span class="label color_5">助医</span>
                    <span class="label color_5">相谈</span>
                    <span class="label color_5">洗涤</span>
                    <span class="label color_5">生活护理</span>
                </div>
            </div>
       </div>

            <div class="row" >
            <div class="col-lg-9 box " style="margin-top: 5px" >
                <div class="zz"></div>
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-12">
                            <p class="title">所选标签</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="selectLabel"></div>
                        </div>
                    </div>
                    <div class="row" align="center">
                        <div class="col-lg-12">
                            <button class="qk" style="background-color: #47e6da" onclick="confirm()">确认</button>
                            <button class="qk" onclick="clearLabels()">清空</button>
                        </div>
                    </div>

                </div>
            </div>
            </div>
        </div>
        <div class="col-lg-2" style="position: relative;top: 0px;right:70px">
            <div class="row">
                <div class="col-lg-12 box" align="center">
                    <div class="zz"></div>
                    <div id="ageBar" class="tu"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box" align="center" >
                    <div class="zz"></div>
                    <div id="sexPie" class="tu"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box" align="center">
                    <div class="zz"></div>
                    <div id="hjPie" class="tu"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 box" align="center">
                    <div class="zz"></div>
                    <div id="pqBar" class="tu"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-4" style="position: relative;top: 10px">
            <div class="row" align="center">
                <div class="col-lg-12">
                    <#include "map-label.ftl"/>
                </div>
            </div>

            <div class="row">
            <#--<#include "table.ftl"/>-->
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var tu_w,tu_h;
        if(winWidth>=1700){
            //家里电脑的分辨率
            tu_w=winWidth/8.2;
            tu_h=winHeight/4.2;
        }else if(winWidth<=1400 && winWidth>=1300){
            tu_w=winWidth/8.2;
            tu_h=winHeight/4.2;
        }else if(winWidth>1400 && winWidth<1700){
            tu_w=winWidth/8.2;
            tu_h=winHeight/4.2;
        }
        $(".tu").css('width',tu_w);
        $(".tu").css( 'height', tu_h);

        var ageBar = echarts.init(document.getElementById('ageBar'));
        var sexPie= echarts.init(document.getElementById('sexPie'));
        var pqBar= echarts.init(document.getElementById('pqBar'));
        var hjPie= echarts.init(document.getElementById('hjPie'));
    </script>
</div>

</body>
<script>
    var dataR;
    var jwData;
    var heatPoints=[];
    var la=[];
    var sex = 0;
    var census=new Array();
    var ageEnd,ageStart;
    var family=new Array(),economic=new Array();
    var health=new Array();
    var oldStatus=new Array();
    var familyType=new Array();
    var jw = [1,2,3,13,45,58,59,60,63,66,67,84,85,87,88,89,90,93,97,98,99,100,101,102,103,104,105,106,107,108,113,119,120,121,122,123,124,125,126,134,135];
    var politicalStatusArray = new Array();
    var organIdArray = new Array();
    var secTypeArray = new Array();
    var la=new Array();
    $.ajax({
        url: "/visual/data/getVisualDataApartLabel",
        type: "get",
        success: function (result) {
            if (result.success == true) {

                dataR = result.data;
                //    年龄分布柱状图
                title_text = '年龄';
                legend_data = [
                    {
                        name: '男',
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    {
                        name: '女',
                        textStyle: {
                            color: '#fff'
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
                                position: 'insideLeft'
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: series_color_1
                            }
                        },
                        data: [dataR.NumAbove90M, dataR.Num80To90M, dataR.Num70To80M, dataR.Num60To70M]
                    },
                    {
                        name: '女',
                        type: 'bar',
                        stack: '总量',
                        label: {
                            normal: {
                                show: true,
                                position: 'insideRight'
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
                var option_age_bar = chartBarPartAge(title_text, legend_data, yAxis_data, series);
                //性别饼图
                title_text = "性别";
                legend_data = [{name: '男', textStyle: {color: legend_color}}, {
                    name: '女',
                    textStyle: {color: legend_color}
                }];
                series = [{
                    name: '老人性别',
                    type: 'pie',
                    radius: '40%',
                    center: ['50%', '60%'],
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
                //片区人数分布
                legend_data = "";
                title_text = '片区人口';
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
                        data: [dataR.NumDongLan, dataR.NumGuLong, dataR.NumPingNan, dataR.NumPingYang, dataR.NumPingJi, dataR.NumGuMei]
                    }
                ];
                var option_pq_bar = chartBar(title_text, legend_data, yAxis_data, series);
                title_text = "户籍";
                legend_data = [{name: '户籍', textStyle: {color: legend_color}}, {
                    name: '非户籍',
                    textStyle: {color: legend_color}
                }];
                series = [{
                    name: '',
                    type: 'pie',
                    radius: '40%',
                    center: ['48%', '60%'],
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
                var option_hj_pie = chartPie(title_text, legend_data, series);
                ageBar.setOption(option_age_bar);
                ageBar.on('legendselectchanged', function (params) {
                    var name = params.name;
                    if(name=="男"){
                        sex=2;

                    }else if(name=="女"){
                        sex=1;

                    }
                    getJwData();
                   //
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
                    //

                });
                pqBar.setOption(option_pq_bar);
                pqBar.on('legendselectchanged',function (params) {
                    var name = params.name;
                    if(name == "古龙")
                        mapDistrict.push(2);
                    else if(name == "东兰")
                        mapDistrict.push(3);
                    else if(name == "古美")
                        mapDistrict.push(1);
                    else if(name == "平南")
                        mapDistrict.push(6);
                    else if(name == "平阳")
                        mapDistrict.push(5);
                    else if(name == "平吉")
                        mapDistrict.push(4);
                });
                hjPie.setOption(option_hj_pie);
                hjPie.on('legendselectchanged',function(params){
                    var name=params.name;
                    if(name=="户籍"){
                        census.push(12);
                        //district.push(district_no);

                    }else if(name=="非户籍"){
                        census.push(13,14);
                        // district.push(district_no);

                    }
                    getJwData();
                   //

                });
            }
        }
    });
</script>

<script>
    function confirm(){
        for (var index = 0; index < la.length; index++) {
            if (la[index] == "男")
                sex = 2;
            else if (la[index] == "女")
                sex = 1;
            else if (la[index] == "60-70岁") {
                ageStart = 60;
                ageEnd = 70;
            } else if (la[index] == "70-80岁") {
                ageStart = 70;
                ageEnd = 80;
            }
            else if (la[index] == "80-90岁") {
                ageStart = 80;
                ageEnd = 90;
            } else if (la[index] == "90岁以上") {
                ageStart = 90;
                ageEnd = 200;
            } else if (la[index] == "东兰")
            {
                mapDistrict.push(3);
            }

            else if (la[index] == "平阳")
                mapDistrict.push(5);
            else if (la[index] == "古美")
                mapDistrict.push(1);
            else if (la[index] == "平吉")
                mapDistrict.push(4);
            else if (la[index] == "平南")
                mapDistrict.push(6);
            else if (la[index] == "古龙")
                mapDistrict.push(2);
            else if (la[index] == "户籍")
                census.push(12);
            else if (la[index] == "非户籍")
                census.push(13);
            else if (la[index] == "人户分离")
                census.push(14);
            else if (la[index] == "群众")
                politicalStatusArray.push(10);
            else if (la[index] == "党员")
                politicalStatusArray.push(11);
            else if (la[index] == "正常")
                intelligenceArray.push(28);
            else if (la[index] == "痴呆")
                intelligenceArray.push(29);
            else if (la[index] == "智障")
                intelligenceArray.push(30);
            else if (la[index] == "正常")
                eyesightArray.push(31);
            else if (la[index] == "失明")
                eyesightArray.push(32);
            else if (la[index] == "有光感")
                eyesightArray.push(33);
            else if (la[index] == "有障碍")
            {   eyesightArray.push(34);
                eyesightArray.push(35);
            }
            else if (la[index] == "有慢病"){
                health.push(1);
                isMb = 1;
            }
            else if (la[index] == "有失能情况"){
                health.push(2);
                isSn = 1;
            }
            else if (la[index] == "有药物反应"){
                health.push(3);
                isYwfy = 1;
            }
            else if (la[index] == "有恶性肿瘤史"){
                health.push(4);
                isExzl = 1;
            }
            else if (la[index] == "有骨折史"){
                health.push(5);
                isGz = 1;
            }
            else if (la[index] == "有残疾史"){
                health.push(6);
                isCj = 1;
            }
            else if (la[index] == "帮困人员")
                economic.push(22);
            else if (la[index] == "低保")
                economic.push(23);
            else if (la[index] == "城乡居民养老保障")
                economic.push(24);
            else if (la[index] == "医疗救助金")
                economic.push(25);
            else if (la[index] == "城镇居民基本医疗保险")
                economic.push(26);
            else if (la[index] == "其他")
                economic.push(27);
            else if (la[index] == "纯老")
                family.push(15);
            else if (la[index] == "独居")
                family.push(16);
            else if (la[index] == "孤老")
                family.push(19);
            else if (la[index] == "一老养一老")
                family.push(17);
            else if (la[index] == "失独家庭")
                family.push(18);
            else if (la[index] == "三支人员")
                family.push(20);
            else if (la[index] == "独生子女家庭")
                familyType.push(21);
            else if (la[index] == "军属")
                familyType.push(74);
            else if (la[index] == "烈士家属")
                familyType.push(75);
            else if (la[index] == "离休干部")
                familyType.push(76);
            else if (la[index] == "侨属")
                familyType.push(77);
            else if (la[index] == "莲花老年公寓")
                organIdArray.push(79);
            else if (la[index] == "平阳养老院")
                organIdArray.push(114);
            else if (la[index] == "古美养老院")
                organIdArray.push(115);
            else if (la[index] == "平南艾为")
                organIdArray.push(14);
            else if (la[index] == "平阳智汇坊")
                organIdArray.push(118);
            else if (la[index] == "平阳乐健")
                organIdArray.push(145);
            else if (la[index] == "平南日间照料中心")
                organIdArray.push(15);
            else if (la[index] == "平吉助餐点")
                organIdArray.push(16);
            else if (la[index] == "古美助餐点")
                organIdArray.push(117);
            else if (la[index] == "平南助餐点")
                organIdArray.push(17);
            else if (la[index] == "古龙助餐点")
                organIdArray.push(116);
            else if (la[index] == "2-3级"){
                secTypeArray.push(1);
                secTypeArray.push(2);
            }
            else if (la[index] == "4级")
                secTypeArray.push(3);
            else if (la[index] == "5级")
                secTypeArray.push(4);
            else if (la[index] == "6级")
                secTypeArray.push(5);
            else if (la[index] == "7级")
                secTypeArray.push(6);
            else if (la[index] == "助餐")
            {
                zhucan = 7;
                secTypeArray.push(7);
            }
            else if (la[index] == "助洁"){
                zhujie = 8;
                secTypeArray.push(8);
            }
            else if (la[index] == "助急"){
                zhuji = 9;
                secTypeArray.push(9);
            }
            else if (la[index] == "助浴"){
                zhuyu = 10;
                secTypeArray.push(10);
            }
            else if (la[index] == "助行"){
                zhuxing = 11;
                secTypeArray.push(11);
            }
            else if (la[index] == "康复辅助"){
                kangfu = 13;
                secTypeArray.push(13);
            }
            else if (la[index] == "助医"){
                zhuyi = 12;
                secTypeArray.push(12);
            }
            else if (la[index] == "相谈"){
                xiangtan = 14;
                secTypeArray.push(14);
            }
            else if (la[index] == "洗涤"){
                xidi = 15;
                secTypeArray.push(15);
            }
            else if (la[index] == "生活护理"){
                shenghuo = 16;
                secTypeArray.push(16);
            }



        }




       // getNumOfJw();
       getAgeAndSex();
       getJwData();
        sex = 0;
        isMb = 0;
        isSn = 0;
        isYwfy = 0;
        isExzl = 0;
        isGz = 0;
        isCj = 0;
        census = [];
        ageStart = 0;
        ageEnd = 0;
        family = [];
        economic = [];
        health = [];
        oldStatus = [];
        intelligenceArray = [];
        eyesightArray = [];
        familyType = [];
        politicalStatusArray = [];
        organIdArray = [];
        secTypeArray = [];
        mapDistrict = [];
        // ageBar = echarts.init(document.getElementById('ageBar'));
        // sexPie= echarts.init(document.getElementById('sexPie'));
        // pqBar= echarts.init(document.getElementById('pqBar'));
        // hjPie= echarts.init(document.getElementById('hjPie'));
        // ageBar.setOption(option_age_bar);
        // sexPie.setOption(option_sex_pie);
        // pqBar.setOption(option_pq_bar);
        // hjPie.setOption(option_hj_pie);
    }


    function label3Show(index) {
        $("#label1").hide();
        $(".aa").css("display","none");
        $("#label3").show();
        $("#label3"+index).show();
    }

    function clearLabels(){
        $('#selectLabel').html('');
        sex = 0;
        census = [];
        ageStart = 0;
        ageEnd = 0;
        family = [];
        economic = [];
        health = [];
        oldStatus = [];
        politicalStatusArray = [];
        organIdArray = [];
        secTypeArray = [];
        thirdTypeArray = [];
        la = [];
        familyType = [];
        eyesightArray = [];
        intelligenceArray = [];
        health = [];
        isMb = 0;
        isSn = 0;
        isYwfy = 0;
        isExzl = 0;
        isGz = 0;
        isCj = 0;
        zhucan = 0;
        zhuji = 0;
        zhujie = 0;
        zhuyu = 0;
        zhuxing = 0;
        zhuyi = 0;
        kangfu = 0;
        xiangtan = 0;
        xidi = 0;
        shenghuo = 0;
        getAgeAndSex();
        getJwData();
        $('.select').each(function() {
            var cl=$(this).attr('class').split(' ')[1];
            $(this).attr('class','label '+cl);
        });
    }
    function getAgeAndSex() {
      ajxa1 =  $.ajax({
            url: "/map/getSexAndAge",
            type: "get",
            data: {
                "iDisplayStart": 0,
                "iDisplayLength": 100,
                "iSortCol_0": 0,
                "sEcho": 0,
                "sSortDir_0": 0,
                "sex": sex,
                "intelligence_array":intelligenceArray,
                "eyesight_array":eyesightArray,
                "familyType_array":familyType,
                "politicalStatus_array": politicalStatusArray,
                "organId_array": organIdArray,
                "secType_array": secTypeArray,
                "census_array": census,
                "ageStart": ageStart,
                "ageEnd": ageEnd,
                "family_array": family,
                "economic_array": economic,
                "isHealth_array": health,
                "oldStatus_array": oldStatus,
                "district_array": mapDistrict
            },
            dataType: 'json',
            success: function (result) {
                if (result.success == true) {

                    dataR = result.data;
                    //    年龄分布柱状图
                    title_text = '年龄';
                    legend_data = [
                        {
                            name: '男',
                            textStyle: {
                                color: '#fff'
                            }
                        },
                        {
                            name: '女',
                            textStyle: {
                                color: '#fff'
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
                                    position: 'insideLeft'
                                }
                            },
                            itemStyle: {
                                normal: {
                                    color: series_color_1
                                }
                            },
                            data: [dataR.numOfOverNineM, dataR.numOfEightToNineM, dataR.numOfSevenToEightM, dataR.numOfSixToSevenM]
                        },
                        {
                            name: '女',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    show: true,
                                    position: 'insideRight'
                                }
                            },
                            itemStyle: {
                                normal: {
                                    color: series_color_2
                                }
                            },
                            data: [dataR.numOfOverNineF, dataR.numOfEightToNineF, dataR.numOfSevenToEightF, dataR.numOfSixToSevenF]
                        }
                    ];
                    var option_age_bar = chartBarPartAge(title_text, legend_data, yAxis_data, series);
                    ageBar.setOption(option_age_bar);
                }
            }


        });
       ajax2 = $.ajax({
            url: "/chartchange/sexes",
            type: "get",
            data: {
                "iDisplayStart": 0,
                "iDisplayLength": 100,
                "iSortCol_0": 0,
                "sEcho": 0,
                "sSortDir_0": 0,
                "sex": sex,
                "intelligence_array":intelligenceArray,
                "eyesight_array":eyesightArray,
                "familyType_array":familyType,
                "politicalStatus_array": politicalStatusArray,
                "organId_array": organIdArray,
                "secType_array": secTypeArray,
                "census_array": census,
                "ageStart": ageStart,
                "ageEnd": ageEnd,
                "family_array": family,
                "economic_array": economic,
                "isHealth_array": health,
                "oldStatus_array": oldStatus,
                "district_array": mapDistrict
            },
            dataType: 'json',
            success: function (result) {
                if (result.success == true) {
                    dataR = result.data;
                    title_text = "性别";
                    legend_data = [{name: '男', textStyle: {color: legend_color}}, {
                        name: '女',
                        textStyle: {color: legend_color}
                    }];
                    series = [{
                        name: '老人性别',
                        type: 'pie',
                        radius: '40%',
                        center: ['50%', '60%'],
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
                            {value: dataR.numOfMale, name: '男'},
                            {value: dataR.numOfFemale, name: '女'}
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
                    sexPie.setOption(option_sex_pie);
                }
            }
        });
      ajax3 =  $.ajax({
            url: "/chartchange/census",
            type: "get",
            data: {
                "iDisplayStart": 0,
                "iDisplayLength": 100,
                "iSortCol_0": 0,
                "sEcho": 0,
                "sSortDir_0": 0,
                "sex": sex,
                "intelligence_array":intelligenceArray,
                "eyesight_array":eyesightArray,
                "familyType_array":familyType,
                "politicalStatus_array": politicalStatusArray,
                "organId_array": organIdArray,
                "secType_array": secTypeArray,
                "census_array": census,
                "ageStart": ageStart,
                "ageEnd": ageEnd,
                "family_array": family,
                "economic_array": economic,
                "isHealth_array": health,
                "oldStatus_array": oldStatus,
                "district_array": mapDistrict
            },
            dataType: 'json',
            success: function (result) {
                if (result.success == true) {
                    dataR = result.data;
                    title_text = "户籍";
                    legend_data = [{name: '户籍', textStyle: {color: legend_color}}, {
                        name: '非户籍',
                        textStyle: {color: legend_color}
                    }];
                    series = [{
                        name: '',
                        type: 'pie',
                        radius: '40%',
                        center: ['48%', '60%'],
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
                            {value: dataR.numOfCensus, name: '户籍'},
                            {value: dataR.numOfNotCensus, name: '非户籍'}
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }];
                    var option_hj_pie = chartPie(title_text, legend_data, series);
                    hjPie.setOption(option_hj_pie);
                }
            }
        });
       ajax4 = $.ajax({
            url: "/chartchange/district",
            type: "get",
            data: {
                "iDisplayStart": 0,
                "iDisplayLength": 100,
                "iSortCol_0": 0,
                "sEcho": 0,
                "sSortDir_0": 0,
                "sex": sex,
                "intelligence_array":intelligenceArray,
                "eyesight_array":eyesightArray,
                "familyType_array":familyType,
                "politicalStatus_array": politicalStatusArray,
                "organId_array": organIdArray,
                "secType_array": secTypeArray,
                "census_array": census,
                "ageStart": ageStart,
                "ageEnd": ageEnd,
                "family_array": family,
                "economic_array": economic,
                "isHealth_array": health,
                "oldStatus_array": oldStatus,
                "district_array": mapDistrict
            },
            dataType: 'json',
            success: function (result) {
                if (result.success == true) {
                    dataR = result.data;
                    legend_data = "";
                    title_text = '片区人口';
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
                            data: [dataR.donglan, dataR.gulong, dataR.pingnan, dataR.pingyang, dataR.pingji, dataR.gumei]
                        }
                    ];
                    var option_pq_bar = chartBar(title_text, legend_data, yAxis_data, series);
                    pqBar.setOption(option_pq_bar);
                }
            }
        });
    }
    Array.prototype.aindexOf = function(val) {
        for (var i = 0; i < this.length; i++) {
            if (this[i] == val) return i;
        }
        return -1;
    };
    Array.prototype.remove = function(val) {
        var index = this.aindexOf(val);
        if (index > -1) {
            this.splice(index, 1);
        }
    };

    $("span.label").click(
            function () {
                if($(this).attr("class").indexOf("select")>0){
                    var cl=$(this).attr("class").split(" ")[1];
                    $(this).attr("class","label "+cl);
                    var laa=$(this).text().trim();
                    $("#selectLabel span").each(function () {
                        if($(this).text().trim()==laa){
                            $("#label3").hide();
                            $("#label1").show();
                            var text = $(this).text();
                            la.remove(text);

                            $(this).remove();
                            // ageBar = echarts.init(document.getElementById('ageBar'));
                            // sexPie= echarts.init(document.getElementById('sexPie'));
                            // pqBar= echarts.init(document.getElementById('pqBar'));
                            // hjPie= echarts.init(document.getElementById('hjPie'));
                            // ageBar.setOption(option_age_bar);
                            // sexPie.setOption(option_sex_pie);
                            // pqBar.setOption(option_pq_bar);
                            // hjPie.setOption(option_hj_pie);


                            return;
                        }
                    });
                }else {

                    $(this).addClass("select");
                    var text = $(this).text();
                    var cl=$(this).attr("class").split(" ")[1];
                    $("#selectLabel").append($("<span class='bl label "+cl+"'>" + text + "</span>"));
                    la.push(text);
//             table.fnFilter();
                    $("#label3").hide();
                    $("#label1").show();

                    //alert(la.length);

                    // ageBar = echarts.init(document.getElementById('ageBar'));
                    // sexPie = echarts.init(document.getElementById('sexPie'));
                    // pqBar = echarts.init(document.getElementById('pqBar'));
                    // hjPie = echarts.init(document.getElementById('hjPie'));
                    // ageBar.setOption(option_age_bar);
                    // sexPie.setOption(option_sex_pie);
                    // pqBar.setOption(option_pq_bar);
                    // hjPie.setOption(option_hj_pie);
                }
            }
    );
    function picChange(index){
        document.getElementById("container").style.zIndex = 1;
        document.getElementById("dituContent").style.zIndex =2;
        for(var i=0;i<markerArr.length;i++){
            // alert(markerArr.length);
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0,p1);
            var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
            var iw = createInfoWindow(i);
            var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
            marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                borderColor:"#808080",
                color:"#333",
                cursor:"pointer",
                maxWidth:"none",
                fontSize : "15px"//字体大小 　　

            });

            (function(){
                var index = i;
                var _iw = createInfoWindow(i);
                var _marker = marker;
                _marker.addEventListener("click",function(){
                    this.openInfoWindow(_iw);
                });
                _iw.addEventListener("open",function(){
                    _marker.getLabel().hide();
                })
                _iw.addEventListener("close",function(){
                    _marker.getLabel().show();
                })
                label.addEventListener("click",function(){
                    _marker.openInfoWindow(_iw);
                })
                if(!!json.isOpen){
                    label.hide();
                    _marker.openInfoWindow(_iw);
                }
            })()
        }

        organMapIndex=index;
        var allOverlay = map.getOverlays();
        var len = map.getOverlays().length;

        if(organMapIndex == 1) str="养老院";//老有所养
        else if(organMapIndex == 2) str="社区卫生站";//所医
        else if(organMapIndex == 3) str="助餐点";//所为
        else if(organMapIndex == 4) str="老年人学校";//所学
        else if(organMapIndex == 5) str="社区卫生站";//所乐
        for (var i = len; i >0; i--){
            if (allOverlay[i] instanceof BMap.Marker) {
                var str = allOverlay[i].getLabel().content;
                if (organMapIndex == 1) {
                    if (str != "莲花敬老院" && str != "古美敬老院" && str != "平阳敬老院"
                            &&str != "智慧坊长者照护之家" && str != "平南长者照护之家" && str != "平阳长者照护之家"
                            &&str != "平南邻里中心" && str != "平吉一村日托站" && str != "平吉二村日托站"
                            &&str != "古美助餐点" && str != "古龙助餐点" && str != "平南助餐点"
                            &&str != "平吉助餐点") {
                        map.removeOverlay(map.getOverlays()[i]);

                    }
                } else if (organMapIndex == 2) {
                    if (str != "古美社区卫生服务中心" && str != "万源城社区卫生服务站" && str != "平吉社区卫生服务站"
                            &&str != "成亿社区卫生服务站" && str != "古龙社区卫生服务站" && str != "东兰社区卫生服务站"
                            &&str != "平南社区卫生服务站") {
                        map.removeOverlay(map.getOverlays()[i]);

                    }
                } else if (organMapIndex == 5) {
                    if (str != "东兰邻里中心" && str != "古龙邻里中心" && str != "平南邻里中心"
                            &&str != "平南居" && str != "东兰苑" && str != "古美韵"
                            &&str != "社区活动中心"
                            &&str != "东兰一居" && str != "古龙一居" && str != "古美一村"&&str != "古龙二居" && str != "古龙三居" && str != "东兰三居"
                            &&str != "东兰四居" && str != "平吉三村" && str != "古龙六居"&&str != "古美九村" && str != "古美七村" && str != "华梅花苑"
                            &&str != "梅莲苑" && str != "平阳二村" && str != "平阳三村"&&str != "万源四居" && str != "万源一居" && str != "东兰二居"
                            &&str != "平吉四村" && str != "古龙四居" && str != "古美八村"&&str != "古美四村" && str != "平南三居" && str != "平南一居"
                            &&str != "平阳六村" && str != "平阳四村" && str != "平阳一村"&&str != "万源三居" && str != "古龙五村" && str != "平吉六村"
                            &&str != "华一新城" && str != "平吉二村" && str != "平吉五村"&&str != "古美三村" && str != "古美十村" && str != "平南二居"
                            &&str != "平阳五村" && str != "平吉一村" && str != "万源二居") {
                        map.removeOverlay(map.getOverlays()[i]);

                    }
                }else if (organMapIndex == 3) {
                    if (str != "古美中心幼儿园" && str != "古美阳光幼儿园" && str != "平南小学"
                            &&str != "平吉小学" && str != "古美学校" && str != "实验学校西校"
                            &&str != "古美高级中学" && str != "龙茗中学"&&str!="古美学校（小、初中）") {
                        map.removeOverlay(map.getOverlays()[i]);

                    }
                }else if (organMapIndex == 4) {
                    if (str != "古美路街道社区学校") {
                        map.removeOverlay(map.getOverlays()[i]);

                    }
                }
            }


        }
    }
    function ChangeMap() {
        document.getElementById("container").style.zIndex = 3 - document.getElementById("container").style.zIndex;
        document.getElementById("dituContent").style.zIndex = 3 - document.getElementById("dituContent").style.zIndex;
        heatmapOverlay.setDataSet({data:hpoints,max:200});
        for(var i=0;i<markerArr.length;i++){
            // alert(markerArr.length);
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0,p1);
            var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
            var iw = createInfoWindow(i);
            var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
            marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                borderColor:"#808080",
                color:"#333",
                cursor:"pointer",
                maxWidth:"none",
                fontSize : "15px"//字体大小 　　

            });

            (function(){
                var index = i;
                var _iw = createInfoWindow(i);
                var _marker = marker;
                _marker.addEventListener("click",function(){
                    this.openInfoWindow(_iw);
                });
                _iw.addEventListener("open",function(){
                    _marker.getLabel().hide();
                })
                _iw.addEventListener("close",function(){
                    _marker.getLabel().show();
                })
                label.addEventListener("click",function(){
                    _marker.openInfoWindow(_iw);
                })
                if(!!json.isOpen){
                    label.hide();
                    _marker.openInfoWindow(_iw);
                }
            })()
        }
    }
</script>
<script src="/static/js/visual/mapData.js"></script>
</html>