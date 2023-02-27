<%@page import="VO.TrainerBoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	
	//조회한 글정보 얻기
	TrainerBoardVo vo = (TrainerBoardVo)request.getAttribute("vo");
	String nickname = vo.getCb_nickname();//조회한 글을 작성한 사람 닉네임
// 	String email = vo.getcb_email();//조회한 글을 작성한 사람의 이메일
	String title = vo.getCb_title();//조회한 글제목
	String content = vo.getCb_content(); //조회한 글 내용.replace("/r/n", "<br>")
	String file = vo.getCb_file();//업로드한 실제파일명 (조회후 받아온 값)
// 	int downCount = vo.getDowncount(); //업로드한 파일을 실제 다운로드한 횟수
	
	String cb_idx = (String)request.getAttribute("cb_idx");
	System.out.println("-----@@@@" + cb_idx);
	
	
	
	String nowPage = (String)request.getAttribute("nowPage");
	String nowBlock = (String)request.getAttribute("nowBlock");
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세</title>

    <style>

        h1 {
            font-size: 2em;
            font-weight: bold;
            margin-bottom: 30px;
            text-align: center;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }

        th {
            background-color: #f5f5f5;
            font-weight: bold;
        }

        a {
            color: #00bcd4;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>게시글 상세</h1>
    	<table width="80%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td colspan="3">
				<div align="center">
					<table width="95%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="327" colspan="3" valign="top">
								<div align="center">
									<table width="95%" height="373" border="0" cellpadding="0" cellspacing="1" class="border1">
										<tr>
											<td width="13%" height="29" bgcolor="#e4e4e4" class="text2">
												<div align="center">작 성 자</div>
											</td>
											<td width="34%" bgcolor="#f5f5f5" style="text-align: left">
												&nbsp;&nbsp; <input type="text" name="writer" id="writer" value="<%=nickname%>" disabled>
											</td>
										</tr>
										<tr>
											<td height="31" bgcolor="#e4e4e4" class="text2">
												<div align="center">제&nbsp;&nbsp;&nbsp; &nbsp; 목</div>
											</td>
											<td colspan="3" bgcolor="#f5f5f5" style="text-align: left">
												&nbsp;&nbsp; <input type="text" name="title" id="title" value="<%=title%>" disabled>
											</td>
										</tr>
										<tr>
											<td height="31" bgcolor="#e4e4e4" class="text2">
												<div align="center">다운로드:</div>
											</td>
											<td colspan="2" bgcolor="#f5f5f5" style="text-align: left">
												<%-- 다운로드할 폴더번호 경로와 다운로드 할 파일명 전달 --%>
												<a href="<%=contextPath%>/tb/Download.bo?path=<%=cb_idx%>&fileName=<%=file%>">&nbsp;&nbsp;<%=file%></a>
											</td>
										</tr>
										<tr>
											<td height="245" bgcolor="#e4e4e4" class="text2">
												<div align="center">내 &nbsp;&nbsp; 용</div>
											</td>
											<td colspan="3" bgcolor="#f5f5f5" style="text-align: left; vertical-align: top;">
												&nbsp; <%out.print(content);%><%-- <textarea rows="20" cols="100" name="content" id="content" disabled></textarea>--%>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 48%">
								<div align="right" id="menuButton" >
								<%--수정하기 --%>	
									<input type="image" src="<%=contextPath%>/board/images/update.gif" id="update" style="visibility:hidden" />&nbsp;&nbsp; 
								<%--삭제하기 --%>	
									<input type="image" src="<%=contextPath%>/board/images/delete01.gif" id="delete" onclick="javascript:deletePro('<%=cb_idx%>');" style="visibility:hidden" />&nbsp;&nbsp; 
								<%--답변달기 --%>
									<input type="image" src="<%=contextPath%>/board/images/reply.gif" id="reply" />&nbsp;&nbsp; 
								</div>
							</td>
							<td width="10%">
								<div align="center">
									<input type="image" 
											src="<%=contextPath%>/board/images/list.gif"
											id="list" 
											onclick="location.href='<%=contextPath%>/FileBoard/list.bo?nowBlock=<%=nowBlock%>&nowPage=<%=nowPage%>'" />&nbsp;
								</div>
							</td>
							<td width="42%"></td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
    <div style="text-align: center;">
        <a href="list.bo">목록으로</a>
    </div>
</body>
</html>