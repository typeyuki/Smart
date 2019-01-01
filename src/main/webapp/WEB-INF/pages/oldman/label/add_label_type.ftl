<div class="modal fade" id="firModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" style="width: 80%">
        <div class="modal-content">
            <div class="modal-body">
                <div class="wrapper wrapper-content animated fadeInRight">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>一级标签 <small>添加</small></h5>
                                </div>
                                <div class="ibox-content">
                                    <form method="post" id="labelType1Add" class="form-horizontal" action="/oldman/label/type/1/add">
                                        <input type="hidden" name="type" value="9">
                                        <input type="hidden" name="id" value="0">
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">名称</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="value"/>
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

                <a onclick="$('#labelType1Add').submit()" href="javascript:void(0);" class="btn btn-primary firSub">保存</a>

                <a data-dismiss="modal" href="javascript:void(0);" class="btn btn-primary ">关闭</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>


<div class="modal fade" id="secModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" style="width: 80%">
        <div class="modal-content">
            <div class="modal-body">
                <div class="wrapper wrapper-content animated fadeInRight">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>政策类型 <small>添加</small></h5>
                                </div>
                                <div class="ibox-content">
                                    <form method="post" id="labelType2Add" class="form-horizontal" action="/oldman/label/add">
                                        <input type="hidden" name="id" value="0">
                                        <input type="hidden" name="firIndex" value="37">
                                        <#--<div class="form-group">-->
                                            <#--<label class="col-sm-1 control-label">一级菜单</label>-->
                                            <#--<div class="col-sm-2">-->
                                                <#--<select name="firIndex">-->
                                                    <#--<option></option>-->
                                                    <#--<#list fir as list>-->
                                                        <#--<option  value="${list.id!}" > ${list.value!}</option>-->
                                                    <#--</#list>-->
                                                <#--</select>-->
                                            <#--</div>-->
                                        <#--</div>-->
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="star-content">*</span>名称</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control bx" name="secName"/>
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

                <a onclick="check()" href="javascript:void(0);" class="btn btn-primary ">保存</a>

                <a data-dismiss="modal" href="javascript:void(0);" class="btn btn-primary ">关闭</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<script>
    function check() {
        var i=0;
        $("#secModal .bx").each(function () {
            if($(this).val()==null || $(this).val().trim()==''){
                i=1;
                return ;
            }
        });
        if(i==0)
            $('#labelType2Add').submit()
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