/**
 * 
 */
// ckeditor 글 작성시 3300자 이상(줄바꿈 8자) 작성 불가
function checkLength() {
	let ckForm = document.getElementById('ckForm');
	let editor = CKEDITOR.instances.content.getData().replace(/<[^>]*>?/g, '');

	if (editor.length > 3300) {
		alert('3300자 이상 작성 불가' + '현재 ' + editor.length + '자 작성됨');
		return false;
	} else {
		ckForm.submit();
	}
}

// contextPath얻기
function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/',
			hostIndex + 1));
};

// 삭제하기를 눌렀을때 ajax로 삭제 처리하기
function tbDelete(tb_idx, tb_level) {
	let result = window.confirm("정말로 글을 삭제하시겠습니까?");

	if (result == true) {// 확인 버튼 클릭

		// 비동기방식으로 글삭제 요청!
		$.ajax({
			type : "post",
			async : true,
			url : getContextPath() + "/tb/tbDelete.bo",
			data : {
				tb_idx : tb_idx,
				tb_level : tb_level
			},
			dataType : "text",
			success : function(data) {

				if (data == "삭제성공") {
					alert("삭제 성공!");

					// 강제로 클릭 이벤트 발생시키는 부분
					location.href = getContextPath() + "/tb/list.bo";

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

//글 읽기
function fnRead(val) {

	document.frmRead.action = getContextPath()+"/tb/read.bo";
	document.frmRead.tb_idx.value = val;
	document.frmRead.submit();
}