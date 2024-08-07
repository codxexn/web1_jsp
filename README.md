# web1_JSP✍️
**웹개발 (2023.06.12.~2023.11.07.) 강의에서 공부한 JSP 내용**입니다.

readme 파일에 목차 및 내용 정리해두었으니 참고 부탁드립니다.

감사합니다.🥰


<br><br>

## 📝 Day01
> ### JSP: Java Server Page(html): 웹언어

<br>

> #### 요청은 클라이언트, 요청 처리는 서버
> dbms도 server가 돌아간다.(Listenr)  
> 요청은 우리가 쿼리를 날리고, 응답은 Listener가 데이터로 해준다.  
> 따라서 요청과 응답이 일어나기 위해서는 환경이 조성돼 있어야 한다.(tomcat)  

<br>

> #### 웹 서버: 정적 데이터(웹 서버가 응답 가능한 데이터) 처리
- 요청(request)를 제일 처음 맞이하는 건 웹 서버
- html, css, js(이벤트나 DOM정도 연산 가능)
(회사 소개 등 미리 준비해놓는 페이지는 웹서버에서 바로 처리해서 페이지에서 보여줄 수 있다.)

<br>

> #### 동적 데이터 처리(jsp) - 웹 컨테이너가 받아서 처리
- 복잡한 연산이 필요한 것
  - (마이페이지를 누르면 바로 회원정보를 조회해서 select로 가지고 와야 함)
- DB 통해서만 알아낼 수 있다. (CRUD)
- 동적 데이터를 처리할 수 있다는 것은 연산이 가능한 언어가 그 안에 존재한다는 것
  - 연산이 가능한 언어들(예>자바)
> 동적인 데이터를 파라미터로 받음(VO)⬇️  
> 파라미터를 DB 쿼리문에 저장(Mapper)⬇️  
> 쿼리 실행(DAO)⬇️  
> 결과⬇️  
> 웹 서버 전달⬇️  
> **응답**

<br>

📌 자바와 DB를 연동(jdbc-preparedStatement)해서 set, get 사용해서 Query 작성했던 것 ➡️ ?에 들어갈 값들이 사용자가 화면에 입력한 것!  
📌 자바쪽 메소드로 받은 것을 실행하면 쿼리가 발생하고 결과가 있으면 return을 발생(select)하면서 화면쪽으로 다시 보내줌 ➡️ 화면쪽에서 연산이 필요하면 JS로

<br>

> #### 웹 컨테이너(Web Container)
> Java 프로그램이 실행될 수 있는 환경, 실행되고 있는 곳  
> 자바가 돌아가고 있다는 것은 웹 컨테이너가 메모리에 올라갔다는 것  
> 그 전에는 대기하고 있다가 사용자가 동적 데이터를 요청하면 그 요청에 맞는 자바 프로그램이 돌아가게 된다.  
> 사용자 요청에 맞는 자바 프로그램 ➡️ 서블릿(Servlet)  
> 웹 컨테이너 = 서블릿 컨테이너  

<br>

📌 결국 사용자가 요청하면 웹서버가 받고 정적 데이터가 아닌 동적 데이터라면 웹 컨테이너가 대기하고 있다가 그 요청에 맞는 서블릿으로 보낸다.

<br>

> #### 서블릿(servlet)
> 자바파일인데 httpservlet 이라는 클래스를 상속받는 순간 서블릿이라고 불린다.
- 사용자 요청에 맞게끔 응답을 해주어야 하기 때문에 처음부터 메소드를 만드는 것이 아니라 이미 httpservlet이라는 부모클래스에 만들어져 있는 메소드를 재정의해서 쓴다.
-   (httpservlet를 상속받는 순간 서블릿의 역할을 수행할 수 있게 된다.)
- 재정의 할 수 있는 메소드: do get, do post

<br>

> #### GET 방식과 POST 방식
- GET
  - 주소에 데이터를 추가하여 전달하는 방식.
  - 보통 쿼리 문자열(query string)에 포함되어 전송되므로, 길이에 제한이 있으며
  - 주소에 데이터가 보이므로 보안상 취약점이 존재한다.
  - 중요한 데이터 혹은 길이가 긴 데이터는 POST 방식을 사용하여 요청하는 것이 좋지만
  - GET 방식이 POST 방식보다 상대적으로 빠른 전송방식이다.
