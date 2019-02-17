layui.use(['element','table','carousel'], function () {
    var element = layui.element;
    var table = layui.table
        , $ = layui.jquery;
    var carousel = layui.carousel;

    carousel.render({
        elem: '#test1'
        ,width: '100%' //设置容器宽度
        ,height: '100%'
        ,arrow: 'hover' //始终显示箭头
        ,anim: 'default' //切换动画方式
    });

    table.render({
        elem: '#table1'
        ,height: 315
        ,url: '' //数据接口
        ,page: true //开启分页
        ,cols: [[ //表头
            {field: 'groupid', title: '群号', width:70, sort: true, fixed: 'left'}
            ,{field: 'groupname', title: '群名', width:150}
            ,{field: 'sex', title: '性别', width:150, sort: true}
            ,{field: 'city', title: '城市', width:80}
            ,{field: 'sign', title: '签名', width: 800}
            ,{field: 'experience', title: '积分', width: 80, sort: true}
            ,{field: 'score', title: '评分', width: 80, sort: true}
            ,{field: 'classify', title: '职业', width: 80}
            ,{field: 'wealth', title: '财富', width: 135, sort: true}
        ]]
    });
});
function refreshHighlight(url) {
    $ = layui.jquery;
    $(".layui-nav[lay-filter='navList'] a").each(function (ind, val) {
        if($(this).attr('href') === url){
            $('.layui-nav dd').removeClass('layui-this');
            $(this).parent('dd').addClass('layui-this');
        }
    })
}