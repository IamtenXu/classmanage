<%--
  Created by IntelliJ IDEA.
  User: xh601
  Date: 2019/2/1
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Title</title>

    <script src="js/jquery.min.js"></script>

</head>

<body>



<form id="uploadForm" enctype="multipart/form-data">

    <input id="file" type="file" name="file"/>

    <br><br><br>

    <button id="upload" type="button" onclick="uploadImg()" >测试上传图片到腾讯云</button>

</form>

<script>

    /*

      ajax文件上传教程：

      https://blog.csdn.net/inuyasha1121/article/details/51915742

      */

    function uploadImg() {

        debugger

        $.ajax({

            type: "post",

            url: '/user/upload',

            data: new FormData($('#uploadForm')[0]),

            processData: false,

            contentType: false,

            success: function (data) {

                alert(data.msg)

            },

            error:function (XMLHttpRequest, textStatus, errorThrown) {

                alert("请求失败！");

            }

        });

    }

</script>

</body>

</html>