- POST
  - 데이터를 별도로 첨부(Header에 첨부)하여 전달하는 방식.
  - 브라우저 히스토리에도 남지 않고 데이터는 쿼리 문자열과는 별도로 전송된다.
  - 따라서 데이터의 길이에 제한도 없으며, GET 방식 보다 보안성이 높다.
  - 하지만 GET 방식 보다 상대적으로 느리다.

<br>

> #### < form > 태그의 method="get 혹은 post"
> 서블릿에 있는 메소드 중 어떤 것을 사용할지 적어주는 곳
- < form > submit을 하면 날아가는데, (html로 갈 수도 있지만) method에 get 혹은 post를 적는 순간 그 데이터를 들고 java(servlet)로 날아가게 된다.(동적 데이터라 복잡한 연산이 필요하기 때문(DB에 CRUD를 해야하니까))
- < form method="get" >: doGet() 실행 ➡️ 단순 페이지 이동
- < form method="post" >: doPost() 실행 ➡️ 완료버튼

<br>

여기서 메소드 안에 매개변수로 사용자가 입력한 정보를 받아야 메소드를 실행할 수 있는데 그 **매개변수 객체 이름이 request**(사용자가 입력한 정보, 요청을 어떻게 했는지에 대한 정보가 들어있는 객체)이다.

<br>

doGet, doPost 메소드를 재정의하면 request가 매개변수로 설정되기 때문에 그걸 받았다는 가정하에 **request.getParameter()** 라는 메소드를 통해서 화면에서 입력한 값을 가지고 올 수 있게 된다.

<br>

그래서 request.getParameter() 로 받은 값으로 jdbc 쿼리에 넣어서 DB로 쿼리를 날린다.

<br>

❕select 쿼리가 나갔으면 결과값이 있고 그 결과가 화면에서 필요한 상황(예, 마이페이지나 목록, 상세보기 등)이다. ➡️ 응답 객체까지 doGet, doPost 메소드에 매개변수로 설정이 되기 때문에 리턴된 결과값은 응답객체인 response에 담아서 보내준다.

<br>

웹컨테이너에서는 httpservlet request라는 객체와 httpservlet response 라는 객체가 매개변수로 위치해있다. 근데 서버로 다시 보낼 때는 servlet이라는 단어가 붙으면 안된다. 서블릿의 역할은 다 끝났기 때문이다. 따라서 **웹서버로 갈 때는 http request, http response 라는 객체로 옮겨담아진다.** 
#### ➡️ 웹서버에서 바로 응답할 수 있게 정제된 결과값이 된다는 것

<br>

> get방식은 url에 ? 뒤에 key=value 가 보인다.  
> url에 담겨서 가기 때문에 길이에 제한이 있다.  
> 길이가 긴 것은 post로 한다.  

```java
?name=이도은&age=20
```

> post는 request header 라는 저장공간에 키, 밸류로 저장돼서 전달되기 때문에 url에 보이지 않는다.  

📌 **개발자모드, 네트워크, 전체, 페이로드에 들어가면 key, value 값이 다 보이기 때문에 비번과 같이 보안이 필요한 값은 submit함과 동시에 암호화를 해서 보내준다.**

<br>

