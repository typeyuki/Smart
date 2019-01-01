<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/css/style.min.css?v=4.0.0" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>账户<small>密码修改</small></h5>
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
                    <form method="post" action="/user/password/edit"  class="form-horizontal" >
                        <input type="hidden" name="id" value="${user.id!0}">
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">账号</label>
                            <div class="col-sm-5">
                                <p class="form-control"> ${user.username}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新密码</label>
                            <div class="col-sm-5">
                                <input type="password" name="password" class="form-control p1" value="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-5">
                                <input type="password"  class="form-control p2" value="" />
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <input type="button" class="btn btn-primary" value="保存" onclick="sub()" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.5"></script>
<script src="/static/js/bootstrap-dialog.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>
<script>
    function sub() {
        var p1=$(".p1").val().trim();
        var p2=$(".p2").val().trim();
        if((p1=="" && p2=="") || p1!=p2){
            BootstrapDialog.show({
                title: '',
                message: '两次密码不一致或都为空',
                buttons: [{
                    label: '确定',            cssClass:'btn btn-primary',
                    action: function(dialog) {
                        dialog.close();
                    }
                }]
            });
        }else if(p1.length<6){
            BootstrapDialog.show({
                title: '',
                message: '密码长度至少6位',
                buttons: [{
                    label: '确定',            cssClass:'btn btn-primary',
                    action: function(dialog) {
                        dialog.close();
                    }
                }]
            });
        } else{
            $(".p1").val(p1);
            $("form").submit();
        }
    }
</script>
</html>