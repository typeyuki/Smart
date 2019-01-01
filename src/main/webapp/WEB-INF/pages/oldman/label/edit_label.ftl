

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
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
                                    <form method="post" id="oldmanEdit" class="form-horizontal" action="/oldman/label/update">
                                        <input type="hidden" name="id">
                                        <input type="hidden" name="type" value="${type}">
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="star-content">*</span>政策类型</label>
                                            <div class="col-sm-8">
                                                <select name="secId" class="search_select bx" data-live-search="true">
                                                <#list rule.secLabel as list>
                                                    <option  value="${list.id!}" > ${list.secName!}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="star-content">*</span>名称</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control bx" name="name"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">条件</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="rule"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">内容</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="content"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">文号</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="wh"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="star-content">*</span>开始时间</label>
                                            <div class="col-sm-8">
                                                <input type="date" class="form-control bx" name="startTime"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="star-content">*</span>结束时间</label>
                                            <div class="col-sm-8">
                                                <input type="date" class="form-control bx" name="endTime"/>
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
                <a onclick="check2()" href="javascript:void(0);" class="btn btn-primary aaaa">保存</a>
                <a data-dismiss="modal" href="javascript:void(0);" class="btn btn-primary ">关闭</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<script>
    function check2() {
        var i=0;
        $("#editModal .bx").each(function () {
            if($(this).val()==null || $(this).val().trim()==''){
                i=1;
                return ;
            }
        });
        if(i==0)
            $('#oldmanEdit').submit()
        else
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
</script>