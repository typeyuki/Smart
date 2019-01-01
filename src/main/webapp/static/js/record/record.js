/**
 * Created by netlab606 on 2018/4/2.
 */
var table;
var  integralType,signType,name="",hdType="",hdTime="";
var peopleType=$("input[name=peopleType]:checked").val();
var minus;//积分查询 扣分
$(document).ready(function(){
    //这个方法用来启动该页面的ReverseAjax功能
    dwr.engine.setActiveReverseAjax(true);
    //设置在页面关闭时，通知服务端销毁会话
    dwr.engine.setNotifyServerOnPageUnload(true);

    var columns;
    var columnDefs;
    if(type==1 && organId==0){
        columns=[{},{
            data:"time"
        },{
            data:"data"
        },{
            data:"moneyChange"
        },{
            data:"order"
        }
        ];
    }else if(type==1 && organId!=0){
        columns=[{},{
            data:"time"
        },{
          data:"data"
        },{
            data:"order"
        }
        ];
    }else if(type==2){
        columns=[{},{
            data:"time"
        },{
            data:"secType"
        },{
            data:"peopleType"
        },{
            data:"hdType"
        },{
            data:"hdName"
        },{
            data:"hdTime"
        }
        ];
    }else if(type==4){
        columns=[{},{
            data:"time"
        },{
            data:"secType"
        },{
            data:"integral"
        }
        ];
    }else{
        columns=[{},{
            data:"time"
        }
        ];
    }
    columnDefs=[
        // 列样式
        {
            "targets": [0], // 目标列位置，下标从0开始
            "data": "oldman", // 数据列名
            "render": function(data, type, full) { // 返回自定义内容
                return data.name
            }
        }

    ];
    //全部的
    if(organId==0){
        columns.push({});
        if(type==1){
            columnDefs.push({
                "targets": [5], // 目标列位置，下标从0开始
                "data": "organ", // 数据列名
                "render": function(data, type, full) { // 返回自定义内容
                    return data.name
                }
            });
            // columnDefs.push({ "bSortable": false, "aTargets": [1,2,3,4] });
        }else if(type==2){
            columnDefs.push({
                "targets": [7], // 目标列位置，下标从0开始
                "data": "organ", // 数据列名
                "render": function(data, type, full) { // 返回自定义内容
                    return data.name
                }
            });
            // columnDefs.push({ "bSortable": false, "aTargets": [1,2,3,4] });
        }else if(type==4){
            columnDefs.push({
                "targets": [4], // 目标列位置，下标从0开始
                "data": "organ", // 数据列名
                "render": function(data, type, full) { // 返回自定义内容
                    return data.name
                }
            });
            // columnDefs.push({ "bSortable": false, "aTargets": [1,2,3,4] });
        }else {
            columnDefs.push({
                "targets": [2], // 目标列位置，下标从0开始
                "data": "organ", // 数据列名
                "render": function(data, type, full) { // 返回自定义内容
                    return data.name
                }
            });
            // columnDefs.push(columnDefs.push({ "bSortable": false, "aTargets": [1,2,3] }));
        }
    }else{
        // if(type==1){
        //     columnDefs.push({ "bSortable": false, "aTargets": [1,2,3] });
        // }else{
        //     columnDefs.push(columnDefs.push({ "bSortable": false, "aTargets": [1,2] }));
        // }
    }


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
            "columns":columns,
            "columnDefs":columnDefs ,
            "sAjaxSource": "/record/data",//这个是请求的地址
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
                "organId":organId,
                "type":type,
                "start":$("input[name='start']").val(),
                "end":$("input[name='end']").val(),
                "organ":$("select[name='organ']").val(),
                "search":$(".search").val().trim(),
                "order":$("select[name='order']").val()
            },
            type: 'POST',
            dataType: 'json',
            async: false,
            success: function (result) {
                fnCallback(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
            },
            error:function(XMLHttpRequest, textStatus, errorThrown) {
                // alert("status:"+XMLHttpRequest.status+",readyState:"+XMLHttpRequest.readyState+",textStatus:"+textStatus);
                BootstrapDialog.show({
                    title: '',
                    message: "服务器出错",
                    buttons: [{
                        label: '确定',            cssClass:'btn btn-primary',
                        action: function(dialog) {
                            dialog.close();
                        }
                    }]
                });
            }
        });
    }

    $('#search').click(function () {
        var i=0;
        $("input[type='date']").each(function () {
            var mathc=new RegExp('[0-9]{4}-[0-9]{2}-[0-9]{2}','i');
            if(i==0 && $(this).val().trim()!='' && !mathc.test($(this).val().trim())){
                BootstrapDialog.show({
                    title: '',
                    message: '格式不对，例：2018-01-01',
                    buttons: [{
                        label: '确定',            cssClass:'btn btn-primary',
                        action: function(dialog) {
                            dialog.close();
                        }
                    }]
                });
                i=1;
            }
        });
        if(i==0){
            table.fnFilter();
            if(type==1){
                $.ajax({
                    url : "/record/getMoneySum",
                    type : "get",
                    dataType : 'json',
                    data:{
                        "start":$("input[name='startDate']").val(),
                        "end":$("input[name='endDate']").val(),
                        "organId":organId
                    },
                    success : function(data) {
                        if (data.success==true) {
                            $("#sumMoney").html(data.data);
                        }
                    }
                });
        }
        }
    });


    $("input[name='peopleType']").on("change",function () {
        peopleType=$(this).val();
    });

    var oTable=$("#editable").dataTable();
    oTable.$("td").editable("",{
        "callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},
        "submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),
            "column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"});

});

