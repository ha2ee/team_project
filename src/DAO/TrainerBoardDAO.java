package DAO;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import VO.TrainerBoardVo;

public class TrainerBoardDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public TrainerBoardDAO() {
	
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:/comp/env/jdbc/oracle");
			
		} catch (Exception e) {
			System.out.println("DB연결 실패! - "+ e);
		}
	}
	
	//자원해제 기능
	private void closeResource() {
		if(con != null)try {con.close();} catch (Exception e) {e.printStackTrace();}
		if(pstmt != null)try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
		if(rs != null)try {rs.close();} catch (Exception e) {e.printStackTrace();}
	}
    

	//아이디가 어느테이블(ys_member, Member_Trainer)에 속하는지 확인
	public boolean checkTable(String id) {

		boolean result = false;
		
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement("select * from YS_MEMBER WHERE MEM_ID = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
			
		} catch (Exception e) {
			System.out.println("checkTable메소드 내부에서 오류!");
			e.printStackTrace();
		} finally {
			closeResource();
		}
		
		
		return result;
	}
	
	
	
	
	
	
	   // 글목록 가져오기
    public ArrayList<TrainerBoardVo> getBoardList(HashMap<String, Object> listOpt)
    {
        ArrayList<TrainerBoardVo> list = new ArrayList<>();
        
        String opt = (String)listOpt.get("opt"); // 검색옵션(제목, 내용, 글쓴이 등..)
        String condition = (String)listOpt.get("condition"); // 검색내용
        int start = (Integer)listOpt.get("start"); // 현재 페이지번호
        
        try {
            con = ds.getConnection();
            StringBuffer sql = new StringBuffer();
            
            // 글목록 전체를 보여줄 때
            if(opt == null)
            {
                // tb_group(그룹번호)의 내림차순 정렬 후 동일한 그룹번호일 때는
                // tb_level(답변글 순서)의 오름차순으로 정렬 한 후에
                // 10개의 글을 한 화면에 보여주는(start번째 부터 start+9까지) 쿼리
                // desc : 내림차순, asc : 오름차순 ( 생략 가능 )
                
                sql.append("select * from ");
                sql.append("(select rownum rnum, Tb_idx, Tb_ID, Tb_name");
                sql.append(", TB_TITLE, TB_CONTENT, TB_GROUP, TB_LEVEL, TB_DATE, TB_CNT, TB_FILE");
                sql.append(" FROM ");
                sql.append("(select * from Trainer_board order by TB_GROUP)) ");
//              sql.append("(select * from Trainer_board order by TB_LEVEL desc, TB_GROUP asc)) ");
                sql.append("where rnum>=? and rnum<=?");
                
                
                pstmt = con.prepareStatement(sql.toString());
                pstmt.setInt(1, start);
                pstmt.setInt(2, start+9);
                
                // StringBuffer를 비운다.
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("0")) // 제목으로 검색
            {
                
                sql.append("select * from ");
                sql.append("(select rownum rnum, Tb_idx, Tb_ID, Tb_name");
                sql.append(", TB_TITLE, TB_CONTENT, TB_GROUP, TB_LEVEL, TB_DATE, TB_CNT, TB_FILE");
                sql.append(" FROM ");
                sql.append("(select * from Trainer_board where Tb_title like ? ");
                sql.append("order BY TB_GROUP)) ");
//              sql.append("order BY TB_LEVEL desc, TB_GROUP asc)) ");
                sql.append("where rnum>=? and rnum<=?");
                
                pstmt = con.prepareStatement(sql.toString());
                pstmt.setString(1, "%"+condition+"%");
                pstmt.setInt(2, start);
                pstmt.setInt(3, start+9);
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("1")) // 내용으로 검색
            {
                
                sql.append("select * from ");
                sql.append("(select rownum rnum, Tb_idx, Tb_ID, Tb_name");
                sql.append(", TB_TITLE, TB_CONTENT, TB_GROUP, TB_LEVEL, TB_DATE, TB_CNT, TB_FILE");
                sql.append(" FROM ");
                sql.append("(select * from Trainer_board where Tb_content like ? ");
                sql.append("order BY TB_GROUP asc)) ");
//              sql.append("order BY TB_LEVEL desc, TB_GROUP asc)) ");
                sql.append("where rnum>=? and rnum<=?");
                
                pstmt = con.prepareStatement(sql.toString());
                pstmt.setString(1, "%"+condition+"%");
                pstmt.setInt(2, start);
                pstmt.setInt(3, start+9);
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("2")) // 제목+내용으로 검색
            {
                
                sql.append("select * from ");
                sql.append("(select rownum rnum, Tb_idx, Tb_ID, Tb_name");
                sql.append(", TB_TITLE, TB_CONTENT, TB_GROUP, TB_LEVEL, TB_DATE, TB_CNT, TB_FILE");
                sql.append(" FROM ");
                sql.append("(select * from Trainer_board where Tb_title like ? OR Tb_content like ? ");
                sql.append("order BY TB_GROUP asc)) ");
//              sql.append("order BY TB_LEVEL desc, TB_GROUP asc)) ");
                sql.append("where rnum>=? and rnum<=?");
                
                pstmt = con.prepareStatement(sql.toString());
                pstmt.setString(1, "%"+condition+"%");
                pstmt.setString(2, "%"+condition+"%");
                pstmt.setInt(3, start);
                pstmt.setInt(4, start+9);
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("3")) // 글쓴이로 검색
            {
                
                sql.append("select * from ");
                sql.append("(select rownum rnum, Tb_idx, Tb_ID, Tb_nickname");
                sql.append(", TB_TITLE, TB_CONTENT, TB_GROUP, TB_LEVEL, TB_DATE, TB_CNT, TB_FILE");
                sql.append(" FROM ");
                sql.append("(select * from Trainer_board where Tb_name like ? ");
                sql.append("order BY TB_GROUP asc)) ");
//              sql.append("order BY TB_LEVEL desc, TB_GROUP asc)) ");
                sql.append("where rnum>=? and rnum<=?");
            	
                pstmt = con.prepareStatement(sql.toString());
                pstmt.setString(1, "%"+condition+"%");
                pstmt.setInt(2, start);
                pstmt.setInt(3, start+9);
                
                sql.delete(0, sql.toString().length());
            }
            
            rs = pstmt.executeQuery();
            while(rs.next())
            {
				TrainerBoardVo vo = new TrainerBoardVo(rs.getInt("Tb_idx"),
						rs.getString("Tb_id"),
						rs.getString("Tb_name"),
						rs.getString("Tb_title"), 
						rs.getString("Tb_content"), 
						rs.getInt("Tb_group"), 
						rs.getInt("Tb_level"), 
						rs.getDate("Tb_date"), 
						rs.getInt("Tb_cnt"),
						rs.getString("Tb_file")
						);
				list.add(vo);
            }
            
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
        
        closeResource();
        return list;
    } // end getBoardList
    
    // 글의 개수를 가져오는 메서드
    public int getBoardListCount(HashMap<String, Object> listOpt)
    {
        int result = 0;
        String opt = (String)listOpt.get("opt"); // 검색옵션(제목, 내용, 글쓴이 등..)
        String condition = (String)listOpt.get("condition"); // 검색내용
        
        try {
            con = ds.getConnection();
            StringBuffer sql = new StringBuffer();
            
            if(opt == null)    // 전체글의 개수
            {
                sql.append("select count(*) from Trainer_board");
                pstmt = con.prepareStatement(sql.toString());
                
                // StringBuffer를 비운다.
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("0")) // 제목으로 검색한 글의 개수
            {
                sql.append("select count(*) from Trainer_board where Tb_title like ?");
                pstmt = con.prepareStatement(sql.toString());
                pstmt.setString(1, '%'+condition+'%');
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("1")) // 내용으로 검색한 글의 개수
            {
                sql.append("select count(*) from Trainer_board where Tb_content like ?");
                pstmt = con.prepareStatement(sql.toString());
                pstmt.setString(1, '%'+condition+'%');
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("2")) // 제목+내용으로 검색한 글의 개수
            {
                sql.append("select count(*) from Trainer_board ");
                sql.append("where Tb_title like ? or Tb_content like ?");
                pstmt = con.prepareStatement(sql.toString());
                pstmt.setString(1, '%'+condition+'%');
                pstmt.setString(2, '%'+condition+'%');
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("3")) // 글쓴이로 검색한 글의 개수
            {
                sql.append("select count(*) from Trainer_board where Tb_name like ?");
                pstmt = con.prepareStatement(sql.toString());
                pstmt.setString(1, '%'+condition+'%');
                
                sql.delete(0, sql.toString().length());
            }
            
            rs = pstmt.executeQuery();
            if(rs.next())    result = rs.getInt(1);
            
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
        
        closeResource();
        return result;
    } // end getBoardListCount
 
	//TRAINER_BOARD테이블에 저장된 최신 글 번호 조회 후 반환 하는 메소드
	public int getNewArticleNO() {
		
		try {
			con = ds.getConnection();
			
			String sql = "select max(Tb_idx) from trainer_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return (rs.getInt(1) + 1); //insert할 글번호 만들어서 반환
			}
			
			
			
		} catch (Exception e) {
			System.out.println("getNewArticleNO메소드 내부에서 오류 :");
			e.printStackTrace();
		} finally {
			closeResource();
		}
		
		
		return 0; //글이 존재 하지 않으면 TB_IDX 0을 반환
	}
	
	//글 작성 메소드
	public int insertBoard(TrainerBoardVo vo) {
		int articleNO = getNewArticleNO(); // 글번호 생성(없으면 0을 반환 받았을것이고, 있으면 최대 글 개수(IDX)번호에서 +1을 반환 받음
		String sql = null;
		try {
			//DB접속
			con = ds.getConnection();
			
			//두번째 부터 입력되는 주글 들의 pos를 1증가 시킨다.
			sql = "update trainer_board set tb_group = tb_group +1";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			
			//insert SQL문 만들기 //tb_group , tb_level 0 0 으로 insert 규칙3
			sql = "insert into trainer_board (tb_idx, tb_id, tb_name, tb_title, "
							+ "tb_content, tb_group, "
							+ "tb_level, tb_date, tb_cnt, tb_file) "
							+ " values (?,?,?,?,?,0,0,sysdate,0,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleNO);
			pstmt.setString(2, vo.getTb_id());
			pstmt.setString(3, vo.getTb_name());
			pstmt.setString(4, vo.getTb_title());
			pstmt.setString(5, vo.getTb_content());
			pstmt.setString(6, vo.getTb_file());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertBoard 메소드 내부에서 오류 !");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		return articleNO; //insert한 글번호를 반환 함. 이유 : 글번호 폴더를 만들어서 파일을 그안에 업로드 하기 위함
	}
	
    // 게시글 수정
    public void updateBoard(HttpServletRequest request, HttpServletResponse response, String tb_idx) throws Exception {
        
    	PreparedStatement pstmt = null;
        con = ds.getConnection();
        try {
		Map<String, String> articleMap = upload(request, response);
		
		String writer = articleMap.get("name"); //작성자(이름)
		String title = articleMap.get("title"); //제목
		String content = articleMap.get("content"); //내용
		String id = articleMap.get("id"); //글 작성자 아이디
		String file = articleMap.get("file"); //글을 수정할때 업로드 하기 위해 첨부한 파일명
		
		TrainerBoardVo  vo = new TrainerBoardVo();
		vo.setTb_name(writer);
		vo.setTb_title(title);
		vo.setTb_content(content);
		vo.setTb_id(id);
		vo.setTb_file(file);
		
		//수정할때 파일이 null이 아니라면 재 업로드
		if (vo.getTb_file() != null) {
		if(file != null && file.length() != 0) {
			File srcFile = new File("C:\\file_repo\\temp\\"+file);
			File destDir = new File(request.getServletContext().getRealPath("\\uploadFile\\TrainerBoardFile\\tb_idx")+tb_idx);
//			File destDir = new File("C:\\Users\\HP\\git\\neulbom\\WebContent\\uploadFile\\TrainerBoardFile\\tb_idx"+tb_idx);
			destDir.mkdirs();
			FileUtils.moveFileToDirectory(srcFile, destDir, true);
		}//파일 재 업로드

            String sql = "UPDATE TRAINER_BOARD SET tb_name =?, tb_title=?, tb_content=?, tb_file=? WHERE tb_idx=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, vo.getTb_name());
            pstmt.setString(2, vo.getTb_title());
            pstmt.setString(3, vo.getTb_content());
            pstmt.setString(4, vo.getTb_file());
            pstmt.setString(5, tb_idx);
            pstmt.executeUpdate();
            
		} else { //파일이 없다면 db에 tb_file은 업데이트 하지 않는다. 
            String sql = "UPDATE TRAINER_BOARD SET tb_name =?, tb_title=?, tb_content=? WHERE tb_idx=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, vo.getTb_name());
            pstmt.setString(2, vo.getTb_title());
            pstmt.setString(3, vo.getTb_content());
            pstmt.setString(4, tb_idx);
            pstmt.executeUpdate();
		}
        } finally {
        	closeResource();
        }

//        return tb_idx;
    }
    
    
    // 게시글 목록 조회
    public List<TrainerBoardVo> selectBoardList() {
        List<TrainerBoardVo> boardList = new ArrayList<>();
        try {
            con = ds.getConnection();
            String query = "SELECT tb_idx, tb_title, tb_name, tb_date, tb_cnt FROM TRAINER_BOARD ORDER BY tb_idx DESC";
            pstmt = con.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                TrainerBoardVo board = new TrainerBoardVo();
                board.setTb_idx(rs.getInt("tb_idx"));
                board.setTb_title(rs.getString("tb_title"));
                board.setTb_name(rs.getString("tb_name"));
                board.setTb_date(rs.getTimestamp("tb_date"));
                board.setTb_cnt(rs.getInt("tb_cnt"));
                boardList.add(board);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResource();
        }
        return boardList;
    }

	//파일 업로드 메소드
	private Map<String, String> upload(HttpServletRequest request, 
			HttpServletResponse response) 
			throws ServletException, IOException{

		Map<String, String> articleMap = new HashMap<String, String>();
		
		//한글처리
		request.setCharacterEncoding("utf-8");
		
		//인코딩 방식 UTF-8 문자열을 변수에 저장
		String encoding = "UTF-8";
		
		//업로드할 파일 폴더 경로와 연결된 File객체 생성
		File currentDirPath = new File("C:\\file_repo");
		
		//업로드 할 파일 데이터를 임시로 저장할 객체 메모리 생성
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//임시 메모리의 최대 사이즈를 1메가 바이트로 설정
		factory.setSizeThreshold(1024*1024*1);
		//임시 메모리에 파일업로드시~ 지정한 1메가 바이트크기를 넘길경우
		//실제 업로드될 파일 폴더 경로를 설정
		factory.setRepository(currentDirPath);
		
		//파일 업로드할 메모리를 생성자 쪽으로 전달받아 저장하여 생성되는 파일업로드 기능을 처리할 객체생성
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		try {
		
		//입력한 문자열 정보들이 저장된 request객체 메모리를
		//ServletFileUpload객체의 parseRequest메소드 호출시
		//매개변수로 전달 하면 request객체 메모리에 저장된
		//요청하는 아이템들을 파싱(추출)해서 DiskFileItem객체에 각각 저장한 후 
		//DiskFileItem객체들을 ArrayList배열에 추가합니다.
		//그 후 ArrayList배열 자체를 반환 받습니다.
		List<FileItem> items = upload.parseRequest(request); //제네릭타입 FileItem추가
		
		//ArrayList가변 길이 배열의 크기만큼(DiskFileItem객체의 갯수만큼) 반복
		for(int i=0; i<items.size(); i++ ) {
		
		//ArrayList가변 배열에서.. DiskFileItem객체를 얻는다.
		FileItem fileItem = (FileItem)items.get(i);
		
		//DiskFileItem객체(요청한 아이템 하나의 정보)가 파일 아이템이 아닐경우
		if(fileItem.isFormField()) {
		System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
		
		articleMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
		}else {//DiskFileItem객체(요청한 아이템 하나의 정보)가 파일일 경우
		System.out.println("파라미터: "+fileItem.getFieldName());
		System.out.println("파일명: "+fileItem.getName());
		System.out.println("파일크기: "+fileItem.getSize() + "bytes");
		
		//업로드할 파일의 크기가 0보다 크다면?(업로드할 파일이 있다면?)
		if(fileItem.getSize() > 0) {
		
		//업로드할 파일명을 얻어 파일명의 뒤에서부터 \\문자열이 포함되어 있는지
		//index위치번호를 알려주는데 없으면 -1을 반환함
		int idx = fileItem.getName().lastIndexOf("\\");
		
		if(idx == -1) {//업로드할 파일명에 \\문자열이 포함되어 있지 않으면?
		
		idx = fileItem.getName().lastIndexOf("/");
		
		}
		
		//업로드할 파일명 얻기
		String fileName = fileItem.getName().substring(idx+1);

		//업로드할 파일 경로 + 파일명을 만들어서 그경로에 접근할 File객체 생성
		File uploadFile = new File(currentDirPath + "\\temp\\" + fileName);
		
		articleMap.put(fileItem.getFieldName(), fileName);
		//실제 위 경로에 파일 업로드
		fileItem.write(uploadFile);
		
		}
		}
		
		}
		
		}catch (Exception e) {
		e.printStackTrace();
		}
		
		
		return articleMap;
		}
	
		public int InsertBoard(HttpServletRequest request, 
									  HttpServletResponse response) throws Exception {
			TrainerBoardDAO dao = new TrainerBoardDAO();
			//업로드 후 업로드한 파일명을 담고 있는 해쉬맵을 반환 받는다.
			Map<String, String> articleMap = upload(request, response);
			
			//작성한 글 정보(업로드할 파일정보 포함)를 HashMap에서 꺼내오기
			String writer = articleMap.get("name"); //작성자(닉네임)
			String title = articleMap.get("title"); //제목
			String content = articleMap.get("content"); //내용
			String id = articleMap.get("id"); //글 작성자 아이디
			String file = articleMap.get("file"); //글을 작성할때 업로드 하기 위해 첨부한 파일명
			
			
			//요청한 값을 TrainerBoardVo객체의 각 변수에 저장
			TrainerBoardVo  vo = new TrainerBoardVo();
			vo.setTb_name(writer);
			vo.setTb_title(title);
			vo.setTb_content(content);
			vo.setTb_id(id);
			vo.setTb_file(file);
			
			//작성한 글 내용을 DB에 insert하고 추가 시킨 글의 글번호를 조회 후 반환 받습니다.
			//글번호 폴더를 생성하기 위해 글번호를 받아 저장할 변수
			int articleNO = dao.insertBoard(vo);
			
			if(file != null && file.length() != 0) {
				File srcFile = new File("C:\\file_repo\\temp\\"+file);
				File destDir = new File(request.getServletContext().getRealPath("\\uploadFile\\TrainerBoardFile\\tb_idx")+articleNO);
//				File destDir = new File("C:\\Users\\HP\\git\\neulbom\\WebContent\\uploadFile\\TrainerBoardFile\\tb_idx"+articleNO);
				
				//DB에 추가한 글에 대한 글번호를 조회해서 가져왔기 때문에 글 번호 폴더 생성
				destDir.mkdirs();
				
				//temp폴더에 업로드된 파일을 글번호폴더로 이동시키자
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			
			}
			return articleNO;
		}
		
		//게시판 모든 글 조회하는 메소드
		public ArrayList<TrainerBoardVo> boardListAll() { //TrainerBoardVo 제네릭타입 추가
			
			String sql = null;
			
			ArrayList<TrainerBoardVo> list = new ArrayList<>();
			
			
			try {
				con = ds.getConnection();
				sql = "select * from trainer_board order by tb_group asc";
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					TrainerBoardVo vo = new TrainerBoardVo(rs.getInt("tb_idx"),
											rs.getString("tb_id"),
											rs.getString("tb_name"),
											rs.getString("tb_title"), 
											rs.getString("tb_content"), 
											rs.getInt("tb_group"), 
											rs.getInt("tb_level"), 
											rs.getDate("tb_date"), 
											rs.getInt("tb_cnt"),
											rs.getString("tb_file")
											);
					list.add(vo);
				}
				
			} catch (Exception e) {
				System.out.println("boardListAll 메소드 내부에서 오류!");
				e.printStackTrace();
			} finally {
				closeResource();
			}
			
			
			
			return list;
		}
		
		
		public int getTotalRecord() {
			//조회된 글의 글수 저장
			int total = 0;
			
			try {
				con = ds.getConnection();
				
				pstmt = con.prepareStatement("select count(*) as cnt from trainer_board");
				rs = pstmt.executeQuery();
				rs.next();
				total = rs.getInt("cnt");
				System.out.println(total);
				
			} catch (Exception e) {
				System.out.println("getTotalRecord메소드 내부에서 오류!");
				e.printStackTrace();
			} finally {
				closeResource();
			}
			
			
			return total;
		}

		//글을 읽을때(fnRead)시 조회수가 늘어나게 만드는 메소드
		public TrainerBoardVo boardRead(HttpServletRequest request) {

			String tb_idx = request.getParameter("tb_idx");
			
			TrainerBoardVo vo = null;
			String sql = null;
			try {
				con = ds.getConnection();
				
				sql = "UPDATE trainer_board SET tb_cnt = tb_cnt +1 where tb_idx = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(tb_idx));
				pstmt.executeUpdate();
				
				
				sql = "select * from trainer_board where tb_idx = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(tb_idx));
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					vo = new TrainerBoardVo(rs.getInt("tb_idx"),  
										rs.getString("tb_id"), 
										rs.getString("tb_name"),
										rs.getString("tb_title"), 
										rs.getString("tb_content"), 
										rs.getInt("tb_group"), 
										rs.getInt("tb_level"), 
										rs.getDate("tb_date"), 
										rs.getInt("tb_cnt"),
										rs.getString("tb_file")
										);
										
					
				}
			}catch (Exception e) {
				System.out.println("boardRead메소드에서 SQL오류 : ");
				e.printStackTrace();
			}finally {
				closeResource();
			}
			
			return vo;
			 
		}

		public void downLoad(HttpServletResponse response, String filePath, String fileName) {
			
			
			try {
				File file = new File(filePath);
				byte b[] = new byte[(int) file.length()];
				
				//page의 ContentType등을 동적으로 바꾸기 위해 초기화 시킨다
				response.reset();
				response.setContentType("apllication/octet-stream"); //파일 확장자를 모를때 사용 8비트로 된 데이터
				
				//한글 인코딩
				String encoding = new String(fileName.getBytes("utf-8"));
				
				response.setHeader("Content-Disposition", "attachment;filename="+encoding);
				response.setHeader("content-Length", String.valueOf(file.length()));
				
				if (file.isFile()) { //파일이 있을 경우
					 FileInputStream fileInputStream = new FileInputStream(file);
					 ServletOutputStream servletOutputStream = response.getOutputStream();
					 
					 //파일을 읽어서 클라이언트쪽으로 저장한다
					 int readNum = 0;
					 while ( (readNum = fileInputStream.read(b)) != -1) {
		                    servletOutputStream.write(b, 0, readNum); //  b배열 안에 있는 시작 off(index) 부터 len 만큼 출력한다.
		                }
		                servletOutputStream.close();
		                fileInputStream.close();
				}
			} catch (Exception e) {
				System.out.println("download메소드에서 오류 발생");
				e.printStackTrace();
				
			} finally {
				closeResource();
			}
			
		}

		public TrainerBoardVo getReadPage(String tb_idx) {
			String sql = "";
			TrainerBoardVo vo = null;
			
			try {
				con = ds.getConnection();
				
				sql = "select * from trainer_board where tb_idx = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(tb_idx));
				rs=pstmt.executeQuery();
				while(rs.next()) {
					
					vo = new TrainerBoardVo(rs.getInt("tb_idx"),  
							rs.getString("tb_id"), 
							rs.getString("tb_name"),
							rs.getString("tb_title"), 
							rs.getString("tb_content"), 
							rs.getInt("tb_group"), 
							rs.getInt("tb_level"), 
							rs.getDate("tb_date"), 
							rs.getInt("tb_cnt"),
							rs.getString("tb_file")
							);
				}
				
			} catch (Exception e) {
				
			} finally {
				closeResource();
			}
			return vo;
		}

		public String deleteBoard(HttpServletRequest request) throws IOException {
			String delete_idx = request.getParameter("tb_idx");
			String delete_level = request.getParameter("tb_level");
			File deleteDir;
			if( Integer.parseInt(delete_level) > 0) {
				deleteDir = new File(request.getServletContext().getRealPath("\\uploadFile\\TrainerBoardFile\\reply_tb_idx") + delete_idx); 
			} else {
				deleteDir = new File(request.getServletContext().getRealPath("\\uploadFile\\TrainerBoardFile\\tb_idx") + delete_idx); 
			}
			//글삭제에 성공하면 "삭제성공" 반환 받고, 실패하면 "삭제실패" 반환 받음 
			String result = tbDBDelete(delete_idx);
			
			if(result.equals("삭제성공")) {
				
				if (deleteDir.exists()) {
					
					FileUtils.deleteDirectory(deleteDir);//글번호 폴더도 삭제
				}
			}
			return result; //글삭제에 성공하면 "삭제성공" 반환 , 실패하면 "삭제실패" 반환  
		}
			
	
		public String tbDBDelete(String tb_idx) {
			String result = null;
			
			try {
				con = ds.getConnection();
				
				String sql = "DELETE FROM Trainer_board WHERE tb_idx=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, tb_idx);
				int val = pstmt.executeUpdate();
				
				if(val == 1) {
					result = "삭제성공";
				}else {
					result = "삭제실패";
				}
				
				
			}catch (Exception e) {
				System.out.println("tbDBDelete메소드 내부에서 오류 ");
				e.printStackTrace();
			}finally {
				closeResource();
			}
			return result;
		}	
		

	public List<String> contentLink(String tb_content) {
		 tb_content
	    .replaceAll("&", "&amp;")
	    .replaceAll("<", "&lt;")
	    .replaceAll(">", "&gt;")
	    .replaceAll("\"", "&quot;")
	    .replaceAll("'", "&#39;"); //크롬에선 문제x entity 변환필요한 브라우저에선 주석 해제 필요
		Pattern pattern = Pattern.compile("src=\"(.*?)\""); //주어진 정규식을 갖는 패턴을 생성//src="http://localhost:8090/TeamProject/ckstorage/images/edu.png"
		Matcher matcher = pattern.matcher(tb_content); //패턴에 매칭할 문자열을 입력해 Matcher를 생성(인자에 검사할 문자열)
		List<String> imageUrls = new ArrayList<>(); //imageUrl을 저장할 배열 생성
		
		while (matcher.find()) { //패턴이 일치하는 다음 문자열을 찾는다. 다음 문자열이 있다면 true 
			//src="http://localhost:8090/TeamProject/ckstorage/images/edu.png"
			//src="http://localhost:8090/TeamProject/ckstorage/images/lessonlist.png"
		 String imageUrl = matcher.group(1); //String group(int group) 매칭되는 문자열 중 group번째 그룹의 문자열 반환
		//   System.out.println("matcher.group()값 : " +matcher.group()); // 패턴과 일치하는 모든 것, 그룹 0은 예약되어 있으며 항상 전체 일치 항목을 반환하는 반면 다른 모든 항목은 선택 사항이며 사용자가 정의
		//   System.out.println("matcher.group(1)값 : " +matcher.group(1)); //그룹 1: 시작 단어 와 끝 단어 사이의 숫자 
		 imageUrls.add(imageUrl);
		}
	
		
		return imageUrls;
	}


	//답변글 작성 메소드
	public void insertReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> rp_articleMap = upload(request,response);
		
		// 주글 (부모글) 글번호 + 작성한 답변글 내용 얻기
		String super_tb_idx = rp_articleMap.get("super_tb_idx");//부모 글번호
		String reply_id = rp_articleMap.get("id"); //답변글 작성자 아이디
		String reply_name = rp_articleMap.get("name"); //답변글 작성자 이름
		String reply_title = rp_articleMap.get("title"); //답변글 제목
		String reply_content = rp_articleMap.get("content"); //답변글 내용
		String reply_file = rp_articleMap.get("file"); //글을 작성할때 업로드 하기 위해 첨부한 파일명
		
		int rp_articleNO = replyInsertBoard(super_tb_idx,reply_id,reply_name,reply_title,reply_content,reply_file);
		
		if(reply_file != null && reply_file.length() != 0) {
			
			File srcFile = new File("C:\\file_repo\\temp\\"+reply_file);
			File destDir = new File(request.getServletContext().getRealPath("\\uploadFile\\TrainerBoardFile\\reply_tb_idx")+rp_articleNO); 
			
			destDir.mkdirs();
			
			FileUtils.moveFileToDirectory(srcFile, destDir, true);
		
		}
	
	}


	//답변글 db등록
	private int replyInsertBoard(String super_tb_idx, String reply_id, String reply_name, String reply_title,
			String reply_content, String reply_file) {

		int articleNO = getNewArticleNO(); 
		String sql = null;
		
		try {
			con = ds.getConnection();
			
			sql = "select tb_group, tb_level from trainer_board where tb_idx='"+super_tb_idx+"'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			
			String tb_group = rs.getString("tb_group");
			String tb_level = rs.getString("tb_level");
			
			sql = "update Trainer_board set tb_group = tb_group + 1 where tb_group > ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tb_group);
			pstmt.executeUpdate();
	
			sql = "insert into trainer_board (tb_idx, tb_id, tb_name, "
							+ " tb_title, tb_content, tb_group, "
							+ "tb_level, tb_date, tb_cnt, tb_file) "
							+ " values (?,?,?,?,?,?,?,sysdate,0,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleNO);
			pstmt.setString(2, reply_id);
			pstmt.setString(3, reply_name);
			pstmt.setString(4, reply_title);
			pstmt.setString(5, reply_content);
			pstmt.setInt(6, Integer.parseInt(tb_group)+1);
			pstmt.setInt(7, Integer.parseInt(tb_level)+1);
			pstmt.setString(8, reply_file);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("replyInsertBoard메소드 내부에서 오류 ");
			e.printStackTrace();
		} finally {
			closeResource();
		}
		
		return articleNO;
	}
	
	
}

