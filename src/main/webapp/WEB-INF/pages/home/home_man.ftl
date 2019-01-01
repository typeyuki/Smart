<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#include "../common/head.ftl" />

    <link href="/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="/static/css/common_table.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>居家养老 <small>人员</small></h5>
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
                        <a  href="javascript:void(0);" id="search" class="btn btn-primary ">搜索</a>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <label>模糊匹配：</label>
                            <input class="search form-control inp" type="text">
                        </div>
                        <div class="col-sm-2">
                            <label>时间：</label>
                            <input type="month" class="form-control inp ny"  value="${ny!""}" />
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover dataTables-example text-nowrap">
                            <thead>
                            <tr>
                                <#--<th>老人编号</th>-->
                                <th>老人姓名</th>
                                <#--长护险-->
                                <#if type==2>
                                    <th>是否获得服务</th>
                                <#else >
                                    <th>服务开始时间</th>
                                    <th>服务结束时间</th>
                                </#if>
                                <th>服务机构</th>
                                <th>时间</th>
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
<script>
    var hid="${(hid?c)!}";
    var url="/home/man";
    var type="${type!}";
</script>
<script src="/js/content.min.js?v=1.0.0"></script>
<script src="/static/js/common.js"></script>
<script src="/static/js/home/home_man.js" ></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>

</html>