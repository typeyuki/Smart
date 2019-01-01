
<div class="modal fade" id="adddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" style="width: 80%">
        <div class="modal-content">
            <div class="modal-body">
                <div class="wrapper wrapper-content animated fadeInRight">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5></h5>
                                </div>
                                <div class="ibox-content">
                                    <form method="post" id="aaa" class="form-horizontal" action="/card/add">
                                        <div class="form-group lr">
                                            <label class="col-sm-1 control-label">老人</label>
                                            <div class="col-sm-8">
                                                <select  class="selectpicker bla bla bli" data-live-search="true" name="oldmanId">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">卡号</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="cid">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">密码</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="password">
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <a onclick="$('#aaa').submit()" href="javascript:void(0);" class="btn btn-primary ">保存</a>
                <a data-dismiss="modal" href="javascript:void(0);" class="btn btn-primary ">关闭</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<script>
    $('.selectpicker').selectpicker({
        'selectedText': 'cat'
    });

    $(".input-block-level").on("keyup",function () {
        var search=$(this).val();
        if(search.trim()!=""){
            $.ajax({
                url : "/oldman/getBySearch",
                type : "post",
                dataType : 'json',
                data:{
                    search:search
                },
                success : function(data) {
                    if (data.success==true) {
                        $("select[name='oldmanId']").empty();
                        for(var i=0;i<data.data.length;i++){
                            var $option=$("<option value='"+data.data[i].id+"'>"+data.data[i].name+"</option>");
                            $("select[name='oldmanId']").append($option);
                        }
                        $(".selectpicker" ).selectpicker('refresh');
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
    });

</script>

