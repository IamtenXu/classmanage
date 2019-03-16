//导入学生信息
function uploadStu() {
    if($("#stu").val()===''){
        alert("请选择文件！");
        return false;
    }
    $.ajax({
        type: "post",
        url: '/excel/uploadStu',
        data: new FormData($('#StuForm')[0]),
        processData: false,
        contentType: false,
        success: function (data) {
            alert(data.msg);
            location.reload();
        },
        error:function (XMLHttpRequest, textStatus, errorThrown) {
            alert("请求失败！");
        }
    });
}
//导入教师信息
function uploadTea() {
    if($("#tea").val()===''){
        alert("请选择文件！");
        return false;
    }
    $.ajax({
        type: "post",
        url: '/excel/uploadTea',
        data: new FormData($('#TeaForm')[0]),
        processData: false,
        contentType: false,
        success: function (data) {
            alert(data.msg);
            location.reload();
        },
        error:function (XMLHttpRequest, textStatus, errorThrown) {
            alert("请求失败！");
        }
    });
}
//导入教师信息
function uploadClass() {
    if($("#class").val()===''){
        alert("请选择文件！");
        return false;
    }
    $.ajax({
        type: "post",
        url: '/excel/uploadClass',
        data: new FormData($('#ClassForm')[0]),
        processData: false,
        contentType: false,
        success: function (data) {
            alert(data.msg);
            location.reload();
        },
        error:function (XMLHttpRequest, textStatus, errorThrown) {
            alert("请求失败！");
        }
    });
}