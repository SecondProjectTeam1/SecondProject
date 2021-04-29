package com.sist.vo;

public class BooksCategoryVO {
   private String category;
   private int count;
   private int cno;

   public int getCno() {
      return cno;
   }

   public void setCno(int cno) {
      this.cno = cno;
   }

   public int getCount() {
      return count;
   }

   public void setCount(int count) {
      this.count = count;
   }

   public String getCategory() {
      return category;
   }

   public void setCategory(String category) {
      this.category = category;
   }
   
}