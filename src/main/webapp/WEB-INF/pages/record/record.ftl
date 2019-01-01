<#assign basePath=request.contextPath />
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#include "../common/head.ftl" />
    <link href="/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="/static/css/common_table.css" rel="stylesheet">
    <link href="/static/css/oldman/base.css" rel="stylesheet">
<style>
    .sign,.integral{
        display: none;
    }
</style>

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
                    <h5>${typeDesc}<small></small></h5>
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
                        <a onclick="$('.wrapper').hide();$('#process').show();$('#export').submit();"  class="btn btn-primary ">导出</a>
                        <#if organId?? && organId!=0>
                            <a  href="javascript:void(0);"  class="btn btn-primary " id="saoma" onclick="beginSao(this)">开启扫码</a>
                            <label style="display: none" class="saoma">卡号：</label><input class="inp saoma" id="saoma_input"  style="display: none">
                        <#if type==2>
                            <input type="radio" name="peopleType" class="sign" id="t1" value="1" checked>
                            <label class="control-label sign" for="t1">活动参与</label>
                            <input type="radio" name="peopleType"class="sign"  id="t2" value="2">
                            <label class="control-label sign" for="t2">活动组织</label>
                            <input type="radio" name="peopleType"class="sign"  id="t3" value="3">
                            <label class="control-label sign" for="t3">其他</label>
                        <#elseif type==4>
                            <label class="integral">积分扣减：</label><input style="width: 20%" class="integral form-control inp minus" type="number" value="0" onchange="minus=$(this).val()"> <label class="integral" >分</label>
                        </#if>
                        </#if>
                        <a  href="javascript:void(0);" id="search" class="btn btn-primary ">搜索</a>
                    </div>
                    <div class="row">
                            <form action="/record/export" method="post" id="export">
                                <div class="col-sm-4">
                                    <label >时间范围：</label><br>
                                    <input type="hidden" name="organId" value="${organId!0}">
                                    <input type="hidden" name="type" value="${type}">
                                    <input class="form-control inp aa age" type="date" name="start" >-
                                    <input class="form-control inp aa age" type="date" name="end" >
                                </div>
                                <#if type==2>
                                    <div class="col-sm-2">
                                        <label>扫码类型：</label>
                                        <select name="order" class="selectpicker bla bla bli" >
                                            <option></option>
                                            <option value="1">日常签到</option>
                                            <option value="2">活动签到</option>
                                        </select>
                                    </div>
                                    <#elseif type==4>
                                        <div class="col-sm-2">
                                            <label>扫码类型：</label>
                                            <select name="order" class="selectpicker bla bla bli" >
                                                <option></option>
                                                <option value="1">积分查询</option>
                                                <option value="2">积分兑换</option>
                                            </select>
                                        </div>
                                </#if>
                                <#if organId!=0>
                                <#else >
                                <div class="col-sm-2">
                                    <label >机<span style="color: white">填充</span>构：</label>
                                    <select name="organ" class="selectpicker bla bla bli" multiple data-live-search="true">
                                    <#list organs as list>
                                        <option value="${list.id!}" > ${list.name!}</option>
                                    </#list>
                                    </select>
                                </div>
                                </#if>
                                <div class="col-sm-2">
                                    <label>模糊搜索：</label>
                                    <input name="search" class="form-control inp search" type="text">
                                </div>
                            </form>
                        <div class="col-sm-2">
                            <#if type==1>
                            金额：<span id="sumMoney">${(moneySum.data)!0}</span>元
                            </#if>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover dataTables-example text-nowrap">
                            <thead>
                            <tr>
                                <#--<th>序号</th>-->
                                <th>老人</th>
                                <th>时间</th>
                                <#if type==1>
                                    <th>金额</th>
                                    <#if organId!=0>
                                    <#else >
                                        <th>金额变动</th>
                                    </#if>

                                <th>单号</th>
                                </#if>
                                <#if type==4>
                                    <th>扫码类型</th>
                                    <th>兑换积分</th>
                                </#if>
                                <#if type==2>
                                    <th>签到类型</th>
                                    <th>活动角色</th>
                                    <th>活动类型</th>
                                    <th>活动名称</th>
                                    <th>活动时间</th>
                                </#if>
                                <#if organId!=0>
                                <#else >
                                    <th>机构</th>
                                </#if>
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

<#include "../spinner.ftl" />
<#include "sign_select.ftl" />
<script>
    var type=${type!};
    var organId=${(organId?c)!0};
</script>
<script src="/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/common.js"></script>
<script src="/static/js/record/record.js" ></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>

</html>