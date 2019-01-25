package com.excel.bookstore.bookmanageserver.controller;

import com.excel.bookstore.bookmanageserver.model.Cart;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.*;
import sun.nio.cs.UnicodeEncoder;

import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.LinkedHashMap;

/**
 *
 */
@RestController
public class RedisController {

  @Autowired
  private StringRedisTemplate stringRedisTemplate;

  //添加
  @RequestMapping(value="/addCart")
  @CrossOrigin
  public void addCart(String ID, String name, String list){
    System.out.println("addCart");

    System.out.println(ID);
    System.out.println(name);
    System.out.println(list);
    System.out.println(URLDecoder.decode(list));
    System.out.println(URLEncoder.encode(list));
    stringRedisTemplate.opsForValue().set("cart","test");
    System.out.println("end");
  }


  @RequestMapping(value="/test",method = RequestMethod.POST)
  @CrossOrigin
  public void test(@RequestBody Object cart){
    System.out.println("test");
    LinkedHashMap map = (LinkedHashMap) cart;
    JSONPObject json = (JSONPObject)map.get("cart");
    System.out.println(json);
    System.out.println(map.get("cart"));

    System.out.println("end");
  }


  //添加
  @RequestMapping(value="/editCart")
  public void editCart(){
    stringRedisTemplate.opsForValue().set("cart","test");
  }


  //获取
  @RequestMapping(value="/cartList")
  public String cartList(){
    return stringRedisTemplate.opsForValue().get("cart");
  }


}
