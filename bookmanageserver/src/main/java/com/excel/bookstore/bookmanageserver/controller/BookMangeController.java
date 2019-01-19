package com.excel.bookstore.bookmanageserver.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BookMangeController {
    @Value("${spring.application.name}")
    public String appName;
    @Value("${spring.cloud.config.uri}")
    public String configUri;
    @Value("${spring.cloud.config.profile}")
    public String configProfile;
    @Value("${spring.cloud.config.label}")
    public String configLabel;
    @Value("${com.springcloud.book.config}")
    public String configSpring;
    //@Autowired
    //private Environment env;
    @RequestMapping(value="/")
    public String index() {
        return "Hello, welcome to our book store!";
    }
    @RequestMapping("/desc")
    public String config() {
        //String springCloud = env.getProperty("springcloud");
        return appName + ":"+configUri+ ":" +configProfile + ":" +configLabel +"\n" + configSpring;
    }
}
