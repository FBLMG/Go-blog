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
                        <div class="title">博客标签</div>
                    </div>
                </div>
                <div class="card-body">
                    <form class="form-horizontal">
                        <!-- 标签ID  -->
                        <input type="hidden" class="form-control" id="id" name="id"
                               placeholder="标签ID" value="{{.articleLabel.Id}}">
                        <!-- 标签标题 -->
                        <div class="form-group">
                            <label for="title" class="col-sm-2 control-label">标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="title" name="title"
                                       placeholder="标题" value="{{.articleLabel.Title}}">
                            </div>
                        </div>
                        <!-- 标签状态 -->
                        <div class="form-group">
                            <label for="status" class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-10">
                                <select id="status" name="status">
                                {{$statusSelect:=.articleLabel.Status}}
                                {{range $k,$v:=.StatusList}}
                                    <option value="{{$k}}"
                                    {{if eq $statusSelect $k}}
                                            selected="selected"
                                    {{end}}
                                    >{{$v}}</option>
                                {{end}}
                                </select>
                            </div>
                        </div>
                        <!-- 标签排序 -->
                        <div class="form-group">
                            <label for="sort" class="col-sm-2 control-label">序号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="sort" name="sort"
                                       placeholder="序号" value="{{.articleLabel.Sort}}">
                            </div>
                        </div>
                        <!-- 发表标签 -->
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="button" class="btn btn-success" onclick="edit()">编辑</button>
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
<!-- 编辑标签 -->
<script type="application/javascript">
    //编辑标签
    function edit() {
        var id = $('#id').val();
        var title = $('#title').val();
        var status = $('#status').val();
        var sort = $('#sort').val();
        var ajaxActionUrl = '/adminArticleLabelUpdate';
        if (title === '') {
            layer.msg('标题不允许为空！');
            return false;
        }
        /* ajax提交 */
        $.ajax({
            //提交数据的类型 POST GET
            type: "POST",
            //提交的网址
            url: ajaxActionUrl,
            //提交的数据
            data: {id: id, title: title, status: status, sort: sort},
            //返回数据的格式
            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //成功返回之后调用的函数
            success: function (data) {
                ////根据ajax返回参数判断编辑情况
                if (data.status === 1) {
                    layer.msg(data.message);
                } else if (data.status === -1) {
                    layer.msg(data.message);
                } else {
                    layer.msg('未知错误!');
                }
                ////根据ajax返回参数判断编辑情况
            }
        });
        /* ajax提交 */
    }
</script>