```java
로그인
사용자가 form에 아이디, 비번을 입력한다.
input(form)태그의 method=get 혹은 post로 넣어준다.
input(form)태그에 name="" 이라는 속성이 있는데 거기에는 req.getParameter에 작성해줄 key값을 적어줘야 한다.

예)
<input name="memberId">
그리고 사용자가 입력한 값이 그 key(memberId)에 해당하는 value가 된다.

request 객체를 타고 웹서버로 갔다가 동적데이터이기 때문에 해당 요청을 처리할 수 있는 웹컨테이너(서블릿 컨테이너)로 이동해서 해당 서블릿을 찾아간다.

해당 서블릿의 메소드에 적힌 대로 get, post메소드의 매개변수 중 req에 input(form)태그에 담아줬던 값(map구조(key:value))이 들어간다.

req.getParameter()로 사용자가 입력한 값을 받아올 수 있는데
getParameter()의 괄호 안에는 input(form)태그에 name="" 이라는 속성에 적어줬던 key값을 적어주면 된다.

그러면 memberVO에서 getMemberId(); 으로 만들어준 getter 메소드를 이용해서
getMemberId(req.getParameter(memberId));을 적어주면 사용자가 입력한 값(value)이 메소드에 들어가게 된다.

그리고 DB에 selectQuery 날려주기 위해서 Mapper에 작성해둔 쿼리에 넣어줘야 한다.
where=?에 해당 값들을 getter로 가지고 와서 넣어주면 된다.

DB 조회 후에 결과가 resultSet에 담긴다.

로그인을 하고나면 페이지에서 계속해서 회원정보를 가지고 있어야 마이페이지 등의 정보를 볼 수 있기 때문에 아이디, 비번이 일치했다는 true, false로 값을 받는 게 아니라 회원의 고유pk 인 id(번호)를 결과값으로 받아준다.

정보가 일치하면 id, 일치하지 않으면 null

이렇게 로그인에 성공을 하면 서블릿이 메모리에 올라가 있을 필요가 없기 때문에 메모리에서 해제가 된다.
```
```java
 request.getParameter("name");  
```  
> 화면에서 입력한 값을 매개변수로 받아줌  
```java
<input name="name" placeholder="이름을 입력하세요.">  
```  
> name 이라는 변수명에 사용자가 입력한 값을 넣어서 서블릿에 전송해준다. 전송할 때 request 라는 객체에 name:(사용자가 입력한 값) Map구조의 값으로 전달해준다. 따라서 getParameter("name")라는 메소드를 사용하면 key값이 name인 값을 가지고 와서 변수에 담아서 재사용이 가능하다.

<br>

📌 **응답페이지에서 한글 안 깨지게 해주는 코드**
```java
response.setContentType("text/html; charset=utf-8");
```

<br>

보통 로그인을 성공하면 메인이나 다른 페이지로 이동하기 때문에 리턴값이 없다.  
**서블릿에서 어떤 페이지로 이동할지 설정**할 수 있다.  

**response 객체에 다른 html로 이동할 수 있게 해주는 메소드가 있다.**
```java
if(리턴값 == null){
	이동 메소드(다시 로그인.html);
} else {
	이동 메소드(메인 페이지.html);
}
```
이렇게 구분해서 리턴을 다르게 해줄 수 있다.  
이렇게 서블릿으로 응답할 페이지까지 구분지어준 후 웹서버로 넘어간다.  

결국 response를 한다는 것은 html 문서로 응답한다는 것인데,  
자바에서는 html 문서를 만들 수가 없지만 servlet은 html 문서를 제작해서 응답할 수 있다.  

```java
예)
"<h1>로그인 성공</h1>"
```
> 자바 코드에서 html 작성이 되는 것이 Servlet(서블릿)이다.    
> 서블릿은  "" 안에 "", 태그, 인라인 속성 등 해주어야 할 게 너무 많아서   
> 오타 발생률이 높고 불편하며 가독성이 좋지 않다.  
> 그런 부분을 보완해서 나온 것이 JSP이다.  
> **html에서 java 작성이 가능**한 것!
- HTML을 중심으로 자바와 같이 연동하여 사용하는 웹 언어
- HTML코드 안에 JAVA 코드를 작성할 수 있는 언어
- 서블릿을 안쓰는 게 아니라 JSP 파일이 컴파일이 되면 서블릿 파일로 바뀌면서 가는 것
- html 안에서 자바를 작성하면 그 연산을 하기 위해 컴파일이 필요하고 그렇게 컴파일 하는 과정에서 확장자가 .servlet으로 바뀌고 서블릿이 메모리에 올라가면서 요청과 응답을 받을 수 있게끔 바뀐다.

<br>

➡️ html 파일 안에서 자바 코드를 작성하게 되면 작업에 혼란이 생길 수 있다.  
➡️ 하나의 파일에는 하나의 언어만 쓰자.  
➡️ JSP에서는 html만 쓰자.  
➡️ Java 코드는 Servlet(서블릿)에 몰아넣고 실질적으로 연산이 필요한 건 JSP에서!  
➡️ JSP에서 Java 코드를 쓰는 건: 받은 데이터를 반복 돌려서 뿌릴 때  

<br><br>

## 📝 Day02
> ### JSP: Java Server Page(html): 웹언어
- 웹서버에서 요청을 받고 동적데이터 처리가 필요한 건 웹컨테이너(서블릿 컨테이너)로 보냄
	- (서블릿을 메모리에 할당해달라고 WAS(Tomcat)에게 요청)
