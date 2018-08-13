package com.naver.house.controller;
 
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.naver.house.bean.Article;
import com.naver.house.bean.AttachFile;
import com.naver.house.bean.Comment;
import com.naver.house.bean.PagingHelper;
import com.naver.house.bean.WebContants;
import com.naver.house.service.BoardService;
 
@Controller
public class BbsController {
 
    @Autowired
    private BoardService boardService;
   
    @RequestMapping(value="/list.nhn", method={RequestMethod.GET, RequestMethod.POST})
    public String list(String boardCd,
      Integer curPage,
      String searchWord,
      Model model) throws Exception{
       
     if (boardCd == null) boardCd = "free";
     if (curPage == null) curPage = 1;
     if (searchWord == null) searchWord = "";
     
     int numPerPage = 10;// 페이지당 레코드 수 지정
     int pagePerBlock = 10;// 페이지 링크의 그룹(block)의 크기 지정
     
     int totalRecord = boardService.getTotalRecord(boardCd, searchWord);
     
     PagingHelper pagingHelper = new PagingHelper(totalRecord, curPage, numPerPage, pagePerBlock);  
     boardService.setPagingHelper(pagingHelper);
     
     int start = pagingHelper.getStartRecord();
     int end = pagingHelper.getEndRecord();

     ArrayList<Article> list = boardService.getArticleList(boardCd, searchWord, start, end);
     String boardNm = boardService.getBoardNm(boardCd);
     Integer no = boardService.getListNo();
     Integer prevLink = boardService.getPrevLink();
     Integer nextLink = boardService.getNextLink();
     Integer firstPage = boardService.getFirstPage();
     Integer lastPage = boardService.getLastPage();
     int[] pageLinks = boardService.getPageLinks();
     
     // 목록을 위한 데이터
     model.addAttribute("list", list);
     model.addAttribute("boardNm", boardNm);
     model.addAttribute("boardCd", boardCd);//boardCd는 null 값이면 free로 만들어야 하므로
     
     model.addAttribute("no", no);
     model.addAttribute("prevLink", prevLink);
     model.addAttribute("nextLink", nextLink);
     model.addAttribute("firstPage", firstPage);
     model.addAttribute("lastPage", lastPage);
     model.addAttribute("pageLinks", pageLinks);
     model.addAttribute("curPage", curPage);//curPage는 null 값이면 1로 만들어야 하므로
    
     return "bbs/list"; 
    }
    
    @RequestMapping(value="/hit_list.nhn", method={RequestMethod.GET, RequestMethod.POST})
    public String list1(String boardCd,
      Integer curPage,
      String searchWord,
      Model model) throws Exception{
       
     if (boardCd == null) boardCd = "free";
     if (curPage == null) curPage = 1;
     if (searchWord == null) searchWord = "";
     
     int numPerPage = 5;// 페이지당 레코드 수 지정
     int pagePerBlock = 5;// 페이지 링크의 그룹(block)의 크기 지정
     
     int totalRecord = boardService.getTotalRecord1(boardCd, searchWord);
     
     PagingHelper pagingHelper = new PagingHelper(totalRecord, curPage, numPerPage, pagePerBlock);  
     boardService.setPagingHelper(pagingHelper);
     
     int start = pagingHelper.getStartRecord();
     int end = pagingHelper.getEndRecord();

     ArrayList<Article> list = boardService.getHitList(boardCd, searchWord, start, end);
     String boardNm = boardService.getBoardNm(boardCd);
     Integer no = boardService.getListNo();
     Integer prevLink = boardService.getPrevLink();
     Integer nextLink = boardService.getNextLink();
     Integer firstPage = boardService.getFirstPage();
     Integer lastPage = boardService.getLastPage();
     int[] pageLinks = boardService.getPageLinks();
     
     // 목록을 위한 데이터
     model.addAttribute("hit_list", list);
     model.addAttribute("boardNm", boardNm);
     model.addAttribute("boardCd", boardCd);//boardCd는 null 값이면 free로 만들어야 하므로
     
     model.addAttribute("no", no);
     model.addAttribute("prevLink", prevLink);
     model.addAttribute("nextLink", nextLink);
     model.addAttribute("firstPage", firstPage);
     model.addAttribute("lastPage", lastPage);
     model.addAttribute("pageLinks", pageLinks);
     model.addAttribute("curPage", curPage);//curPage는 null 값이면 1로 만들어야 하므로
     
     return "inc/hit_list"; 
    }
    
    @RequestMapping(value="/write.nhn", method=RequestMethod.GET)
    public String write(String boardCd, Model model) throws Exception {
       
        //게시판 이름
        String boardNm = boardService.getBoardNm(boardCd);
        model.addAttribute("boardNm", boardNm);
       
        return "bbs/writeform";
    }
   
