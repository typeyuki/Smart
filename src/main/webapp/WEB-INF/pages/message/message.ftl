<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#include "../common/head.ftl" />
    <link href="/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="/static/css/common_table.css" rel="stylesheet">
    <style>
        .odd{
            background-color: #f9f9f9!important;
        }
        .even{
            background-color: #fff!important;
        }
    </style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>消息中心<small></small></h5>
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
                        <a onclick="del('/message/del');"  href="javascript:void(0);" class="btn btn-primary ">删除</a>
                        <a  href="javascript:void(0);" id="search" class="btn btn-primary ">搜索</a>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <label>模糊匹配：</label>
                            <input class="search form-control inp" type="text">
                        </div>
                        <div class="col-sm-2">
                            <label>类型：</label>
                            <select name="type" class="form-control inp" >
                                <option></option>
                                <option value="1">系统消息</option>
                                <option value="21">服务平台反馈</option>
                                <option value="22">服务平台举报</option>
                                <option value="23">商城</option>
                            </select>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover dataTables-example text-nowrap">
                            <thead>
                            <tr>
                                <th><input type='checkbox' class="checktd" onclick="thCheck(this)"/></th>
                                <#--<th>序号</th>-->
                                <th>类型</th>
                                <th>消息</th>
                                <th>时间</th>
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



<script src="/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/common.js"></script>
<script src="/static/js/message/message.js" ></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>
</html>