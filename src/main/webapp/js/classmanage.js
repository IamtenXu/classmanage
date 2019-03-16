layui.use(['form'], function(){
    var form = layui.form
        ,$ = layui.jquery;

    //添加下拉框选项
    $.ajax({
        url: '/instructor/instructorselect',
        dataType: 'json',
        type: 'get',
        success: function (data) {
            $.each(data.classinfo, function (index, item) {
                $('#classid').append(new Option(item.classid, item.classid));// 下拉菜单里添加元素
            });
            layui.form.render("select");//重新渲染 固定写法
        }
    });
    form.on('select(classidFilter)', function(data){
        if(data.value!=="") {
            $.ajax({
                url: '/instructor/instructormanagequery',
                dataType: 'json',
                type: 'POST',
                // async:false,
                data: {"classid": data.value},
                success: function (data) {
                    $("#monitor").empty();
                    $('#monitor').append(new Option('',''));
                    $("#secretary").empty();
                    $('#secretary').append(new Option('',''));
                    $("#mmonitor").empty();
                    $('#mmonitor').append(new Option('',''));
                    $("#learning").empty();
                    $('#learning').append(new Option('',''));
                    $("#sports").empty();
                    $('#sports').append(new Option('',''));
                    $("#art").empty();
                    $('#art').append(new Option('',''));
                    $("#organizing").empty();
                    $('#organizing').append(new Option('',''));
                    $("#publicity").empty();
                    $('#publicity').append(new Option('',''));
                    $("#life").empty();
                    $('#life').append(new Option('',''));
                    $("#psychological").empty();
                    $('#psychological').append(new Option('',''));
                    $.each(data.stulist, function (index, item) {
                        $('#monitor').append(new Option(item.sname, item.stuid));// 下拉菜单里添加元素
                    });
                    $.each(data.stulist, function (index, item) {
                        $('#secretary').append(new Option(item.sname, item.stuid));// 下拉菜单里添加元素
                    });
                    $.each(data.stulist, function (index, item) {
                        $('#mmonitor').append(new Option(item.sname, item.stuid));// 下拉菜单里添加元素
                    });
                    $.each(data.stulist, function (index, item) {
                        $('#learning').append(new Option(item.sname, item.stuid));// 下拉菜单里添加元素
                    });
                    $.each(data.stulist, function (index, item) {
                        $('#sports').append(new Option(item.sname, item.stuid));// 下拉菜单里添加元素
                    });
                    $.each(data.stulist, function (index, item) {
                        $('#art').append(new Option(item.sname, item.stuid));// 下拉菜单里添加元素
                    });
                    $.each(data.stulist, function (index, item) {
                        $('#organizing').append(new Option(item.sname, item.stuid));// 下拉菜单里添加元素
                    });
                    $.each(data.stulist, function (index, item) {
                        $('#publicity').append(new Option(item.sname, item.stuid));// 下拉菜单里添加元素
                    });
                    $.each(data.stulist, function (index, item) {
                        $('#life').append(new Option(item.sname, item.stuid));// 下拉菜单里添加元素
                    });
                    $.each(data.stulist, function (index, item) {
                        $('#psychological').append(new Option(item.sname, item.stuid));// 下拉菜单里添加元素
                    });
                    layui.form.render("select");//重新渲染 固定写法
                    if(data.classmanage.monitor!==null){$("#monitor").val(data.classmanage.monitor.stuid);}
                    if(data.classmanage.secretary!==null){$("#secretary").val(data.classmanage.secretary.stuid);}
                    if(data.classmanage.mmonitor!==null){$("#mmonitor").val(data.classmanage.mmonitor.stuid);}
                    if(data.classmanage.learning!==null){$("#learning").val(data.classmanage.learning.stuid);}
                    if(data.classmanage.sports!==null){$("#sports").val(data.classmanage.sports.stuid);}
                    if(data.classmanage.art!==null){$("#art").val(data.classmanage.art.stuid);}
                    if(data.classmanage.organizing!==null){$("#organizing").val(data.classmanage.organizing.stuid);}
                    if(data.classmanage.publicity!==null){$("#publicity").val(data.classmanage.publicity.stuid);}
                    if(data.classmanage.life!==null){$("#life").val(data.classmanage.life.stuid);}
                    if(data.classmanage.psychological!==null){$("#psychological").val(data.classmanage.psychological.stuid);}
                    layui.form.render("select");//重新渲染 固定写法
                }
            });
        }
    });
});