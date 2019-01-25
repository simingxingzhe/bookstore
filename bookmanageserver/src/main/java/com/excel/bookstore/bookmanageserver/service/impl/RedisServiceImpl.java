package com.excel.bookstore.bookmanageserver.service.impl;

import com.excel.bookstore.bookmanageserver.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

@Service
public class RedisServiceImpl implements RedisService {

  @Autowired
  private RedisTemplate<String, String> redisTemplate;
  @Override
  public void set(String id, String name) {
    ValueOperations<String,String> vo = redisTemplate.opsForValue();
    vo.set(id, name);
  }

  @Override
  public String get(String id) {
    ValueOperations<String, String> vo=redisTemplate.opsForValue();
    return vo.get(id);
  }

  @Override
  public void update(String id, String name) {
    ValueOperations<String,String> vo=redisTemplate.opsForValue();
    vo.set(id, name);

  }

  @Override
  public void delete(String id) {
    ValueOperations<String, String> vo=redisTemplate.opsForValue();
    vo.getOperations().delete(id);
  }

}

