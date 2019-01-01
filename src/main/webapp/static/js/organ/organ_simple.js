$(function () {
        $(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});

});

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