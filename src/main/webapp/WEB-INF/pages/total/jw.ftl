<style>
    .tu{
        background-color:#fff ;
        cursor:pointer!important;
        -moz-box-shadow:2px 2px 9px #333333; -webkit-box-shadow:2px 2px 9px #333333; box-shadow:2px 2px 9px #333333;
    }
    canvas{
        cursor:pointer!important;
    }
    #messageNum,#messageNum1,#oldmanNum,#num80,#bl,#organNum{
        position: absolute;
        font-size: 2em;
        z-index: 999;
        font-weight: bold;
    }

    @media only screen and (min-width: 1000px) and ( max-width: 1600px){
        .middle{
            position: absolute;
            top:50%;
            left:50%;
            width:100%;
            transform:translate(-50%,-44%);
            text-align: center;
            /*margin-top: 0.8%*/
        }
        .middle-left{
            position: relative;left: 6.5%;
        }
        .middle-right{
            position: relative;left: 9%
        }
        .tu{
            width: 75%;
        }
        .tu-marign{
            margin-top: 10%
        }
        .middle-left-left{
            position: relative;left: 4.5%;
        }
        .tu span{
            font-size: 1.2em;
            position: relative;
            top:10px;
            color: whitesmoke;
            font-weight: bold;
            right: 3px;
        }
        .high{
            width: 10%;
        }
        .tuPie,.tuBar{
            position: relative;
            right: 10px;
        }
        #num{
            width: 110%;
            position: relative;
            right: 15%;
            bottom: 2%;
        }
        #messageNum{
            left: -5%;
            top: 54.5%;
            color: red;
        }
        #messageNum1{
            left: -6.5%;
            top: 54.5%;
            color: red;
        }
        #oldmanNum{
            left: 46.5%;
            top: 79%;
            color: white;
        }
        #num80{
            left: 75%;
            top: 54%;
            color: white;
        }
        #bl{
            left: 46.5%;
            top: 28%;
            color: white;
        }
        #clickMessage{
            height: 36%;
            width: 42%;
            border-radius: 100%;
            position: absolute;
            top: 48%;
            left: -6%;
            z-index: 999;
            cursor: pointer;
        }
    }


    @media only screen and ( min-width: 1600px){
        .middle{
            position: absolute;
            top:50%;
            left:50%;
            width:100%;
            transform:translate(-50%,-44%);
            text-align: center;
            /*margin-top: 0.8%*/
        }
        .middle-left{
            position: relative;left: 6.5%;
        }
        .middle-right{
            position: relative;left: 9%
        }
        .tu{
            width: 75%;
        }
        .tu-marign{
            margin-top: 10%
        }
        .middle-left-left{
            position: relative;left: 4.5%;
        }
        .tu span{
            font-size: 1.2em;
            position: relative;
            top:10px;
            color: whitesmoke;
            font-weight: bold;
            right: 3px;
        }
        .high{
            width: 10%;
        }
        .tuPie,.tuBar{
            position: relative;
            right: 10px;
        }
        #num{
            width: 110%;
            position: relative;
            right: 15%;
            bottom: 2%;
        }
        #messageNum{
            left: -5%;
            top: 54.5%;
            color: red;
        }
        #messageNum1{
            left: -6.5%;
            top: 54.5%;
            color: red;
        }
        #oldmanNum{
            left: 46.5%;
            top: 79%;
            color: white;
        }
        #num80{
            left: 75%;
            top: 54%;
            color: white;
        }
        #bl{
            left: 46.5%;
            top: 28%;
            color: white;
        }
        #clickMessage{
            height: 36%;
            width: 42%;
            border-radius: 100%;
            position: absolute;
            top: 48%;
            left: -6%;
            z-index: 999;
            cursor: pointer;
        }
    }