- WAS에서 서블릿을 메모리에 할당한다. web.xml 참조한 후 알맞은 서블릿에 대한 Thread를 생성하고 req, resp 객체 생성후 서블릿에 전달
	- (연산 종료되면 서블릿을 메모리에서 해제시켜준다.)
- 서블릿에서 연산을 함
- 요청에 대한 응답페이지가 있어야 하는 경우 ➡️ 서블릿에서 응답페이지 작성이 가능하지만 불편하다.
- 따라서 요청에 대한 응답페이지를 작성하는 건 JSP
- 받은 데이터를 반복해서 뿌려야 할 땐 JSP에서 자바코드 사용
- 서블릿을 통해서 연산을 한 다음 JSP로 넘겨준다.

<br>

> ### 웹 서버(http) - 아파치
사용자의 요청이 정적 데이터인지 동적 데이터인지 판단한다.  
정적 데이터일 경우 이미 준비된 HTML문서를 그대로 응답해주며,  
동적 데이터라면 (서블릿을 메모리에 할당해달라고 WAS에 요청) 웹 컨테이너에 요청을 보낸다.

<br>

> ### 웹 컨테이너(서블릿 컨테이너)
동적 데이터일 경우 JSP, 서블릿으로 연산 및 제어 그리고 DB까지 접근한다.  
DB에 접근하는 연산을 복잡한 연산이라고 하며, JAVA로 처리한다.  
동적 데이터가 정제된 데이터(정적 데이터)로 완성되면 이를 웹 서버로 전달해준다.  

<br>

> ### WAS(Web Application Server) - Tomcat
동적 데이터를 처리할 서블릿을 메모리에 할당하며,  
web.xml(- 요청에 대한 경로를 설정해주는 것)을 참조한 뒤   
알맞는 서블릿에 대한 Thread를 생성한다.  
- 자바는 멀티쓰레드, JS는 싱글쓰레드
  
서블릿 요청과 서블릿 응답 객체 생성 후 서블릿에 전달하면, 연산 종료 후 메모리에서 해제시킨다.  

[리눅스에서 배포할 때는 아파치/톰캣 따로, 로컬에서는 함께 돼 있다.]

<br>

> ### 서블릿(Servlet)
Java 코드 안에 HTML 코드를 작성할 수 있는 Java 프로그램이다.  
Thread에 의해 서블릿에 있는 service() 메소드가 호출된다.  
전송 방식 요청에 맞게 doGet() 또는 doPost()등의 메소드를 호출한다.  

<br>

> ### MVC 패턴(Model, View, Controller)
JSP 파일에 자바코드를 넣는 게 아니라 자바코드를 다 분리해서 설계해놓는 방식

<br>

> ### web.xml: 요청에 대한 경로를 설정 및 관리
> 사용자가 news라고 요청하면 이걸 처리할 수 있는 .java(서블릿) 파일로 가야 한다. 
> 그 경로를 설정하고 관리해주는 곳이 web.xml 이다.

<br>

따라서 요청을 보내면 우선 web.xml 부터 가서 확인 후에  
WAS에서 Thread를 생성하고  
Thread가 해당 부분을 Start해주면 메모리에 올라간 뒤  
자바는 멀티쓰레드이기 때문에 쓰레드객체가 먼저 생성이 돼야 서블릿을 메모리에 올릴 수 있다.  
⬇️  
해당 서블릿으로 이동한다.  
Thread에 의해 서블릿에 있는 service() 메소드가 호출되며 전송방식 요청에 맞게 doGet() , doPost() 등의 메소드를 호출한다.

<br>

📌 일반 클래스로 생성을 했는데 servlet으로 만들어주고 싶으면 직접 extends를 해주어야 한다.  
➡️ Superclass의 경로: javax.servlet.http.HttpServlet

```java
@WebServlet("/home")
public class MyServlet extends HttpServlet {

}
```
- mapping 해줌, 사용자가 /home을 요청하면 이 servlet이 메모리에 올라감
- 근데 하나당 하나로 설정하면 유지보수하는데 힘드니까 관리를 web.xml에서 하겠다는 것

```java
private static final long serialVersionUID = 1L;
```
- serialVersionUID -> 직렬화, 역직렬화를 이해해야 함
  
<br>

