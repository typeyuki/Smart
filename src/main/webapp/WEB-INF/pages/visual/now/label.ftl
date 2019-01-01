<style>
    @media only screen and (min-width: 6000px){
        #label .title{
            text-align: center;
            font-size: 35px;
            font-weight: bold;
        }
        #label .ta{
            margin-top: 55%;
            font-size: 50px;
            position: relative;
            left: 20%;
        }
        #label .secTitle{
            text-align: center;
            font-size: 15px;
            font-weight: bold;
            margin-top: 8px;
        }
        #label .qk_1{
            font-size: 30px;
            padding:10px 30px;
            color: white;
            border: none;
            border-radius: 10px;
            margin: 10px;
            width: 80%;
        }
        #label .label{
            display: inline-block;
            font-size: 30px;
            padding:5px!important;
            margin: 5px!important;
            line-height: 2!important;
        }
    }
    .label_tu{
        padding-top: 5%;
        padding-bottom: 2%;
    }
    h2,p,td,h3,h1,span{
        color: white!important;
    }
    .select{
        opacity: 0.5;
    }
    .qk{
        font-size: 24px;
        background-color:#6cbdfc ;
        padding:10px 30px;
        color: white;
        border: none;
        border-radius: 10px;
        margin-bottom: 10px;
        /*position: fixed;*/
        /*bottom: 5%;*/
        /*left:3%*/
    }

    .bl{
        display: inline-block;
        line-height: 1!important;
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
        margin-top: 20%;
        padding: 50px;
    }
    .daohang{
        font-size: 40px;
        color: white;
        background-color: transparent;
        border: 15px solid #47e3d8;
        padding: 20px 40px;
        border-radius: 100%;
        font-weight: bold;
    }
</style>
<div class="row">
    <div class="col-lg-1" style="width: 5%"></div>
    <div class="col-lg-5">
        <div class="row">
            <div class="col-lg-12 box">
                <div class="zz"></div>
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6" align="center">
                        <button class="daohang" onclick="picChange(1)">老有<br>所养</button>
                    </div>
                    <div class="col-lg-3"></div>
                </div>
                <div class="row">
                    <div class="col-lg-6" align="left">
                        <button class="daohang" onclick="picChange(2)">老有<br>所医</button>
                    </div>
                    <div class="col-lg-6" align="right">
                        <button class="daohang" onclick="picChange(3)">老有<br>所为</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-5" align="center">
                        <button class="daohang" onclick="picChange(4)">老有<br>所学</button>
                    </div>
                    <div class="col-lg-5" align="center">
                        <button class="daohang" onclick="picChange(5)">老有<br>所乐</button>
                    </div>
                    <div class="col-lg-1"></div>
                </div>
            </div>
        </div>

        <div class="row box" style="margin-top: 20px" id="label1">
            <div class="zz"></div>
            <div class="row" style="border-bottom: 0px solid white;margin: 0!important;">
                <div class="col-lg-5" >
                    <p class="title ta"  onclick="ChangeMap()">身</br>份</br>标</br>签</p>
                </div>
                <div class="col-lg-7">
                    <div class="row">
                        <div class="col-lg-12" align="right">
                            <button class="qk_1 color_2" style="height: 85px" onclick="label3Show(31)">基 本 信 息</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12" align="right">
                            <button class="qk_1 color_2" style="height: 85px" onclick="label3Show(32)">健 康 档 案</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12" align="right">
                            <button class="qk_1 color_2" style="height: 85px" onclick="label3Show(33)">经 济 条 件</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12" align="right">
                            <button class="qk_1 color_2" style="height: 85px" onclick="label3Show(34)">家 庭 结 构</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12" align="right">
                            <button class="qk_1 color_2" style="height: 85px" onclick="label3Show(35)">养 老 状 态</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="label31" class="row box label3" style="display: none;margin-top: 20px">
            <div class="zz"></div>
            <div class="col-lg-12">
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
        </div>
        <div id="label32" class="row box label3" style="display: none;margin-top: 20px">
            <div class="zz"></div>
            <div class="col-lg-12">
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
        </div>
        <div id="label33" class="row box label3" style="display: none;margin-top: 20px">
            <div class="zz"></div>
            <div class="col-lg-12">
                <span class="label color_3">帮困人员</span>
                <span class="label color_3">低保</span>
                <span class="label color_3">城乡居民养老保险</span>
                <span class="label color_3">医疗救助金</span>
                <span class="label color_3">城镇居民基本医疗保险</span>
                <span class="label color_3">其他</span>
            </div>
        </div>
        <div id="label34" class="row box label3" style="display: none;margin-top: 20px">
            <div class="zz"></div>
            <div class="col-lg-12">
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
        </div>
        <div id="label35" class="row box label3" style="display: none;margin-top: 20px">
            <div class="zz"></div>
            <div class="col-lg-12">
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
        <div class="row box selectLabel" style="margin-top: 25px;word-break : break-all;height: 520px">
            <div class="zz"></div>
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <p class="title">所选标签</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12" id="selectLabel">
                    </div>
                </div>
                <div class="row" align="center">
                    <div class="col-lg-12">
                        <button class="qk" style="background-color: #47e6da" onclick="butt(0)">确认</button>
                        <button class="qk" onclick="clearLabels()">清空</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-1" style="width: 3%"></div>
    <div class="col-lg-5" style="width: 46%;position: relative;left: -1.5%">
        <div class="row">
            <div class="col-lg-12 box" align="center">
                <div class="zz"></div>
                <div id="label_hjPie" class="label_tu"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 box" align="center">
                <div class="zz"></div>
                <div id="label_sexPie" class="label_tu"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 box" align="center">
                <div class="zz"></div>
                <div id="label_ageBar" class="label_tu"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 box" align="center">
                <div class="zz"></div>
                <div id="label_pqBar" class="label_tu"></div>
            </div>
        </div>
        <script type="text/javascript">
            var label_tu_w,label_tu_h;
            var label_width=$("#label").width();
            if(winWidth>=1900){
                label_tu_w=label_width/2.5;
                label_tu_h=winHeight/6.5;
            }else if(winWidth<=1400 && winWidth>=1300){
                label_tu_w=winWidth/3;
                label_tu_h=winHeight/5.5;
            }
            $(".label_tu").css('width',label_tu_w);
            $(".label_tu").css( 'height', label_tu_h);
            var label_ageBar = echarts.init(document.getElementById('label_ageBar'));
            var label_sexPie= echarts.init(document.getElementById('label_sexPie'));
            var label_pqBar= echarts.init(document.getElementById('label_pqBar'));
            var label_hjPie= echarts.init(document.getElementById('label_hjPie'));

        </script>
    </div>
