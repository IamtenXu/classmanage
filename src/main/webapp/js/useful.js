//判断arr中是否有相同的元素
function isRepeat(arr){
    var nary=arr.sort();
    for(var i=0;i<arr.length;i++){
        if (nary[i]===nary[i+1]){
            return true;
        }
    }
    return false;
}