> ### 직렬화 작업한 것의 고유값 ➡️ serialVersionUID
데이터 저장처럼 객체를 저장해도 그 저장공간을 주소값을 저장하게 되는데 전원을 껐다켜면 바뀌어 있고 사용자마다 주소값이 다르기 때문에 참조하기가 힘들다.  
따라서, 해당 **객체에 있는 필드를 json, xml 로 변환해서 서버에 저장**해놓는 게 **직렬화**라는 작업  
**직렬화해놓은 객체를 다시 원본 객체에 new해서 그곳의 데이터를 새롭게 담아주는 작업 ➡️ 역직렬화**  
```java
response.getWriter().append("Served at: ").append(request.getContextPath());
```
- response 객체의 getWriter() 메소드를 불러서 append(연결)해주면 <body> 태그 안에 "Served at: "가 작성된다.
- request.getContextPath()의 값이 또 연결돼서 붙는다.
- 화면에 Served at: /servlet ➡️ 서블릿은 응답까지 만들어준다.

<br>

- ContextPath(): 시작 경로
comcat(welcome 파일)  
➡️ ip + 포트번호만 넣어도 내가 원하는 초기화면이 보일 수 있게 웰컴파일의 index.html을 함. root경로  
➡️ 부모경로 (/만 해도 메인이 나오게 설정하는 것)

<br>

- getContextPath(): 웰컴경로 재정의 해준 값
예) www.naver.com/main  
/main ➡️ / 로 바꿔줌   
보여지는 것: www.naver.com/  

<br>

> ### web.xml 경로 관리 상세 예시
> WebContent - WEB-INF - web.xml (경로에 대한 것을 정리, 관리하는 파일)

```java
<servlet>
  	<servlet-name>Home</servlet-name>
  	<servlet-class>com.app.servlet.MyServlet</servlet-class>
</servlet>
```
📌 텍스트대치나 마찬가지!  
- 이름: Home
- 문구: com.app.servlet.MyServlet
- Home 이라고 쓰면 com.app.servlet.MyServlet 이렇게 쓰는 거나 똑같음

<br>

📌 어떤 경로를 요청해야 저 서블릿을 실행할까? ➡️ **< url-pattern >**
```java
<servlet-mapping>
  	<servlet-name>Home</servlet-name>
  	<url-pattern>/home</url-pattern>
</servlet-mapping>
```
- /home을 요청하면 Home(com.app.servlet.MyServlet)을 실행하겠다.

<br>

> #### 확장자: 경로 관리를 위해 보안상 응답한 경로가 아니라 요청한 경로가 보이도록 설정한다.
> 경로 관리를 위해 보안상 응답한 경로가 아니라 요청한 경로가 보이도록 설정한다.  
> .확장자라는 폴더 안에 관리하는 것이나 마찬가지  
> 예) 확장자가 *.post 로 끝나면 게시글 관련됐다는 의미  

관련된 서비스를 한 servlet에 모아둔다.  
📌 **getUrl()**  
사용자가 요청한 URL을 문자열로 가지고 온 다음 split 으로 0번째 방 것을 가지고 오면 .확장자 앞의 값을 가지고 올 수 있다. 그리고 if, switch 문으로 값에 따른 경로를 지정해준다.

<br>

```java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getParameter("name");
		PrintWriter out = response.getWriter(); // response.getWriter(); return 타입은 PrintWriter
		out.print("<h1><mark>Hello Servlet!</mark></h1>"); // 객체에 print() 라는 메소드가 있고 () 안의 값이 <body>에 작성된다.
		out.close(); // flush
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
```
- doPost를 실행하면 doGet이 실행되기 때문에 구분이 없이 doGet이 실행되게끔 돼 있다.
- Post, Get 구분은 Spring 때 진행한다.
➡️ 한 곳에서 코드 구현  
➡️ 다른 한 메소드는 사용  

```java
<form action ="home" method="get">	
		<input name="name" placeholder="이름을 입력하세요.">
		<button>완료</button>
```
- <%//action= 어디로 갈래? get이 default %>
- default 가 submit이라 바로 action으로 감
- action에 /home 이 아니라 home을 작성하는 이유는?
	- contextpath가 날아간다.
	- 앞에 /로 시작하면 앞에 다 날아가고 home으로 시작하게 된다

<br>

