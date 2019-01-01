<div class="wrapper wrapper-content animated fadeInRight box" id="table1" style="positon:relative;top:-80px">
        <div class="zz"></div>
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover dataTables-example text-nowrap" id="dt">
                            <thead>
                            <tr>
                                <th>序号</th>
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

<script>
    $("#table1").css("margin-top",winWidth/3.1);
    $("#table1").css("width",winWidth/2.1);
    $("#table1").css("height",winWidth/6);
    var label=[];//用于标签页面
    var sex;
    var census=new Array();
    var ageEnd,ageStart;
    var family=new Array(),economic=new Array();
    var health=new Array();
    var oldStatus=new Array();
    var district=new Array();
    var familyType=new Array();
    var iDisplayLength=12;
    var table;
    $(document).ready(function(){
        //$("tr:odd").css("background-color", "#ccc");
        //$("tr").each(function(i){this.style.backgroundColor=['#ccc','#fff'][i%2]})
        table =$(".dataTables-example").dataTable(
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
                    "iDisplayLength" : 3,
                    "columnDefs": [
                        {
                            "targets": [3], // 目标列位置，下标从0开始
                            "data": "name", // 数据列名
                            "render": function(data, type, full) { // 返回自定义内容
                                //先拿到点击的行号
                                // var rowIndex = $(this).parents("tr").index();
                                // var idx = $('#example').DataTable().row(rowIndex).data().id;
                                // return "<span class='btn btn-primary' onclick=look(idx) id='"+data+"'>"+data+"</span>";
                                return "<span class='btn btn-primary' onclick=look($(this).parent().prev().prev().prev().text()) id='"+data+"'>"+data+"</span>";
                            },

                        },
                        {
                            "targets":[0],
                            "visible":false
                        },

                    ],
                    "createdRow": function (row, data, dataIndex) {
                        // row : tr dom
                        // data: row data
                        // dataIndex:row data's index
                        if (dataIndex%2) {
                            $(row).css("background-color", "#607B8B");
                        }
                    },
                    "sAjaxSource": "/oldman/data",//这个是请求的地址
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
                    "census_array":census,
                    "ageStart":ageStart,
                    "ageEnd":ageEnd,
                    "family_array":family,
                    "economic_array":economic,
                    "isHealth_array":health,
                    "oldStatus_array":oldStatus,
                    "district_array":district,
                    "familyType_array":familyType,

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
                    document.getElementById("name").innerHTML += dataR.oldman.name;
                    document.getElementById("no").innerHTML += dataR.oldman.id;
                    document.getElementById("sex").innerHTML += dataR.oldman.sex;
                    document.getElementById("age").innerHTML += dataR.oldman.age;
                    document.getElementById("phone").innerHTML += dataR.oldman.phone;
                    document.getElementById("census").innerHTML += dataR.oldman.census;
                    document.getElementById("politicalStatus").innerHTML += dataR.oldman.politicalStatus;
                    document.getElementById("pid").innerHTML += dataR.oldman.pid;

                    document.getElementById("dName").innerHTML += dataR.oldman.dName;
                    document.getElementById("xName").innerHTML += dataR.oldman.xName;
                    document.getElementById("louNum").innerHTML += dataR.oldman.louNum;
                    document.getElementById("jName").innerHTML += dataR.oldman.jName;
                    document.getElementById("address").innerHTML += dataR.oldman.address;


                    politicalStatus
                    // 显示模态框
                    $('#editModal').modal('show');

                }
            }
        });

    }
</script>
<#--//old-->
    <#--<div class="wrapper wrapper-content animated fadeInRight box">-->
        <#--<div class="zz"></div>-->
        <#--<div class="row">-->
            <#--<div class="col-lg-12">-->
                <#--<div class="ibox float-e-margins">-->
                    <#--<div class="ibox-content">-->
                        <#--<div class="table-responsive">-->
                            <#--<table class="table table-striped table-bordered table-hover dataTables-example text-nowrap">-->
                                <#--<thead>-->
                                <#--<tr>-->
                                    <#--<th>序号</th>-->
                                    <#--<th>片区</th>-->
                                    <#--<th>居委</th>-->
                                    <#--<th>小区</th>-->
                                    <#--<th>楼号</th>-->
                                    <#--<th>姓名</th>-->
                                    <#--<th>性别</th>-->
                                    <#--<th>年龄</th>-->
                                    <#--<th>政治面貌</th>-->
                                    <#--<th>户籍</th>-->
                                    <#--<th>电话</th>-->
                                    <#--<th>地址</th>-->
                                    <#--<th>身份证号码</th>-->
                                    <#--<th></th>-->
                                <#--</tr>-->
                                <#--</thead>-->
                                <#--<tbody>-->
                                <#--</tbody>-->
                            <#--</table>-->
                        <#--</div>-->
                    <#--</div>-->
                <#--</div>-->
            <#--</div>-->
        <#--</div>-->
    <#--</div>-->



