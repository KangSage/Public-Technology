# Handlebars.js 사용법 - JavaScript 템플릿 엔진

## 공식 사이트 : <https://handlebarsjs.com/>

- 기본 원리 : 미리 구현할 모양의 템플릿을 만들어 놓고  
'원하는 자리'에 값을 넣어 도장 찍듯이 같은 모양의 HTML을 만들어 낸다.  
값이 들어갈 자리는 '겹친 중괄호' {{property name}} 속에 프로퍼티명으로 지정한다.

- 반복되는 리스트 등에 많이 사용한다.  
자체적으로 if문 : {{#if}}, for문 : {{#each}}, 핼퍼 함수 등을 지원하여 HTML을 가공하기 쉽다.

## 기본 사용법

#### 탬플릿 정의
~~~
/*  찍어낼 탬플릿을 <script> 태그를 이용하여 정의한다.
 *  태그를 찾을 id를 넣고 type을 임의로 지정하여 handlebars용 탬플릿임을 알린다.
 */
<script id="entry-template" type="text/x-handlebars-template"> 
  <div class="entry">
    <h1>{{title}}</h1>
    <div class="body">
      {{body}}
    </div>
  </div>
</script>
~~~

#### JavaScript Code 
~~~
// 정의된 템플릿 태그를 찾아 source 변수에 담는다.
var source   = document.getElementById('entry-template').innerHTML; // 순수 JS
var source   = $('#entry-template').html();                         // jQuery 사용

// source 변수에 담긴 템플릿을 컴파일한 함수를 template 변수에 담아서 사용하기 편하게 만든다.
var template = Handlebars.compile(source);

// {{property name}} 자리에 값을 넣어 줄 객체를 만든다. 
var context = {
    title: 'My New Post',
    body: 'This is my first post!'
};

// template 함수에 객체를 넣으면 객체의 프로퍼티에 맞춰서 HTML이 만들어진다.
var html    = template(context);
~~~

#### 출력 결과

~~~
console.log(html);

// 콘솔에 찍힌 HTML
<div class="entry">
  <h1>My New Post</h1>
  <div class="body">
    This is my first post!
  </div>
</div>
~~~

그 외 기본 사용법은 일단 공식 사이트 참조.  
추후 추가 예정.

## 핼퍼 함수 사용법

- 핼퍼 함수 : 이름 그대로 탬플릿 엔진 사용에 도움을 주는 함수.  
미리 정의 해둔 함수의 기능대로 프로퍼티를 가공할 수 있다.

#### 출력할 템플릿 정의
~~~
/*
 * {{#'template 함수에 넣은 변수 안의 배열명'}}
 *  <div class="note {{'정의한 핼퍼 함수명' '함수에 넘겨줄 프로퍼티명1' '프로퍼티명2' '...'}}"></div>
 * {{/'배열명'}}
 */

{{#list}}
    <div class="note {{fn_noteClassName type typeCode}}"></div>
{{/list}}
~~~

#### 핼퍼 함수 정의
~~~
// handlebars에 note 색상을 지정하는 클래스를 리턴하는 함수를 등록
// 해당 핼퍼 함수를 넣은 위치에 리턴 값이 놓인다.

/*
 * 핼퍼 함수 작성법 
 * Handlebars.registerHelper('함수를 호출할 이름', 콜백 함수(프로퍼티명1, 프로퍼티명 2, ...){ ... });
 */

Handlebars.registerHelper('fn_noteClassName', function(type, typeCode) {
	if ((type === '적립' && typeCode === '정상') || 
                (type === '충전' && typeCode === '정상') || 
                    (type === '환전' && typeCode === '정상')) {
		return 'note-primary'; // 파란색
	} else if (typeCode === '취소' || typeCode === '오류') {
		return 'note-danger'; // 붉은색
	} else if (typeCode === '대기') {
		return 'note-yellow'; // 노란색
	} else if (type === '사용' && typeCode === '정상') {
		return 'note-warning'; // 주황색
	}
});
~~~

#### 리스트 데이터를 담아 출력
~~~
var data = { 
    list : [ // {{#list}}에 맞춰 줄 프로퍼티
        {type:'충전',typeCode:'정상'},
        {type:'환전',typeCode:'오류'},
        {type:'사용',typeCode:'정상'}
    ]
}

var html = template(data);
console.log(html);

// 콘솔에 찍힌 HTML
<div class="note note-primary"></div>
<div class="note note-danger"></div>
<div class="note note-warning"></div>
~~~