</style>
<div class="row middle">
    <div class="col-lg-4 middle-left">
        <div style="position: relative;">
        <#if (num.messageNum!0)?length=1 >
        <span id="messageNum">
        <#else >
        <span id="messageNum1">
        </#if>
        ${num.messageNum!0}</span>
            <span id="oldmanNum">${num.oldmanNum!0}</span>
            <span id="num80">${num.num80!0}</span>
            <span id="bl">${((num.bl!"0.00%")?substring(0,1)==".")?string("0"+(num.bl)!,(num.bl)!"0.00%")}</span>
            <div id="clickMessage" onclick="location.href='/'"></div>
            <img src="/static/img/num_jw.png" id="num" >
        </div>
    </div>
    <div class="col-lg-4 middle-right">
        <div class="row">
            <div class="col-lg-12 tu">
                <div class="row" onclick="back('/oldman',1)">
                    <div class="col-lg-1 high" style=" background: linear-gradient(#6371B0,#C3921B);">
                        <span>老人综合信息</span>
                    </div>
                    <div class="col-lg-10">
                        <div id="old" class="tuPie"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row tu-marign">
            <div class="col-lg-12 tu">
                <div class="row" onclick="back('/oldman/key',3)">
                    <div class="col-lg-1 high" style="background: linear-gradient(#2C572F,#C51F83)">
                        <span>重点老人信息</span>
                    </div>
                    <div class="col-lg-10">
                        <div id="key" class="tuPie" ></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-4 middle-left-left" >
        <div class="row" >
            <div class="col-lg-12 tu" >
                <div class="row" onclick="$('#oldStatusModal').modal();">
                    <div class="col-lg-1 high" style="background: linear-gradient(#92C990,#C51F83)">
                        <span>养老信息</span>
                    </div>
                    <div class="col-lg-10">
                        <div id="oldStatus" class="tuPie"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row tu-marign">
            <div class="col-lg-12 tu">
                <div class="row"  onclick="back('/oldman/health',2)">
                    <div class="col-lg-1 high" style="background-color: #C7610C">
                        <span>老人健康基本信息</span>
                    </div>
                    <div class="col-lg-10">
                        <div id="oldHealth" class="tuBar"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var tuPie_w,tuPie_h,tuBar_w,tuBar_h;
        if(winWidth>=1600){
            tuPie_w=winWidth/4.5;
            tuPie_h=winHeight/4;
            tuBar_w=winWidth/4.2;
            tuBar_h=winHeight/4;
        }else if(winWidth<1600 && winWidth>=1000){
            tuPie_w=winWidth/4.5;
            tuPie_h=winHeight/4;
            tuBar_w=winWidth/4.2;
            tuBar_h=winHeight/4;
        }
        $(".tuPie").css('width',tuPie_w);
        $(".tuPie").css( 'height', tuPie_h);
        $(".tuBar").css('width',tuBar_w);
        $(".tuBar").css( 'height', tuBar_h);
        $(".high").css("height",tuPie_h+10);

        var old = echarts.init(document.getElementById('old'));
        var oldStatusa = echarts.init(document.getElementById('oldStatus'));
        var oldHealth = echarts.init(document.getElementById('oldHealth'));
        var key = echarts.init(document.getElementById('key'));
    </script>
</div>
<#include "oldStatus.ftl"/>
<#include "organ.ftl"/>
    <script src="/static/js/common.js"></script>
    <script>
        $.ajax({
            url : "/total/data/getOldmanNum",
            type : "get",
            success : function(data) {
                if (data.success==true) {
                    var dataR=data.data;
                    title_text="";
//                titleClick.link="javascript:newPage(1,'老人信息','/oldman')";
                    legend_data=[{name:'60岁-79岁'},
                        {name:'80岁以上'}];
                    series=[
                        {
                            name:'',
                            type:'pie',
                            radius: ['40%', '60%'],
                            center: ['38%','55%'],
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
                            ]
                        }
                    ];
                    color=["#C3921B","#6371B0"];
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
                    var option_old = chartPie(title_text,legend_data,series,tooltip,color);
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
                    title_text="";
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
                        center: ['38%','55%'],
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
                    color=["#C51F83","#2C572F","#92C990"];
                    var option_oldStatus = chartPie(title_text,legend_data,series,tooltip,color);
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
                    title_text="";
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
                    color=["#C7610C"];
                    var option_oldHealth=chartBarHei(title_text,legend_data,xAxis_data,series,color);
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
                    title_text="";
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
                        center: ['38%','55%'],
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
                    color=["#C51F83","#2C572F","#54A887"];
                    var option_key = chartPie(title_text,legend_data,series,tooltip,color);
                    key.setOption(option_key);
                }
            }
        });

    </script>