<style>
    #div-table{
        height: 100px;
        overflow-y: scroll;
        width: 100%;
        background-color: #eee;
        display: none;
    }
    #table{
        width: 100%;
    }
    #table td{
        width: 100%;
        height: 15px;
        padding: 4px;
    }
    #table tr:hover{
        background: silver;
    }
</style>

<div class="modal fade" id="signModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" style="width: 80%">
        <div class="modal-content">
            <div class="modal-body">
                <div class="wrapper wrapper-content animated fadeInRight">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>签到扫码</h5>
                                </div>
                                <div class="ibox-content">
                                    <form class="form-horizontal" >
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">类型</label>
                                            <div class="col-sm-8">
                                                <input type="radio" name="signType" class="col-sm-1" id="type1" value="0" checked>
                                                <label class="col-sm-2 control-label" for="type1">日常签到</label>
                                                <input type="radio" name="signType" class="col-sm-1"  id="type2" value="1">
                                                <label class="col-sm-2 control-label" for="type2">活动签到</label>
                                            </div>
                                        </div>
                                        <div class="hd" style="display: none">
                                            <div class="form-group">
                                                <label class="col-sm-1 control-label">活动类型</label>
                                                <div class="col-sm-8">
                                                    <select  class="form-control inp" name="hdType">
                                                        <option value="1">老有所养</option>
                                                        <option value="2">老有所医</option>
                                                        <option value="3">老有所乐</option>
                                                        <option value="4">老有所为</option>
                                                        <option value="5">老有所学</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-1 control-label">活动名称</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="name" class="form-control" onkeyup="hdname(this)">
                                                    <div id="div-table">
                                                        <table id="table">
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-1 control-label">活动时间</label>
                                                <div class="col-sm-8">
                                                    <input type="date" name="time" class="form-control">
                                                </div>
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

                <a onclick="sign()" href="javascript:void(0);" class="btn btn-primary sub">开始</a>

                <a data-dismiss="modal" href="javascript:void(0);" class="btn btn-primary ">关闭</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<div class="modal fade" id="integralModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" style="width: 80%">
        <div class="modal-content">
            <div class="modal-body">
                <div class="wrapper wrapper-content animated fadeInRight">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>积分扫码</h5>
                                </div>
                                <div class="ibox-content">
                                    <form class="form-horizontal" >
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">类型</label>
                                            <div class="col-sm-8">
                                                <input type="radio" name="integralType" class="col-sm-1" id="ty1" value="0" checked>
                                                <label class="col-sm-2 control-label" for="ty1">积分查询</label>
                                                <input type="radio" name="integralType" class="col-sm-1"  id="ty2" value="1">
                                                <label class="col-sm-2 control-label" for="ty2">积分兑换</label>
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

                <a onclick="integral()" href="javascript:void(0);" class="btn btn-primary sub">开始</a>

                <a data-dismiss="modal" href="javascript:void(0);" class="btn btn-primary ">关闭</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>


<script>
    $("input[name='signType']").on("change",function () {
       if($(this).val()==1){
           $(".hd").show();
       }else{
           $(".hd").hide();
       }
    });
    function sign() {
        signType=$("input[name='signType']:checked").val();
        if(signType==0){
            name="";
            hdType=0;
            peopleType=0;
        }else{
            name=$("#signModal input[name='name']").val();
            hdType=$("select[name='hdType']").val();
            hdTime=$("#signModal input[name='time']").val();
        }
        $("#saoma").html("关闭扫码");
        $(".saoma").show();
        if(signType==1){
            $(".sign").show();
        }
        $("#signModal").modal('hide');
        $("#saoma_input").focus();
    }
    function hdname(obj) {
        if($(obj).val().trim()!=""){
            $.ajax({
                url : "/record/sign/getHdNameLike",
                type : "post",
                dataType : 'json',
                data:{
                    name:$(obj).val()
                },
                success : function(data) {
                    if (data.success==true) {
                        $("#table").empty();
                        if(data.data.length>0){
                            for(var i=0;i<data.data.length;i++){
                                var $tr=$("<tr onclick=selectName('"+data.data[i]+"')><td>"+data.data[i]+"</td></tr>");
                                $("#table").append($tr);
                            }
                            $("#div-table").show();
                        }else{
                            $("#div-table").hide();
                        }

                    } else {
                        $("#div-table").hide();
                    }
                }
            });
        }else{
            $("#div-table").hide();
        }
    }

    function selectName(name) {
        $("#div-table").hide();
        $("#signModal input[name='name']").val(name);
    }

    function integral() {
        integralType=$("input[name='integralType']:checked").val();
        if(integralType==0){
            minus=0;
        }
        $("#saoma").html("关闭扫码");
        $(".saoma").show();
        if(integralType==1){
            $(".integral").show();
        }
        $("#integralModal").modal('hide');
        $("#saoma_input").focus();
    }
</script>