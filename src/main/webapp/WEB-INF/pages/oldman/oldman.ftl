<#assign basePath=request.contextPath />
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#include "../common/head.ftl" />

    <link href="/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="/static/css/common_table.css" rel="stylesheet">
    <link href="/static/css/boxy.css" rel="stylesheet">
    <link href="/static/jGrowl/jquery.jgrowl.css" rel="stylesheet">
    <script type='text/javascript' src="${basePath}/dwr/engine.js"></script>
    <script type='text/javascript' src="${basePath}/dwr/util.js"></script>
    <script type='text/javascript' src="${basePath}/dwr/interface/Remote.js"></script>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>老人信息</h5>
                    <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div>
                        <#if organId?? && organId!=0>
                            <button onclick=newPage(15,"小区维护","/autoValue/2") class="btn btn-primary" >小区维护</button>
                        <#else >
                            <button onclick=newPage(15,"管理","/autoValue/1") class="btn btn-primary" >管理</button>
                        </#if>
                        <#if organId?? && organId!=0>
                        <#else >
                        <a onclick="updateOldStatus()" href="javascript:void(0);" class="btn btn-primary ">更新养老状态</a>
                        </#if>
                        <a  onclick="del('/oldman/del')" class="btn btn-primary ">删除</a>
                        <a  onclick="$('#exportModal').modal()" class="btn btn-primary ">导出</a>
                        <#if organId?? && organId!=0>
                        <#else >
                            <#--<form action="/oldman/importExcelCunstom" method="post" enctype="multipart/form-data" id="importForma" style="display: inline">-->
                                <#--<input type="button" style="display:inline" class="btn btn-primary" onclick="$('#formaFile').trigger('click');" value="自定义导入">-->
                                <#--<input type="hidden" name="start">-->
                                <#--<input type="file" name="file" onchange="$('#importModal').modal()" id="formaFile" style="display:none">-->
                            <#--</form>-->
                        </#if>
<#if organId?? && organId!=0>
                        <form action="/oldman/importExcel" method="post" enctype="multipart/form-data" id="importForm" style="display: inline">
                            <input type="button" style="display:inline" class="btn btn-primary" onclick="$('#formFile').trigger('click');" value="导入">
                            <input type="file" name="file" onchange="$('.wrapper').hide();$('#process').show();$('#importForm').submit()" id="formFile" style="display:none">
                        </form>
</#if><a  href="javascript:void(0);" id="search" class="btn btn-primary ">搜索</a>
                    </div>
                    <form action="/oldman/export" id="exportForm" method="post">
                        <div class="row" style="margin-top: 10px;margin-bottom: 10px">
                            <div class="col-sm-2 pq jw">
                                <label >片<span style="color: white">填充</span>区：</label>
                                <select name="district" class="selectpicker bla bla bli" multiple data-live-search="true" onchange="pqSelect()">
<#if (info.district)??>
                                <#list info.district as district>
                                        <option  value="${district.id!}" > ${district.value!}</option>
                                    </#list>
