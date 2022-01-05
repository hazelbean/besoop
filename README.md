# BESOOP
<br/>
<br/>

![besoop](https://user-images.githubusercontent.com/45682282/148246504-5c133ed4-1bd1-4c6b-abc4-2847122b2505.gif)

### 비숲
*Web, 2021.08 - 2021.10*
<br/>
마포구청 노인장애인과와 250여개의 복지시설의 업무를 지원하는 B2B 웹사이트

##

### 개발배경
비숲은 마포구청 노인장애인과와 복지시설이 함께 사용하는 업무시스템입니다.
마포구청은 서울시에서 업무를 받아 250여개의 복지시설로 공지하고 복지시설로부터 회신받아 취합합니다.
하지만 업무시스템이 구축되 있지 않아 업무가 효율적이지 않다는 문제점이 있습니다. 
비숲은 이러한 문제점을 개선하고 업무 환경을 개선하기 위해 만들어졌습니다.

비숲의 업무 처리 프로세스는 크게 업무생성, 업무배포, 업무확인 입니다.
마포구청은 업무를 생성하고 복지시설에 배포합니다.
복지시설에서는 배포된 업무를 확인하고 항목에 대해 값을 입력하여 회신합니다.
마포구청은 회신받은 업무를 확인하여 승인하거나 수정요청할 수 있습니다.
업무결과는 엑셀로 다운로드할 수 있습니다.
또한 FAQ 게시판을 통해 복지시설로 부터 반복적으로 들어오는 질문을 공지할 수 있습니다.
<br/>
<br/>

### 개발목표
1. 마포구청 노인장애인과와 복지시설의 수합 업무를 전산화 하여 업무 효율성을 높임
2. 업무 결과를 Excel 파일로 다운로드할 수 있는 기능을 제공
3. eGovFrame(전자정부프레임워크)을 사용하여 유지보수를 용의하게 함
4. Bootstrap을 사용하여 반응형을 지원하고 심미성 및 편의성을 높임

<br/>
<br/>

### 주요기능
>  **로그인**
 - 관리자 및 담당자 권한 분리
 - 비밀번호 암호화
 - 일정시간 경과 후 자동 로그아웃

>  **마포구청 Menu**
- 업무생성
- 업무생성확인
- 업무배포결과
- 복지시설관리
- FAQ
- 사용자관리
- 복지시설관리

>  **복지시설 Menu**
- 업무확인
- FAQ
<br/>
<br/>

### 개발환경
> **Server & Back-end**
- JDK 1.8
- Tomcat 8.5
- My-SQL 5.6.21
- Jenkins
- Visual SVN Server 4.3.1
- eGovFramework(전자정부프레임워크) 3.10
- Eclipse 3.10
- Maven 3.6.3
- MyBatis

> **Front-end**
- HTML5 & CSS
- Jquery
- Bootstrap4
<br/>
<br/>
