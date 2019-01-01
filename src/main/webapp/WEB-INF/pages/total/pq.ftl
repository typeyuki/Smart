<style>
    .tu{
        background-color:#fff ;
        cursor:pointer!important;
    }
    canvas{
        cursor:pointer!important;
    }
    .tu1 img{
        width: 70%;
        height: 75%;
    }
    .tu1{
        padding-top: 4%;
        text-align: center;
        background-color: #715f41;
        position: relative;
    }
    p{
        color: white;
    }
    p.p_small{
        font-size: 18px;
        position: absolute;
        left: 50%;
        bottom: -7%;
        transform: translate(-50%, -50%);
        text-align: center;
    }
    p.num_p{
        font-size: 18px;
        text-align: center;
    }

    .tu2{
        background-color: #715f41;
        padding-top: 4%;
        text-align: center;
    }
    .num{
        font-size: 34px;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
        color: #ffeb3b;
    }
    .message_num{
        position: absolute;
        top: 20%;
        font-size: 28px;
        color: red;
        background-color: white;
        border-radius: 100%;
        padding: 2px 6px;
        font-weight: bold;
    }
</style>
<div class="row" style="margin-top: 3%">
    <div class="col-lg-4" style="position: relative;left: 6.5%;">
        <div class="row">
            <div class="col-lg-12">
                <div class="row" >
                    <div class="col-lg-4 tu1" align="center">
                        <img src="/static/img/touxiang.svg">
                        <p class="p_small">${roleDesc}</p>

                    </div>
                    <div class="col-lg-4 tu1" align="center" style="cursor: pointer" onclick=location.href="/">
                        <div style="border-left:2px solid whitesmoke;">
                            <i class="fa fa-envelope fa-4x" style="color: white;margin:20% 0;"><span class="message_num">${num.messageNum!0}</span></i>
                            <p class="p_small">消息中心</p>
                        </div>
                    </div>
                </div>
                <script>
                    $(".tu1").css("height",winHeight/4);
                    $(".tu1").css("width",winWidth/7.5);
                </script>
            </div>
        </div>
        <div class="row" style="margin-top: 7%">
            <div class="col-lg-4 tu2" style="background-color: #607d8b">
                <p class="num_p">街道老人数量</p>
                <p class="num">${num.oldmanNum!0}</p>
            </div>
            <div class="col-lg-4 tu2" style="margin-left: 3.2%;background-color: #926c5e">
                <p class="num_p">80岁及以上老人数量</p>
                <p class="num">${num.num80!0}</p>
            </div>
        </div>
        <div class="row" style="margin-top: 2%;">
            <div class="col-lg-4 tu2" style="background-color: #926c5e">
                <p class="num_p">老龄人口比例</p>
                <p class="num">${num.bl!"0%"}</p>
            </div>
        </div>
        <script>
            $(".tu2").css("height",winHeight/4.8);
            $(".tu2").css("width",winWidth/7.85);
        </script>
    </div>
    <div class="col-lg-8" style="position: relative;left: 9%">
        <div class="row">
            <div class="col-lg-4 tu" style="width: 37%">
                <div id="old" class="tuPie" onclick="back('/oldman',1)"></div>
            </div>
            <div class="col-lg-5 tu" style="position:relative;left:3%;width: 37%">
                <div id="oldHealth" class="tuBar" onclick="back('/oldman/health',2)"></div>
            </div>
        </div>
        <div class="row" style="margin-top: 1%">
            <div class="col-lg-5 tu" style="width: 37%">
                <div id="key" class="tuPie" onclick="back('/oldman/key',3)"></div>
            </div>
            <div class="col-lg-5 tu" style="position:relative;left:3%;width: 37%">
                <div id="oldStatus" class="tuPie" onclick="$('#oldStatusModal').modal();"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
        var tuPie_w,tuPie_h,tuBar_w,tuBar_h;
        if(winWidth>=1700){
            tuPie_w=winWidth/4.5;
            tuPie_h=winHeight/3.1;
            tuBar_w=winWidth/4.2;
            tuBar_h=winHeight/3.1;
        }else if(winWidth<1700 && winWidth>=1000){
            tuPie_w=winWidth/4.5;
            tuPie_h=winHeight/3.1;
            tuBar_w=winWidth/4.2;
            tuBar_h=winHeight/3.1;
        }
        $(".tuPie").css('width',tuPie_w);
        $(".tuPie").css( 'height', tuPie_h);
        $(".tuBar").css('width',tuBar_w);
        $(".tuBar").css( 'height', tuBar_h);

        var old = echarts.init(document.getElementById('old'));
        var oldStatusa = echarts.init(document.getElementById('oldStatus'));
        var oldHealth = echarts.init(document.getElementById('oldHealth'));
        var key = echarts.init(document.getElementById('key'));
    </script>