</#if>
                                </select>
                            </div>
                            <div class="col-sm-2 jw">
                                <label >居<span style="color: white">填充</span>委：</label>
                                <select  name="jw" class="selectpicker bla bla bli" multiple data-live-search="true" onchange="jwSelect()">
                             <#if  (info.organ)??>
                                 <#list info.organ as organ>
                                     <option value="${organ.id!}"> ${organ.name!}</option>
                                 </#list>
                             </#if>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <label >小<span style="color: white">填充</span>区：</label>
                                <select  name="xq" class="selectpicker bla bla bli" multiple data-live-search="true">
                                <#if (info.xq)??>
                                    <#list info.xq as xq>
                                        <option value="${xq.id!}"> ${xq.value!}</option>
                                    </#list>
                                </#if>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <label >楼号起止：</label><br>
                                <input class="age form-control inp" name="louNumStart" type="number">&nbsp;-
                                <input class="age form-control inp" name="louNumEnd" type="number">
                            </div>
                            <div class="col-sm-2">
                                <label >模糊匹配：</label><br>
                                <input name="search" class="form-control inp"  type="text" >
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <label >年龄起止：</label><br>
                                <input class="age form-control inp" name="ageStart" type="text" >&nbsp;-
                                <input class="age form-control inp" name="ageEnd" type="text" >
                            </div>
                            <div class="col-sm-2">
                                <label >性<span style="color: white">填充</span>别：</label><br>
                                <select name="sex" class="form-control inp">
                                    <option></option>
                                <#list (info.sex)?keys as key>
                                    <option  value="${key!}"> ${(info.sex)?values[key_index]!}</option>
                                </#list>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <label >户<span style="color: white">填充</span>籍：</label>
                                <select name="censusArray"  class="selectpicker bla bla bli" multiple data-live-search="true">
                                <#list info.census as census>
                                    <option type="checkbox" value="${census.id!}" >${census.value!}</option>
                                </#list>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <label>养老状态：</label>
                                <select name="oldStatusArray" class="selectpicker bla bla bli" multiple data-live-search="true">
                                <#list (info.oldStatus)?keys as key>
                                    <option  value="${key!}"> ${(info.oldStatus)?values[key_index]!}</option>
                                </#list>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <label >重点老人：</label>
                                <select name="isKey" class="form-control inp" >
                                    <option></option>
                                    <option value="1">是</option>
                                    <option value="0">否</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <label >政治面貌：</label>
                                <select name="politicalStatusArray" class="selectpicker bla bla bli" multiple data-live-search="true">
                                <#list info.politicalStatuses as politicalStatuses>
                                    <option value="${politicalStatuses.id!}">${politicalStatuses.value!}</option>
                                </#list>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <label >职<span style="color: white">填充</span>称：</label>
                                <select name="zcArray" class="selectpicker bla bla bli" multiple data-live-search="true">
                                <#list info.zc as list>
                                    <option value="${list.id!}" > ${list.value!}</option>
                                </#list>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <label >社区职务：</label>
                                <select name="sqzwArray" class="selectpicker bla bla bli" multiple data-live-search="true">
                                <#list info.sqzw as list>
                                    <option value="${list.id!}" > ${list.value!}</option>
                                </#list>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <label >志愿者：</label>
                                <select name="isVolunteer" class="form-control inp" >
                                    <option></option>
                                    <option value="1">是</option>
                                    <option value="0">否</option>
                                </select>
                            </div>
                            <div class="col-sm-2" >
                                <label >家庭类别：</label>
                                <select name="familyTypeArray" class="selectpicker bla bla bli" multiple data-live-search="true">
                                <#list info.familyType as list>
                                    <option value="${list.id!}">${list.value!}</option>
                                </#list>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <label>家庭结构：</label>
                                <select name="familyArray"  class="selectpicker bla bla bli" multiple data-live-search="true">
                                <#list info.family as family>
                                    <option value="${family.id!}"> <i></i> ${family.value!}</option>
                                </#list>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <label >经济条件：</label>
                                <select name="economicArray" class="selectpicker bla bla bli" multiple data-live-search="true">
                                <#list info.economic as economic>
                                    <option type="checkbox" value="${economic.id!}" > <i></i> ${economic.value!}</option>
                                </#list>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <label >健康状况：</label>
                                <select name="isHealth" class="selectpicker bla bla bli" multiple data-live-search="true">
                                    <option value="1">有慢病</option>
                                    <option value="2">有失能情况</option>
                                    <option value="3">有药物反应</option>
                                    <option value="4">有恶性肿瘤史</option>
                                    <option value="5">有骨折史</option>
                                    <option value="6">有残疾史</option>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <label >智<span style="color: white">填充</span>力：</label>
                                <select name="intelligence" class="selectpicker bla bla bli" multiple data-live-search="true">
                                <#list info.intelligence as intelligence>
                                    <option value="${intelligence.id!}" > ${intelligence.value!}</option>
                                </#list>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <label>视<span style="color: white">填充</span>力：</label>
                                <select name="eyesight" class="selectpicker bla bla bli" multiple data-live-search="true">
                                <#list info.eyesight as eyesight>
                                    <option value="${eyesight.id!}"> ${eyesight.value!}</option>
                                </#list>
                                </select>
                            </div>
                        </div>

                        <#--<script>-->
                            <#--$.ajax({-->
                                <#--url: "/user/checkUserOrganType",-->
                                <#--type: "get",-->
                                <#--success: function (data) {-->
                                    <#--if (data.success == true) {-->
                                        <#--if(data.data=="居委会"){-->
                                            <#--$("select[name='jw']").empty();-->
                                            <#--$("select[name='district']").empty();-->
                                        <#--}else if(data.data=="片区"){-->
                                            <#--$("select[name='district']").empty();-->
                                        <#--}-->
                                    <#--}-->
                                <#--}-->
                            <#--});-->
                        <#--</script>-->


                    </form>


                    <div class="table-responsive">
                    <table id="table" class="table table-striped table-bordered table-hover dataTables-example text-nowrap">
                        <thead>
                        <tr>
                            <th style="width:15px;"><input type='checkbox' class="checktd" onclick="thCheck(this)" /></th>
                            <th>片区</th>
                            <th>居委</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>年龄</th>
                            <th>身份证号码</th>
                            <th>政治面貌</th>
                            <th>户籍</th>
                            <th>养老状态</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<#include  "../spinner.ftl"/>
