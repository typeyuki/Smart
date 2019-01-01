<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#include "../common/head.ftl" />

    <link href="/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="/static/css/common_table.css" rel="stylesheet">
    <style>
        .noBtn{
            padding: 5px;
        }
    </style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5 id="title">${(type==21)?string("机构养老",(type==22)?string("社区养老",(type==1)?string("政府机构","社会涉老机构")))}</h5>
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
                        <#if status?? && (status=="1" || status=="3")>
                        <#else >
                            <a onclick=newPage("951","机构添加",'/organ/${type}/add') href="javascript:void(0);" class="btn btn-primary ">添加</a>
                            <a onclick="del('/organ/del/ids')"  href="javascript:void(0);" class="btn btn-primary ">删除</a>

                        </#if>
                        <#if status??>
                        <#else >
                            <form action="/organ/${type}/importExcel" method="post" enctype="multipart/form-data" id="importForm" style="display: inline">
                                <input type="button" style="display:inline" class="btn btn-primary" onclick="alert('除机构养老、社区养老的机构外，其他机构的导入excel表需要在最后一列表明机构类型');$('#formFile').trigger('click');" value="导入">
                                <input type="file" name="file" onchange="$('.wrapper').hide();$('#process').show();$('#importForm').submit()" id="formFile" style="display:inline">
                                <input type="hidden" name="pType" value="oldman">
                                <a  href="javascript:void(0);" id="search" class="btn btn-primary ">搜索</a>
                                <#if type!=1>
                                    <input style="width: 25%" class="search form-control inp" type="text" placeholder="模糊搜索">
                                </#if>
                            </form>
                            <script>
                                $("#formFile").hide();
                            </script>
                        </#if>

                    </div>
                        <#if type==1>
                        <div class="row">
                            <div class="col-sm-2">
                                <label>类型：</label>
                                <select class="type form-control inp">
                                    <option></option>
                                    <option value="33">片区</option>
                                    <option value="2">居委</option>
                                    <option value="100">其他</option>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <label>模糊匹配：</label>
                                <input class="search form-control inp" type="text">
                            </div>
                        </div>
                        </#if>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover dataTables-example text-nowrap">
                            <thead>
                            <tr>
                                <#if status?? && (status=="1" || status=="3")>
                                <#else >
                                    <th><input type='checkbox' class="checktd" onclick="thCheck(this)" /></th> <!-- checkbox-->
                                </#if>
                                <th>类型</th>
                                <th>名称</th>
                                <#--<#if type==21 || type==22 || type==3>-->
                                    <#--<th>床（席）位数</th>-->
                                <#--</#if>-->
                                <#--<#if type==21 || type==22 >-->
                                    <#--<th>入住数</th>-->
                                    <#--<th>剩余床数</th>-->
                                <#--</#if>-->
                                <#if status?? && (status=="3" )>
                                <th>被拒绝状态</th>
                                </#if>
                                <th>权限</th>
                                <th>更新时间</th>
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
<script>
    var firType=${type};
    var status="${status!}";
    <#if result??>
    BootstrapDialog.show({
        title: '',
        message: '录入数据：${result.data.total}\n其中成功导入数据：${result.data.numSuccess}\n包括添加：${result.data.successAdd}\n更新：${result.data.successUpdate}\n删除：${result.data.successDel}\n失败：${result.data.numFail}',
        buttons: [{
            label: '确定',            cssClass:'btn btn-primary',
            action: function(dialog) {
                dialog.close();
            }
        }]
    });
    </#if>

</script>
<script src="/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/common.js"></script>
<script src="/static/js/organ/organ.js" ></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>

</html>