function beginSao(obj) {
    if($(obj).html()=="开启扫码"){
        if(type==2){
            $("input[name='signType']:first").prop("checked",true);
            $(".hd").hide();
            $("#signModal input[name='name']").val("");
            $("#signModal").modal();
        }else if(type==4){
            $("input[name='integralType']:first").prop("checked",true);
            $("#integralModal").modal();
        }else{
            $(obj).html("关闭扫码");
            $(".saoma").show();
            $("#saoma_input").focus();
        }
    }else{
        $(".sign").hide();
        $(".integral").hide();
        $(obj).html("开启扫码");
        $(".saoma").hide();
    }
}

$('#saoma_input').bind('keypress',function(event){
    var t;
    if(type==2){
        t="sign";
    }else if(type==3){
        t="info";
    }else if(type==4){
        t="integral";
    }

    if(event.keyCode == "13")
    {
        var data={};
        if(type==2){
            data={
                cid:$(this).val().trim(),
                organId:organId,
                type:signType,
                peopleType:peopleType,
                name:name,
                hdType:hdType,
                hdTime:hdTime
            };
        }else if(type==4){
            data={
                cid:$(this).val().trim(),
                organId:organId,
                type:integralType,
                minus:minus
            };
        }else{
            data={
                cid:$(this).val().trim(),
                organId:organId
            };
        }
        $.ajax({
            url : "/card/"+t,
            type : "post",
            dataType : 'json',
            data:data,
            success : function(data) {
                $("#saoma_input").val("");
                if (data.success==true) {
                    if(type==3){
                        newPage(4,data.data.oldman.name,"/oldman/"+data.data.oldman.id+"/info");
                    }else if(type==4){
                        BootstrapDialog.show({
                            title: '',
                            message: data.data,
                            buttons: [{
                                label: '确定',            cssClass:'btn btn-primary',
                                action: function(dialog) {
                                    dialog.close();
                                }
                            }]
                        });
                    }
                } else {
                    BootstrapDialog.show({
                        title: '',
                        message: data.data,
                        buttons: [{
                            label: '确定',            cssClass:'btn btn-primary',
                            action: function(dialog) {
                                dialog.close();
                            }
                        }]
                    });
                }
            }
        });
    }

});


function finshRecord(data) {
    if(organId==data.data){
        table.fnFilter();
    }
}

function finshRecordExport(data) {
    if(organId==data.data){
        $("#process").hide();
        $(".wrapper").show();
        BootstrapDialog.show({
            title: '',
            message: '已导出',
            buttons: [{
                label: '确定',            cssClass:'btn btn-primary',
                action: function(dialog) {
                    dialog.close();
                }
            }]
        });
    }
}

