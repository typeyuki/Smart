/**
 * Created by netlab606 on 2018/4/2.
 */
$(document).ready(function(){
    var columns=[];
    var columnDefs=[];
    if(single=="single"){
        columns=[{},{
            data:"oldmanName"
        },{
            data: "oldmanStatus"
        },{
            data:"num"
        },{
            data:"timeIn"
        },{
            data:"timeOut"
        },{
            data:"applyTime"
        },{
            data:"ny"
        }
        ];
        columnDefs=[
            // 列样式
            {
                "targets": [0], // 目标列位置，下标从0开始
                "data": "id", // 数据列名
                "render": function(data, type, full) { // 返回自定义内容
                    return"<input type='checkbox' name='id' value='"+data+"' />"
                }
            },
            {
                "targets": [3], // 目标列位置，下标从0开始
                "data": "num", // 数据列名
                "render": function(data, type, full) { // 返回自定义内容
                    if(data=="0" || data==0){
                        return "排队中";
                    }else{
                        return data;
                    }
                }
            },
            // 增加一列，包括删除和修改，同时将我们需要传递的数据传递到链接中
            {
                "targets": [8], // 目标列位id置，下标从0开始
                "data": "id", // 数据列名
                "render": function(data, type, full) { // 返回自定义内容
                    return "<span class='btn btn-primary' onclick='edit("+data+")'>修改</span>";
                }
            }
        ];
    }else{
        columns=[{
            data:"oldmanName"
        },{
            data: "oldmanStatus"
        },{
            data:"num"
        },{
            data:"timeIn"
        },{
            data:"timeOut"
        },{
            data:"applyTime"
        },{
            data:"ny"
        }
        ];
        columnDefs=[
            // 列样式
            {
                "targets": [2], // 目标列位置，下标从0开始
                "data": "num", // 数据列名
                "render": function(data, type, full) { // 返回自定义内容
                    if(data=="0" || data==0){
                        return "排队中";
                    }else{
                        return data;
                    }
                }
            },
            // 增加一列，包括删除和修改，同时将我们需要传递的数据传递到链接中
            {
                "targets": [7], // 目标列位置，下标从0开始
                "data": "oldmanId", // 数据列名
                "render": function(data, type, full) { // 返回自定义内容

                    return "<button class='btn btn-primary'  onclick=check($(this).parent().prev().prev().prev().prev().prev().prev().text(),"+data+",$(this).parent().prev().prev().prev().prev().prev().prev().prev().text(),'/oldman/"+data+"/info')>查看</button>";
                }
            }
        ];
    }

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
            "columns":columns,
            "columnDefs": columnDefs,
            "sAjaxSource": dataUrl,//这个是请求的地址
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
                "organId" : organId,
                "search" : $('.search').val(),
                "isPd":$("select[name='isPd']").val(),
                "isExist":$("select[name='isExist']").val(),
                "ny":$(".ny").val()
            },
            type: 'POST',
            dataType: 'json',
            async: false,
            success: function (result) {
                fnCallback(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
            },
            error:function(XMLHttpRequest, textStatus, errorThrown) {
                // alert("status:"+XMLHttpRequest.status+",readyState:"+XMLHttpRequest.readyState+",textStatus:"+textStatus);
            }
        });
    }

    $('#search').click(function () {
        var mathc=new RegExp('[0-9]{4}-[0-9]{2}','i');
        if($(".ny").val().trim()!='' && !mathc.test($(".ny").val().trim())){
            BootstrapDialog.show({
                title: '',
                message: '格式不对，例：2018-01',
                buttons: [{
                    label: '确定',            cssClass:'btn btn-primary',
                    action: function(dialog) {
                        dialog.close();
                    }
                }]
            });
        }else{
            table.fnFilter();
        }
    });

    var oTable=$("#editable").dataTable();
    oTable.$("td").editable("",{
        "callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},
        "submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),
            "column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"});

});

