// // 휴대폰 번호 입력 부분
// function restrictNonNumericInput(inputElement) {
//   inputElement.addEventListener("input", function (event) {
//     const inputValue = event.target.value;
//     event.target.value = inputValue.replace(/\D/g, "");
//   });
// }
// function changePhone1(){
//     const phone1 = document.getElementById("phone1").value // 010
//     if(phone1.length === 3){
//         document.getElementById("phone2").focus();
//     }
// }
// function changePhone2(){
//     const phone2 = document.getElementById("phone2").value // 010
//     if(phone2.length === 4){
//         document.getElementById("phone3").focus();
//     }
// }
// function changePhone3(){
//     const phone3 = document.getElementById("phone3").value // 010
//     if(phone3.length === 4){
//       document.getElementById("sendMessage").focus();
//       document.getElementById("sendMessage").setAttribute("style", "background-color: #43a048cb; color: #fff;")
//       document.getElementById("sendMessage").disabled = false;
//     }
// }
// restrictNonNumericInput(document.getElementById("phone2"));
// restrictNonNumericInput(document.getElementById("phone3"));

// // 문자인증+타이머 부분
// function initButton(){
//   // document.getElementById("sendMessage").disabled = true;
//   document.getElementById("completion").disabled = true;
//   document.getElementById("certificationNumber").innerHTML = "000000";
//   document.getElementById("timeLimit").innerHTML = "03:00";
//     document.getElementById("sendMessage").setAttribute("style","background-color:none;")
//   document.getElementById("completion").setAttribute("style","background-color:none;")
// }

// let processID = -1;

// const getToken = () => {

//   // 인증확인 버튼 활성화
//   document.getElementById("completion").setAttribute("style", "background-color: #43a048cb; color: #fff;")
//   document.getElementById("completion").disabled = false;

//   if (processID != -1) clearInterval(processID);
//   const token = String(Math.floor(Math.random() * 1000000)).padStart(6, "0");
//   document.getElementById("certificationNumber").innerText = token;
//   let time = 180;
//   processID = setInterval(function () {
//     if (time < 0 || document.getElementById("sendMessage").disabled) {
//       clearInterval(processID);
//       initButton();
//       return;
//     }
//     let mm = String(Math.floor(time / 60)).padStart(2, "0");
//     let ss = String(time % 60).padStart(2, "0");
//     let result = mm + ":" + ss;
//     document.getElementById("timeLimit").innerText = result;
//     time--;
//   }, 50);
// };




