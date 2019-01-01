/**
 * Created by netlab606 on 2018/4/2.
 */
var table;
$(document).ready(function(){
    table =$(".dataTables-example").DataTable(
        {
            "sPaginationType": "full_numbers",
            "bPaginite": true,
            "bInfo": true,
            "bSort": false,
            "bFilter": false, //搜索栏
            "bStateSave": true,
            "bProcessing": true, //加载数据时显示正在加载信息
            "bServerSide": true, //指定从服务器端获取数据
            "columns":[{},{data:"grandName"},{data:"parentName"},{data:"name"},{}],
            "columnDefs":[ {
                "targets": [0], // 目标列位置，下标从0开始
                "data": "id", // 数据列名
                "render": function(data, type, full) { // 返回自定义内容
                    return"<input type='checkbox' name='id' value='"+data+"'/>"
                }
            },{
                "targets": [4], // 目标列位置，下标从0开始
                "data": "id", // 数据列名
                "render": function(data, type, full) { // 返回自定义内容
                    return "<span class='btn btn-primary' onclick='edit("+data+",this)'>修改</span>";
                }
            }],
            "sAjaxSource": "/product/type/data",//这个是请求的地址
            "fnServerData": retrieveData
        });

    $('#search').click(function () {
        table.fnFilter();
    });

    init(type);

    $('.search_select').searchableSelect();


    var oTable=$("#editable").dataTable();
    oTable.$("td").editable("",{
        "callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},
        "submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),
            "column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"});



});


function add() {
    $("#editModal form").attr("action","/product/type/add");
    $("#editModal small").html("添加");
    $("#editModal .firSub").html("添加");
    $("#editModal input[name='type']").val(type);
    if(type=="1"){
        $(".se2").show();
        $(".se3").show();
        $(".fir").attr("class","bx fir form-control");
        $(".sec").attr("class","form-control bx sec");
    }
else if(type=="2"){
        $(".se2").hide();
        $(".se3").show();
        $(".fir").attr("class","bx fir form-control");
        $(".sec").attr("class","form-control sec");
    }else{
        $(".se2").hide();
        $(".se3").hide();
        $(".fir").attr("class","fir form-control");
        $(".sec").attr("class","form-control sec");
    }
    $("#editModal").modal();
}
var parent;
function edit(id) {
    $("#editModal form").attr("action","/product/type/edit");
    $("#editModal small").html("修改");
    $("#editModal .firSub").html("保存");
    oldman_edit(1,"/product/type/"+id+"/getById");
    if(type=="1"){
        $(".se2").show();
        $(".se3").show();
        $(".fir").attr("class","bx fir form-control");
        $(".sec").attr("class","form-control bx sec");
        $.ajax({
            url: "/product/type/"+$("#editModal .fir").val()+"/getByParent",
            type: 'GET',
            async:false,
            success: function (result) {
                if(result.success==true){
                    for(var i=0;i<result.data.length;i++){
                        var op;
                        if(result.data[i].id==parent){
                            op=$("<option value='"+result.data[i].id+"' selected>"+result.data[i].name+"</option>");
                        }else{
                            op=$("<option value='"+result.data[i].id+"'>"+result.data[i].name+"</option>");
                        }
                        $(".sec").append(op);
                    }
                }
            }
        });
    }else if(type=="2"){
        $(".se2").hide();
        $(".se3").show();
        $(".fir").attr("class","bx fir form-control");
        $(".sec").attr("class","form-control sec");
    }else{
        $(".se2").hide();
        $(".se3").hide();
        $(".fir").attr("class","fir form-control");
        $(".sec").attr("class","form-control sec");
    }
}


function change(index,obj) {
    type=index;
    $(".auto").prop("disabled",false);
    $(obj).prop("disabled",true);
    $("input[name='id']").prop("checked",false);

    $(".search").val("");
    init(index);
}

