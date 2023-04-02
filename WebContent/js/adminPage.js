const board_manage = document.querySelector('.board_manage');
const submenu = document.querySelector('.submenu');

board_manage.addEventListener('click', () => {
    submenu.classList.toggle('active');
});

function memPopup() {
	let url = "/TeamProject/nbAdmin/memUpdatePopup.jsp";
	let	name = "popup test";
	var option = "width=700, height=800, top=100, left=200, location=yes"
		window.open(url,name,option);
}

//contextPath얻기
function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/',
			hostIndex + 1));
};


//관리자창에서 삭제하기를 눌렀을때 ajax로 삭제 처리하기
function admTbDelete(tb_idx, tb_level) {
	let result = window.confirm("정말로 글을 삭제하시겠습니까?");

	if (result == true) {// 확인 버튼 클릭

		// 비동기방식으로 글삭제 요청!
		$.ajax({
			type : "post",
			async : true,
			url : getContextPath() + "/adm/trBoardDelete.adm",
			data : {
				tb_idx : tb_idx,
				tb_level : tb_level
			},
			dataType : "text",
			success : function(data) {

				if (data == "삭제성공") {
					alert("삭제 성공!");

					location.href = getContextPath() + "/adm/trBoardList.adm";

				} else {// "삭제실패"
					alert("삭제에 실패했습니다.")
					location.reload();
				}

			},
			error : function() {
				alert("비동기 통신 장애");
			}
		});

	} else {// 취소 버튼을 눌렀을때
		return false;
	}
}

//관리자 자유게시판에서 글 삭제 하는 메소드
function fbDelete(fb_idx){
	var result = window.confirm("정말로 글을 삭제하시겠습니까?");
	
	if(result == true){//확인 버튼 클릭
		
		//비동기방식으로 글삭제 요청!
		$.ajax({
			type : "post",
			async : true,
			url : getContextPath() + "/adm/fbDelete.adm",
			data : {fb_idx : fb_idx},
			dataType : "text",
			success : function(data){
				
				if(data=="삭제성공"){
					alert("삭제 성공!");
					
					//강제로 클릭 이벤트 발생시키는 부분
					location.href=getContextPath() + "/adm/freeBoardList.adm";
					
				}else{//"삭제실패"
					alert("삭제에 실패했습니다.")
					location.reload();
				}
				
			},
			error : function(){
				alert("비동기 통신 장애");
			}
		});
		
	}else{//취소 버튼을 눌렀을때
		return false;
	}
}

//관리자페이지 리뷰보드 글 삭제 js
function del(idx){
	var result = window.confirm("정말로 글을 삭제하시겠습니까?");
	
	if(result == true){//확인 버튼 클릭
		//비동기방식으로 글삭제 요청!
		$.ajax({
			type : "post",
			async : true,
			url : "<%=contextPath%>/review/del.rv",
			data : {idx : idx},
			dataType : "text",
			success : function(data){
				if(data==1){
					alert("삭제 성공!");
					location.href="<%=contextPath%>/adm/reviewBoardList.adm";
				}else{//"삭제실패"
					alert("삭제에 실패했습니다.")
					location.reload();
				}
			},
			error : function(){
				alert("비동기 통신 장애");
			}
		});
	}else{//취소 버튼을 눌렀을때
		return false;
	}
}