// 가입부분 체크


  function generateRandomCode(length) {
    const characters = "0123456789";
    let code = "";
    for (let i = 0; i < length; i++) {
      const randomIndex = Math.floor(Math.random() * characters.length);
      code += characters[randomIndex];
    }
    return code;
  }

  function sendVerificationEmail() {
    const trustInput = document.getElementById("trust");
    const sendMessageButton = document.getElementById("sendMessage");
    const signUpButton = document.getElementById("signUpButton");
    
    // 난수 생성
    const verificationCode = generateRandomCode(6);
    trustInput.value = verificationCode;

    // 버튼 상태 변경
    sendMessageButton.innerHTML = "인증번호 확인";
    sendMessageButton.disabled = false;
    signUpButton.disabled = true;

      sendMessageButton.style.backgroundColor = "#43a048cb";
      sendMessageButton.style.color = "#fff";
    

    sendMessageButton.onclick = function () {
      verifyCode(verificationCode);
    };
  }
  
  function verifyCode(verificationCode) {
    const trustInput = document.getElementById("trust");
    const sendMessageButton = document.getElementById("sendMessage");
    const signUpButton = document.getElementById("signUpButton");
  
    const enteredCode = trustInput.value;
  
    if (enteredCode === verificationCode) {
      alert("인증이 완료되었습니다.");
      signUpButton.disabled = false;
      sendMessageButton.disabled = true;
      document.getElementById("signUpButton").setAttribute("style", "background-color: #43a048cb; color: #fff;")

      sendMessageButton.innerHTML = "인증번호 확인";
      trustInput.value = "";
    } else {
      document.getElementById("trustError").innerHTML = "인증번호가 일치하지 않습니다.";
    }
  }

  // 이메일 입력 변경 감지
  // document.getElementById("email").addEventListener("input", function () {
  //   const emailInput = document.getElementById("email");
  //   const sendMessageButton = document.getElementById("sendMessage");
  //   const email = emailInput.value;
  //   const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

  //   // 이메일 유효성 검사 로직 (필요시) - 예시로는 간단한 형식 검사를 수행합니다.
  //   //이메일확인
  // if(email.includes("@") && email.includes(".")){
  //   let emailId = email.split('@')[0]
  //   let emailServer = email.split('@')[1]
  //   if (emailId === "" || emailServer === ""){
  //     document.getElementById("emailError").innerHTML="이메일은 필수 입니다."
  //     sendMessageButton.disabled = false;
  //   }
  //   else{
  //     document.getElementById("emailError").innerHTML=""
  //     sendMessageButton.disabled = true;
  //   }
  // }
  // if (!emailRegex.test(email)) {
  //   document.getElementById("emailError").innerHTML="이메일이 올바르지 않습니다."
  //   sendMessageButton.disabled = false;
  // }
  // });

  document.getElementById("email").addEventListener("input", function () {
  const emailInput = document.getElementById("email");
  const sendMessageButton = document.getElementById("sendMessage");
  const email = emailInput.value;
  const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

  // 이메일 유효성 검사 로직
  if (email === "") {
    document.getElementById("emailError").innerHTML = "이메일은 필수입니다.";
    sendMessageButton.disabled = true;
  } else if (!emailRegex.test(email)) {
    document.getElementById("emailError").innerHTML = "이메일이 올바르지 않습니다.";
    sendMessageButton.disabled = true;
  } else {
    // 서버에 이메일 중복 검사 요청 
    const isEmailAvailable = true; //중복이 아닐시

    if (isEmailAvailable) {
      document.getElementById("emailError").innerHTML = "";
      sendMessageButton.disabled = false;
      sendMessageButton.style.backgroundColor = "#43a048cb";
      sendMessageButton.style.color = "#fff";
    } else {
      document.getElementById("emailError").innerHTML = "이미 사용 중인 이메일입니다.";
      sendMessageButton.disabled = true;
    }
  }
});
function signUpCheck(){

      let id = document.getElementById("id").value
  let name = document.getElementById("name").value
  let password = document.getElementById("password").value
  let passwordCheck = document.getElementById("passwordCheck").value
  // let email = document.getElementById("email").value
  // let area = document.getElementById("area").value
  let gender_man = document.getElementById("gender_man").checked
  let gender_woman = document.getElementById("gender_woman").checked
  let check = true;

  // 아이디확인
  const minLength = 4;
  const maxLength = 16;
  const validChars = /^[a-z0-9_-]+$/;

  if (id == null || id == "") {
    document.getElementById("idError").innerHTML = "아이디는 필수입니다.";
    check = false
  }      // 문자 제한 검사
  else if (!validChars.test(id)) {
    document.getElementById("idError").innerHTML = "영문과 숫자만 입력 가능합니다.";
    check = false
  }     // 길이 검사
  else if (id.length < minLength || id.length > maxLength) {
    document.getElementById("idError").innerHTML = "아이디는 숫자포함 영문 4~16자 입니다.";
    check = false
  }
  // else if (id.search(/\s/) != -1) {
  //   document.getElementById("idError").innerHTML = "아이디는 빈 칸을 포함할 수 없습니다.";
  //   check = false;
  // }  // 아이디 특수문자 포함 안됨
  // else if (specialCheck.test(id)) {
  //   document.getElementById("idError").innerHTML = "아이디는 특수문자를 포함할 수 없습니다.";
  //   check = false;
  // }
  else {
    document.getElementById("idError").innerHTML = "";
  }

  // 유효한 문자열 검사
  // 추가적인 유효성 검사 규칙을 적용할 수 있습니다.
  // 예: 숫자로 시작하지 않도록, 특정 단어 포함 여부 등

 




  /*-------------------------------------------------------------------- */



      var nickLength = 0;
      var initialRegex = /^[ㄱ-ㅎㅏ-ㅣ]+$/;
      var koreanRegex = /^[ㄱ-ㅎㅏ-ㅣ가-힣]*$/
      var numCheck = /[0-9]/;
      var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

      //한글, 영문 길이 2,1로 바꾸기
      for (let i = 0; i < name.length; i++) {
        const char = name.charAt(i);
        // 유니코드 범위를 사용하여 한글 여부를 체크합니다
        if (/[\uAC00-\uD7AF\u1100-\u11FF\u3130-\u318F\uA960-\uA97F\uAC00-\uD7A3]/.test(char)) {
          nickLength += 2; // 한글은 2로 치환
        } else {
          nickLength += 1; // 영문 및 기타 문자는 1로 치환
        }
      }
      //이름 지을때 영어랑 한글 섞지 못하게
      function isMixed(name) {
        let hasEnglish = false;
        let hasKorean = false;
      
        for (let i = 0; i < name.length; i++) {
          const char = name.charAt(i);
          if (/[a-zA-Z]/.test(char)) {
            hasEnglish = true;
          } else if (koreanRegex.test(char)) {
            hasKorean = true;
          }
        }
        return hasEnglish && hasKorean;
      }
      //이름 지을때 글자와 초성 못 섞게
      function isMixed2(name) {
        let hasLetter = false;
        let hasInitial = false;
      
        for (let i = 0; i < name.length; i++) {
          const char = name.charAt(i);
          if (/[ㄱ-ㅎㅏ-ㅣ]/.test(char)) {
            hasInitial = true;
          } else if (/[가-힣]/.test(char)) {
            hasLetter = true;
          }
        }
        return (hasLetter && hasInitial);
      }

      //비속어 필터링
      var filteredWords = ["시발","병신","fuck","꺼져","찐따","씨발","뼝신","병씬","뼝씬","씌발","쓰발","씨이발","벼엉신",
    "븅신","새끼","섀끼","새끠","새꺄","섀꺄","새뀌"]; // 비속어 목록
      var lowerCaseName = name.toLowerCase(); // 입력된 이름을 소문자로 변환하여 비교

      let i = 0;
      while (i < filteredWords.length) {
        if (lowerCaseName.includes(filteredWords[i])) {
          document.getElementById("nameError").innerHTML = "비속어는 사용할 수 없습니다.";
          check = false;
          return; // 가입을 막고 함수 종료
        }
        i++;
      }

       // 이름 필수 입력
      if (name == null || name == "") {
        document.getElementById("nameError").innerHTML = "이름은 필수입니다.";
        check = false;
      }
      // 이름 빈칸 포함 안됨
      else if (name.search(/\s/) != -1) {
        document.getElementById("nameError").innerHTML = "이름은 빈 칸을 포함할 수 없습니다.";
        check = false;
      }
      // 이름 한글 2~10자, 영문 및 숫자 2~20자
      else if (nickLength < 3 || nickLength > 20) {
        document.getElementById("nameError").innerHTML = "이름은 한글 2~10자, 영문 3~20자입니다.";
        check = false;
      }
      // 이름 특수문자 포함 안됨
      else if (specialCheck.test(name)) {
        document.getElementById("nameError").innerHTML = "이름은 특수문자를 포함할 수 없습니다.";
        check = false;
      }
      // 숫자 포함 안됨
      else if (numCheck.test(name)) {
        document.getElementById("nameError").innerHTML = "이름에 숫자를 포함할 수 없습니다.";
        check = false;
      }
      // 초성만 쓰면 안됨
      else if (initialRegex.test(name)) {
        document.getElementById("nameError").innerHTML = "이름은 초성으로만 입력할 수 없습니다.";
        check = false;
      }
      else if (isMixed(name)) {
        document.getElementById("nameError").innerHTML = "이름은 영어 또는 한글로만 입력해야 합니다.";
        check = false;
      }
      // 한글 + 초성 같이 안됨 
      else if (isMixed2(name)) {
        document.getElementById("nameError").innerHTML = "이름은 영어 또는 한글로만 입력해야 합니다.";
        check = false;
      }     
      else {
        document.getElementById("nameError").innerHTML = "";
      }


  // 비밀번호 확인
  if(password !== passwordCheck){
    document.getElementById("passwordError").innerHTML=""
    document.getElementById("passwordCheckError").innerHTML="비밀번호가 일치하지 않습니다."
    check = false
  }else{
    document.getElementById("passwordError").innerHTML=""
    document.getElementById("passwordCheckError").innerHTML=""
  }
       

  //비밀번호
  if(password===""){
    document.getElementById("passwordError").innerHTML="비밀번호를 입력해주세요."
    check = false
    }
    else if (password.length < 8 && password.length > 20) {
    document.getElementById("passwordError").innerHTML="비밀번호는 최소 8자 이상 20자 이하입니다."
    check = false
    }
    // 대소문자 조합: 영문 대문자와 영문 소문자가 모두 포함되어야 함
    else if (!/[A-Z]/.test(password) && !/[a-z]/.test(password)) {
    document.getElementById("passwordError").innerHTML="비밀번호에 영문이 포함되어야 합니다."
    check = false
    }
    // 특수문자 포함: 특수문자가 최소한 1개 이상 포함되어야 함
    else if (!/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
    document.getElementById("passwordError").innerHTML="비밀번호에 특수문자가 최소 1개 이상 포함되어야 합니다."
    check = false
    }
  else{
    document.getElementById("passwordError").innerHTML=""
  }
x

  if(passwordCheck===""){
    document.getElementById("passwordCheckError").innerHTML="비밀번호를 다시 입력해주세요."
    check = false
  }else{
    //document.getElementById("passwordCheckError").innerHTML=""
  }

  
  // 성별체크확인
  if(!gender_man && !gender_woman){
    document.getElementById("genderError").innerHTML="성별을 선택해주세요."
    check = false
  }else{
    document.getElementById("genderError").innerHTML=""
  }
  
  if(check){
    document.getElementById("idError").innerHTML=""
    document.getElementById("nameError").innerHTML=""
    document.getElementById("passwordError").innerHTML=""
    document.getElementById("passwordCheckError").innerHTML=""
    // document.getElementById("areaError").innerHTML=""
    document.getElementById("genderError").innerHTML=""
    
    //비동기 처리이벤트
    setTimeout(function() {
      alert("가입이 완료되었습니다.");
      window.location = 'login.html';
  },0);
  }

}

