/**
 * Created by netlab606 on 2018/4/2.
 */
var table;
$(document).ready(function(){
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
            "columns":[{},{
                data:"oldmanName"
            },{
                data:"integral"
            }
            ],
            "columnDefs": [
                // 增加一列，包括删除和修改，同时将我们需要传递的数据传递到链接中
                {
                    "targets": [0], // 目标列位置，下标从0开始
                    "data": "oldmanId", // 数据列名
                    "render": function(data, type, full) { // 返回自定义内容
                        return"<input type='checkbox' name='id' value='"+data+"'/>"
                    }
                },
                {
                    "targets": [3], // 目标列位置，下标从0开始
                    "data": "oldmanId", // 数据列名
                    "render": function(data, type, full) { // 返回自定义内容
                        return "<button class='btn btn-primary' onclick=newPage("+data+",$(this).parent().prev().prev().text(),'/card/"+data+"/integral/record')>查看积分记录</button>";
                    }
                }
            ],
            "sAjaxSource": "/oldman/integralData",//这个是请求的地址
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
                "search" : $('.search').val().trim()
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

    $('#search').click(function () {
        table.fnFilter();
    });

    var oTable=$("#editable").dataTable();
    oTable.$("td").editable("",{
        "callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},
        "submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),
            "column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"});

});

function zero() {

    BootstrapDialog.show({
        title: '积分',
        message: '积分清零',
        buttons: [{
            label: '确定',
            cssClass:'btn btn-primary',
            action: function(dialog) {
                var ids=[];
                $("input[name='id']:checked").each(function () {
                    ids.push($(this).val()+"#"+$(this).parent().next().next().text());
                });

                $.ajax({
                    url :"/oldman/integral/zero",
                    type : "post",
                    dataType : 'json',
                    data:{
                        oldmanIds:ids
                    },
                    success : function(data) {
                        if (data.success==true) {
                            table.fnFilter();
                            dialog.close();
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
        }, {
            label: '取消',
            action: function(dialog) {
                dialog.close();
            }
        }]
    });
}
