package com.excel.bookstore.bookserverconfig;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@SpringBootApplication
@EnableConfigServer
public class BookserverconfigApplication {

    public static void main(String[] args) {
        SpringApplication.run(BookserverconfigApplication.class, args);
    }

}

