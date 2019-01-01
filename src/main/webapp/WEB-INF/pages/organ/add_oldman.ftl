
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
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
                                    <form method="post" id="oldmanEdit" class="form-horizontal" action="/organ/oldman/add">
                                        <input type="hidden" class="id"/>
                                        <div class="form-group lr">
                                            <label class="col-sm-1 control-label"><span  class="star-content">*</span>老人</label>
                                            <div class="col-sm-8">
                                                <select  class="bx selectpicker bla bla bli" data-live-search="true" name="oldmanId">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="star-content">*</span>床位号</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control bx" name="num" placeholder="排队的填‘0’"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">入院时间</label>
                                            <div class="col-sm-8">
                                                <input type="date" class="form-control" name="timeIn"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">可能的出院时间</label>
                                            <div class="col-sm-8">
                                                <input type="date" class="form-control" name="timeOut"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">申请时间</label>
                                            <div class="col-sm-8">
                                                <input type="date" class="form-control" name="applyTime"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="star-content">*</span>更新时间</label>
                                            <div class="col-sm-8">
                                                <input type="month" class="form-control bx" name="ny"/>
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
                <a onclick="abc();" href="javascript:void(0);" class="btn btn-primary ">保存</a>
                <a data-dismiss="modal" href="javascript:void(0);" class="btn btn-primary ">关闭</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<script>
    function abc() {
        var i=0;
        $("#addModal input.bx").each(function () {
            if($(this).val()==null || $.trim($(this).val())==''){
                i=1;
                return ;
            }
        });
        if(i==0){
            $('#oldmanEdit').submit();
        } else{
            BootstrapDialog.show({
                title: '',
                message: '标红处不能为空',
                buttons: [{
                    label: '确定',            cssClass:'btn btn-primary',
                    action: function(dialog) {
                        dialog.close();
                    }
                }]
            });
        }
    }

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

