package com.kdt.miniproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.miniproject.mapper.MainMapper;

@Service
public class MainService {
 
 @Autowired
 MainMapper mapper;

 public void all(){
  mapper.all();
 }
}
