<div class="modal fade" id="oldStatusModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
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
                                        <div class="form-group">
                                            <div class="col-sm-2">
                                                <button class="btn btn-primary" onclick="back('/oldman/organ/organ',4)">机构养老</button>
                                            </div>
                                            <div class="col-sm-2">
                                                <button class="btn btn-primary" onclick="back('/oldman/organ/community',5)">社区养老</button>
                                            </div>
                                            <div class="col-sm-2">
                                                <button class="btn btn-primary" onclick="back('/oldman/organ/home',6)">居家养老</button>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">

                <a onclick="sub()" href="javascript:void(0);" class="btn btn-primary firSub">确定</a>

                <a data-dismiss="modal" href="javascript:void(0);" class="btn btn-primary ">关闭</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