</div>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/GeoUtils/1.2/docs/symbols/BMapLib.html"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/GeoUtils/1.2/docs/symbols/src/BMapLib_GeoUtils.js.html"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Lak4ThuxodnoDdL3ZrfK5t91UR4uDmGm"></script>

 <script>
    // $(".selectLabel").css("height",winHeight/8.4);
     $("#label1").css("height",winHeight/5);
     $(".label3").css("height",winHeight/5);
     var organMapIndex=0;
     var markerArr,hpoints,hpointsMale,hpointsFemale,hpointsHuJi,hpointsFeiHuJi;

     //var jw0 = [2,58,59];
     var politicalStatusArray = new Array();
    var organIdArray = new Array();
    var secTypeArray = new Array();
    var mapDistrict = new Array();

     var PyYLYContent="上海市闵行区平阳敬老院创建于2008年12月，占地面积824平方米，总建筑面积为4997平方米，绿化面积1018平方米，总投资1000多万元。院内拥有双人房（或夫妻房）、三人房和七人房共64间，共有床位200张，并有良好的设备、整洁的环境、严格的管理、周到的服务、医养的融合，是上海市社会福利行业协会会员单位。\n",
             GmYLYContent="上海闵行区古美敬老院，位于闵行区虹莘路2288弄135号（平吉二村内）交通便利。敬老院成立于2000年7月，总建筑面积为2164平方米，使用面积1824平方米，绿化面积910平方米，食堂使用面积为80平方米，拥有床位95张。老人房间布局合理，可适合不同需求的老人居住。房间设施设备齐全、有线电视、电扇、卫生设备、空调、呼叫装置一应齐全，院内还设有餐厅、健身房、棋牌室、阅览室等。\n" +
                     "  收养对象为身体健康为能自理、有困难或完全不能自理的老人，包括患有  各类老年疾病的、患有老年痴呆症及需要临终关怀的老人，为他们提供长期的 养老和日托服务，是一所集养老、康复、护理、娱乐为一体的综合型养老机构。\n" +
                     "    建院以来，敬老院始终坚持以“老人为本”的服务宗旨，以“奉若父母，情同亲生”为服务理念，依靠一流的服务，让入住这里的老年人生活舒适、身心快乐健康，真正体会到：老有所养、老有所教、老有所医、老有所为、老有所学、老有所乐！已成为地区老年人不可多得的“养老福地”，入住率始终保持95%以上。\n",
             LhYLYContent="上海市闵行区莲花敬老院，位于闵行区莲花路1115号，东近中环线，南近沪闵路高架莲花南方友谊商城商圈，西靠万源路，北靠东兰路，与徐汇区一路之隔，地理位置优越，四通八达，是目前市内难得的地处黄金地段，生活环境理想的老年公寓。我院占地面积4900平方米，建筑面积7480平方米，绿化面积1800平方米，拥有养老床位187张，是一所重点投资建设的集休养、医疗、康复、娱乐为一体的综合型宾馆式养老机构，可适应不同层次需求的老年人在此居住养老。我院内各项设施设备堪称一流。老人居室内配有：空调、液晶电视、程控电话，宾馆式配套家居设备，使您居住生活倍感舒适；公共设施丰富完备：电脑网吧室、书报阅览室、多功能娱乐室、影视厅、老年餐厅、作业治疗室、自助厨房及配套盥洗设施，使您日常生活十分便利；老年活动室设有：老年大学、健身室、棋牌室、书画室、茶室、会议室和阳光绿化平台等。",
             GmZZZHContent="古美智汇坊——平阳为老服务中心位于闵行区平阳路1526号（近虹莘路）， 2016年7月开业，建筑面积420㎡，包括18张照护床位，若干个日托服务。为面向半护理、全护理长者提供托付、照护的智慧养老场所。包含长期照护、短期照护、日托照护服务、健康管理、营养餐饮等多种为老服务，更有亲情式24小时贴心专业护理，让长者享受食、住、娱、医、养、护的一站式养老服务。\n" +
                     "长期照护——为中轻度失能长者进行健康生活管理，提供心理上的亲情服务，使他们拥有更有尊严的生活；\n" +
                     "短期照护——对处于慢性病康复期的长者进行专业护理；\n" +
                     "喘息照护——为长者提供超短期护理，缓解家属护理压力；\n" +
                     "日托服务——日托单天护理。";

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
                 fontSize : "30px"//字体大小 　　

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
     function createIcon(json){
         var icon = new BMap.Icon("http://map.baidu.com/image/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})

         //var icon = new BMap.Icon("http://app.baidu.com/map/image/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
         return icon;
     }
     function createInfoWindow(i){
         var json = markerArr[i];
         var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
         return iw;
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
                 fontSize : "30px"//字体大小 　　

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

     function label3Show(index) {
         $("#label1").hide();
//         $(".aa").css("display","none");
//         $("#label").show();
         $("#label"+index).show();

     }
     var dataLabel;
     var jwData;
     var heatPoints=[];
     var la=[];
     var sex = 0;
     var isMb = 0;
     var isSn = 0;
     var isYwfy = 0;
     var isExzl = 0;
     var isGz = 0;
     var isCj = 0;
     var zhucan = 0;//用作未参加助餐服务的老人标签
     var zhuji = 0;//用作未参加jtys的老人标签
     var zhujie = 0;//用作未参加jtbc的老人标签
     var zhuyu = 0;//用作未参加chx的老人标签
     var zhuxing = 0;
     var zhuyi = 0;
     var kangfu = 0;
     var xiangtan = 0;
     var xidi = 0;
     var shenghuo = 0;//用作可以自理老人的标签
     var isService = 0;
     var isVolunteer = 0;
     var mapDistrict = new Array();
     var intelligenceArray = new Array();
     var eyesightArray = new Array();
     var census=new Array();
     var ageEnd,ageStart;
     var family=new Array(),economic=new Array();
     var health=new Array();
     var oldStatus=new Array();
     var familyType=new Array();
     var politicalStatusArray = new Array();
     var organIdArray = new Array();
     var secTypeArray = new Array();
     var thirdTypeArray = new Array();
     var forthTypeArray = new Array();
     var fifthTypeArray = new Array();
     var sixthTypeArray = new Array();
     function butt(flag) {
         var table =$(".dataTables-example").dataTable(
                 {
                     "sPaginationType": "full_numbers",
                     "bPaginite": true,
                     "bInfo": true,
                     "bSort": false,
                     "bFilter": false, //搜索栏
                     "bStateSave": true,
                     "bProcessing": true, //加载数据时显示正在加载信息
                     "bServerSide": true, //指定从服务器端获取数据
                     "columns":[{
                         data:"id"
                     },{
                         data:"dName"
                     },{
                         data:"jName"
                     },{
                         data:"name"
                     },{
                         data:"sex"
                     },{
                         data:"age"
                     },{
                         data:"census"
                     },{
                         data:"phone"
                     },{
                         data:"pid"
                     }
                     ],
                     "iDisplayLength" : iDisplayLength,
                     "columnDefs": [
                         {
                             "targets": [3], // 目标列位置，下标从0开始
                             "data": "name", // 数据列名
                             "render": function(data, type, full) { // 返回自定义内容
                                 return "<span class='btn btn-primary' onclick=look($(this).parent().prev().prev().prev().text()) id='"+data+"'>"+data+"</span>";
                             }
                         }
                     ],
                     "sAjaxSource": "/VTabel/getOld",//这个是请求的地址
                     "fnServerData": retrieveData
                 });
         function retrieveData(url,aoData,fnCallback) {
             $.ajax({
                 url: url,//"/map/jwAndNum",//这个就是请求地址对应sAjaxSource
                 data : {
                     "iDisplayStart" : aoData.iDisplayStart,
                     "iDisplayLength" : aoData.iDisplayLength,
                     "iSortCol_0" : aoData.iSortCol_0,
                     "sEcho" : aoData.sEcho,
                     "sSortDir_0" : aoData.sSortDir_0,
                     "sex": sex,
                     "isMb":isMb,
                     "isSn":isSn,
                     "isYwfy":isYwfy,
                     "isExzl":isExzl,
                     "isGz":isGz,
                     "isCj":isCj,
                     "zhucan":zhucan,
                     "zhuji":zhuji,
                     "zhujie" :zhujie,
                     "zhuyu" : zhuyu,
                     "zhuxing"  :zhuxing,
                     "zhuyi"  :zhuyi,
                     "kangfu"  :kangfu,
                     "xiangtan" : xiangtan ,
                     "xidi" : xidi,
                     "shenghuo": shenghuo,
                     "intelligence_array":intelligenceArray,
                     "isHealth_array":health,
                     "eyesight_array":eyesightArray,
                     "familyType_array":familyType,
                     "politicalStatus_array":politicalStatusArray,
                     "organId_array":organIdArray,
                     "secType_array":secTypeArray,
                     "thirdType_array":thirdTypeArray,
                     "forthType_array":forthTypeArray,
                     "fifthType_array" :fifthTypeArray,
                     "sixthType_array":sixthTypeArray,
                     "census_array":census,
                     "ageStart":ageStart,
                     "ageEnd":ageEnd,
                     "family_array":family,
                     "economic_array":economic,
                     "oldStatus_array":oldStatus,
                     "isVolunteer":isVolunteer,
                     "isService":isService,
                     "district_array":mapDistrict
                     //"jw_array":jw

                 },
                 type: 'POST',
                 dataType: 'json',
                 async: false,
                 success: function (result) {

                     fnCallback(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
                 },
                 error:function(XMLHttpRequest, textStatus, errorThrown) {
//                    alert("status:"+XMLHttpRequest.status+",readyState:"+XMLHttpRequest.readyState+",textStatus:"+textStatus);
                 }
             });
         }
         // if(flag==1){
         //     $('#selectLabel').html('');
         //     sex = 0;
         //     census = 0;
         //     ageStart = 0;
         //     ageEnd = 0;
         //     family = [];
         //     economic = [];
         //     health = [];
         //     oldStatus = [];
         // }

         if(flag == 0) {
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
                       ageEnd = 90;}
                 else if (la[index] == "90岁以上") {
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
                 else if (la[index] == "非户籍"){
                     census.push(13);
                 }
                 else if (la[index] == "人户分离")
                     census.push(14);
                 else if (la[index] == "群众")
                     politicalStatusArray.push(10);
                 else if (la[index] == "党员")
                     politicalStatusArray.push(11);
                 else if (la[index] == "智力正常")
                     intelligenceArray.push(28);
                 else if (la[index] == "痴呆")
                     intelligenceArray.push(29);
                 else if (la[index] == "智障")
                     intelligenceArray.push(30);
                 else if (la[index] == "视力正常")
                     eyesightArray.push(31);
                 else if (la[index] == "失明")
                     eyesightArray.push(32);
                 else if (la[index] == "有光感")
                     eyesightArray.push(33);
                 else if (la[index] == "一般障碍")
                     eyesightArray.push(34);
                 else if(la[index] == "严重障碍")
                     eyesightArray.push(35);
                 else if (la[index] == "有慢病"){
                     health.push(1);
                     isMb = 1;
                 }
                 else if (la[index] == "有失能情况"){
                     health.push(2);
                 }
                 else if (la[index] == "有药物反应"){
                     health.push(3);
                 }
                 else if (la[index] == "有恶性肿瘤史"){
                     health.push(4);
                 }
                 else if (la[index] == "有骨折史"){
                     health.push(5);
                 }
                 else if (la[index] == "有残疾史"){
                     health.push(6);
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
                     thirdTypeArray.push(7);
                 }
                 else if (la[index] == "助洁"){
                     thirdTypeArray.push(8);
                 }
                 else if (la[index] == "助急"){
                     thirdTypeArray.push(9);
                 }
                 else if (la[index] == "助浴"){
                     thirdTypeArray.push(10);
                 }
                 else if (la[index] == "助行"){
                     thirdTypeArray.push(11);
                 }
                 else if (la[index] == "康复辅助"){
                     thirdTypeArray.push(13);
                 }
                 else if (la[index] == "助医"){
                     thirdTypeArray.push(12);
                 }
                 else if (la[index] == "相谈"){
                     thirdTypeArray.push(14);
                 }
                 else if (la[index] == "洗涤"){
                     thirdTypeArray.push(15);
                 }
                 else if (la[index] == "生活护理"){
                     thirdTypeArray.push(16);
                 }


             }
         }
         getAgeAndSex();
         getNumOfJw();

         table.fnFilter();
         //getJwData();
        // heatmapOverlay.setDataSet({data:heatPoints,max:200});
         sex = 0;
         census = [];
         ageStart = 0;
         ageEnd = 0;
         family = [];
         familyType = [];
         economic = [];
         health = [];
         oldStatus = [];
         politicalStatusArray = [];
         organIdArray = [];
         secTypeArray = [];
         thirdTypeArray = [];
         mapDistrict = [];
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

         // ageBar = echarts.init(document.getElementById('ageBar'));
         // sexPie= echarts.init(document.getElementById('sexPie'));
         // pqBar= echarts.init(document.getElementById('pqBar'));
         // hjPie= echarts.init(document.getElementById('hjPie'));
         // ageBar.setOption(option_age_bar);
         // sexPie.setOption(option_sex_pie);
         // pqBar.setOption(option_pq_bar);
         // hjPie.setOption(option_hj_pie);


         //添加label筛选条件



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
         getNumOfJw();
         table.fnFilter();

         $('.select').each(function() {
             var cl=$(this).attr('class').split(' ')[1];
             $(this).attr('class','label '+cl);
         });
     }

     function getNumOfJw(){
         var jw1 = [1,2,3,13,45,59,60,113,63,66,67,84,85];
         var jw2 = [87,88,89,90,135,97,98,99,100,101,102,103,104];
         var jw3 = [105,106,107,108,119,120,121,122,123,124,125,126,134];
         ajax5 = $.ajax({
             url: "/map/jwNumTest",//这个就是请求地址对应sAjaxSource
             data : {
                 "iDisplayStart" : 0,
                 "iDisplayLength" : 100,
                 "iSortCol_0" : 0,
                 "sEcho" : 0,
                 "sSortDir_0" : 0,
                 "sex": sex,
                 "isMb":isMb,
                 "isSn":isSn,
                 "isYwfy":isYwfy,
                 "isExzl":isExzl,
                 "isGz":isGz,
                 "isCj":isCj,
                 "zhucan":zhucan,
                 "zhuji":zhuji,
                 "zhujie" :zhujie,
                 "zhuyu" : zhuyu,
                 "zhuxing"  :zhuxing,
                 "zhuyi"  :zhuyi,
                 "kangfu"  :kangfu,
                 "xiangtan" : xiangtan ,
                 "xidi" : xidi,
                 "shenghuo": shenghuo,
                 "intelligence_array":intelligenceArray,
                 "isHealth_array":health,
                 "eyesight_array":eyesightArray,
                 "familyType_array":familyType,
                 "politicalStatus_array":politicalStatusArray,
                 "organId_array":organIdArray,
                 "secType_array":secTypeArray,
                 "thirdType_array":thirdTypeArray,
                  "forthType_array":forthTypeArray,
                 "fifthType_array" :fifthTypeArray,
                 "sixthType_array":sixthTypeArray,
                 "census_array":census,
                 "ageStart":ageStart,
                 "ageEnd":ageEnd,
                 "family_array":family,
                 "economic_array":economic,
                 "oldStatus_array":oldStatus,
                 "isVolunteer":isVolunteer,
                 "isService":isService,
                 "district_array":mapDistrict,
                 "jw_array":jw1

             },
             type: 'GET',
             dataType: 'json',
             // async:false,
             success: function (result) {
                 if(result.success == true){
                     jwData = result.data;
                     var heatPoints1=[
                         {"lng":"121.389133","lat":"31.158804","count":jwData.东兰一居},
                         {"lng":"121.410277","lat":"31.151814","count":jwData.古龙一居},
                         {"lng":"121.409142","lat":"31.148518","count":jwData.古美一村},
                         {"lng":"121.411089","lat":"31.152975","count":jwData.古龙二居},
                         {"lng":"121.406289","lat":"31.155351","count":jwData.古龙三居},
                         {"lng":"121.387235","lat":"31.157819","count":jwData.东兰三居},
                         {"lng":"121.388044","lat":"31.161102","count":jwData.东兰四居},
                         {"lng":"121.392393","lat":"31.145568","count":jwData.平吉三村},
                         {"lng":"121.411512","lat":"31.159194","count":jwData.古龙六居},
                         {"lng":"121.411598","lat":"31.146782","count":jwData.古美九村},
                         {"lng":"121.41470","lat":"31.151291","count":jwData.古美七村},
                         {"lng":"121.410200","lat":"31.162142","count":jwData.华梅花苑},
                         {"lng":"121.407256","lat":"31.166000","count":jwData.梅莲苑}
                     ];
                     heatPoints = heatPoints.concat(heatPoints1);
                     heatmapOverlay.setDataSet({data:heatPoints,max:300});
                 }
             }
         });
         ajax6 = $.ajax({
             url: "/map/jwNumTest",//这个就是请求地址对应sAjaxSource
             data : {
                 "iDisplayStart" : 0,
                 "iDisplayLength" : 100,
                 "iSortCol_0" : 0,
                 "sEcho" : 0,
                 "sSortDir_0" : 0,
                 "sex": sex,
                 "isMb":isMb,
                 "isSn":isSn,
                 "isYwfy":isYwfy,
                 "isExzl":isExzl,
                 "isGz":isGz,
                 "isCj":isCj,
                 "zhucan":zhucan,
                 "zhuji":zhuji,
                 "zhujie" :zhujie,
                 "zhuyu" : zhuyu,
                 "zhuxing"  :zhuxing,
                 "zhuyi"  :zhuyi,
                 "kangfu"  :kangfu,
                 "xiangtan" : xiangtan ,
                 "xidi" : xidi,
                 "shenghuo": shenghuo,
                 "intelligence_array":intelligenceArray,
                 "eyesight_array":eyesightArray,
                 "familyType_array":familyType,
                 "politicalStatus_array":politicalStatusArray,
                 "organId_array":organIdArray,
                 "secType_array":secTypeArray,
                 "thirdType_array":thirdTypeArray,
                 "forthType_array":forthTypeArray,
                 "fifthType_array" :fifthTypeArray,
                 "sixthType_array":sixthTypeArray,
                 "census_array":census,
                 "ageStart":ageStart,
                 "ageEnd":ageEnd,
                 "family_array":family,
                 "economic_array":economic,
                 "isHealth_array":health,
                 "isVolunteer":isVolunteer,
                 "isService":isService,
                 "oldStatus_array":oldStatus,
                 "district_array":mapDistrict,
                 "jw_array":jw2

             },
             type: 'GET',
             dataType: 'json',
             // async:false,
             success: function (result) {
                 if(result.success == true){
                     jwData = result.data;
                     var  heatPoints2=[
                         {"lng":"121.396912","lat":"31.143988","count":jwData.平阳二村},
                         {"lng":"121.39388","lat":"31.139939","count":jwData.平阳三村},
                         {"lng":"121.404052","lat":"31.151059","count":jwData.万源四居},
                         {"lng":"121.399151","lat":"31.153805","count":jwData.万源一居},
                         {"lng":"121.393436","lat":"31.157818","count":jwData.东兰二居},
                         {"lng":"121.391183","lat":"31.153482","count":jwData.平吉四村},
                         {"lng":"121.412186","lat":"31.155164","count":jwData.古龙四居},
                         {"lng":"121.409878","lat":"31.145572","count":jwData.古美八村},
                         {"lng":"121.410402","lat":"31.148453","count":jwData.古美四村},
                         {"lng":"121.397204","lat":"31.159934","count":jwData.平南三居},
                         {"lng":"121.400571","lat":"31.160467","count":jwData.平南一居},
                         {"lng":"121.397188","lat":"31.136772","count":jwData.平阳六村},
                         {"lng":"121.396699","lat":"31.138846","count":jwData.平阳四村}
                     ];
                     heatPoints=heatPoints.concat(heatPoints2);
                     heatmapOverlay.setDataSet({data:heatPoints,max:300});
                     // heatmapOverlay1.show();
                 }
             }
         });
         ajax7 = $.ajax({
             url: "/map/jwNumTest",//这个就是请求地址对应sAjaxSource
             data : {
                 "iDisplayStart" : 0,
                 "iDisplayLength" : 100,
                 "iSortCol_0" : 0,
                 "sEcho" : 0,
                 "sSortDir_0" : 0,
                 "sex": sex,
                 "isMb":isMb,
                 "isSn":isSn,
                 "isYwfy":isYwfy,
                 "isExzl":isExzl,
                 "isGz":isGz,
                 "isCj":isCj,
                 "zhucan":zhucan,
                 "zhuji":zhuji,
                 "zhujie" :zhujie,
                 "zhuyu" : zhuyu,
                 "zhuxing"  :zhuxing,
                 "zhuyi"  :zhuyi,
                 "kangfu"  :kangfu,
                 "xiangtan" : xiangtan ,
                 "xidi" : xidi,
                 "shenghuo": shenghuo,
                 "intelligence_array":intelligenceArray,
                 "eyesight_array":eyesightArray,
                 "familyType_array":familyType,
                 "politicalStatus_array":politicalStatusArray,
                 "organId_array":organIdArray,
                 "secType_array":secTypeArray,
                 "thirdType_array":thirdTypeArray,
                 "forthType_array":forthTypeArray,
                 "fifthType_array" :fifthTypeArray,
                 "sixthType_array":sixthTypeArray,
                 "census_array":census,
                 "ageStart":ageStart,
                 "ageEnd":ageEnd,
                 "family_array":family,
                 "economic_array":economic,
                 "isHealth_array":health,
                 "isVolunteer":isVolunteer,
                 "isService":isService,
                 "oldStatus_array":oldStatus,
                 "district_array":mapDistrict,
                 "jw_array":jw3

             },
             type: 'GET',
             dataType: 'json',
             //async:false,
             success: function (result) {
                 if(result.success == true){
                     jwData = result.data;
                     var  heatPoints3=[
                         {"lng":"121.389500","lat":"31.141276","count":jwData.平阳一村},
                         {"lng":"121.403865","lat":"31.152716","count":jwData.万源三居},
                         {"lng":"121.405819","lat":"31.155885","count":jwData.古龙五村},
                         {"lng":"121.395925","lat":"31.148518","count":jwData.平吉六村},
                         {"lng":"121.405043","lat":"31.162622","count":jwData.华一新城},
                         {"lng":"121.388900","lat":"31.14893","count":jwData.平吉二村},
                         {"lng":"121.3945","lat":"31.151394","count":jwData.平吉五村},
                         {"lng":"121.409875","lat":"31.147900","count":jwData.古美三村},
                         {"lng":"121.414226","lat":"31.1478032","count":jwData.古美十村},
                         {"lng":"121.397218","lat":"31.158308","count":jwData.平南二居},
                         {"lng":"121.393407","lat":"31.13485","count":jwData.平阳五村},
                         {"lng":"121.388900","lat":"31.151069","count":jwData.平吉一村},
                         {"lng":"121.401069","lat":"31.155103","count":jwData.万源二居}
                     ];
                     heatPoints =  heatPoints.concat(heatPoints3);
                     heatmapOverlay.setDataSet({data:heatPoints,max:300});
                     //  heatmapOverlay2.show();
                 }
             }
         });
         heatPoints = [];

     }
     function getAgeAndSex() {
         $.ajax({
             url: "/chartchange/AgeSex",
             type: "get",
             data: {
                 "sex": sex,
                 "isMb":isMb,
                 "isSn":isSn,
                 "isYwfy":isYwfy,
                 "isExzl":isExzl,
                 "isGz":isGz,
                 "isCj":isCj,
                 "zhucan":zhucan,
                 "zhuji":zhuji,
                 "zhujie" :zhujie,
                 "zhuyu" : zhuyu,
                 "zhuxing"  :zhuxing,
                 "zhuyi"  :zhuyi,
                 "kangfu"  :kangfu,
                 "xiangtan" : xiangtan ,
                 "xidi" : xidi,
                 "shenghuo": shenghuo,
                 "intelligence_array":intelligenceArray,
                 "eyesight_array":eyesightArray,
                 "familyType_array":familyType,
                 "politicalStatus_array":politicalStatusArray,
                 "organId_array":organIdArray,
                 "secType_array":secTypeArray,
                 "thirdType_array":thirdTypeArray,
                 "forthType_array":forthTypeArray,
                 "fifthType_array" :fifthTypeArray,
                 "sixthType_array":sixthTypeArray,
                 "census_array":census,
                 "ageStart":ageStart,
                 "ageEnd":ageEnd,
                 "isVolunteer":isVolunteer,
                 "isService":isService,
                 "family_array":family,
                 "economic_array":economic,
                 "isHealth_array":health,
                 "oldStatus_array":oldStatus,
                 "district_array":mapDistrict
             },
             dataType: 'json',
             success: function (result) {
                 if (result.success == true) {

                     dataLabel = result.data;
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
                             data: [dataLabel.numOfOverNineM, dataLabel.numOfEightToNineM, dataLabel.numOfSevenToEightM, dataLabel.numOfSixToSevenM]
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
                             data: [dataLabel.numOfOverNineF, dataLabel.numOfEightToNineF, dataLabel.numOfSevenToEightF, dataLabel.numOfSixToSevenF]
                         }
                     ];
                     var option_age_bar = chartBar(title_text, legend_data, yAxis_data, series);
                     //ageBar = echarts.init(document.getElementById('ageBar'));
                     label_ageBar.setOption(option_age_bar);
                 }
             }


         });
         $.ajax({
             url: "/chartchange/Sex",
             type: "get",
             data: {
                 "sex": sex,
                 "isMb":isMb,
                 "isSn":isSn,
                 "isYwfy":isYwfy,
                 "isExzl":isExzl,
                 "isGz":isGz,
                 "isCj":isCj,
                 "zhucan":zhucan,
                 "zhuji":zhuji,
                 "zhujie" :zhujie,
                 "zhuyu" : zhuyu,
                 "zhuxing"  :zhuxing,
                 "zhuyi"  :zhuyi,
                 "kangfu"  :kangfu,
                 "xiangtan" : xiangtan ,
                 "xidi" : xidi,
                 "shenghuo": shenghuo,
                 "intelligence_array":intelligenceArray,
                 "eyesight_array":eyesightArray,
                 "familyType_array":familyType,
                 "politicalStatus_array":politicalStatusArray,
                 "organId_array":organIdArray,
                 "secType_array":secTypeArray,
                 "thirdType_array":thirdTypeArray,
                 "forthType_array":forthTypeArray,
                 "fifthType_array" :fifthTypeArray,
                 "sixthType_array":sixthTypeArray,
                 "census_array":census,
                 "ageStart":ageStart,
                 "ageEnd":ageEnd,
                 "isVolunteer":isVolunteer,
                 "isService":isService,
                 "family_array":family,
                 "economic_array":economic,
                 "isHealth_array":health,
                 "oldStatus_array":oldStatus,
                 "district_array":mapDistrict
             },
             dataType: 'json',
             success: function (result) {
                 if (result.success == true) {
                     dataLabel = result.data;
                     title_text = "性别";
                     legend_data = [{name: '男', textStyle: {color: legend_color}}, {
                         name: '女',
                         textStyle: {color: legend_color}
                     }];
                     series = [{
                         name: '老人性别',
                         type: 'pie',
                         radius: '55%',
                         center: ['50%', '60%'],
                         label: {
                             normal: {
                                 formatter: '{d}%\n({c})',
                                 textStyle: {
                                     fontWeight: 'normal',
                                     fontSize: 20
                                 }
                             }
                         },
                         data: [
                             {value: dataLabel.numOfMale, name: '男'},
                             {value: dataLabel.numOfFemale, name: '女'}
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
                     //sexPie = echarts.init(document.getElementById('sexPie'));
                     label_sexPie.setOption(option_sex_pie);
                 }
             }
         });
         $.ajax({
             url: "/chartchange/Census",
             type: "get",
             data: {
                 "sex": sex,
                 "isMb":isMb,
                 "isSn":isSn,
                 "isYwfy":isYwfy,
                 "isExzl":isExzl,
                 "isGz":isGz,
                 "isCj":isCj,
                 "zhucan":zhucan,
                 "zhuji":zhuji,
                 "zhujie" :zhujie,
                 "zhuyu" : zhuyu,
                 "zhuxing"  :zhuxing,
                 "zhuyi"  :zhuyi,
                 "kangfu"  :kangfu,
                 "xiangtan" : xiangtan ,
                 "xidi" : xidi,
                 "shenghuo": shenghuo,
                 "intelligence_array":intelligenceArray,
                 "eyesight_array":eyesightArray,
                 "familyType_array":familyType,
                 "politicalStatus_array":politicalStatusArray,
                 "organId_array":organIdArray,
                 "secType_array":secTypeArray,
                 "thirdType_array":thirdTypeArray,
                 "forthType_array":forthTypeArray,
                 "fifthType_array" :fifthTypeArray,
                 "sixthType_array":sixthTypeArray,
                 "census_array":census,
                 "ageStart":ageStart,
                 "ageEnd":ageEnd,
                 "isVolunteer":isVolunteer,
                 "isService":isService,
                 "family_array":family,
                 "economic_array":economic,
                 "isHealth_array":health,
                 "oldStatus_array":oldStatus,
                 "district_array":mapDistrict
             },
             dataType: 'json',
             success: function (result) {
                 if (result.success == true) {
                     dataLabel = result.data;
                     title_text = "户籍";
                     legend_data = [{name: '户籍', textStyle: {color: legend_color}}, {
                         name: '非户籍',
                         textStyle: {color: legend_color}
                     }];
                     series = [{
                         name: '老人户籍',
                         type: 'pie',
                         radius: '55%',
                         center: ['48%', '60%'],
                         label: {
                             normal: {
                                 formatter: '{d}%\n({c})',
                                 textStyle: {
                                     fontWeight: 'normal',
                                     fontSize: 20
                                 }
                             }
                         },
                         data: [
                             {value: dataLabel.numOfCensus, name: '户籍'},
                             {value: dataLabel.numOfNotCensus, name: '非户籍'}
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
                    // hjPie = echarts.init(document.getElementById('hjPie'));
                     label_hjPie.setOption(option_hj_pie);
                 }
             }
         });
         $.ajax({
             url: "/chartchange/District",
             type: "get",
             data: {
                 "sex": sex,
                 "isMb":isMb,
                 "isSn":isSn,
                 "isYwfy":isYwfy,
                 "isExzl":isExzl,
                 "isGz":isGz,
                 "isCj":isCj,
                 "zhucan":zhucan,
                 "zhuji":zhuji,
                 "zhujie" :zhujie,
                 "zhuyu" : zhuyu,
                 "zhuxing"  :zhuxing,
                 "zhuyi"  :zhuyi,
                 "kangfu"  :kangfu,
                 "xiangtan" : xiangtan ,
                 "xidi" : xidi,
                 "shenghuo": shenghuo,
                 "intelligence_array":intelligenceArray,
                 "eyesight_array":eyesightArray,
                 "familyType_array":familyType,
                 "politicalStatus_array":politicalStatusArray,
                 "organId_array":organIdArray,
                 "secType_array":secTypeArray,
                 "thirdType_array":thirdTypeArray,
                 "forthType_array":forthTypeArray,
                 "fifthType_array" :fifthTypeArray,
                 "sixthType_array":sixthTypeArray,
                 "census_array":census,
                 "ageStart":ageStart,
                 "ageEnd":ageEnd,
                 "isVolunteer":isVolunteer,
                 "isService":isService,
                 "family_array":family,
                 "economic_array":economic,
                 "isHealth_array":health,
                 "oldStatus_array":oldStatus,
                 "district_array":mapDistrict
             },
             dataType: 'json',
             success: function (result) {
                 if (result.success == true) {
                     dataLabel = result.data;
                     legend_data = "";
                     var posList = [
                         'left', 'right', 'top', 'bottom',
                         'inside',
                         'insideTop', 'insideLeft', 'insideRight', 'insideBottom',
                         'insideTopLeft', 'insideTopRight', 'insideBottomLeft', 'insideBottomRight'
                     ];

                     label_pqBar.configParameters = {
                         rotate: {
                             min: -90,
                             max: 90
                         },
                         align: {
                             options: {
                                 left: 'left',
                                 center: 'center',
                                 right: 'right'
                             }
                         },
                         verticalAlign: {
                             options: {
                                 top: 'top',
                                 middle: 'middle',
                                 bottom: 'bottom'
                             }
                         },
                         position: {
                             options: echarts.util.reduce(posList, function (map, pos) {
                                 map[pos] = pos;
                                 return map;
                             }, {})
                         },
                         distance: {
                             min: 0,
                             max: 100
                         }
                     };

                     label_pqBar.config = {
                         rotate: 90,
                         align: 'left',
                         verticalAlign: 'middle',
                         position: 'insideBottom',
                         distance: 15,
                         onChange: function () {
                             var labelOption = {
                                 normal: {
                                     rotate: label_pqBar.config.rotate,
                                     align: label_pqBar.config.align,
                                     verticalAlign: label_pqBar.config.verticalAlign,
                                     position: label_pqBar.config.position,
                                     distance: label_pqBar.config.distance
                                 }
                             };
                             label_pqBar.setOption({
                                 series: [{
                                     label: labelOption
                                 }, {
                                     label: labelOption
                                 }, {
                                     label: labelOption
                                 }, {
                                     label: labelOption
                                 }]
                             });
                         }
                     };


                     var labelOption = {
                         normal: {
                             show: true,
                             position: label_pqBar.config.position,
                             distance: label_pqBar.config.distance,
                             align: label_pqBar.config.align,
                             verticalAlign: label_pqBar.config.verticalAlign,
                             rotate: label_pqBar.config.rotate,
                             formatter: '{c}',
                             fontSize: 16,
                             rich: {
                                 name: {
                                     textBorderColor: '#fff'
                                 }
                             }
                         }
                     };

                     option = {
                         //color: ['#003366', '#006699', '#4cabce', '#e5323e'],
                         title: {
                             text:'片区人口',
                             textStyle:{
                                 color:'#fff',
                                 fontSize:title_fontSize,
                                 fontWeight:100
                             },
                             x:'0%',
                             y:'0%',
                         },
                         color: ['#ffd289'],
                         legend: {
                             data: ['']
                         },
                         calculable: true,
                         xAxis: [
                             {
                                 type: 'category',
                                 axisTick: {show: false},
                                 data: ['东兰','古龙','平南','平阳','平吉','古美'],
                                 axisLine:{
                                     lineStyle:{
                                         color:'white',
                                         fontSize: 20
                                     }
                                 },
                             }
                         ],
                         yAxis: [
                             {
                                 type: 'value',
                                 axisLine:{
                                     lineStyle:{
                                         color:'white',
                                         fontSize: 20
                                     }
                                 }
                             }
                         ],
                         series: [
                             {
                                 type: 'bar',
                                 barGap: 0,
                                 label: labelOption,
                                 data: [dataLabel.donglan, dataLabel.gulong, dataLabel.pingnan, dataLabel.pingyang, dataLabel.pingji, dataLabel.gumei],
                                 barWidth: 20,//柱图宽度
                                 itemStyle: {
                                     normal: {
                                         barBorderRadius: 20,
                                         color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                             offset: 0,
                                             color: '#99d9ea'
                                         }, {
                                             offset: 1,
                                             color: 'rgba(0,188,226, 0.5)'
                                         }]),
                                         shadowColor: 'rgba(0, 0, 0, 0.4)',
                                         shadowBlur: 20
                                     }
                                 }

                             },

                         ]
                     };
                     //pqBar.setOption(option);
                     label_pqBar.setOption(option);
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
                             $(".label3").hide();
                             $("#label1").show();
                             var text = $(this).text();
                             la.remove(text);
                             $(this).remove();
                             ageBar = echarts.init(document.getElementById('ageBar'));
                             sexPie= echarts.init(document.getElementById('sexPie'));
                             pqBar= echarts.init(document.getElementById('pqBar'));
                             hjPie= echarts.init(document.getElementById('hjPie'));
                             ageBar.setOption(option_age_bar);
                             sexPie.setOption(option_sex_pie);
                             pqBar.setOption(option_pq_bar);
                             hjPie.setOption(option_hj_pie);


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
                     $(".label3").hide();
                     $("#label1").show();

                     ageBar = echarts.init(document.getElementById('ageBar'));
                     sexPie = echarts.init(document.getElementById('sexPie'));
                     pqBar = echarts.init(document.getElementById('pqBar'));
                     hjPie = echarts.init(document.getElementById('hjPie'));
                     ageBar.setOption(option_age_bar);
                     sexPie.setOption(option_sex_pie);
                     pqBar.setOption(option_pq_bar);
                     hjPie.setOption(option_hj_pie);
                 }
             }
     );
 </script>
