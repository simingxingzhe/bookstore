package com.excel.bookstore.bookmanageserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class BookmanageserverApplication {

    public static void main(String[] args) {
        SpringApplication.run(BookmanageserverApplication.class, args);
    }

}

