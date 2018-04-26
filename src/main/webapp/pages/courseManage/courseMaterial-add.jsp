<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>上传教学资料</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../../css/font.css">
    <link rel="stylesheet" href="../../css/xadmin.css">
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../js/xadmin.js"></script>




    <%--S    上传文件相关操作--%>
    <%
        String courseId=request.getParameter("courseId");
    %>
    <% if (courseId != null) { %>
    <script type="text/javascript" charset="utf-8">
        var courseId = "<%= courseId %>";//将传过来的课程编号赋给JS的全局变量
    </script>
    <% }%>
    <%--E    上传文件相关操作--%>


    <%--引入公共的标签--%>
    <%@ include file="/tag.jsp" %>
    <!--qlq引入的课程管理的JS-->
    <script type="text/javascript" src="../../js/trainScheme/courseLibrary.js" charset="utf-8"></script>





</head>

<body>
<div class="x-body">
    <form class="layui-form">
        <!--1-->
        <div class="layui-form-item">
            <label for="" class="layui-form-label">
                教学资料类别
            </label>
            <div class="layui-input-inline">
                <select name="" lay-verify="required">
				  <option value="">请选择资料类别</option>
				  <option value="课程进度表" >课程进度表</option>
				  <option value="课程教学大纲">课程教学大纲</option>
				  <option value="课程实验大纲">课程实验大纲</option>
				</select>     
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>必须选择
            </div>
        </div>
        <div class="layui-form-item">
            <label for="" class="layui-form-label">
                教学资料名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="" name="" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>必须填写
            </div>
        </div>
        <!--1-1-->
        <div class="layui-form-item">
            <label for="" class="layui-form-label">
               教学资料附件
            </label>
            <div class="layui-input-inline">
                <input type="" id="uploadCourseMaterial" name="" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>必须选择
            </div>
        </div>
        <!--2-->
        
        <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button class="layui-btn" lay-filter="add" lay-submit="">
                  确认上传
              </button>
        </div>
        <!---->
    </form>
</div>
<script>
layui.use('upload', function(){
  var upload = layui.upload;

    //选完文件后不自动上传
    upload.render({
        elem: '#uploadCourseMaterial',
        url: '/upload/',auto: false,
        accept: 'file', //普通文件,
        exts: 'doc|docx|pdf', //只允许上传doc,docx和pdf文件
        bindAction: '#test9',//绑定到哪个按钮进行提交
        done: function(res){
            console.log(res)
        }
    });



});








</script>

<script>
    layui.use(['form', 'layer'], function () {
        $ = layui.jquery;
        var form = layui.form
            , layer = layui.layer;

        //自定义验证规则
        form.verify({
            nikename: function (value) {
                if (value.length < 5) {
                    return '昵称至少得5个字符啊';
                }
            }
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
            , repass: function (value) {
                if ($('#L_pass').val() != $('#L_repass').val()) {
                    return '两次密码不一致';
                }
            }
        });

        //监听提交
        form.on('submit(add)', function (data) {
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {icon: 6}, function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
        });


    });
</script>

</body>

</html>