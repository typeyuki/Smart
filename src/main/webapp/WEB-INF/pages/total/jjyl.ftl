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
        white-space:nowrap;
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
                            <i class="fa fa-envelope fa-4x" style="color: white;margin:20% 0;"><span class="message_num">${(num.messageNum)!0}</span></i>
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
                <p class="num_p">老人数量</p>
                <p class="num">${(num.oldmanNum)!9}</p>
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
                <div id="type" class="tuPie" onclick="back('/home/man/all',6)"></div>
            </div>
            <div class="col-lg-5 tu" style="position:relative;left:3%;width: 37%">
                <div id="inout" class="tuPie" onclick="back('/home/man/all',6)"></div>
            </div>
        </div>
        <div class="row" style="margin-top: 1%">
            <div class="col-lg-5 tu" style="width: 37%">
                <div id="num" class="tuPie" onclick="back('/home/man/all',6)"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
        var tuPie_w,tuPie_h;
        if(winWidth>=1700){
            tuPie_w=winWidth/3.5;
            tuPie_h=winHeight/2;
            tuBar_h=winHeight/2;
        }else if(winWidth<1700 && winWidth>=1000){
            tuPie_w=winWidth/4.5;
            tuPie_h=winHeight/3.1;
        }
        $(".tuPie").css('width',tuPie_w);
        $(".tuPie").css( 'height', tuPie_h);

        var type = echarts.init(document.getElementById('type'));
        var inout = echarts.init(document.getElementById('inout'));
        var num = echarts.init(document.getElementById('num'));
    </script>

<#include "oldStatus.ftl"/>
<script src="/static/js/common.js"></script>
<script>
//    $.ajax({
//        url : "/total/data/getOldmanNum",
//        type : "get",
//        success : function(data) {
//            if (data.success==true) {
//                var dataR=data.data;
                title_text="类型人员占比";
                legend_data=[{name:'家庭服务'},{name:'长护险'},{name:'智能终端'},{name:'家庭医生'},{name:'家庭病床'}];
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
                        {value:6, name:'家庭服务'},
                        {value:0, name:'长护险'},
                        {value:3, name:'智能终端'},
                        {value:0, name:'家庭医生'},
                        {value:0, name:'家庭病床'}
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
                        return params.name+"："+params.value;
                    }
                };
                var option_type = chartPie(title_text,legend_data,series,tooltip);
                type.setOption(option_type);
//            }
//        }
//    });


//    $.ajax({
//        url : "/total/data/getOldStatus",
//        type : "get",
//        success : function(data) {
//            if (data.success==true) {
//                var dataR=data.data;
                title_text="街道内外人员占比";
                legend_data=[{name:'街道'},{name:'非街道'}];
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
                        {value:9, name:'街道'},
                        {value:0, name:'非街道'}
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
                        return params.name+"："+params.value;
                    }
                };
                var option_inout = chartPie(title_text,legend_data,series,tooltip);
                inout.setOption(option_inout);
//            }
//        }
//    });




            title_text='最近半年数量变化';
            xAxis_data=['2月','3月','4月','5月','6月','7月'];
            series=[
                {
                    name: '数量',
                    type: 'line',
                    data: [0,0,0,0,0,9]
                }
            ];
            var option_num = chartLine(title_text,legend_data,xAxis_data,series);
            num.setOption(option_num);


</script>

