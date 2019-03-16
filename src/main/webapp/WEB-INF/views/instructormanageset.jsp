<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xh601
  Date: 2019/2/1
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>班级信息</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div>
    <div>
        <!-- 内容主体区域 -->
        <div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">
                <legend>班委设置</legend>
            </fieldset>

            <form class="layui-form" action="" lay-filter="example">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">班级号</label>
                        <div class="layui-input-inline">
                            <select name="classid"  lay-verify="required" id="classid" lay-filter="classidFilter">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">班长</label>
                        <div class="layui-input-inline">
                            <select name="monitor"  lay-verify="required" id="monitor" lay-filter="monitorFilter">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">团支书</label>
                        <div class="layui-input-inline">
                            <select name="secretary"  lay-verify="required" id="secretary" lay-filter="secretaryFilter">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">副班长</label>
                        <div class="layui-input-inline">
                            <select name="mmonitor"  lay-verify="required" id="mmonitor" lay-filter="mmonitorFilter">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">学习委员</label>
                        <div class="layui-input-inline">
                            <select name="learning"  lay-verify="required" id="learning" lay-filter="learningFilter">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">体育委员</label>
                        <div class="layui-input-inline">
                            <select name="sports"  lay-verify="required" id="sports" lay-filter="sportsFilter">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">文艺委员</label>
                        <div class="layui-input-inline">
                            <select name="art"  lay-verify="required" id="art" lay-filter="artFilter">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">组织委员</label>
                        <div class="layui-input-inline">
                            <select name="organizing"  lay-verify="required" id="organizing" lay-filter="organizingFilter">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">宣传委员</label>
                        <div class="layui-input-inline">
                            <select name="publicity"  lay-verify="required" id="publicity" lay-filter="publicityFilter">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">生活委员</label>
                        <div class="layui-input-inline">
                            <select name="life"  lay-verify="required" id="life" lay-filter="lifeFilter">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">心理委员</label>
                        <div class="layui-input-inline">
                            <select name="psychological"  lay-verify="required" id="psychological" lay-filter="psychologicalFilter">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/classmanage.js"></script>
</html>