<#include  "edit_oldman.ftl"/>
<#include  "base_export.ftl"/>
<#include  "import.ftl"/>

<script>
    <#if result??>
    $.jGrowl('录入数据：${result.data.total}<br>'+
            '其中成功导入数据：${result.data.numSuccess}<br>'+
            '包括添加：${result.data.successAdd}，更新：${result.data.successUpdate}，删除：${result.data.successDel}<br>'+
            '未成功导入的行号：'+
            '<#list (result.data.fail_detail)?keys as key>'+
                '<br>原因：${key}<br>'+
                '<#list (result.data.fail_detail)?values[key_index]! as list>'+
                    '<#if (list_index+1)%6!=0>${list}&nbsp;&nbsp;&nbsp;<#else>${list}<br></#if>'+
                    '</#list>'+
                '</#list>', { sticky: true });
    <#--BootstrapDialog.show({-->
        <#--title: '',-->
        <#--closeByBackdrop: false,-->
        <#--closeByKeyboard: false,-->
        <#--message: '录入数据：${result.data.total}<br>'+-->
        <#--'其中成功导入数据：${result.data.numSuccess}<br>'+-->
        <#--'包括添加：${result.data.successAdd}，更新：${result.data.successUpdate}，删除：${result.data.successDel}<br>'+-->
        <#--'未成功导入的行号：'+-->
        <#--'<#list (result.data.fail_detail)?keys as key>'+-->
            <#--'<br>原因：${key}<br>'+-->
    <#--'<#list (result.data.fail_detail)?values[key_index]! as list>'+-->
                        <#--'<#if (list_index)%10==0></#if>${list}&nbsp;&nbsp;&nbsp;<#if (list_index)%10==0><bt></#if>'+-->
                        <#--'</#list>'+-->
                    <#--'</#list>',-->
        <#--buttons: [{-->
            <#--label: '确定',            cssClass:'btn btn-primary',-->
            <#--action: function(dialog) {-->
                <#--dialog.close();-->
            <#--}-->
        <#--}]-->
    <#--});-->

    </#if>
    <#if error??>
    BootstrapDialog.show({
        title: '',
        message: '${error}',
        buttons: [{
            label: '确定',            cssClass:'btn btn-primary',
            action: function(dialog) {
                dialog.close();
            }
        }]
    });

    </#if>
    var organId=${(organId?c)!0};

</script>


<script src="/js/content.min.js?v=1.0.0"></script>

<script src="/static/js/common.js" ></script>
<script src="/static/js/oldman/oldman.js" ></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>

</html>