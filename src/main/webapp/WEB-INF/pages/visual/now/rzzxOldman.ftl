<style>
    @media only screen and (min-width: 6000px){
        .rzzxOldman_tu{
            padding-top: 5%;
            padding-bottom: 2%;
        }
    }
</style>
<#include "../head.ftl" />
<div id="child_rzzxOldman" style="display: none">
    <div class="row box">
        <div class="zz"></div>
        <p class="title" onclick="change('child_rzzxOldman','child_organ')" style="font-size: 28px">日照中心床位数总和</p>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_sub_pie" class="rzzxOldman_tu"></div>
        </div>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_sex_pie" class="rzzxOldman_tu"></div>
        </div>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_age_bar" class="rzzxOldman_tu"></div>
        </div>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_sub_wl" class="rzzxOldman_tu"></div>
        </div>
    </div>
    <div class="row box">
        <div class="zz"></div>
        <p class="title" style="font-size: 28px">日间照料中心(平南邻里中心）</p>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_1_pie" class="rzzxOldman_tu"></div>
        </div>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_1_sex" class="rzzxOldman_tu"></div>
        </div>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_1_age" class="rzzxOldman_tu"></div>
        </div>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_1_wl" class="rzzxOldman_tu"></div>
        </div>
    </div>
    <div class="row box">
        <div class="zz"></div>
        <p class="title" style="font-size: 28px">平吉一村日托站</p>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_2_pie" class="rzzxOldman_tu"></div>
        </div>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_2_sex" class="rzzxOldman_tu"></div>
        </div>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_2_age" class="rzzxOldman_tu"></div>
        </div>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_2_wl" class="rzzxOldman_tu"></div>
        </div>
    </div>
    <div class="row box">
        <div class="zz"></div>
        <p class="title" style="font-size: 28px">平吉二村日托站</p>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_3_pie" class="rzzxOldman_tu"></div>
        </div>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_3_sex" class="rzzxOldman_tu"></div>
        </div>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_3_age" class="rzzxOldman_tu"></div>
        </div>
        <div class="col-lg-3">
            <div id="rzzxOldman_jg_3_wl" class="rzzxOldman_tu"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var rzzxOldman_tu_w,rzzxOldman_tu_h;
    var rzzxOldman_width=$("#organ").width();
    if(winWidth>=1900){
        rzzxOldman_tu_w=rzzxOldman_width/4;
        rzzxOldman_tu_h=winHeight/10.05;
    }else if(winWidth<=1400 && winWidth>=1300){
        oldman_tu_w=winWidth/4.5;
        oldman_tu_h=winHeight/4.1;
    }

    $(".rzzxOldman_tu").css('width',rzzxOldman_tu_w);
    $(".rzzxOldman_tu").css( 'height', rzzxOldman_tu_h);

    var rzzxOldman_jg_sub_pie = echarts.init(document.getElementById('rzzxOldman_jg_sub_pie'));
    var rzzxOldman_jg_sub_wl= echarts.init(document.getElementById('rzzxOldman_jg_sub_wl'));
    var rzzxOldman_jg_1_pie= echarts.init(document.getElementById('rzzxOldman_jg_1_pie'));
    var rzzxOldman_jg_1_wl = echarts.init(document.getElementById('rzzxOldman_jg_1_wl'));
    var rzzxOldman_jg_2_pie= echarts.init(document.getElementById('rzzxOldman_jg_2_pie'));
    var rzzxOldman_jg_2_wl = echarts.init(document.getElementById('rzzxOldman_jg_2_wl'));
    var rzzxOldman_jg_3_pie= echarts.init(document.getElementById('rzzxOldman_jg_3_pie'));
    var rzzxOldman_jg_3_wl = echarts.init(document.getElementById('rzzxOldman_jg_3_wl'));

    var rzzxOldman_jg_sex_pie = echarts.init(document.getElementById('rzzxOldman_jg_sex_pie'));
    var rzzxOldman_jg_age_bar = echarts.init(document.getElementById('rzzxOldman_jg_age_bar'));
    var rzzxOldman_jg_1_age = echarts.init(document.getElementById('rzzxOldman_jg_1_age'));
    var rzzxOldman_jg_1_sex = echarts.init(document.getElementById('rzzxOldman_jg_1_sex'));
    var rzzxOldman_jg_2_age = echarts.init(document.getElementById('rzzxOldman_jg_2_age'));
    var rzzxOldman_jg_2_sex = echarts.init(document.getElementById('rzzxOldman_jg_2_sex'));
    var rzzxOldman_jg_3_age = echarts.init(document.getElementById('rzzxOldman_jg_3_age'));
    var rzzxOldman_jg_3_sex = echarts.init(document.getElementById('rzzxOldman_jg_3_sex'));
</script>


<script>

    title_text="";
    legend_data=[{name:'已入住',textStyle:{color:legend_color,fontSize:18}},{name:'剩余',textStyle:{color:legend_color,fontSize:18}}];
    series=[{
        name: '老人户籍',
        type: 'pie',
        radius : '55%',
        center: ['48%', '50%'],
        label : {
            normal : {
                formatter: '{d}%\n({c})',
                textStyle : {
                    fontWeight : 'normal',
                    fontSize : 20
                }
            }
        },
        data:[
            {value:476, name:'已入住'},
            {value:376, name:'剩余'}
        ],
        itemStyle: {
            emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        }
    }];
    var rzzxOldman_option_sub_pie = chartPie(title_text,legend_data,series);

    title_text="";
    legend_data=[];
    series=[
        {
            name:'未来空余',
            type:'pie',
            radius: ['50%', '65%'],
            avoidLabelOverlap: false,
            label: {
                normal : {
                    position:"center",
                    formatter: '{a}\n{c}',
                    textStyle : {
                        fontWeight : 'normal',
                        fontSize : 18,
                        color:"#f2f989"
                    }
                }
            },
            data:[
                {value:0, name:'未来空余'}
            ]
        }
    ];
    var rzzxOldman_option_sub_wl = gauge(title_text,58);
    title_text="";
    legend_data=[{name:'已入住',textStyle:{color:legend_color,fontSize:18}},{name:'剩余',textStyle:{color:legend_color,fontSize:18}}];
    series=[{
        name: '老人户籍',
        type: 'pie',
        radius : '55%',
        center: ['48%', '50%'],
        label : {
            normal : {
                formatter: '{d}%\n({c})',
                textStyle : {
                    fontWeight : 'normal',
                    fontSize : 20
                }
            }
        },
        data:[
            {value:476, name:'已入住'},
            {value:376, name:'剩余'}
        ],
        itemStyle: {
            emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        }
    }];
    var rzzxOldman_option_1_pie = chartPie(title_text,legend_data,series);

    title_text="";
    legend_data=[];
    series=[
        {
            name:'未来空余',
            type:'pie',
            radius: ['50%', '65%'],
            avoidLabelOverlap: false,
            label: {
                normal : {
                    position:"center",
                    formatter: '{a}\n{c}',
                    textStyle : {
                        fontWeight : 'normal',
                        fontSize : 18,
                        color:"#f2f989"
                    }
                }
            },
            data:[
                {value:40, name:'未来空余'}
            ]
        }
    ];
    var rzzxOldman_option_1_wl = gauge(title_text,58);
    title_text="";
    legend_data=[{name:'已入住',textStyle:{color:legend_color,fontSize:18}},{name:'剩余',textStyle:{color:legend_color,fontSize:18}}];
    series=[{
        name: '老人户籍',
        type: 'pie',
        radius : '30%',
        center: ['48%', '50%'],
        label : {
            normal : {
                formatter: '{d}%\n({c})',
                textStyle : {
                    fontWeight : 'normal',
                    fontSize : 12
                }
            }
        },
        data:[
            {value:0, name:'已入住'},
            {value:0, name:'剩余'}
        ],
        itemStyle: {
            emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        }
    }];
    var rzzxOldman_option_2_pie = chartPie(title_text,legend_data,series);

    title_text = "";
    legend_data = [{name: '失能', textStyle: {color: legend_color, fontSize:8}}, {
        name: '失智',
        textStyle: {color: legend_color, fontSize:8}
    },{name: '自理', textStyle: {color: legend_color, fontSize:8}}];
    series = [{
        name: '老人健康状态',
        type: 'pie',
        radius: '30%',
        center: ['48%', '50%'],
        label: {
            normal: {
                formatter: '{d}%\n({c})',
                textStyle: {
                    fontWeight: 'normal',
                    fontSize:12
                }
            }
        },
        data: [
            {value: 0, name: '失能'},
            {value: 0, name: '失智'},
            {value: 0, name: '自理'}
        ],
        itemStyle: {
            emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        }
    }];
    var rzzxOldman_option_2_wl =chartPie_for_big_SN(title_text, legend_data, series);

    title_text="";
    legend_data=[{name:'已入住',textStyle:{color:legend_color,fontSize:18}},{name:'剩余',textStyle:{color:legend_color,fontSize:18}}];
    series=[{
        name: '老人户籍',
        type: 'pie',
        radius : '30%',
        center: ['48%', '50%'],
        label : {
            normal : {
                formatter: '{d}%\n({c})',
                textStyle : {
                    fontWeight : 'normal',
                    fontSize : 12
                }
            }
        },
        data:[
            {value:0, name:'已入住'},
            {value:0, name:'剩余'}
        ],
        itemStyle: {
            emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        }
    }];
    var rzzxOldman_option_3_pie = chartPie(title_text,legend_data,series);

    title_text = "";
    legend_data = [{name: '失能', textStyle: {color: legend_color, fontSize:8}}, {
        name: '失智',
        textStyle: {color: legend_color, fontSize:8}
    },{name: '自理', textStyle: {color: legend_color, fontSize:8}}];
    series = [{
        name: '老人健康状态',
        type: 'pie',
        radius: '30%',
        center: ['48%', '50%'],
        label: {
            normal: {
                formatter: '{d}%\n({c})',
                textStyle: {
                    fontWeight: 'normal',
                    fontSize:12
                }
            }
        },
        data: [
            {value: 0, name: '失能'},
            {value: 0, name: '失智'},
            {value: 0, name: '自理'}
        ],
        itemStyle: {
            emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        }
    }];
    var rzzxOldman_option_3_wl =chartPie_for_big_SN(title_text, legend_data, series);


    rzzxOldman_jg_sub_pie.setOption(rzzxOldman_option_sub_pie);
    rzzxOldman_jg_sub_wl.setOption(rzzxOldman_option_sub_wl);
    rzzxOldman_jg_1_pie.setOption(rzzxOldman_option_1_pie);
    rzzxOldman_jg_1_wl.setOption(rzzxOldman_option_1_wl);
    rzzxOldman_jg_2_pie.setOption(rzzxOldman_option_2_pie);
    rzzxOldman_jg_2_wl.setOption(rzzxOldman_option_2_wl);
    rzzxOldman_jg_3_pie.setOption(rzzxOldman_option_3_pie);
    rzzxOldman_jg_3_wl.setOption(rzzxOldman_option_3_wl);
    rzzxOldman_jg_1_wl.on('legendselectchanged',function (params){
        var name = params.name;
        if(name == "失能")
            health.push(2);
        else if(name == "失智")
            intelligenceArray.push(29,30);
        else if(name == "自理")
            shenghuo = 1;
        table.fnFilter();
        getNumOfJw();
        //getAgeAndSex();
        
    } );
    rzzxOldman_jg_2_wl.on('legendselectchanged',function (params){
        var name = params.name;
        if(name == "失能")
            health.push(2);
        else if(name == "失智")
            intelligenceArray.push(29,30);
        else if(name == "自理")
            shenghuo = 1;
        table.fnFilter();
        getNumOfJw();
        //getAgeAndSex();
        
    } );
    rzzxOldman_jg_3_wl.on('legendselectchanged',function (params){
        var name = params.name;
        if(name == "失能")
            health.push(2);
        else if(name == "失智")
            intelligenceArray.push(29,30);
        else if(name == "自理")
            shenghuo = 1;
        table.fnFilter();
        getNumOfJw();
        //getAgeAndSex();
        
    } );

    //性别饼图
    title_text="性别";
    legend_data=[{name:'男',textStyle:{color:legend_color,fontSize:18}},{name:'女',textStyle:{color:legend_color,fontSize:18}}];
    series=[{
        name: '老人性别',
        type: 'pie',
        radius : '55%',
        label : {
            normal : {
                formatter: '{d}%\n({c})',
                textStyle : {
                    fontWeight : 'normal',
                    fontSize : 20
                }
            }
        },
        center: ['48%', '50%'],
        data:[
            {value:476, name:'男'},
            {value:376, name:'女'}
        ],
        itemStyle: {
            emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        }
    }];
    var rzzxOldman_option_jg_sex_pie = chartPie(title_text,legend_data,series);
    rzzxOldman_jg_sex_pie.setOption(rzzxOldman_option_jg_sex_pie);
    rzzxOldman_jg_sex_pie.on('legendselectchanged',function (params){
        var name = params.name;
        if(name=="男"){
            sex=2;
        }else if(name=="女"){
            sex=1;
        }
        table.fnFilter();
        getNumOfJw();
        //getAgeAndSex();
        
    } );
    //性别饼图
    title_text="性别";
    legend_data=[{name:'男',textStyle:{color:legend_color,fontSize:18}},{name:'女',textStyle:{color:legend_color,fontSize:18}}];
    series=[{
        name: '老人性别',
        type: 'pie',
        radius : '55%',
        label : {
            normal : {
                formatter: '{d}%\n({c})',
                textStyle : {
                    fontWeight : 'normal',
                    fontSize : 20
                }
            }
        },
        center: ['48%', '50%'],
        data:[
            {value:476, name:'男'},
            {value:376, name:'女'}
        ],
        itemStyle: {
            emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        }
    }];
    var rzzxOldman_option_jg_1_sex = chartPie(title_text,legend_data,series);
    rzzxOldman_jg_1_sex.setOption(rzzxOldman_option_jg_1_sex);
    rzzxOldman_jg_1_sex.on('legendselectchanged',function (params){
        var name = params.name;
        if(name=="男"){
            sex=2;
        }else if(name=="女"){
            sex=1;
        }
        table.fnFilter();
        getNumOfJw();
        //getAgeAndSex();
        
    } );

    //性别饼图
    title_text="性别";
    legend_data=[{name:'男',textStyle:{color:legend_color,fontSize:18}},{name:'女',textStyle:{color:legend_color,fontSize:18}}];
    series=[{
        name: '老人性别',
        type: 'pie',
        radius : '30%',
        label : {
            normal : {
                formatter: '{d}%\n({c})',
                textStyle : {
                    fontWeight : 'normal',
                    fontSize : 12
                }
            }
        },
        center: ['48%', '50%'],
        data:[
            {value:0, name:'男'},
            {value:0, name:'女'}
        ],
        itemStyle: {
            emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        }
    }];
    var rzzxOldman_option_jg_2_sex = chartPie(title_text,legend_data,series);
    rzzxOldman_jg_2_sex.setOption(rzzxOldman_option_jg_2_sex);
    rzzxOldman_jg_2_sex.on('legendselectchanged',function (params){
        var name = params.name;
        if(name=="男"){
            sex=2;
        }else if(name=="女"){
            sex=1;
        }
        table.fnFilter();
        getNumOfJw();
        //getAgeAndSex();
        
    } );

    //性别饼图
    title_text="性别";
    legend_data=[{name:'男',textStyle:{color:legend_color,fontSize:18}},{name:'女',textStyle:{color:legend_color,fontSize:18}}];
    series=[{
        name: '老人性别',
        type: 'pie',
        radius : '30%',
        label : {
            normal : {
                formatter: '{d}%\n({c})',
                textStyle : {
                    fontWeight : 'normal',
                    fontSize : 12
                }
            }
        },
        center: ['48%', '50%'],
        data:[
            {value:0, name:'男'},
            {value:0, name:'女'}
        ],
        itemStyle: {
            emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        }
    }];
    var rzzxOldman_option_jg_3_sex = chartPie(title_text,legend_data,series);
    rzzxOldman_jg_3_sex.setOption(rzzxOldman_option_jg_3_sex);
    rzzxOldman_jg_3_sex.on('legendselectchanged',function (params){
        var name = params.name;
        if(name=="男"){
            sex=2;
        }else if(name=="女"){
            sex=1;
        }
        table.fnFilter();
        getNumOfJw();
        //getAgeAndSex();
        
    } );

    title_text='年龄';
    legend_data=[
        {
            name:'男',
            textStyle:{
                color:'#fff',
                fontSize:18
            }
        },
        {
            name:'女',
            textStyle:{
                color:'#fff',
                fontSize:18
            }}
    ];
    yAxis_data=['90-   ','80-90','70-80','60-70'];
    series=[
        {
            name: '男',
            type: 'bar',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'insideLeft',
                    textStyle:{
                        fontSize:20
                    }

                }
            },
            itemStyle:{
                normal: {
                    color:series_color_1
                }
            },
            data: [67,134,234,534]
        },
        {
            name: '女',
            type: 'bar',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'insideRight',
                    textStyle:{
                        fontSize:20
                    }
                }
            },
            itemStyle:{
                normal: {
                    color:series_color_2
                }
            },
            data: [7,34,134,234]
        }
    ];
    var rzzxOldman_option_jg_age_bar=chartBar(title_text,legend_data,yAxis_data,series);
    rzzxOldman_jg_age_bar.setOption(rzzxOldman_option_jg_age_bar);
    rzzxOldman_jg_age_bar.on('legendselectchanged',function (params){
        var name = params.name;
        if(name=="男"){
            sex=2;
        }else if(name=="女"){
            sex=1;
        }
        table.fnFilter();
        getNumOfJw();
        //getAgeAndSex();
        
    } );

    title_text='年龄';
    legend_data=[
        {
            name:'男',
            textStyle:{
                color:'#fff',
                fontSize:18
            }
        },
        {
            name:'女',
            textStyle:{
                color:'#fff',
                fontSize:18
            }}
    ];
    yAxis_data=['90-   ','80-90','70-80','60-70'];
    series=[
        {
            name: '男',
            type: 'bar',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'insideLeft',
                    textStyle:{
                        fontSize:20
                    }
                }
            },
            itemStyle:{
                normal: {
                    color:series_color_1
                }
            },
            data: [67,134,234,534]
        },
        {
            name: '女',
            type: 'bar',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'insideRight',
                    textStyle:{
                        fontSize:20
                    }
                }
            },
            itemStyle:{
                normal: {
                    color:series_color_2
                }
            },
            data: [7,34,134,234]
        }
    ];
    var rzzxOldman_option_jg_1_age=chartBar(title_text,legend_data,yAxis_data,series);
    rzzxOldman_jg_1_age.setOption(rzzxOldman_option_jg_1_age);
    rzzxOldman_jg_1_age.on('legendselectchanged',function (params){
        var name = params.name;
        if(name=="男"){
            sex=2;
        }else if(name=="女"){
            sex=1;
        }
        table.fnFilter();
        getNumOfJw();
        //getAgeAndSex();
        
    } );

    title_text='年龄';
    legend_data=[
        {
            name:'男',
            textStyle:{
                color:'#fff',
                fontSize:18
            }
        },
        {
            name:'女',
            textStyle:{
                color:'#fff',
                fontSize:18
            }}
    ];
    yAxis_data=['90-   ','80-90','70-80','60-70'];
    series=[
        {
            name: '男',
            type: 'bar',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'insideLeft',
                    textStyle:{
                        fontSize:20
                    }
                }
            },
            itemStyle:{
                normal: {
                    color:series_color_1
                }
            },
            data: [0,0,0,0]
        },
        {
            name: '女',
            type: 'bar',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'insideRight',
                    textStyle:{
                        fontSize:20
                    }
                }
            },
            itemStyle:{
                normal: {
                    color:series_color_2
                }
            },
            data: [0,0,0,0]
        }
    ];
    var rzzxOldman_option_jg_2_age=chartBar(title_text,legend_data,yAxis_data,series);
    rzzxOldman_jg_2_age.setOption(rzzxOldman_option_jg_2_age);
    rzzxOldman_jg_2_age.on('legendselectchanged',function (params){
        var name = params.name;
        if(name=="男"){
            sex=2;
        }else if(name=="女"){
            sex=1;
        }
        table.fnFilter();
        getNumOfJw();
        //getAgeAndSex();
        
    } );

    title_text='年龄';
    legend_data=[
        {
            name:'男',
            textStyle:{
                color:'#fff',
                fontSize:18
            }
        },
        {
            name:'女',
            textStyle:{
                color:'#fff',
                fontSize:18
            }}
    ];
    yAxis_data=['90-   ','80-90','70-80','60-70'];
    series=[
        {
            name: '男',
            type: 'bar',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'insideLeft',
                    textStyle:{
                        fontSize:20
                    }
                }
            },
            itemStyle:{
                normal: {
                    color:series_color_1
                }
            },
            data: [0,0,0,0]
        },
        {
            name: '女',
            type: 'bar',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'insideRight',
                    textStyle:{
                        fontSize:20
                    }
                }
            },
            itemStyle:{
                normal: {
                    color:series_color_2
                }
            },
            data: [0,0,0,0]
        }
    ];
    var rzzxOldman_option_jg_3_age=chartBar(title_text,legend_data,yAxis_data,series);
    rzzxOldman_jg_3_age.setOption(rzzxOldman_option_jg_3_age);
    rzzxOldman_jg_3_age.on('legendselectchanged',function (params){
        var name = params.name;
        if(name=="男"){
            sex=2;
        }else if(name=="女"){
            sex=1;
        }
        table.fnFilter();
        getNumOfJw();
        //getAgeAndSex();
        
    } );

</script>