<#include "oldStatus.ftl"/>
<script src="/static/js/common.js"></script>
<script>
    $.ajax({
        url : "/total/data/getOldmanNum",
        type : "get",
        success : function(data) {
            if (data.success==true) {
                var dataR=data.data;
                title_text="老人综合信息";
//                titleClick.link="javascript:newPage(1,'老人信息','/oldman')";
                legend_data=[{name:'60岁-79岁'},
                    {name:'80岁以上'}];
                series=[
                    {
                        name:'',
                        type:'pie',
                        radius: ['40%', '60%'],
                        center: ['45%','58%'],
                        avoidLabelOverlap: false,
                        label: {
                            normal: {
                                show: true,
                                formatter: "{d}%\n({c})"
                            }
                        },
                        data:[
                            {value:dataR.num60, name:'60岁-79岁'},
                            {value:dataR.num80, name:'80岁以上'}
//                            {value:(dataR.num-dataR.num80-dataR.num60), name:'全部'}
                        ]
                    }
                ];
                tooltip = {
                    trigger: 'item',
                    formatter: function (params) {
//                        if(params.name=="全部"){
//                            return params.name+"："+dataR.num;
//                        }else{
                            return params.name+"："+params.value;
//                        }
                    }
                };
                var option_old = chartPie(title_text,legend_data,series,tooltip);
                old.setOption(option_old);
            }
        }
    });


    $.ajax({
        url : "/total/data/getOldStatus",
        type : "get",
        success : function(data) {
            if (data.success==true) {
                var dataR=data.data;
                title_text="养老信息";
//                titleClick.link="javascript:newPage(1,'重点老人','/oldman/key')";

                legend_data=[{name:'机构养老'},{name:'社区养老'},{name:'居家养老'}];
                series=[{
                    name: '',
                    type: 'pie',
                    radius : '60%',
                    label : {
                        normal : {
                            formatter: '{d}%\n({c})'
                        }
                    },
                    center: ['48%', '60%'],
                    data:[
                        {value:dataR.organOldNum, name:'机构养老'},
                        {value:dataR.communityOldNum, name:'社区养老'},
                        {value:dataR.familyOldNum, name:'居家养老'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                tooltip = {
                    trigger: 'item',
                    formatter: "{b}：{d}%({c})"
                };
                var option_oldStatus = chartPie(title_text,legend_data,series,tooltip);
                oldStatusa.setOption(option_oldStatus);
            }
        }
    });

    $.ajax({
        url : "/total/data/getHealthNum",
        type : "get",
        success : function(data) {
            if (data.success==true) {
                var dataR=data.data;
                title_text="老人健康基本信息";
//                titleClick.link="javascript:newPage(2,'健康档案','/oldman/health')";
                legend_data=[];
                xAxis_data=['慢病','失能','药物反应','恶性肿瘤史','残疾史','骨折史'];
                series=[
                    {
                        name: '人数',
                        type: 'bar',
                        label:{
                            normal:{
                                show:true,
                                position:'top'
                            }
                        },

                        data: [dataR.mbNum,dataR.snNum,dataR.ywfyNum,dataR.exzlNum,dataR.cjNum,dataR.gzNum]
                    }
                ];
                tooltip = {
                    trigger: 'item',
                    formatter: "{b}：{d}%({c})"
                };
                var option_oldHealth=chartBarHei(title_text,legend_data,xAxis_data,series);
                oldHealth.setOption(option_oldHealth);
            }
        }
    });

    $.ajax({
        url : "/total/data/getKeyNum",
        type : "get",
        success : function(data) {
            if (data.success==true) {
                var dataR=data.data;
                title_text="重点老人信息";
//                titleClick.link="javascript:newPage(1,'重点老人','/oldman/key')";

                legend_data=[{name:'已安排'},{name:"待安排"},{name:'总人数'}];
                series=[{
                    name: '',
                    type: 'pie',
                    radius : '60%',
                    label : {
                        normal : {
                            formatter: '{d}%\n({c})'
                        }
                    },
                    center: ['48%', '60%'],
                    data:[
                        {value:dataR.num-dataR.apNum-dataR.clNum, name:'总人数'},
                        {value:dataR.apNum, name:'已安排'},
                        {value:dataR.clNum, name:'待安排'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }];
                tooltip = {
                    trigger: 'item',
                    formatter: function (params) {
                        if(params.name=="总人数"){
                            return params.name+"："+dataR.num;
                        }else{
                            return params.name+"："+params.value;
                        }
                    }
                };
                var option_key = chartPie(title_text,legend_data,series,tooltip);
                key.setOption(option_key);
            }
        }
    });

</script>