- /home에 가서 아래 정보를 가지고 get 메소드 실행해줘.
- /home 은 Home Servlet -> Home 은 com.app.servlet.MyServlet
- 위 경로에서 doGet 메소드 실행
- name = "name" key 값이 name 인 것
- request.getParameter("name"); 요청한 매개변수의 key가 name

```java
<%/* 
		button 을 누르면 바로 submit 된다.
		input 안에 작성된 정보를 가지고 
		web.xml에서 /home으로 경로 설정한 com.app.servlet.MyServlet 으로 가서
		doGet 메소드를 실행해라.
		
		doGet 메소드는 요청, 응답이라는 두개의 매개변수를 받는다.
		매개변수 request에는 request.getParameter("name"); 라는 메소드가 있고
		name 이라는 key를 가진 파라미터를 겟하면 
		
		위에 input 태그에 작성된 값(name이라는 key값에 저장된 value)을 가져다준다.
		그리고 그 밑에 응답하는 코드를 실행해준다.
```
> action ="home" 은 /home으로 요청하겠다는 의미  
> "/home"을 적으면 안된다.  
> ContextPath까지 날아가고 서버 뒤에서 바로 /home으로 시작하기 때문이다. 그냥 home을 적어주어야 ContextPath 뒤에 /해서 home이 붙는다.

<br>

```java
<servlet>
  	<servlet-name>Intro</servlet-name>
  	<jsp-file>/intro.jsp</jsp-file>
</servlet>
  
<servlet-mapping>
  	<servlet-name>Intro</servlet-name>
  	<url-pattern>/intro</url-pattern>
</servlet-mapping>
```
- jsp도 컴파일하면 서블릿이기 때문에 서블릿 매핑 작업이 된다.
- /intro를 요청하면 Intro라는 변수에 담겨있는 /intro.jsp 경로의 jsp 파일을 실행해달라는 의미
- /: WebContent까지의 경로를 의미


<br>

📌 **정리**
- 서블릿에서 사용자가 받은 값으로 해야할 것들을 doGet, doPost 재정의
- web.xml에 경로 정리 및 관리
- jsp에서 사용자에게 요청받을 화면 작성
- 실제로 사용자에게 값을 입력 받으면
	- 서블릿에서 받은 값을
	- doGet, doPost에서 request.getParameter() 로 가지고 와서
	- setter, getter로 알맞는 쿼리로 CRUD를 한 다음
	- 리턴해야할 값이 있는지, 없는지 판단
	- 사용자에게 응답페이지를 서블릿으로 작성을 하던가
	- 알맞는 html파일로 이동을 시켜준다.

<br>

- request Header: 사용자가 입력한 값을 담아주는 저장공간

- response Header: 응답할 페이지에 무언가를 담아서 전달할 때 쓰는 저장공간, 보통은 페이지를 만들어서 그 페이지를 담아서 전달한다.

<br><br>

## 📝 Day03
> jdbc 에서 preparedStatement resultSet "" 안에 쿼리작성하는 건 너무 복잡해지기 때문에 "" 안에 쿼리 작성하지 말고 따로 쿼리만 분리해서 모아두는 파일을 만든다.

<br>

> 자바쪽에서 그 파일에 있는 쿼리를 불러와서 실행한다.  
> 각 쿼리에도 이름을 붙여서 또 담아주면,  
> 자바파일에서는 그 쿼리이름만 써줘도 자동으로 써진다.  
> (메소드에 담아주는 것)  

<br>

📌 **myBatis라는 프레임워크를 사용해서 자바와 쿼리파일을 분리**   
➡️ 그래도 직접 쿼리를 작성해야 하기 때문에 오타 발생률이 높다. 따라서 요즘 강소기업이나 대기업에서 진행하는 프로젝트는 orm 이라는 기술을 사용한다. 직접 쿼리를 치지 않음. 메소드를 쓰면 자동으로 쿼리가 나온다. 메소드를 사용했을 때 어떻게 조인을 걸고 어떻게 참조할 수 있을지 공부해야 함

<br>

> ### My batis

<br>

> #### Framework: 프레임워크: 작업하기 위한 틀
> 내가 직접 만들지 않고 누군가가 이미 만들어놓은 것을 사용하는 것  
> 연동하면 이미 만들어놓은 것들을 가지고 와서 쓸 수 있다.  

<br>

> API도 같은 개념인데  
> 라이브러리가 모여서 API가 되고  
> API가 모여서 프레임워크가 된다.  
> 프레임워크가 가장 큰 규모이다.  

