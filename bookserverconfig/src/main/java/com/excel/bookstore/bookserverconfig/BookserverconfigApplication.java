package com.excel.bookstore.bookserverconfig;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.config.server.EnableConfigServer;
//import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableConfigServer
//@EnableDiscoveryClient
public class BookserverconfigApplication {

    public static void main(String[] args) {
        SpringApplication.run(BookserverconfigApplication.class, args);
    }

}