    @RequestMapping(value="/write", method=RequestMethod.POST)
    public String write(Article article,
      MultipartHttpServletRequest mpRequest, String id,HttpServletRequest request) throws Exception {
      HttpSession session=request.getSession();
      id=(String) session.getAttribute("id");
     article.setId(id);
     boardService.insert(article);
     article.setArticleNo(boardService.getNewArticle().getArticleNo());
     
     //파일업로드
     List<MultipartFile> fileList = mpRequest.getFiles("upload");        
      
     System.out.println("업로드 파일 갯수 = " + fileList.size() );
    
     
     for(MultipartFile mf : fileList){
      String filename = mf.getOriginalFilename();
     
      if(filename.equals("")) {
    	  System.out.println("업로드 파일 이름 ('') " + filename);
    	  break;
      }
      mf.transferTo(new File(WebContants.BASE_PATH + filename));
     }
     

     //파일데이터 삽입
     int size = fileList.size();
     for (int i = 0; i < size; i++) {
      MultipartFile mpFile = fileList.get(i);
      AttachFile attachFile = new AttachFile();
      String filename = mpFile.getOriginalFilename();
      attachFile.setFilename(filename);
      attachFile.setFiletype(mpFile.getContentType());
      attachFile.setFilesize(mpFile.getSize());
      attachFile.setArticleNo(article.getArticleNo());
      if(attachFile.getFilesize() == 0) {
      attachFile.setArticleNo(0);
      attachFile.setAttachFileNo(0);
    }
      boardService.insertAttachFile(attachFile);
     }     
     
     return "redirect:/list.nhn?boardCd=" + article.getBoardCd();
    }

    
    
    @RequestMapping(value="/view.nhn", method=RequestMethod.GET)

    public String view(int articleNo,
      String boardCd,
      @RequestParam (value ="curPage", defaultValue = "1" )Integer curPage,
      String searchWord,
      Model model, String id,HttpServletRequest request,Article article) throws Exception {
     
     int numPerPage = 10;// 페이지당 레코드 수 지정
     int pagePerBlock = 10;// 페이지 링크의 그룹(block)의 크기 지정
     if (searchWord == null) searchWord = ""; // 검색어가 null 이면 ""으로 변경 

     //목록보기
     int totalRecord = boardService.getTotalRecord(boardCd, searchWord);
     System.out.println(curPage);
     PagingHelper pagingHelper = new PagingHelper(totalRecord, curPage, numPerPage, pagePerBlock);  
     boardService.setPagingHelper(pagingHelper);
     
     int start = pagingHelper.getStartRecord();
     int end = pagingHelper.getEndRecord();

     ArrayList<Article> list = boardService.getArticleList(boardCd, searchWord, start, end);
     String boardNm = boardService.getBoardNm(boardCd);
     Integer no = boardService.getListNo();
     Integer prevLink = boardService.getPrevLink();
     Integer nextLink = boardService.getNextLink();
     Integer firstPage = boardService.getFirstPage();
     Integer lastPage = boardService.getLastPage();
     int[] pageLinks = boardService.getPageLinks();
     
     // 목록을 위한 데이터
     model.addAttribute("list", list);
     model.addAttribute("boardNm", boardNm);
     
     model.addAttribute("no", no);
     model.addAttribute("prevLink", prevLink);
     model.addAttribute("nextLink", nextLink);
     model.addAttribute("firstPage", firstPage);
     model.addAttribute("lastPage", lastPage);
     model.addAttribute("pageLinks", pageLinks);
     
     boardService.increaseHit(articleNo);//조회수 증가
     
     HttpSession session=request.getSession();
 	id=(String) session.getAttribute("id");
 	article.setId(id);
 	article.setArticleNo(boardService.getNewArticle().getArticleNo());
  
     //상세보기
     Article thisArticle = boardService.getArticle(articleNo);
     Article prevArticle = boardService.getPrevArticle(articleNo, boardCd, searchWord);
     Article nextArticle = boardService.getNextArticle(articleNo, boardCd, searchWord);
     ArrayList<AttachFile> attachFileList = boardService.getAttachFileList(articleNo);
     System.out.println(attachFileList);
     ArrayList<Comment> commentList = boardService.getCommentList(articleNo);

     model.addAttribute("thisArticle", thisArticle);
     model.addAttribute("prevArticle", prevArticle);
     model.addAttribute("nextArticle", nextArticle);
     model.addAttribute("attachFileList", attachFileList);
     model.addAttribute("commentList", commentList);
     
     return "bbs/view";
    }
    
