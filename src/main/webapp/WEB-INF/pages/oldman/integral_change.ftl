<div class="modal fade" id="integralModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" style="width: 80%">
        <div class="modal-content">
            <div class="modal-body">
                <div class="wrapper wrapper-content animated fadeInRight">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>积分变更</h5>
                                </div>
                                <div class="ibox-content">
                                    <form class="form-horizontal" >
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">类型</label>
                                            <div class="col-sm-8">
                                                <input type="radio" name="type" value="add" class="col-sm-1" id="type1" checked>
                                                <label class="col-sm-2 control-label" for="type1">增加</label>
                                                <input type="radio" name="type" class="col-sm-1"  id="type2" value="jian">
                                                <label class="col-sm-2 control-label" for="type2">减少</label>
                                            </div>
                                        </div>

                                            <div class="form-group">
                                                <label class="col-sm-1 control-label">积分</label>
                                                <div class="col-sm-8">
                                                    <input id="integral" type="number" name="integral" class="form-control inp">
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

                <a onclick="changeIntegral()" href="javascript:void(0);" class="btn btn-primary sub">确定</a>

                <a data-dismiss="modal" href="javascript:void(0);" class="btn btn-primary ">关闭</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>


<script>
    function changeIntegral() {
        var ids=[];
        $("input[name='id']:checked").each(function () {
            ids.push($(this).val()+"#"+$(this).parent().next().next().text());
        });


        $.ajax({
            url : "/oldman/integral/change",
            type : "post",
            dataType : 'json',
            data:{
                oldmanIds:ids,
                type:$("#integralModal input[name='type']:checked").val(),
                value:$("#integralModal input[name='integral']").val()
            },
            success : function(data) {
                if (data.success==true) {
                    table.fnFilter();
                    $('#integralModal').modal('hide');
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
</script>