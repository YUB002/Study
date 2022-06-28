function setClock(){
    var dateInfo = new Date(); //현재시간
    var hour = modifyNumber(dateInfo.getHours()); //modifyNumber() 9이하의 숫자 앞에 0을 붙여줌
    var min = modifyNumber(dateInfo.getMinutes());
    var sec = modifyNumber(dateInfo.getSeconds());
    var year = dateInfo.getFullYear();
    var month = modifyNumber(dateInfo.getMonth()+1); //getMonth의 반환값이 0~11이기때문에 +1해야 함
    var date = modifyNumber(dateInfo.getDate());
    document.getElementById("time").innerHTML = hour + ":" + min  + ":" + sec;
    document.getElementById("date").innerHTML = year + ". " + month + ". " + date + ".";
}

function modifyNumber(time){
    if(parseInt(time)<10){
        return "0"+ time;
    }
    else{
        return time;
    }
} 

window.onload = function(){
    setClock();
    setInterval(setClock,1000); //1초마다 setClock 함수 실행
}//widow.onload: 모든 요소가 준비된 이후에 실행되도록