function init(index) {
    if(index==1){
        $(".th2").remove();
        $(".th3").remove();
        $(".se2").show();
        $(".se3").show();
        $(".fir").attr("class","bx fir form-control");
        $(".sec").attr("class","form-control bx sec");
        $("th.start").after("<th class='th2'>二级类别</th>");
        $("th.start").after("<th class='th3'>一级类别</th>");
        $('.dataTables-example').DataTable().clear();
        $('.dataTables-example').DataTable().destroy();
        table =$(".dataTables-example").DataTable(
            {
                "sPaginationType": "full_numbers",
                "bPaginite": true,
                "bInfo": true,
                "bSort": false,
                "bFilter": false, //搜索栏
                "bStateSave": true,
                "bProcessing": true, //加载数据时显示正在加载信息
                "bServerSide": true, //指定从服务器端获取数据
                "columns":[{},{data:"grandName"},{data:"parentName"},{data:"name"},{}],
                "columnDefs":[ {
                    "targets": [0], // 目标列位置，下标从0开始
                    "data": "id", // 数据列名
                    "render": function(data, type, full) { // 返回自定义内容
                        return"<input type='checkbox' name='id' value='"+data+"'/>"
                    }
                },{
                    "targets": [4], // 目标列位置，下标从0开始
                    "data": "id", // 数据列名
                    "render": function(data, type, full) { // 返回自定义内容
                        return "<span class='btn btn-primary' onclick='edit("+data+",this)'>修改</span>";
                    }
                }],
                "sAjaxSource": "/product/type/data",//这个是请求的地址
                "fnServerData": retrieveData
            });
    }else if(index==2){
        $(".fir").attr("class","bx fir form-control");
        $(".sec").attr("class","form-control sec");
        $(".th2").remove();
        $(".th3").remove();
        $(".se2").hide();
        $(".se3").show();
        $("th.start").after("<th class='th3'>类别</th>");
        $('.dataTables-example').DataTable().clear();
        $('.dataTables-example').DataTable().destroy();
        table =$(".dataTables-example").DataTable(
            {
                "sPaginationType": "full_numbers",
                "bPaginite": true,
                "bInfo": true,
                "bSort": false,
                "bFilter": false, //搜索栏
                "bStateSave": true,
                "bProcessing": true, //加载数据时显示正在加载信息
                "bServerSide": true, //指定从服务器端获取数据
                "columns":[{},{data:"parentName"},{data:"name"},{}],
                "columnDefs":[ {
                    "targets": [0], // 目标列位置，下标从0开始
                    "data": "id", // 数据列名
                    "render": function(data, type, full) { // 返回自定义内容
                        return"<input type='checkbox' name='id' value='"+data+"'/>"
                    }
                },{
                    "targets": [3], // 目标列位置，下标从0开始
                    "data": "id", // 数据列名
                    "render": function(data, type, full) { // 返回自定义内容
                        return "<span class='btn btn-primary' onclick='edit("+data+",this)'>修改</span>";
                    }
                }],
                "sAjaxSource": "/product/type/data",//这个是请求的地址
                "fnServerData": retrieveData
            });
    }else{
        $(".fir").attr("class","fir form-control");
        $(".sec").attr("class","form-control sec");
        $(".th2").remove();
        $(".th3").remove();
        $(".se2").hide();
        $(".se3").hide();
        $('.dataTables-example').DataTable().clear();
        $('.dataTables-example').DataTable().destroy();
        table =$(".dataTables-example").DataTable(
            {
                "sPaginationType": "full_numbers",
                "bPaginite": true,
                "bInfo": true,
                "bSort": false,
                "bFilter": false, //搜索栏
                "bStateSave": true,
                "bProcessing": true, //加载数据时显示正在加载信息
                "bServerSide": true, //指定从服务器端获取数据
                "columns":[{},{data:"name"},{}],
                "columnDefs":[ {
                    "targets": [0], // 目标列位置，下标从0开始
                    "data": "id", // 数据列名
                    "render": function(data, type, full) { // 返回自定义内容
                        return"<input type='checkbox' name='id'  value='"+data+"'/>"
                    }
                },{
                    "targets": [2], // 目标列位置，下标从0开始
                    "data": "id", // 数据列名
                    "render": function(data, type, full) { // 返回自定义内容
                        return "<span class='btn btn-primary' onclick='edit("+data+",this)'>修改</span>";
                    }
                }],
                "sAjaxSource": "/product/type/data",//这个是请求的地址
                "fnServerData": retrieveData
            });
    }
}

function retrieveData(url, aoData, fnCallback) {


    $.ajax({
        url: url,//这个就是请求地址对应sAjaxSource
        data : {
            "iDisplayStart" : aoData.iDisplayStart,
            "iDisplayLength" : aoData.iDisplayLength,
            "iSortCol_0" : aoData.iSortCol_0,
            "sEcho" : aoData.sEcho,
            "sSortDir_0" : aoData.sSortDir_0,
            "type":type
        },
        type: 'POST',
        dataType: 'json',
        async: false,
        success: function (result) {
            fnCallback(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
        },
        error:function(XMLHttpRequest, textStatus, errorThrown) {
        }
    });
}