<style>
    #table{
        position: relative;
        top:50px;
    }
</style>

    <div class="wrapper wrapper-content animated fadeInRight box" id="table1"">
        <div class="zz"></div>
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover dataTables-example text-nowrap" id="dt">
                            <thead>
                            <tr>
                                <th>片区</th>
                                <th>居委</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>年龄</th>
                                <th>户籍</th>
                                <th>电话</th>
                                <th>身份证号码</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

<#include "table_info.ftl" />
<script>
    $("#table1").css("margin-top",(winHeight/1.5+190)+"px");
    var tableWidth=document.getElementById('dt');
    tableWidth.style.width='105%';
    var label=[];//用于标签页面
    var sex;
    var census=new Array();
    var ageEnd,ageStart;
    var family=new Array(),economic=new Array();
    var health=new Array();
    var oldStatus=new Array();
    var district=new Array();
    var familyType=new Array();
    var politicStatus = new Array();
    var jw = [1,2,3,13,45,58,59,60,63,66,67,84,85,87,88,89,90,93,97,98,99,100,101,102,103,104,105,106,107,108,113,119,120,121,122,123,124,125,126,134,135];
    var iDisplayLength=12;
    var table;
    $(document).ready(function(){
        //$("tr:odd").css("background-color", "#ccc");
        //$("tr").each(function(i){this.style.backgroundColor=['#ccc','#fff'][i%2]})
        table =$(".dataTables-example").dataTable(
                {
                    "sPaginationType": "full_numbers",
                    // bAutoWidth: false,
                    "bPaginite": true,
                    "bInfo": true,
                    "bSort": false,
                    "bFilter": false, //搜索栏
                    "bStateSave": true,
                    "bProcessing": true, //加载数据时显示正在加载信息
                    "bServerSide": true, //指定从服务器端获取数据
                    "iDisplayLength":9,
                    "columns":[{
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
                            "targets": [2], // 目标列位置，下标从0开始
                            "data": "name", // 数据列名
                            "render": function(data, type, full) { // 返回自定义内容
                                //先拿到点击的行号
                               var oid=data.split("*")[1];
                               var name=data.split("*")[0];

                               //alert("id:"+oid+"name"+name);
                                //alert(data);
                                return "<span  onclick=look('"+oid+"') id='"+data+"'>"+name+"</span>";
                                // return "<span  onclick=look(oid) id='"+data+"'>"+name+"</span>";
                               // return "<span class='btn btn-primary' onclick=look(idx) id='"+data+"'>"+data+"</span>";
                            }

                        },
                        {
                            "targets": [7], // 目标列位置，下标从0开始
                            "data": "name", // 数据列名
                            sWidth:"8%",
                            "render": function(data, type, full) { // 返回自定义内容
                                //alert(data);
                                return data.substring(0,10)+"****"+data.substring(14);
                            }

                        },
                        {
                            "targets": [6], // 目标列位置，下标从0开始
                            "visible": false


                        }

                    ],
                    "createdRow": function (row, data, dataIndex) {
                        // row : tr dom
                        // data: row data
                        // dataIndex:row data's index
                        if (dataIndex%2) {
                            $(row).css("background-color", "#607B8B");
                        }
                    },
                    "sAjaxSource": "/VTabel/getOld",//这个是请求的地址
                    "fnServerData": retrieveData
                });
        function retrieveData(url, aoData, fnCallback) {
            $.ajax({
                url: url,//这个就是请求地址对应sAjaxSource
                data : {
                    "iDisplayStart" : aoData.iDisplayStart,
                    "iDisplayLength" : aoData.iDisplayLength,
                    "iSortCol_0" : aoData.iSortCol_0,
                    "sEcho" : aoData.sEcho,
                    "sSortDir_0" : aoData.sSortDir_0,
                    "sex": sex,
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
                    "district_array":mapDistrict

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



        $("#DataTables_Table_0").prev().css("display","none");
        $("#dt_wrapper").find("div.row:first-child").hide();
        var oTable=$("#editable").dataTable();
        oTable.$("td").editable("",{
            "callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},
            "submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),
                "column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"});

    });


    function look(id) {
        $.ajax({
            url : "/oldman/"+id+"/info",
            type : "post",
            success : function(data) {
                if (data.success==true) {
                    var dataR=data.data;
                    // $('#editModal').modal();

                    //clear
                    document.getElementById("name").innerHTML="姓名：";
                    document.getElementById("no").innerHTML ="编号：";
                    document.getElementById("sex").innerHTML ="性别：";
                    document.getElementById("age").innerHTML ="年龄：";
                    document.getElementById("phone").innerHTML ="电话：";
                    document.getElementById("census").innerHTML ="户籍：";
                    document.getElementById("politicalStatus").innerHTML ="政治面貌：";
                    document.getElementById("pid").innerHTML ="身份证号码：";

                    document.getElementById("dName").innerHTML ="片区：";
                    document.getElementById("xName").innerHTML ="小区：";
                    document.getElementById("louNum").innerHTML="楼号：";
                    document.getElementById("jName").innerHTML="居委：";
                    document.getElementById("address").innerHTML="地址：";

                    document.getElementById("zc").innerHTML ="职称：";
                    document.getElementById("bloodType").innerHTML ="血型：";
                    document.getElementById("intelligence").innerHTML ="失智情况：";
                    document.getElementById("eyesight").innerHTML ="视力：";
                    document.getElementById("mb").innerHTML="慢病";

                    document.getElementById("oldStatus").innerHTML ="养老状态：";
                    document.getElementById("economic").innerHTML ="经济条件：";

                    document.getElementById("linkName").innerHTML="姓名：";
                    document.getElementById("linkPhone").innerHTML ="电话：";
                    document.getElementById("linkRelation").innerHTML="关系：";

                    //
                    if(dataR.oldman.name!=null)
                    document.getElementById("name").innerHTML += dataR.oldman.name;
                    if(dataR.oldman.id!=null)
                    document.getElementById("no").innerHTML += dataR.oldman.id;
                    if(dataR.oldman.sex!=null)
                    document.getElementById("sex").innerHTML += dataR.oldman.sex;
                    if(dataR.oldman.age!=null)
                    document.getElementById("age").innerHTML += dataR.oldman.age;
                    if(dataR.oldman.phone!=null)
                    document.getElementById("phone").innerHTML += dataR.oldman.phone;
                    if(dataR.oldman.census!=null)
                    document.getElementById("census").innerHTML += dataR.oldman.census;
                    if(dataR.oldman.hasOwnProperty("politicalStatus"))
                    document.getElementById("politicalStatus").innerHTML += dataR.oldman.politicalStatus;
                    if(dataR.oldman.pid!=null)
                    document.getElementById("pid").innerHTML += dataR.oldman.pid;

                    if(dataR.oldman.dName!=null)
                    document.getElementById("dName").innerHTML += dataR.oldman.dName;
                    if(dataR.oldman.xName!=null)
                    document.getElementById("xName").innerHTML += dataR.oldman.xName;
                    if(dataR.oldman.louNum!=null)
                    document.getElementById("louNum").innerHTML += dataR.oldman.louNum;
                    if(dataR.oldman.jName!=null)
                    document.getElementById("jName").innerHTML += dataR.oldman.jName;
                    if(dataR.oldman.address!=null)
                    document.getElementById("address").innerHTML += dataR.oldman.address;


                    if(dataR.oldman.zc!=null)
                    document.getElementById("zc").innerHTML += dataR.oldman.zc;
                    if(dataR.oldman.bloodType!=null)
                    document.getElementById("bloodType").innerHTML += dataR.health.bloodType;
                    if(dataR.oldman.intelligence!=null)
                    document.getElementById("intelligence").innerHTML += dataR.health.intelligence;
                    if(dataR.oldman.eyesight!=null)
                    document.getElementById("eyesight").innerHTML += dataR.health.eyesight;
                    // if(dataR.health.selectMb[0].secTypeName!=null)
                    // document.getElementById("mb").innerHTML += dataR.health.selectMb[0].secTypeName;
                    //document.getElementById("mb").innerHTML += dataR.health.selectSn

                    if(dataR.hasOwnProperty("organ")&&dataR.organ!=null)
                    {
                        if(dataR.organ.hasOwnProperty("oldmanStatus"))
                            document.getElementById("oldStatus").innerHTML += dataR.organ.oldmanStatus;
                    }

                    if(dataR.economic!=null)
                    document.getElementById("economic").innerHTML += dataR.economic;

                    if(dataR.linkman.name!=null)
                    document.getElementById("linkName").innerHTML += dataR.linkman.name;
                    if(dataR.linkman.phone!=null)
                    document.getElementById("linkPhone").innerHTML += dataR.linkman.phone;
                    if(dataR.linkman.relation!=null)
                    document.getElementById("linkRelation").innerHTML += dataR.linkman.relation;

                    // 显示模态框
                    $('#editModal').modal('show');

                }
            }
        });

    }
</script>