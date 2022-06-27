//사용변수
const GAME_TIME = 9; //숫자가 반복되면 하드코딩이기 때문에 함수값(변하지 않는 값)으로  선언
let score = 0;
let time = GAME_TIME;
let isPlaying = false; //전역변수 기본값 선언
let timeInterval;
let checkInterval;
let words = [];

const wordInput = document.querySelector('.word-input');
const wordDisplay = document.querySelector('.word-display');
const scoreDisplay = document.querySelector('.score');
const timeDisplay = document.querySelector('.time');
const button = document.querySelector('.button');


init();

function init(){
    getWords();
    wordInput.addEventListener('input',checkMatch); //input이 발생할때마다 checkMatch함수 이벤트 실행
}


//게임 실행
function run(){
    if(isPlaying){
        return;
    }
    isPlaying = true; //전역변수로 isPlaying값이 false이기 때문에  함수 run을 했을 때 isPlaying을 true로 만들도록 삽입
    time = GAME_TIME;
    wordInput.focus(); // 바로 입력 가능
    scoreDisplay.innerText = 0;
    timeInterval =setInterval(countDown, 1000); //countdown 함수를 1초마다 계속 실행시켜주는 인터벌 삽입
    checkInterval = setInterval(checkStatus, 50)
    buttonChange('게임중')
}


//게임 상태 확인
function checkStatus(){
    if(isPlaying && time === 0){
        buttonChange("게임시작")
        clearInterval(checkInterval)
    }
}


//단어 불러오기
function getWords(){
    words = ['Hello', 'Banana', 'Apple', 'Cherry'];
    buttonChange('게임시작');
}


//단어일치 체크
    function checkMatch (){
    if(wordInput.value.toLowerCase() === wordDisplay.innerText.toLowerCase()){
        wordInput.value = ""; //초기화
        if(!isPlaying){
            return;
        }
        score++; // wordInput의 값과 wordDisplay의 값이 같으면 점수 , .toLowerCase(): 소문자로 변환
        scoreDisplay.innerText = score; //점수 출력
        time = GAME_TIME;
        const randomIndex = Math.floor(Math.random() * words.length); // Math.random() * range: range 범위의 숫자 중 하나 랜덤하게 반환, Math.floor(): 해당숫자 반올림
        wordDisplay.innerText = words[randomIndex]; 
    }
}

//게임 시간 
function countDown(){
    time > 0 ? time -- : isPlaying = false; //삼항연산자 (조건) ? 참일경우 :거짓일경우
    if(!isPlaying){
        clearInterval(timeInterval)
    } //isPlaying이 false이면 타임인터벌 종료
    timeDisplay.innerText = time;
}


//버튼 클릭할때 인터벌 실행
function buttonChange(text){
    button.innerText = text;
    text === '게임시작' ? button.classList.remove('loading') : button.classList.add('loading')
} 


