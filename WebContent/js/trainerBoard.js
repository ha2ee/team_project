/**
 * 
 */
// ckeditor 글 작성시 3300자 이상(줄바꿈 8자),제목,내용 미입력시 작성 불가
function checkEditor() {
	let ckForm = document.getElementById('ckForm');
	let title = document.getElementById('tbwTitle').value;
	let editor = CKEDITOR.instances.content.getData().replace(/<[^>]*>?/g, '');

	if (title == '' || title == null || editor == '' || editor == null) {
		alert('제목, 내용을 입력해주세요');
		return false;
	}

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

// 글 읽기
function fnRead(val) {

	document.frmRead.action = getContextPath() + "/tb/read.bo";
	document.frmRead.tb_idx.value = val;
	document.frmRead.submit();
}

// 글 수정 간 파일 제거 후 재업로드
function fileDel(tb_idx, tb_level) {
	let result = window.confirm("정말로 파일을 삭제하시겠습니까?");

	if (result == true) {// 확인 버튼 클릭

		// 비동기방식으로 글삭제 요청!
		$.ajax({
			type : "post",
			async : true,
			url : getContextPath() + "/tb/fileDel.bo",
			data : {
				tb_idx : tb_idx,
				tb_level : tb_level
			},
			dataType : "text",
			success : function(data) {

				if (data == "삭제성공") {
					alert("삭제 성공!");
					document.getElementById("delButton").style.display = "none";
					document.getElementById("attachFile").style.display = "none";
					document.getElementById("updateFile").style.display = "block";
					
//					location.href = getContextPath() + "/tb/list.bo";
					
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