const pathname = "/" + window.location.pathname.split("/")[1] + "/";
const origin = window.location.origin;
const contextPath = origin + pathname;

//reviewList.jsp
const fullContent = document.querySelector("#container"); //전체를 둘러싼 컨텐츠 정보획득

function clickWrite(id){
  if(!id){
    alert("로그인 후 작성이 가능합니다.");
  }else{
    location.href = contextPath +'review/write.rv';
  }
}

function del_rv(idx){
  var result = window.confirm("정말로 글을 삭제하시겠습니까?");
  if(result == true){//확인 버튼 클릭
      //비동기방식으로 글삭제 요청!
		$.ajax({
			type : "post",
			async : true,
			url : contextPath + "review/del.rv",
			data : {idx : idx},
			dataType : "text",
			success : function(data){
				if(data==1){
					alert("삭제 성공!");
					//강제로 클릭 이벤트 발생시키는 부분
					location.href= contextPath + "review/list.rv";
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
//reviewList.jsp
//reviewWrite.jsp
			function frmsubmit() {
				if (!$("#fileName").val()) {
					alert("이미지를 첨부해주세요");
				} else {
					$("form").submit();
				}
			}
			$('.DOC_TEXT').keyup(function(e) {
				var content = $(this).val();
				$('#counter').html("(" + content.length + " / 최대 1000자)"); //글자수 실시간 카운팅
				if (content.length > 1000) {
					alert("최대 1000자까지 입력 가능합니다.");
					$(this).val(content.substring(0, 1000));
					$('#counter').html("(1000 / 최대 1000자)");
				}
			});
//reviewWrite.jsp
//reviewWriteUpdate.jsp
			function frmEditsubmit() {
				$("form").submit();
			}
//reviewWriteUpdate.jsp
//write.jsp
  	CKEDITOR.replace('editor1', {
  		height : 500
  	});
//write.jsp
//read.jsp
      function clickLike(id,b_idx){
        if(id == "null"){
          alert("로그인부터 해라");
        } else{
          $.ajax({
                  url: contextPath + "freeboard/like.fb",
                  async : true,
                  type : 'POST',
                  data : {
                            b_idx : b_idx,
                            id : id
                          },
                  success : function(data) {
                    var arr=data.split("l");
                    var arr1 = arr[0];
                    var arr2 = arr[1];
                      $("#countLike").text(arr1);
                      $("#topLike").text(arr1);
                      
                      if ( arr2 == 8 ) {
                        $("#likeimggg").attr("class","fa-solid fa-heart fa-4x");//이제 좋아요 누른 경우;
                      } else if (arr2 == 9) {
                        $("#likeimggg").attr("class","fa-regular fa-heart fa-4x"); //이미 좋아요 누른 경우;
                      }
                  }
            });
        }
      }
    //삭제하기를 눌렀을때 ajax로 삭제 처리하기
      function del(b_idx){
      			var result = window.confirm("정말로 글을 삭제하시겠습니까?");
      			if(result == true){//확인 버튼 클릭
      				//비동기방식으로 글삭제 요청!
      				$.ajax({
      					type : "post",
      					async : true,
      					url : contextPath+"freeboard/del.fb",
      					data : {b_idx : b_idx},
      					dataType : "text",
      					success : function(data){
      						if(data== 1){
      							alert("삭제 성공!");
      							//강제로 클릭 이벤트 발생시키는 부분
      							location.href=contextPath + "freeboard/list.fb";
      									} else {//"삭제실패"
      										alert("삭제에 실패했습니다.")
      										location.reload();
      									}
      								},
      								error : function() {
      									alert("비동기 통신 장애");
      								}
      							});
      				} else {//취소 버튼을 눌렀을때
      					return false;
      				}
      			}      
      
		function comment(b) {
			var commentUpdate = document.getElementById("commentUpdate" + b);
			commentUpdate.submit();
		}

		function updateActive(a) {
			//수정시 입력하는 화면 활성화
			$("#updateActive" + a).removeAttr("disabled");
			//수정하기 버튼 안보이게
			document.getElementById("update" + a).style.display = 'none';
			//수정완료 버튼 보이게 
			document.getElementById("updatePro" + a).style.display = 'block';
		}
//read.jsp