<#--finish-->


<#--<script>-->
    <#--var label=[];//用于标签页面-->

    <#--var iDisplayLength=8;-->
    <#--$(document).ready(function(){-->
        <#--var table =$(".dataTables-example").dataTable(-->
                <#--{-->
                    <#--"sPaginationType": "full_numbers",-->
                    <#--"bPaginite": true,-->
                    <#--"bInfo": true,-->
                    <#--"bSort": true,-->
                    <#--"bFilter": false, //搜索栏-->
                    <#--"bStateSave": true,-->
                    <#--"bProcessing": true, //加载数据时显示正在加载信息-->
                    <#--"bServerSide": true, //指定从服务器端获取数据-->
                    <#--"columns":[{-->
                        <#--data:"id"-->
                    <#--},{-->
                        <#--data:"dName"-->
                    <#--},{-->
                        <#--data:"jName"-->
                    <#--},{-->
                        <#--data:"xName"-->
                    <#--},{-->
                        <#--data:"louNum"-->
                    <#--},{-->
                        <#--data:"name"-->
                    <#--},{-->
                        <#--data:"sex"-->
                    <#--},{-->
                        <#--data:"age"-->
                    <#--},{-->
                        <#--data:"politicalStatus"-->
                    <#--},{-->
                        <#--data:"census"-->
                    <#--},{-->
                        <#--data:"phone"-->
                    <#--},{-->
                        <#--data:"address"-->
                    <#--},{-->
                        <#--data:"pid"-->
                    <#--}-->
                    <#--],-->
                    <#--"iDisplayLength" : iDisplayLength,-->
                    <#--"columnDefs": [-->
                        <#--// 增加一列，包括删除和修改，同时将我们需要传递的数据传递到链接中-->
                        <#--//不进行排序的列-->
                        <#--{ "bSortable": false, "aTargets": [ 0,1,2,3 ,4, 5,6, 7,9,10,11,12] }-->
                    <#--],-->
                    <#--"sAjaxSource": "/oldman/baseData",//这个是请求的地址-->
                    <#--"fnServerData": retrieveData-->
                <#--});-->
        <#--function retrieveData(url, aoData, fnCallback) {-->
            <#--$.ajax({-->
                <#--url: url,//这个就是请求地址对应sAjaxSource-->
                <#--data : {-->
                    <#--"iDisplayStart" : aoData.iDisplayStart,-->
                    <#--"iDisplayLength" : aoData.iDisplayLength,-->
                    <#--"iSortCol_0" : aoData.iSortCol_0,-->
                    <#--"sEcho" : aoData.sEcho,-->
                    <#--"sSortDir_0" : aoData.sSortDir_0,-->
                    <#--"label":label-->
                <#--},-->
                <#--type: 'POST',-->
                <#--dataType: 'json',-->
                <#--async: false,-->
                <#--success: function (result) {-->
                    <#--fnCallback(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的-->
                <#--},-->
                <#--error:function(XMLHttpRequest, textStatus, errorThrown) {-->
<#--//                    alert("status:"+XMLHttpRequest.status+",readyState:"+XMLHttpRequest.readyState+",textStatus:"+textStatus);-->
                <#--}-->
            <#--});-->
        <#--}-->

        <#--$("#DataTables_Table_0").prev().css("display","none");-->

        <#--var oTable=$("#editable").dataTable();-->
        <#--oTable.$("td").editable("",{-->
            <#--"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},-->
            <#--"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),-->
                <#--"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"});-->

    <#--});-->
<#--</script>-->