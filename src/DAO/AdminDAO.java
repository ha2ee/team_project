package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import VO.FreeBoardVo;
import VO.MemberVo;
import VO.PetVo;
import VO.TrainerBoardVo;
import VO.TrainerVo;

public class AdminDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;

	// Vo
	MemberVo memberVO;
	TrainerVo trainerVO;
	PetVo petVO;

	public AdminDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

		} catch (Exception e) {
			System.out.println("DB연결 실패! - " + e);
		}
	}

	// 자원해제 기능
	private void closeResource() {
		if (con != null)
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		if (rs != null)
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

	// 모든 회원 조회
	public List<MemberVo> selectAllMember () {
		 List<MemberVo> list = new ArrayList<>();
		 
		 try {
            con = ds.getConnection();
            String query = "SELECT * from ys_member";
            pstmt = con.prepareStatement(query);
            rs = pstmt.executeQuery();
            while(rs.next()) {
            	memberVO = new MemberVo();
            	memberVO.setMem_id(rs.getString("mem_id"));
            	memberVO.setMem_name(rs.getString("mem_name"));
            	memberVO.setMem_nick(rs.getString("mem_nick"));
            	memberVO.setMem_img(rs.getString("mem_img"));
            	memberVO.setMem_pw(rs.getString("mem_pw"));
            	memberVO.setMem_email(rs.getString("mem_email"));
            	memberVO.setMem_hp(rs.getString("mem_hp"));
            	memberVO.setMem_birth(rs.getString("mem_birth"));
            	memberVO.setMem_gender(rs.getString("mem_gender"));
            	memberVO.setMem_joindate(rs.getDate("mem_joindate"));
            	memberVO.setMem_pet(rs.getString("mem_pet"));
            	memberVO.setMem_address1(rs.getString("mem_address1"));
            	memberVO.setMem_address2(rs.getString("mem_address2"));
            	memberVO.setMem_address3(rs.getString("mem_address3"));
            	memberVO.setMem_address4(rs.getString("mem_address4"));
            	memberVO.setMem_address5(rs.getString("mem_address5"));
            	list.add(memberVO);
            }
		 }catch (SQLException e) {
			System.out.println("selectAllMember메소드에서 오류");
			e.printStackTrace();
			
		} finally {
			closeResource();
		}
		 return list;
	}	
	
	// 모든 회원 조회
	public List<TrainerVo> selectTrAllMember () {
		 List<TrainerVo> list = new ArrayList<>();
		 
		 try {
            con = ds.getConnection();
            String query = "SELECT * from member_trainer";
            pstmt = con.prepareStatement(query);
            rs = pstmt.executeQuery();
            while(rs.next()) {
            	trainerVO = new TrainerVo();
            	trainerVO.setTr_id(rs.getString("tr_id"));
            	trainerVO.setTr_name(rs.getString("tr_name"));
            	trainerVO.setTr_img(rs.getString("tr_img"));
            	trainerVO.setTr_pw(rs.getString("tr_pw"));
            	trainerVO.setTr_email(rs.getString("tr_email"));
            	trainerVO.setTr_hp(rs.getString("tr_hp"));
            	trainerVO.setTr_birth(rs.getString("tr_birth"));
            	trainerVO.setTr_gender(rs.getString("tr_gender"));
            	trainerVO.setTr_joindate(rs.getDate("tr_joindate"));
            	trainerVO.setTr_address1(rs.getString("tr_address1"));
            	trainerVO.setTr_address2(rs.getString("tr_address2"));
            	trainerVO.setTr_address3(rs.getString("tr_address3"));
            	trainerVO.setTr_address4(rs.getString("tr_address4"));
            	trainerVO.setTr_address5(rs.getString("tr_address5"));
            	list.add(trainerVO);
            }
		 }catch (SQLException e) {
			System.out.println("selectAllMember메소드에서 오류");
			e.printStackTrace();
			
		} finally {
			closeResource();
		}
		 return list;
	}		
	
	//자유게시판 모든 글 조회
	public ArrayList<FreeBoardVo> fbListAll() {
	    ArrayList<FreeBoardVo> list = new ArrayList<>();
	    FreeBoardVo vo;
	    try {
	      con = ds.getConnection();

	      String sql = "SELECT * FROM FREE_BOARD order by b_idx desc";

	      pstmt = con.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      while (rs.next()) {
	        vo = new FreeBoardVo(
	                             rs.getInt("b_idx"),
	                             rs.getString("b_id"), 
	                             rs.getString("b_nickname"),
	                             rs.getString("b_title"), 
	                             rs.getString("b_content"), 
	                             rs.getDate("b_date"),
	                             rs.getInt("b_cnt"), 
	                             rs.getString("b_file"),
	                             rs.getString("b_realfile") ,
	                             rs.getInt("b_like")
	                             );
	        list.add(vo);
	      }

	    } catch (Exception e) {
	      System.out.println("fbListAll 메소드에서 에러가 발생하였습니다. 이유는 ? --> " + e);
	      e.printStackTrace();
	    } finally {
	      closeResource();
	    }
	    return list;
	  }
	
	
	
	
	//일반회원 닉네임 체크
	public boolean checkMemNick(String nick) {
		
		boolean memResult = false;
		try {
			con = ds.getConnection();
			
			String sql = "SELECT MEM_NICK FROM YS_MEMBER WHERE MEM_NICK=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nick);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memResult = true;
			}
			
		} catch (Exception e) {
			System.out.println("memCheck 메소드 내부에서 오류!");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		return memResult;
	}
	 
		
	//일반회원 정보 수정
	public void memUpdate(MemberVo vo) {
		
		try {
			con = ds.getConnection();
			
			String query = "update YS_MEMBER set MEM_NICK='" + vo.getMem_nick() + "',"
						                     + " MEM_PW='" + vo.getMem_pw() + "',"
						                     + " MEM_EMAIL='" + vo.getMem_email() + "',"
						                     + " MEM_HP='" + vo.getMem_hp() + "',"
				  						     + " MEM_ADDRESS1='" + vo.getMem_address1() + "',"
										 	 + " MEM_ADDRESS2='" + vo.getMem_address2() + "',"
										 	 + " MEM_ADDRESS3='" + vo.getMem_address3() + "',"
										 	 + " MEM_ADDRESS4='" + vo.getMem_address4() + "',"
										 	 + " MEM_ADDRESS5='" + vo.getMem_address5() + "'"
						                     + " WHERE MEM_ID ='"+ vo.getMem_id() +"'";
			pstmt = con.prepareStatement(query);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				closeResource();
		}
	}

	//트레이너 정보 수정
		public void trUpdate(TrainerVo vo) {
			
			try {
				con = ds.getConnection();
				
				String query = "update MEMBER_TRAINER set TR_PW='" + vo.getTr_pw() + "',"
													  + " TR_EMAIL='" + vo.getTr_email() + "',"
													  + " TR_HP='" + vo.getTr_hp() + "',"
	            					   				  + " TR_ADDRESS1='" + vo.getTr_address1() + "',"
	            					   				  + " TR_ADDRESS2='" + vo.getTr_address2() + "',"
	            					   				  + " TR_ADDRESS3='" + vo.getTr_address3() + "',"
	            					   				  + " TR_ADDRESS4='" + vo.getTr_address4() + "',"
	            					   				  + " TR_ADDRESS5='" + vo.getTr_address5() + "'"
													  + " WHERE TR_ID ='"+ vo.getTr_id() +"'";
				pstmt = con.prepareStatement(query);
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
					closeResource();
			}
		}
		
	//훈련사 상담 게시판 글 목록 6개 가져오기
		 public ArrayList<TrainerBoardVo> getBoardList()
		    {
		        ArrayList<TrainerBoardVo> list = new ArrayList<>();
		        
		        try {
		            con = ds.getConnection();
		            StringBuffer sql = new StringBuffer();
		            
		            // 글목록 전체를 보여줄 때
		                // tb_group(그룹번호)의 내림차순 정렬 후 동일한 그룹번호일 때는
		                // tb_level(답변글 순서)의 오름차순으로 정렬 한 후에
		                // 10개의 글을 한 화면에 보여주는(start번째 부터 start+9까지) 쿼리
		                // desc : 내림차순, asc : 오름차순 ( 생략 가능 )
		                
		                sql.append("select * from ");
		                sql.append("(select rownum rnum, Tb_idx, Tb_ID, Tb_name");
		                sql.append(", TB_TITLE, TB_CONTENT, TB_GROUP, TB_LEVEL, TB_DATE, TB_CNT, TB_FILE");
		                sql.append(" FROM ");
		                sql.append("(select * from Trainer_board order by TB_GROUP)) ");
		                sql.append("where rnum>=? and rnum<=?");
		                
		                
		                pstmt = con.prepareStatement(sql.toString());
		                pstmt.setInt(1, 1);
		                pstmt.setInt(2, 8);
		                
		                // StringBuffer를 비운다.
		                sql.delete(0, sql.toString().length());
		                
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
		        	e.printStackTrace();
		        } finally {
		        	closeResource();
		        }
		        return list;
		    }
		
	//최근 회원 6명만 가져오기
		//회원 목록 가져오기
		    public ArrayList<MemberVo> getMemberListMain()
		    {
		        ArrayList<MemberVo> list = new ArrayList<>();
		        
		        try {
		            con = ds.getConnection();
		            StringBuffer sql = new StringBuffer();
		            
		            // 아이디 전체를 보여줄 때
		                sql.append("select * from ");
		                sql.append("(select rownum rnum, MEM_ID, MEM_NAME, MEM_NICK");
		                sql.append(", MEM_IMG, MEM_PW, MEM_EMAIL, MEM_HP, MEM_BIRTH, MEM_GENDER, MEM_JOINDATE");
		                sql.append(", MEM_PET, MEM_ADDRESS1, MEM_ADDRESS2, MEM_ADDRESS3, MEM_ADDRESS4, MEM_ADDRESS5");
		                sql.append(" FROM ");
		                sql.append("(select * from YS_MEMBER order by MEM_NAME)) ");
		                sql.append("where rnum>=? and rnum<=?");
		                pstmt = con.prepareStatement(sql.toString());
		                pstmt.setInt(1, 1);
		                pstmt.setInt(2, 8);
		                
		                // StringBuffer를 비운다.
		                sql.delete(0, sql.toString().length());		 
		                // StringBuffer를 비운다.
		                sql.delete(0, sql.toString().length());
		                
		                rs = pstmt.executeQuery();
		                while(rs.next())
		                {
		                	memberVO = new MemberVo();
		                	memberVO.setMem_id(rs.getString("mem_id"));
		                	memberVO.setMem_name(rs.getString("mem_name"));
		                	memberVO.setMem_nick(rs.getString("mem_nick"));
		                	memberVO.setMem_img(rs.getString("mem_img"));
		                	memberVO.setMem_pw(rs.getString("mem_pw"));
		                	memberVO.setMem_email(rs.getString("mem_email"));
		                	memberVO.setMem_hp(rs.getString("mem_hp"));
		                	memberVO.setMem_birth(rs.getString("mem_birth"));
		                	memberVO.setMem_gender(rs.getString("mem_gender"));
		                	memberVO.setMem_joindate(rs.getDate("mem_joindate"));
		                	memberVO.setMem_pet(rs.getString("mem_pet"));
		                	memberVO.setMem_address1(rs.getString("mem_address1"));
		                	memberVO.setMem_address2(rs.getString("mem_address2"));
		                	memberVO.setMem_address3(rs.getString("mem_address3"));
		                	memberVO.setMem_address4(rs.getString("mem_address4"));
		                	memberVO.setMem_address5(rs.getString("mem_address5"));
		                	list.add(memberVO);
		                }
		        } catch (Exception e) {
		        	e.printStackTrace();
		        } finally {
		        	closeResource();
		        }
		        return list;
		    }
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
	//회원 삭제 기능
	public void delMem(String id) {
		String sql ="";
		int total = 0;
		try {
			con = ds.getConnection();
			sql = "select count(*) as cnt from ys_member where mem_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt("cnt");
			
			if(total == 1) {
				sql = "delete from ys_member where mem_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
			} else {
				sql = "delete from Member_trainer where tr_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResource();
		}
	}

	public void delImg(String delImgId) {
		String sql ="";
		int total = 0;
		try {
			con = ds.getConnection();
			sql = "select count(*) as cnt from ys_member where mem_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delImgId);
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt("cnt");
			
			if(total == 1) {
				sql = "update ys_member set mem_img = 'profile.png' where mem_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, delImgId);
				pstmt.executeUpdate();
			} else {
				sql = "update Member_trainer set tr_img = 'profile.png' where tr_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, delImgId);
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResource();
		}
	}
	
	
	
	//회원 목록 가져오기
    public ArrayList<MemberVo> getMemberList(HashMap<String, Object> listOpt)
    {
        ArrayList<MemberVo> list = new ArrayList<>();
        
        String opt = (String)listOpt.get("opt"); // 검색옵션(제목, 내용, 글쓴이 등..)
        String condition = (String)listOpt.get("condition"); // 검색내용
        int start = (Integer)listOpt.get("start"); // 현재 페이지번호
        
        try {
            con = ds.getConnection();
            StringBuffer sql = new StringBuffer();
            
            // 아이디 전체를 보여줄 때
            if(opt == null)
            {
                
                sql.append("select * from ");
                sql.append("(select rownum rnum, MEM_ID, MEM_NAME, MEM_NICK");
                sql.append(", MEM_IMG, MEM_PW, MEM_EMAIL, MEM_HP, MEM_BIRTH, MEM_GENDER, MEM_JOINDATE");
                sql.append(", MEM_PET, MEM_ADDRESS1, MEM_ADDRESS2, MEM_ADDRESS3, MEM_ADDRESS4, MEM_ADDRESS5");
                sql.append(" FROM ");
                sql.append("(select * from YS_MEMBER order by MEM_NAME)) ");
                sql.append("where rnum>=? and rnum<=?");
                
                
                pstmt = con.prepareStatement(sql.toString());
                pstmt.setInt(1, start);
                pstmt.setInt(2, start+9);
                
                // StringBuffer를 비운다.
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("0")) // 아이디로 검색
            {
                
                sql.append("select * from ");
                sql.append("(select rownum rnum, MEM_ID, MEM_NAME, MEM_NICK");
                sql.append(", MEM_IMG, MEM_PW, MEM_EMAIL, MEM_HP, MEM_BIRTH, MEM_GENDER, MEM_JOINDATE");
                sql.append(", MEM_PET, MEM_ADDRESS1, MEM_ADDRESS2, MEM_ADDRESS3, MEM_ADDRESS4, MEM_ADDRESS5");
                sql.append(" FROM ");
                sql.append("(select * from YS_MEMBER where MEM_ID like ? ");
                sql.append("order BY MEM_NAME )) ");
                sql.append("where rnum>=? and rnum<=?");
                
                pstmt = con.prepareStatement(sql.toString());
                pstmt.setString(1, "%"+condition+"%");
                pstmt.setInt(2, start);
                pstmt.setInt(3, start+9);
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("1")) // 펫유무로 검색
            {
                
                sql.append("select * from ");
                sql.append("(select rownum rnum, MEM_ID, MEM_NAME, MEM_NICK");
                sql.append(", MEM_IMG, MEM_PW, MEM_EMAIL, MEM_HP, MEM_BIRTH, MEM_GENDER, MEM_JOINDATE");
                sql.append(", MEM_PET, MEM_ADDRESS1, MEM_ADDRESS2, MEM_ADDRESS3, MEM_ADDRESS4, MEM_ADDRESS5");
                sql.append(" FROM ");
                sql.append("(select * from YS_MEMBER where MEM_PET like ? ");
                sql.append("order BY YS_MEMBER )) ");
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
            	memberVO = new MemberVo();
            	memberVO.setMem_id(rs.getString("mem_id"));
            	memberVO.setMem_name(rs.getString("mem_name"));
            	memberVO.setMem_nick(rs.getString("mem_nick"));
            	memberVO.setMem_img(rs.getString("mem_img"));
            	memberVO.setMem_pw(rs.getString("mem_pw"));
            	memberVO.setMem_email(rs.getString("mem_email"));
            	memberVO.setMem_hp(rs.getString("mem_hp"));
            	memberVO.setMem_birth(rs.getString("mem_birth"));
            	memberVO.setMem_gender(rs.getString("mem_gender"));
            	memberVO.setMem_joindate(rs.getDate("mem_joindate"));
            	memberVO.setMem_pet(rs.getString("mem_pet"));
            	memberVO.setMem_address1(rs.getString("mem_address1"));
            	memberVO.setMem_address2(rs.getString("mem_address2"));
            	memberVO.setMem_address3(rs.getString("mem_address3"));
            	memberVO.setMem_address4(rs.getString("mem_address4"));
            	memberVO.setMem_address5(rs.getString("mem_address5"));
            	list.add(memberVO);
            }
            
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
        
        closeResource();
        return list;
    } // end getMemberList
    
    
    
 // 글의 개수를 가져오는 메서드
    public int getMemberListCount(HashMap<String, Object> listOpt)
    {
        int result = 0;
        String opt = (String)listOpt.get("opt"); // 검색옵션(제목, 내용, 글쓴이 등..)
        String condition = (String)listOpt.get("condition"); // 검색내용
        
        try {
            con = ds.getConnection();
            StringBuffer sql = new StringBuffer();
            
            if(opt == null)    // 전체글의 개수
            {
                sql.append("select count(*) from ys_member");
                pstmt = con.prepareStatement(sql.toString());
                
                // StringBuffer를 비운다.
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("0")) // 아이디로 검색한 멤버 수
            {
                sql.append("select count(*) from ys_member where mem_id like ?");
                pstmt = con.prepareStatement(sql.toString());
                pstmt.setString(1, '%'+condition+'%');
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("1")) // 펫 유무로 검색한 멤버 수
            {
                sql.append("select count(*) from ys_member where mem_pet like ?");
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
    } // end getMemberListCount

}
