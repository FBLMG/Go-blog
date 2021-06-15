<div class="side-body">
    <!--
    <div class="page-title">
        <span class="title">Form UI Kits</span>
        <div class="description">A ui elements use in form, input, select, etc.</div>
    </div>
    -->
    <div class="row">
        <div class="col-xs-12">
            <div class="card">
                <div class="card-header">
                    <div class="card-title">
                        <div class="title">友情链接</div>
                    </div>
                </div>
                <div class="card-body">
                    <form class="form-horizontal">
                        <!-- 链接标题 -->
                        <div class="form-group">
                            <label for="title" class="col-sm-2 control-label">标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="title" name="title"
                                       placeholder="标题">
                            </div>
                        </div>
                        <!-- 链接状态 -->
                        <div class="form-group">
                            <label for="status" class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-10">
                                <select id="status" name="status">
                                {{range $k,$v:=.StatusList}}
                                    <option value="{{$k}}">{{$v}}</option>
                                {{end}}
                                </select>
                            </div>
                        </div>
                        <!-- 链接URL -->
                        <div class="form-group">
                            <label for="url" class="col-sm-2 control-label">链接</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="url" name="url"
                                       placeholder="链接">
                            </div>
                        </div>
                        <!-- 描述 -->
                        <div class="form-group">
                            <label for="describe" class="col-sm-2 control-label">描述</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="3" id="describe" name="describe"></textarea>
                            </div>
                        </div>
                        <!-- 序号 -->
                        <div class="form-group">
                            <label for="sort" class="col-sm-2 control-label">序号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="sort" name="sort"
                                       placeholder="序号" value="0">
                            </div>
                        </div>
                        <!-- 发表链接-->
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="button" class="btn btn-success" onclick="add()">添加</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!--  弹窗样式 -->
<link rel="stylesheet" href="static/thirdParty/layer/skin/layer.css"/>
<!--  弹窗样式 -->
<!-- 提交答案 -->
<script type="application/javascript">
    //添加友情链接
    function add() {
        var title = $('#title').val();
        var status = $('#status').val();
        var url = $('#url').val();
        var describe = $('#describe').val();
        var sort = $('#sort').val();
        var ajaxActionUrl = '/adminFriendshipInsert';
        if (title === '') {
            layer.msg('标题不允许为空！');
            return false;
        }
        if (url === '') {
            layer.msg('链接不允许为空！');
            return false;
        }
        /* ajax提交 */
        $.ajax({
            //提交数据的类型 POST GET
            type: "POST",
            //提交的网址
            url: ajaxActionUrl,
            //提交的数据
            data: {title: title, status: status, url: url, describe: describe, sort: sort},
            //返回数据的格式
            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //成功返回之后调用的函数
            success: function (data) {
                ////根据ajax返回参数判断添加情况
                if (data.status === 1) {
                    layer.msg(data.message);
                    window.location.reload();
                } else if (data.status === -1) {
                    layer.msg(data.message);
                } else {
                    layer.msg('未知错误!');
                }
                ////根据ajax返回参数判断添加情况
            }
        });
        /* ajax提交 */
    }
</script>