<br>

> #### DBCP: Database Connection Pool: 커넥션만 있는 풀
> 서버가 실행되자마자 안에 있는 커넥션을 일괄적으로 메모리의 임시영역에 올려둠: 비활성화 상태  
> getConnection 하면 활성화: 메모리에 올라감  
> close 하면 비활성화: 메모리에서 해제가 되는 게 아님  
> 📌 **일괄처리를 하기 때문에 효율을 높인다.**

<br>

> #### JNDI: Java Naming and Directory Interface
> 쿼리를 따로 분리해놓는 파일에서 쿼리를 불러와서 실행할 때 **쿼리 이름을 사용**하는 것이 DataSource라는 객체이다.  
> DataSource 도 자바에서 설정하는 게 아니라, **xml에서 태그로 설정**한다.  
> DataSource 연결 정보가 있다.  
> 어떤 DBMS를 쓸 건지 url 쓴다.  
> **외부파일에 있는 객체를 찾아서 가지고 오는 기술이 JNDI**이다.

<br>

> #### sqlSession: sql을 전송해주고 관리해주는 것  
> 이 객체로 메소드 사용하여 CRUD 한다.  
> sqlSession, sqlSessionFactoryBuilder: 서버가 돌아가는 동시에 두 개가 메모리에 올라간다.  

<br>

📌 **sqlSession 객체에 있는 메소드**
```
select(selectOne, sele ctList)
insert
update
delete
```

<br>

> sqlSession을 만들기 위해서 연결 객체가 필요하다.
> 연결에 대한 정보를 외부파일에 설정해두고 JNDI로 자바쪽으로 가지고 온다.

<br>

> #### Config: 연결 정보 관리 파일 
> SessionFactoryBuilder가 sqlSessionFactory를 짓기 위해서는 설정파일이 필요하다.  
> Config 파일에 연결 정보를 다 써둔다.  
> SessionFactoryBuilder가 Config를 참조해서 sqlSessionFactory를 짓는다.  

여기까지가 요청하기 전 단계  

<br>

> 요청하면 sqlSession이 만들어진다.  
> 외부파일에 작성해둔 쿼리의 경로를 알려줘야 메소드 안에 그 쿼리를 작성해서 날려준다.  
> 중복없는 값으로 쿼리의 이름을 만들어서 알려줘야 한다.  

<br>

> #### Mapper: 쿼리가 모여있는 파일
> 아이디 설정해서 쿼리들을 작성해준다.  
> sqlSession에서 Mapper를 가서 쿼리를 가지고 온 다음, sql을 실행한다.

<br>

📌 Mapper 또한 구분점이 필요하다. **mapper namespace="" 안에 적어준다.**

<br>

📌 **DB에서 테이블을 만들고 난 후, 해야 할 것**
```
1. VO
필드설정
2. Mapper.xml
mapper namespace=""
insert
select
update
delete

3. DAO
method 안에 파라미터 설정해주고
sqlSession.쿼리명(쿼리아이디,파라미터);

끝
```

<br><br>

## 📝 Day04

#### 1. mapper를 만들면 config 쪽에 알려줘야 경로를 안다.
#### 2. Alias도 거기서 만든다.
#### 3. src 에 매퍼, 컨피그 패키지 만들어서 파일 만듬
#### 4. Mapper -> DAO -> Servlet 에서 doGet, doPost에 재정의
#### 5. web.xml에 들어가서 서블릿 등록해주기 

<br>

**모델링을 해서 모두 약속한 방식을 사용하면 따로 교육해야 할 필요가 없기 때문에 약속한 방식이 있다.**  
**DB 조회가 필요없는 정적데이터의 경우, 그냥 바로 처리하면 된다.**

<br>

a.jsp -> c.jsp  
**갈 때 연산이 필요한 경우 b.jsp에서 서블릿을 통해 연산을 해준다.   
회원번호나 객체로 정보 전달해서 b.jsp에서 쿼리 작동 후에 결과값을 c.jsp로 전달해서 화면에 뿌려준다.**

#### 1. jsp방식  
➡️ b.jsp가 복잡해지기 때문에 자바파일을 분리한다.

#### 2. dao에 있는 것을 객체화해서 쓰는 것: M1방식
선언없이 사용만 하는 것

#### 3. M2 방식

<br>