function add() {
    $(".lr").show();
    $(".searchable-select").attr("name","oldmanId");
    $(".id").attr("name","");
    $('#addModal').modal();
    $('#addModal form').attr("action","/organ/oldman/add");
}

function edit(id) {
    $(".lr").hide();
    $(".searchable-select").attr("name","");
    $(".id").attr("name","id");
    $('#addModal form').attr("action","/organ/oldman/update");
    $.ajax({
        url: "/organ/oldman/"+id+"/getById",
        type: "get",
        async:false,
        success: function (result) {
            var data=result.data;
            for(key in data){
                if(key=="timeIn" || key=="timeOut" || key=="applyTime"){
                    if(data[key]!=null){
                        var date = new Date(data[key]);
                        var year = date.getFullYear(),
                            month = date.getMonth()+1,//月份是从0开始的
                            day = date.getDate();
                        var newTime = year + '-' +
                            (month < 10? '0' + month : month) + '-' +
                            (day < 10? '0' + day : day);
                        data[key]=newTime;
                    }
                }
                $("#addModal input[name='"+key+"']").val(data[key]);
            }

            $("#addModal").modal();
        }
    });
}

function thCheck(obj) {
    thCheckByName(obj,"id");
}


function thCheckByName(obj,name) {
    if($(obj).is(':checked')){
        $("input[name="+name+"]").prop("checked",true);
    }else{
        $("input[name="+name+"]").prop("checked",false);
    }
}

function del(url) {
    var ids=[];
    $("input[name='id']:checked").each(function () {
        ids.push($(this).val());
    });

    $.ajax({
        url : url,
        type : "post",
        dataType : 'json',
        data:{
            ids:ids
        },
        success : function(data) {
            if (data.success==true) {
                var start = $(".dataTables-example").dataTable().fnSettings()._iDisplayStart;
                var total = $(".dataTables-example").dataTable().fnSettings().fnRecordsDisplay();
                window.location.reload();
                if(total-start==1){
                    if(start>0){
                        $(".dataTables-example").dataTable().fnPageChange('previous',true);
                    }
                }

            } else {
                BootstrapDialog.show({
                    title: '',
                    message: '删除失败',
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

function check(flag,id,name,url) {
    if(flag=="未录入资料"){
        BootstrapDialog.show({
            title: '',
            message: '未录入资料',
            buttons: [{
                label: '确定',            cssClass:'btn btn-primary',
                action: function(dialog) {
                    dialog.close();
                }
            }]
        });
    }else {
        var t = url,
            a = "1" + id,
            i = name,
            n = !0;

        var jq = top.jQuery;
        if (void 0 == t || 0 == $.trim(t).length)
            return !1;
        if (
            jq(".J_menuTab").each(
                function () {
                    return $(this).data("id") == t ? (
                            $(this).hasClass("active") ||
                            (
                                $(this).addClass("active").siblings(".J_menuTab").removeClass("active"),
                                    jq(".J_mainContent .J_iframe").each(function () {
                                        return $(this).data("id") == t ?
                                            ($(this).show().siblings(".J_iframe").hide(), !1)
                                            :
                                            void 0
                                    }))
                                , n = !1, !1)
                        : void 0
                })
                , n
        ) {
            var s = '<a href="javascript:;" class="active J_menuTab" data-id="' + t + '">' + i + ' <i class="fa fa-times-circle"></i></a>';
            jq(".J_menuTab").removeClass("active");
            var r = '<iframe class="J_iframe" name="iframe' + a + '" width="100%" height="100%" src="' + t + '" frameborder="0" data-id="' + t + '" seamless></iframe>';
            jq(".J_mainContent").find("iframe.J_iframe").hide().parents(".J_mainContent").append(r);
            jq(".J_mainContent iframe:visible").load(function () {
                layer.close(o)
            });
            jq(".J_menuTabs .page-tabs-content").append(s);
            e(jq(".J_menuTab.active"));
        }
        return !1
    }
}