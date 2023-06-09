# 요약
![image](https://user-images.githubusercontent.com/115638416/232486664-0e62a12c-f69d-4a4b-bc11-be5f77458769.png)

프로젝트명 : 늘 봄

늘 봄은 반려동물 교육 플랫폼을 기반으로 한 수강 신청 및 커뮤니티 기능을 가지고 있습니다.<br>
늘 보다, 늘 돌보다, 늘 봄이다 등의 언어 유희적 표현이며 반려인들을 대상으로 서비스를 제공합니다.

## Import시 참고사항
Tomcat 9.0, jdk, jre 10버전을 기준으로 작성 된 프로젝트로 해당 환경으로 설정이 필요합니다.
![image](https://user-images.githubusercontent.com/115638416/233226615-bdf4d8d7-5134-4324-b52f-35dd2232312c.png)
![image](https://user-images.githubusercontent.com/115638416/233226631-d87632bf-4095-4f90-b2f1-7d075e09bde5.png)
![image](https://user-images.githubusercontent.com/115638416/233226659-c739c022-e799-46a3-9425-31575c41ae67.png)
![image](https://user-images.githubusercontent.com/115638416/233227660-d3917d0f-55bd-4fa2-9f24-bdec5fc7a7d1.png)
     
      <Resource
       name="jdbc/oracle"
       auth="Container"
       type="javax.sql.DataSource"
       driverClassName="oracle.jdbc.driver.OracleDriver"
       username="유저명"
       password="패스워드"
       url="jdbc:oracle:thin:@localhost:1521:xe"/> 


## 📌프로젝트 소개 
* 기간 : 2023.02.15 ~ 2023.04.15
* 주제 : 반려동물 교육 플랫폼
* 담당 파트 : 답글형 게시판(훈련사 상담) 및 관리자 페이지 구현
* 사용 기술
    * Tool : eclipse, github
    * Tech : JAVA(jdk-10) / JavaScript / CSS / jQuery / JSP / Servlet MVC / HTML
    * DB : ORACLE 11XE SQL Developer
    * Server : Tomcat 9.0

## 🛠기능 요약
1. 반려동물을 기르는 반려인들이 전문 트레이너들에게 상담을 받고, 교육을 신청하여 수강 할 수 있는 기능을 가집니다.
2. 자유게시판, 수강 후기 게시판을 통해 커뮤니티의 기능을 가집니다.

## 주요기능
* 담당 파트
   * 훈련사 상담 게시판
      * 고객과 관리자가 소통하는 게시판, 댓글이 없는 답변형 게시판으로 트레이너가 글을 작성하는 경우 작성자명에 🍎이모지 및 아이디 볼드 처리
      * CKEDITOR로 이미지를 업로드 후 글을 작성하면 자동으로 이미지 다운로드 링크 생성(HTML5 download 적용)
   * 관리자 페이지
     * 회원 리스트 조회, 회원 정보 수정 및 삭제, 트레이너 관리 등 회원관리 기능
     * 관리자 페이지에서 3개 게시판 리스트 구현 및 글 삭제 기능 추가      
<hr>

* 메인화면
    * 1920 * 1080을 기준으로 제작 되었으며, 우측 상단엔 날씨 API를 이용하여 날씨에 따라 다른 문구들을 출력하게 함.
    * 퀵메뉴의 1:1 채팅문의는 카카오 챗봇연동으로 고객센터를 운영
    * 카카오 맵 API를 활용하여 지도 검색 기능을 제공
    * jsp Include 방식을 적용하여 Header, Section, Footer으로 페이지 구성
    
* 회원가입 및 로그인
    * 아이디 중복 체크 및 정규표현식을 이용하여 회원 가입 양식 지정
    * 아이디 비밀번호 찾기 기능 제공
    * 일반 회원과 트레이너 회원을 구분, 트레이너 회원의 경우 가입신청 -> 관리자 승인 방식
    * 마이페이지에서 펫 정보 및 개인정보 수정가능
    
* 게시판
    * 자유게시판
      * 커뮤니티 기능을 가진 게시판, 좋아요 및 댓글 기능이 구현 되어 있음.
    * 훈련사 상담 게시판
      * 고객과 관리자가 소통하는 게시판, 댓글이 없는 답변형 게시판으로 트레이너가 글을 작성하는 경우 작성자명에 🍎이모지 및 아이디 볼드 처리
      * CKEDITOR로 이미지를 업로드 후 글을 작성하면 자동으로 이미지 다운로드 링크 생성(HTML5 download 적용)
    * 수강 후기 게시판
      * 이미지를 업로드 하면 게시글 리스트에서 썸네일처럼 나타나는 썸네일 형 게시판

* 수강신청
  * 원하는 트레이너를 선택해 교육 수강을 신청 할 수 있음, 오늘 기준 일주일 뒤 부터 한달뒤까지 총7회 예약 가능
  * 해당 트레이너의 해당 일자에 수강 신청을 한 인원이 있는 경우 수강 신청 불가능하게 구현
  * 결제간 카카오페이 API 적용
    
* 관리자 페이지
  * 회원 리스트 조회, 회원 정보 수정 및 삭제, 트레이너 관리 등 회원관리 기능 및 게시판 관리 기능(글 조회 및 삭제)
  * 관리자 메인 페이지에서 최근 등록된 회원, 트레이너, 글 확인 가능

## 🔖DB 구성
다운로드 sql파일 링크 : https://drive.google.com/file/d/1lPvf-Yb4UcnVTnWmbzy1q8NSARDPccCk/view?usp=share_link

* YS_MEMBER
  * 아이디, 이름, 닉네임, 회원사진, 비밀번호, 이메일, 휴대전화번호, 생일, 성별, 가입일자, 펫 유무, 주소를 갖습니다.
* PET
  * 펫 이미지, 나이, 성별, 품종, 중성화 수술 여부, 무게, 펫사진, 회원 아이디를 갖습니다. YS_MEMBER 테이블에 종속성을 가집니다.
* MEMBER_TRAINER
  * 아이디, 이름, 트레이너 사진, 비밀번호, 이메일, 휴대전화 번호, 생일, 성별, 가입일, 주소를 갖습니다.
* TEM_TRAINER
  * 트레이너 회원 가입 전 임시 보관 테이블로 관리자 페이지에서 가입 승인 되면 자동 삭제 되는 임시 테이블입니다.
* FREE_BOARD
  * 자유게시판 테이블이며 인덱스, 아이디, 닉네임, 제목, 내용, 작성일, 조회수, 업로드파일명, 실제파일명, 좋아요 컬럼을 갖습니다.
  * LIKE_TABLE
    * 좋아요 테이블로 FREE_BOARD에 종속성을 가집니다.
  * TBLCOMMENT는 댓글 테이블로 FREE_BOARD, YS_MEMBER, MEMBER_TRAINER 테이블에 종속성을 가집니다.
* REVIEW
  * 수강 후기 게시판 테이블이며, 인덱스, 아이디, 이미지파일명, 실제이미지 파일명, 제목, 내용, 작성일을 갖습니다.
* TRAINER_BOARD
  * 훈련사 상담 게시판으로 인덱스, 작성자 아이디, 이름, 제목, 내용, 들여쓰기를 적용을 위해 그룹, 레벨을 작성, 작성일, 조회수, 업로드 파일명을 갖습니다.
* CART_EDU, EDU_CART
  * 수강신청을 위한 테이블입니다. 수강 신청자 정보와 주소, 펫 정보와 훈련사 정보, 수강 신청일, 횟수, 가격을 컬럼으로 갖습니다.
![image](https://user-images.githubusercontent.com/115638416/232683018-ad9568a2-7f13-4ffc-8d37-40ee2d7c06f3.png)




## 이미지 자료
### 담당파트
![image](https://user-images.githubusercontent.com/115638416/232501695-f7ded26c-6494-4a9d-af62-81d908e82d7e.png)
![image](https://user-images.githubusercontent.com/115638416/232920732-5d47c210-3479-46f0-9900-dcdd5112d4fd.png)
![image](https://user-images.githubusercontent.com/115638416/232501818-83a7dad5-f1b9-4925-9264-d99b0fad5502.png)
![image](https://user-images.githubusercontent.com/115638416/232935460-72b05f52-37a3-42ef-bad8-396fdf1f07f3.png)


### 전체
![image](https://user-images.githubusercontent.com/115638416/232540955-efdb8f98-7d34-47bc-b4f1-49bcc3ca0a32.png)
![image](https://user-images.githubusercontent.com/115638416/232541686-a507b852-f7aa-446e-9e0e-ddea7cc4b32f.png)
![image](https://user-images.githubusercontent.com/115638416/232541789-01802d63-2505-4499-864f-8e354795dd3d.png)
![image](https://user-images.githubusercontent.com/115638416/232541889-2de916e4-43c6-47aa-9360-c45e6526fe46.png)
![image](https://user-images.githubusercontent.com/115638416/232674329-808779f1-9cf5-4468-8d40-c297f81007cd.png)
![image](https://user-images.githubusercontent.com/115638416/232674455-bd48790f-a30d-4ba8-886e-ae2c35044880.png)






### 🔄업데이트 내역
* 0.1 
  * 기본파일 업로드
* 0.2
  * 2023-02-28 
  * 수강 신청, 자유게시판, 훈련사 상담, 회원 가입 구현중
* 0.3
  * 2023-03-03
  * DB구성 변경(MemberVo, TrainerVo, PetVo)
* 0.4
  * 2023-03-08
  * 자유게시판, 훈련사 상담, 회원 가입, 수강 신청 병합 완료
* 0.5
  * 2023-03-16
  * 자유게시판, 훈련사 상담, 회원 가입, 수강 신청, 구현 완료
* 0.6
  * 2023-03-22
  * 소스코드 정리, 파일 나누기, 수강 후기, 기타 기능 구현중
* 0.7
  * 2023-03-29
  * 파일 취합 완료
* 0.8
  * 2023-04-05
  * 최종 파일 구현 점검, ppt 발표 준비
