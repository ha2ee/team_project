package VO;

import java.util.Date;

public class ReviewVo {
  int idx;
  String id, img, imgRealName,title,context;
  Date review_date;
  
  public ReviewVo() {
  }

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getImg() {
    return img;
  }

  public void setImg(String img) {
    this.img = img;
  }

  public String getImgRealName() {
    return imgRealName;
  }

  public void setImgRealName(String imgRealName) {
    this.imgRealName = imgRealName;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContext() {
    return context;
  }

  public void setContext(String context) {
    this.context = context;
  }

  public Date getReview_date() {
    return review_date;
  }

  public void setReview_date(Date review_date) {
    this.review_date = review_date;
  }

  
}
