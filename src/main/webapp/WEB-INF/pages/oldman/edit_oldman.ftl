<style>
    .fa-plus-square{
        margin: 3px;
        color: #1ab394;
    }
    .fa-minus-square{
        margin: 3px;
        color: red;
    }
    .healthAdd{
        width: 90%;
    }
</style>

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
                                    <form method="post" id="oldmanEdit" class="form-horizontal" action="/oldman/update">
                                        <input type="hidden" name="id">
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="star-content">*</span>姓名<span  class="control-label star">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control bx" name="name"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="star-content">*</span>小区</label>
                                            <div class="col-sm-8">
                                                <select name="xqId"  class="search_select bx" data-live-search="true">
                                                    <option></option>
                                                    <#list info.xq as list>
                                                        <option type="checkbox" value="${list.id!}" >${list.value!}</option>
                                                    </#list>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">楼号</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="louNum"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="star-content">*</span>性别</label>
                                            <div class="col-sm-1">
                                                <label>
                                                    <input type="radio" value="2"  name="sex"  > <i></i> 男</label>
                                            </div>
                                            <div class="col-sm-1">
                                                <label>
                                                    <input type="radio" value="1"  name="sex"  > <i></i> 女</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="star-content">*</span>出生日期</label>
                                            <div class="col-sm-8">
                                                <input type="date" class="form-control bx" name="birthdayTime"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">政治面貌</label>
                                            <div class="col-sm-8">
                                                <select class="search_select" name="politicalStatus">
                                                    <option></option>
                                                    <#list info.politicalStatuses as politicalStatuses>
                                                        <option value="${politicalStatuses.id!}">${politicalStatuses.value!}</option>
                                                    </#list>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">户籍</label>
                                            <div class="col-sm-8">
                                                <select class="search_select" name="census">
                                                    <option></option>
                                                    <#list info.census as census>
                                                        <option type="checkbox" value="${census.id!}" >${census.value!}</option>
                                                    </#list>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">职称</label>
                                            <div class="col-sm-8">
                                                <select class="search_select" name="zc">
                                                    <option></option>
                                                <#list info.zc as list>
                                                    <option type="checkbox" value="${list.id!}" >${list.value!}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">社区职务</label>
                                            <div class="col-sm-8">
                                                <select  class="selectpicker bla bla bli" multiple data-live-search="true" name="sqzw">
                                                    <option></option>
                                                    <#list info.sqzw as list>
                                                        <option type="checkbox" value="${list.id!}" >${list.value!}</option>
                                                    </#list>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">电话</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="phone"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"><span  class="star-content">*</span>身份证号码</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control bx" name="pid"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">地址</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="address"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">家庭结构</label>
                                            <div class="col-sm-8">
                                                <select name="family"  class="search_select" data-live-search="true">
                                                    <option></option>
                                                <#list info.family as list>
                                                    <option type="checkbox" value="${list.id!}" >${list.value!}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">家庭类别</label>
                                            <div class="col-sm-8">
                                                <select  class="selectpicker bla bla bli" multiple data-live-search="true" name="familyType">
                                                    <option></option>
                                                <#list info.familyType as list>
                                                    <option type="checkbox" value="${list.id!}" >${list.value!}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">经济条件</label>
                                            <div class="col-sm-8">
                                                <select name="economic"  class="search_select" data-live-search="true">
                                                    <option></option>
                                                <#list info.economic as list>
                                                    <option type="checkbox" value="${list.id!}" >${list.value!}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">血型</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control inp" name="bloodType">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">失智</label>
                                            <div class="col-sm-8">
                                                <select name="intelligence"  class="search_select" data-live-search="true">
                                                    <option></option>
                                                <#list info.intelligence as list>
                                                    <option type="checkbox" value="${list.id!}" >${list.value!}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">视力</label>
                                            <div class="col-sm-8">
                                                <select name="eyesight"  class="search_select" data-live-search="true">
                                                    <option></option>
                                                <#list info.eyesight as list>
                                                    <option type="checkbox" value="${list.id!}" >${list.value!}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">慢病
                                            </label>
                                        <#list info.mb as list>
                                            <div class="col-sm-1">
                                                <div class="radio i-checks">
                                                    <label>
                                                        <input type="checkbox" value="${list.id}" name="healthSelect" > <i></i> ${list.secTypeName}</label>
                                                </div>
                                            </div>
                                        </#list>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">失能
                                            </label>
                                        <#list info.sn as list>
                                            <div class="col-sm-1">
                                                <div class="radio i-checks">
                                                    <label>
                                                        <input type="checkbox" value="${list.id}" name="healthSelect" > <i></i> ${list.secTypeName}</label>
                                                </div>
                                            </div>
                                        </#list>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">药物反应
                                            </label>
                                        <#list info.ywfy as list>
                                            <div class="col-sm-1">
                                                <div class="radio i-checks">
                                                    <label>
                                                        <input type="checkbox" value="${list.id}" name="healthSelect" > <i></i> ${list.secTypeName}</label>
                                                </div>
                                            </div>
                                        </#list>
                                        </div>
                                        <div class="form-group" >
                                            <label class="col-sm-1 control-label">恶性肿瘤史
                                            </label>
                                            <div class="col-sm-8">
                                                <div class="row" id="exzl">
                                                </div>
                                                <div class="row">
                                                    <i class="fa fa-plus-square fa-2x" onclick="addHealth('exzl')"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="col-sm-1 control-label">骨折史
                                            </label>
                                            <div class="col-sm-8">
                                                <div class="row" id="gz">
                                                </div>
                                                <div class="row">
                                                    <i class="fa fa-plus-square fa-2x" onclick="addHealth('gz')"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">残疾情况
                                            </label>
                                            <div class="col-sm-8">
                                                <div class="row" id="cj">
                                                </div>
                                                <div class="row">
                                                    <i class="fa fa-plus-square fa-2x" onclick="addHealth('cj')"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">应急联系人</label>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">姓名</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="linkman.name">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">关系</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="linkman.relation">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">电话</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="linkman.phone">
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
                <a onclick="formSub()" href="javascript:void(0);" class="btn btn-primary ">保存</a>
                <a data-dismiss="modal" href="javascript:void(0);" class="btn btn-primary ">关闭</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<script>
    function edit_health(id) {
        $(".searchable-select").remove();
        $("#editModal input[type='checkbox']").prop("checked",false);
        $("#exzl").find("input").remove();
        $("#gz").find("input").remove();
        $("#cj").find("input").remove();
        var url="/oldman/health/"+id+"/getById";
        $.ajax({
            url: url,
            type: "get",
            async:false,
            success: function (result) {
                var data=result.data;
                for(key in data){
                    if(key=="healthSelect"){
                        if(data[key]!=null && data[key].length>0){
                            for(var i=0;i<data[key].length;i++){
                                $("#editModal input[name='"+key+"'][type='checkbox'][value='"+data[key][i].id+"']").prop("checked",true);
                            }
                        }
                    }else if(key=="healthAdd"){
                        if(data[key]!=null && data[key].length>0){
                            for(var i=0;i<data[key].length;i++){
                                var $input
                                if(data[key][i].type==4){
                                    $input=$("<input name='healthAdd_exzl'  class='form-control inp healthAdd' value='"+data[key][i].desc+"'/><i class='fa fa-minus-square fa-2x' onclick=delHealth(this)></i>");
                                    $("#exzl").append($input);
                                }else if(data[key][i].type==5){
                                    $input=$("<input name='healthAdd_gz'  class='form-control inp healthAdd'  value='"+data[key][i].desc+"'/><i class='fa fa-minus-square fa-2x' onclick=delHealth(this)></i>");
                                    $("#gz").append($input);
                                }else{
                                    $input=$("<input name='healthAdd_cj'  class='form-control inp healthAdd'  value='"+data[key][i].desc+"'/><i class='fa fa-minus-square fa-2x' onclick=delHealth(this)></i>");
                                    $("#cj").append($input);
                                }
                                $("#editModal input[name='"+key+"'][type='checkbox'][value='"+data[key][i].id+"']").prop("checked",true);
                            }
                        }
                    }else{
                        if(data[key]!=null){
//                            $("#editModal input[name='"+key+"'][type='hidden']").val(data[key]);
                            $("#editModal input[name='"+key+"'][type='text']").val(data[key]);
                            $("#editModal select[name='"+key+"'] option[value='"+data[key]+"']").prop("selected",true);
                        }else{
                            $("#editModal select[name='"+key+"'] option:first-child").prop("selected",true);
                        }
                    }
                }

                $('.search_select').searchableSelect();
                $("#editModal").modal();
            }
        });

        $.ajax({
            url: "/oldman/linkman/"+id+"/getById",
            type: "get",
            async:false,
            success: function (result) {
                var data=result.data;
                for(key in data){
                        if(data[key]!=null){
                            $("#editModal input[name='linkman."+key+"']").val(data[key]);
                        }
                }
            }
        });

    }

    function formSub() {
        var i=0;
        $("#editModal .bx").each(function () {
            if($(this).val()==null || $(this).val().trim()==''){
                i=1;
                return ;
            }
        });
        if(i==0){
            $("input[name='healthSelect']").each(function () {
                $(this).attr("name","healthSelectIds");
            });
            $("#oldmanEdit").submit();
        }else{
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
//        $("#healthEdit").submit();
    }

    function addHealth(type) {
        var $input=$("<input name='healthAdd_"+type+"' class='form-control inp healthAdd'/><i class='fa fa-minus-square fa-2x' onclick=delHealth(this)></i>");
        $("#"+type).append($input);
    }
    function delHealth(obj) {
        $(obj).prev().remove();
        $(obj).remove();
    }
</script>
