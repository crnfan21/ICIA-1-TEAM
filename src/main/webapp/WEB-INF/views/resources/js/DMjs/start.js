const main = document.querySelector('#main');
const qna = document.querySelector('#qna');
const result = document.querySelector('#result');

const endPoint = 12;
const select = [0, 0, 0, 0, 0, 0, 0, 0];
const select2 = ['I', 'E', 'S', 'N', 'T', 'F', 'J', 'P'];
const code = [0, 0, 0, 0];

function calResult() {
  console.log(select);
  
  for(var i = 0; i < select.length; i++)
  {
  	if(i % 2 == 0)
  	{
		if(select[i] > select[i + 1])
	    {
	  		code[i / 2] = select2[i];
	    }
	    else
	    {
	    	code[i / 2] = select2[i + 1];
	    }
    }
    
  }
  
  var result = "";
  
  for(var i = 0; i < code.length; i++)
  {
  	result += code[i];
  }
  
  return result;
}

function setResult() {
  let point = calResult();
  const resultName = document.querySelector('.resultName');
  const resultSpe = document.querySelector('.resultSpe');
  let resultCode, resultContent, resultSpecies;
  
  for(var i = 0; i < infoList.length; i++)
  {
  	if(point == infoList[i].name)
  	{
  		resultCode = infoList[i].name;
  		resultContent = infoList[i].desc;
  		resultSpecies = infoList[i].species;
  	}
  }
  
  resultName.innerHTML = resultCode;
  resultSpe.innerHTML = resultSpecies;

  var resultImg = document.createElement('img');
  const imgDiv = document.querySelector('#resultImg');
  var imgURL = '/resources/images/DMimg/' + point + '.jpg';
  resultImg.src = imgURL;
  resultImg.alt = point;
  resultImg.classList.add('img-fluid');
  imgDiv.appendChild(resultImg);

  const resultDesc = document.querySelector('.resultDesc');
  resultDesc.innerHTML = resultContent;
  
  const searchValue = document.querySelector('#searchValue');
  searchValue.value = resultSpecies;
}

function goResult() {
  qna.style.WebkitAnimation = 'fadeOut 1s';
  qna.style.animation = 'fadeOut 1s';
  setTimeout(() => {
    result.style.WebkitAnimation = 'fadeIn 1s';
    result.style.animation = 'fadeIn 1s';
    setTimeout(() => {
      qna.style.display = 'none';
      result.style.display = 'block';
    }, 450);
  });
  setResult();
}

function addAnswer(answerText, qIdx, idx) {
  var a = document.querySelector('.answerBox');
  var answer = document.createElement('button');
  answer.classList.add('answerList');
  answer.classList.add('my-3');
  answer.classList.add('py-3');
  answer.classList.add('mx-auto');
  answer.classList.add('fadeIn');

  a.appendChild(answer);
  answer.innerHTML = answerText;

  answer.addEventListener(
    'click',
    function () {
      var children = document.querySelectorAll('.answerList');
      for (let i = 0; i < children.length; i++) {
        children[i].disabled = true;
        children[i].style.WebkitAnimation = 'fadeOut 0.5s';
        children[i].style.animation = 'fadeOut 0.5s';
      }
      setTimeout(() => {
        var target = qnaList[qIdx].a[idx].type;
        
        if(qIdx <= 2)
        {
        	if(target == 'I')
        	{
        		select[0] += 1;
        	}
        	else
        	{
        		select[1] += 1;
        	}
        }
        else if(qIdx <= 5)
        {
        	if(target == 'S')
        	{
        		select[2] += 1;
        	}
        	else
        	{
        		select[3] += 1;
        	}
        }
        else if(qIdx <= 8)
        {
        	if(target == 'T')
        	{
        		select[4] += 1;
        	}
        	else
        	{
        		select[5] += 1;
        	}
        }
        else
        {
        	if(target == 'J')
        	{
        		select[6] += 1;
        	}
        	else
        	{
        		select[7] += 1;
        	}
        } 

        for (let i = 0; i < children.length; i++) {
          children[i].style.display = 'none';
        }
        goNext(++qIdx);
      }, 450);
    },
    false
  );
}

function goNext(qIdx) {
  if (qIdx === endPoint) {
    goResult();
    return;
  }

  var q = document.querySelector('.qBox');
  q.innerHTML = qnaList[qIdx].q;
  for (let i in qnaList[qIdx].a) {	//quaList[qIdx].a의 length만큼 반복
    addAnswer(qnaList[qIdx].a[i].answer, qIdx, i);
  }
  var status = document.querySelector('.statusBar');
  status.style.width = (100 / endPoint) * (qIdx + 1) + '%';
}

function begin() {
  main.style.WebkitAnimation = 'fadeOut 1s';
  main.style.animation = 'fadeOut 1s';
  setTimeout(() => {
    qna.style.WebkitAnimation = 'fadeIn 1s';
    qna.style.animation = 'fadeIn 1s';
    setTimeout(() => {
      main.style.display = 'none';		//id가 main인 요소를 숨김
      qna.style.display = 'block';		//id가 qna인 요소를 숨김
    }, 450);
    let qIdx = 0;						//변수 qIdx에 0을 넣고 goNext()함수에 넘김
    goNext(qIdx);		
  }, 450);

  
}