### *.확장자
> 경로하나당 변수를 다 만들면 하나의 프로그램에 요청 서블릿이 너무 많아질 때 유지보수가 힘들기 때문에 확장자를 사용한다.
> *와일드 카드를 써서 어떤 것이든 .확장자에 해당하는 걸로 이동한다.  
> .확장자라는 폴더로 카테고리화 시키는 것.  
> .확장자 폴더 안에서는 확장자 앞에 값을 가지고 와서 어떤 서비스인지 구분한다.

<br>

### getUrl()
사용자가 요청한 URL을 문자열로 가지고 온 다음 split 으로 0번째 방 것을 가지고 오면 .확장자 앞의 값을 가지고 올 수 있다.   
그리고 if, switch 문으로 값에 따른 경로를 지정해준다.  

<br>

📌 **정리**
> 1. web.xml에서 대카테고리를 한번 걸러준다.  
> 2. 경로에 확장자를 통해서 *.확장자로 걸러서  
> 3. FC 프론트 컨트롤러(서블릿)로 보내준다.  
> 4. url을 req 객체로 가지고 올 수 있다.  
> 5. getUri은 문자열 값으로 들어와서 앞에것을 split으로 분리해서 if, switch로 넣어줌  
> 6. 그렇게 해서 나눠진 것을 Controller 안에 있는 메소드를 실행시켜준다.  
> 7. 컨트롤러에서도 req 객체로 사용자가 입력한 값을 전달받아야 메소드의 매개변수로 넣고 실행할 수 있기 때문에 fc에서 컨트롤러로 전달해준다.   
> 8. 컨트롤러에서 다오 호출해서 메소드 사용  
> 9. 컨트롤러에서 fc로 리턴할 때는 어디로 어떻게 보낼지를 알려주어야 한다.   
> 10. 따라서 리턴타입은 객체여야만 한다.  

➡️ 예) 회원가입
```java

회원가입
join.member (web.xml에서 걸러줌)
member FC로 이동
FC에서는 getUri 로 join 을 가지고 옴
join 컨트롤러로 이동
메소드에 req, resp 파라미터로 받음
req 에서는 사용자가 입력한 값을 get파라미터로 받을 수 있다.
받아오면 memberVO 객체에 담는다.
멤버 DAO의 insert method에 파라미터 전달
mapper에 insert 쿼리 나가면서 DB에 정보 들어감
[ux로 회원가입 완료되면 로그인 페이지로 바로 이동할 수 있도록 함, 
사용자들이 바로 볼 수 있는 거 감안하는게 UI]
- 어디로 어떻게 보낼지 컨트롤러에서 정함
어디로: login page
```

### 어떻게? ➡️ 포워드(forward), 리다이렉트(redirect)
#### 포워드(forward): 최종화면은 무조건 포워드
.jsp가 안보이기 때문이다.  
응답한 페이지인 a.jsp 가 아니라 사용자가 요청한 /join으로 보여주는 것  
req 객체가 그대로 유지된 채 넘어간다.  
이전에 요청했던 경로는 req객체가 가지고 있다.  
req객체가 유지가 되기 때문에 요청한 경로를 기억할 수 있고 그대로 나올 수 있다.  
req객체가 유지가 되기 때문에 c.jsp에 결과값을 담아서 보내려면  
req에 담아서 간다.  
사용자가 입력한 걸 받을 수도 있지만 마지막 응답할 페이지로 보낼 데이터도 저장할 수 있다.  
req 영역이 있는데 req.setAttribute 라는 메소드를 쓰면   
K:V를 써주고 c.jsp 에는 키 값으로 그 결과값을 쓴다.  

#### 리다이렉트(redirect): 맨 마지막, 응답한 경로가 나온다.
req 객체가 new해서 초기화된 채 넘어간다.  
req객체가 초기화되니까 이전에 요청한 경로를 기억할 수 없고 응답한 경로가 나올 수 밖에 없다.  
결과값을 컨트롤러에 담아봤자 req객체가 초기화되니까 리다이렉트로 보내면 c.jsp 다 null일 수 밖에 없다.  
=> req에만 안 담으면 된다.  
c.jsp 로 보낼 때 queryString으로 보내면 받을 수 있다.  
url?K:V를 쓰는 건 req와 전혀 관련이 없다.  
queryString은 req영역에 저장되는 게 아니라 param 이라는 영역에 저장이 된다.  








