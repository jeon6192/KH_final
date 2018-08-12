package com.naver.house.bean;

import java.util.Date;

public class Comment {
 private int commentNo;
 private int articleNo;
 private int admin_no;
 private String memo;
 private Date regdate;
 
 public int getCommentNo() {
  return commentNo;
 }
 public void setCommentNo(int commentNo) {
  this.commentNo = commentNo;
 }
 public int getArticleNo() {
  return articleNo;
 }
 public void setArticleNo(int articleNo) {
  this.articleNo = articleNo;
 }
 public int getAdmin_no() {
	return admin_no;
}
public void setAdmin_no(int admin_no) {
	this.admin_no = admin_no;
}
public String getMemo() {
  return memo;
 }
 public String getHtmlMemo() {
  if (memo != null) {
   return memo.replace(Article.ENTER, "<br />");
  }
  return null;
 }
 public void setMemo(String memo) {
  this.memo = memo;
 }
 public Date getRegdate() {
  return regdate;
 }
 public void setRegdate(Date regdate) {
  this.regdate = regdate;
 }
 
}