    @RequestMapping(value="/commentAdd", method=RequestMethod.POST)
    public String commentAdd(Integer articleNo, 
      String boardCd, 
      Integer curPage, 
      String searchWord, 
      String memo, /*int admin_no,*/HttpServletRequest request) throws Exception {
      
     Comment comment = new Comment();
     comment.setMemo(memo);
     comment.setArticleNo(articleNo);
     boardService.insertComment(comment);
     
/*  	HttpSession session=request.getSession();
	admin_no=(int) session.getAttribute("admin_no");
	comment.setAdmin_no(admin_no);
	boardService.insertComment(comment);
	comment.setArticleNo(boardService.getNewArticle().getArticleNo());*/
     //searchWord = URLEncoder.encode(searchWord,"UTF-8");
     
     return "redirect:/view.nhn?articleNo=" + articleNo + 
      "&boardCd=" + boardCd + 
      "&curPage=" + curPage + 
      "&searchWord=" + searchWord;

    }

    @RequestMapping(value="/commentUpdate", method=RequestMethod.POST)
    public String commentUpdate(Integer commentNo, 
      Integer articleNo, 
      String boardCd, 
      Integer curPage, 
      String searchWord, 
      String memo) throws Exception {
      
     Comment comment = boardService.getComment(commentNo);
     comment.setMemo(memo);
     boardService.updateComment(comment);
     //searchWord = URLEncoder.encode(searchWord, "UTF-8");
     
     return "redirect:/view.nhn?articleNo=" + articleNo + 
      "&boardCd=" + boardCd + 
      "&curPage=" + curPage + 
      "&searchWord=" + searchWord;

    }

    @RequestMapping(value="/commentDel", method=RequestMethod.POST)
    public String commentDel(Integer commentNo, 
      Integer articleNo, 
      String boardCd, 
      Integer curPage, 
      String searchWord) throws Exception {
      
     boardService.deleteComment(commentNo);
     
     //searchWord = URLEncoder.encode(searchWord,"UTF-8");
     
     return "redirect:/view.nhn?articleNo=" + articleNo + 
      "&boardCd=" + boardCd + 
      "&curPage=" + curPage + 
      "&searchWord=" + searchWord;

    }

    @RequestMapping(value="/delete", method=RequestMethod.POST)
    public String delete(int articleNo, 
      String boardCd,
      Integer curPage, 
      String searchWord) throws Exception {
     
     boardService.delete(articleNo);
     
     return "redirect:/list.nhn?boardCd=" + boardCd + 
     "&curPage=" + curPage + 
     "&searchWord=" + searchWord;
    } 
   
    @RequestMapping(value="/modify.nhn", method=RequestMethod.GET)
    public String update(int articleNo,
            String boardCd,
            Model model) throws Exception {
       
        Article thisArticle = boardService.getArticle(articleNo);
        String boardNm = boardService.getBoardNm(boardCd);
         
        //수정페이지에서 보일 게시글 정보
        model.addAttribute("thisArticle", thisArticle);
        model.addAttribute("boardNm", boardNm);
       
        return "bbs/modifyForm";
    }
   
    @RequestMapping(value="/modify", method=RequestMethod.POST)
    public String update(Article article,
      Integer curPage,
      String boardCd,
      String searchWord,
      Model model,
      MultipartHttpServletRequest mpRequest) throws Exception {

     boardService.update(article);
     
     //파일업로드
     List<MultipartFile> fileList = mpRequest.getFiles("upload");
     for(MultipartFile mf : fileList){
      String filename = mf.getOriginalFilename();
      mf.transferTo(new File(WebContants.BASE_PATH + filename));
     }
     
     //파일데이터 삽입
     int size = fileList.size();
     for (int i = 0; i < size; i++) {
      MultipartFile mpFile = fileList.get(i);
      AttachFile attachFile = new AttachFile();
      String filename = mpFile.getOriginalFilename();
      attachFile.setFilename(filename);
      attachFile.setFiletype(mpFile.getContentType());
      attachFile.setFilesize(mpFile.getSize());
      attachFile.setArticleNo(article.getArticleNo());
      boardService.insertAttachFile(attachFile);
     }  
     return "redirect:/view.nhn?articleNo=" + article.getArticleNo() + 
    		    "&boardCd=" + article.getBoardCd() + 
    		    "&curPage=" + curPage +
    		    "&searchWord=" + searchWord;
    		 }
    
    @RequestMapping(value="/download", method=RequestMethod.POST)
    public String download(String filename, Model model){
     model.addAttribute("filename", filename);
     return "inc/download";
    }
    
    @RequestMapping(value="/attachFileDel", method=RequestMethod.POST)
    public String attachFileDel(Integer attachFileNo, 
      Integer articleNo, 
      String boardCd, 
      Integer curPage, 
      String searchWord) throws Exception {
     
     boardService.deleteFile(attachFileNo);
     
     //searchWord = URLEncoder.encode(searchWord,"UTF-8");
     
     return "redirect:/view.nhn?articleNo=" + articleNo + 
      "&boardCd=" + boardCd + 
      "&curPage=" + curPage + 
      "&searchWord=" + searchWord;

    }

}