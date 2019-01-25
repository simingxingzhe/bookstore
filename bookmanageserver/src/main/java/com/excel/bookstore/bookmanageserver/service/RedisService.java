package com.excel.bookstore.bookmanageserver.service;

public interface RedisService {
  //add
  public void set(String id, String name);
  //select
  public String get(String id);
  //update
  public void update(String id,String name);
  //delete
  public void delete(String id);
}
