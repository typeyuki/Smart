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
var zhucan = 0;
var zhuji = 0;
var zhujie = 0;
var zhuyu = 0;
var zhuxing = 0;
var zhuyi = 0;
var kangfu = 0;
var xiangtan = 0;
var xidi = 0;
var shenghuo = 0;
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
function getJwData(){
    var jw1 = [1,2,3,13,45,59,60,113,63,66,67,84,85];
    var jw2 = [87,88,89,90,135,97,98,99,100,101,102,103,104];
    var jw3 = [105,106,107,108,119,120,121,122,123,124,125,126,134];
    ajax5 = $.ajax({
        url: "/map/jwNum",//这个就是请求地址对应sAjaxSource
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
            "census_array":census,
            "ageStart":ageStart,
            "ageEnd":ageEnd,
            "family_array":family,
            "economic_array":economic,
            "isHealth_array":health,
            "oldStatus_array":oldStatus,
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
                heatmapOverlay.setDataSet({data:heatPoints,max:200});
            }
        }
    });
    ajax6 = $.ajax({
        url: "/map/jwNum",//这个就是请求地址对应sAjaxSource
        data : {
            "iDisplayStart" : 0,
            "iDisplayLength" : 100,
            "iSortCol_0" : 0,
            "sEcho" : 0,
            "sSortDir_0" : 0,
            "sex": sex,
            "intelligence_array":intelligenceArray,
            "eyesight_array":eyesightArray,
            "familyType_array":familyType,
            "politicalStatus_array":politicalStatusArray,
            "organId_array":organIdArray,
            "secType_array":secTypeArray,
            "census_array":census,
            "ageStart":ageStart,
            "ageEnd":ageEnd,
            "family_array":family,
            "economic_array":economic,
            "isHealth_array":health,
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
                heatmapOverlay.setDataSet({data:heatPoints,max:200});
                // heatmapOverlay1.show();
            }
        }
    });
    ajax8 = $.ajax({
        url: "/map/jwNum",//这个就是请求地址对应sAjaxSource
        data : {
            "iDisplayStart" : 0,
            "iDisplayLength" : 100,
            "iSortCol_0" : 0,
            "sEcho" : 0,
            "sSortDir_0" : 0,
            "sex": sex,
            "intelligence_array":intelligenceArray,
            "eyesight_array":eyesightArray,
            "familyType_array":familyType,
            "politicalStatus_array":politicalStatusArray,
            "organId_array":organIdArray,
            "secType_array":secTypeArray,
            "census_array":census,
            "ageStart":ageStart,
            "ageEnd":ageEnd,
            "family_array":family,
            "economic_array":economic,
            "isHealth_array":health,
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
                var  heatPoints4=[

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
                heatPoints = heatPoints.concat(heatPoints4);
                heatmapOverlay.setDataSet({data:heatPoints,max:200});
                //  heatmapOverlay3.show();
            }
        }
    });
    heatPoints = [];
}

