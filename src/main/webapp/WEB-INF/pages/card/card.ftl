<#assign basePath=request.contextPath />
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#include "../common/head.ftl" />

    <link href="/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="/static/css/common_table.css" rel="stylesheet">

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
                    <h5>一卡通 <small>信息</small></h5>
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
                        <a onclick="add()" href="javascript:void(0);" class="btn btn-primary ">添加</a>
                        <a onclick="del('/card/del')"  href="javascript:void(0);" class="btn btn-primary ">删除</a>
                        <button onclick="createCode()" class="btn btn-primary" >生成二维码</button>
                        <#--<a onclick="$('#addModal').modal()" href="javascript:void(0);" class="btn btn-primary ">充值</a>-->
                        <a onclick="changeStatus('3')" href="javascript:void(0);" class="btn btn-primary ">设置为不可用</a>
                        <a onclick="changeStatus('1')" href="javascript:void(0);" class="btn btn-primary ">设置为未激活</a>
                        <a onclick="changeStatus('2')" href="javascript:void(0);" class="btn btn-primary ">挂失</a>
                        <a  href="javascript:void(0);" class="btn btn-primary " onclick="beginSao(this)">激活</a>
                        <a  href="javascript:void(0);" class="btn btn-primary " onclick=newPage(156,"一卡通汇总","/card/sum") >汇总</a>
                        <label style="display: none" class="saoma">卡号：</label><input class="inp saoma" id="saoma_input"  style="display: none">
                        <a  href="javascript:void(0);" id="search" class="btn btn-primary ">搜索</a>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <label >状态：</label>
                            <select class="form-control inp"  name="status">
                                <option></option>
                                <option value="1">未激活</option>
                                <option value="4">激活</option>
                                <option value="2">挂失</option>
                                <option value="3">不可用</option>
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <label >是否生成二维码：</label>
                            <select class="form-control inp" name="isCreate">
                                <option></option>
                                <option value="1">是</option>
                                <option value="0">否</option>
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <label>模糊搜索：</label>
                            <input name="search" class="form-control inp" type="text">
                        </div>
                    </div>
                    <form class="f" action="/card/create" method="post">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover dataTables-example  text-nowrap">
                            <thead>
                            <tr>
                                <th><input type='checkbox' class="checktd" onclick="thCheck(this)"/></th>
                                <th>卡号</th>
                                <th>老人</th>
                                <th>密码</th>
                                <th>状态</th>
                                <th>是否已生成二维码</th>
                                <th>更新时间</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/common.js"></script>

<#include "../spinner.ftl"/>
<#include "add_money.ftl"/>
<#include "edit_card.ftl" />
<#include "add_card.ftl" />
<script src="/static/js/common.js"></script>
<script src="/static/js/card/card.js" ></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>

</html>