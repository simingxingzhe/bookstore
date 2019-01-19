package com.excel.bookstore.bookmanageserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableDiscoveryClient
public class BookmanageserverApplication {

    public static void main(String[] args) {
        SpringApplication.run(BookmanageserverApplication.class, args);
    }

}

