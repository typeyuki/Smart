


<div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" style="width: 80%">
        <div class="modal-content">
            <div class="modal-body">
                <div class="wrapper wrapper-content animated fadeInRight">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>商品 <small>添加</small></h5>
                                </div>
                                <div class="ibox-content">
                                    <form method="post" id="labelType2Add" class="form-horizontal" enctype="multipart/form-data">
                                        <input type="hidden" name="id" value="0">
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="control-label star-content">*</span>一级类别</label>
                                            <div class="col-sm-8">
                                                <select class="form-control inp fir bx" onchange="firSelect(this)">
                                                    <option></option>
                                                <#list fir as list>
                                                    <option  value="${list.id!}" > ${list.name!}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="control-label star-content">*</span>二级类别</label>
                                            <div class="col-sm-8">
                                                <select  class="form-control inp sec bx" onchange="secSelect(this)">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="control-label star-content">*</span>名称</label>
                                            <div class="col-sm-8">
                                                <select name="type" class="form-control inp bx">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="control-label star-content">*</span>价格</label>
                                            <div class="col-sm-8">
                                                <input type="number" step="0.01" class="form-control bx" name="price"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">描述</label>
                                            <div class="col-sm-8">
                                                <textarea  class="form-control" name="intro"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">图片</label>
                                            <div class="col-sm-4">
                                                <img src="" width='100px'>
                                            </div>
                                            <div class="col-sm-2">
                                                <input type="file" class="form-control" name="pic"/>
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

                <a onclick="check()" href="javascript:void(0);" class="btn btn-primary sub">添加</a>

                <a data-dismiss="modal" href="javascript:void(0);" class="btn btn-primary ">关闭</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<script>
    function firSelect(obj) {
        $(".sec").html("");
        $.ajax({
            url: "/product/type/"+$(obj).val()+"/getByParent",
            type: 'GET',
            success: function (result) {
                if(result.success==true){
                    $(".sec").append($("<option></option>"));
                    for(var i=0;i<result.data.length;i++){
                        var op=$("<option value='"+result.data[i].id+"'>"+result.data[i].name+"</option>");
                        $(".sec").append(op)
                    }
                }
            }
        });
    }

    function secSelect(obj) {
        $("select[name='type']").html("");
        $.ajax({
            url: "/product/type/"+$(obj).val()+"/getByParent",
            type: 'GET',
            success: function (result) {
                if(result.success==true){
                    for(var i=0;i<result.data.length;i++){
                        var op=$("<option value='"+result.data[i].id+"'>"+result.data[i].name+"</option>");
                        $("select[name='type']").append(op)
                    }
                }
            }
        });
    }
    
    function check() {
        var i = 0;
        var message;
        $(".bx").each(function () {
            if ($(this).val() == null || $(this).val().trim() == '') {
                i = 1;
                message="标红处不能为空";
                return;
            }
        });

        if($("input[name='pic']").val().length>0){
            var filepath = $("input[name='pic']").val();
            var extStart = filepath.lastIndexOf(".");
            var ext = filepath.substring(extStart, filepath.length).toLowerCase();
            if(ext!=".jpg"&&ext!=".gif"&&ext!=".jpeg"&& ext!=".png"){
                i=1;
                message="图片格式不对";
            }
            var size=$("input[name='pic']")[0].files[0].size;
            if(size>500000){
                i=1;
                message="图片大小不能超过500KB";
            }
        }

        if (i == 0)
            $('form').submit();
        else
            BootstrapDialog.show({
                title: '',
                message: message,
                buttons: [{
                    label: '确定', cssClass: 'btn btn-primary',
                    action: function (dialog) {
                        dialog.close();
                    }
                }]
            });
    }
</script>