package com.excel.bookstore.bookmanageserver.controller;

import com.excel.bookstore.bookmanageserver.model.Book;
import com.excel.bookstore.bookmanageserver.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class BookController {
    @Autowired
    private BookService bookService;
    @RequestMapping("/list")
    public String list(Model model) {
        System.out.println("查询所有");
        List<Book> books = bookService.findAll();
        model.addAttribute("books", books);
        return "user/list";
    }
    @RequestMapping("/list2")
    public List<Book> list() {
        System.out.println("查询所有");
        List<Book> books = bookService.findAll();
        return books;
    }
}
