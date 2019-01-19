package com.excel.bookstore.bookmanageserver.service.impl;

import com.excel.bookstore.bookmanageserver.dao.BookDao;
import com.excel.bookstore.bookmanageserver.model.Book;
import com.excel.bookstore.bookmanageserver.service.BookService;
import jdk.nashorn.internal.runtime.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDao bookDao;
    @Override
    public boolean addBook(Book book) {
        boolean flag=false;
        try{
            bookDao.save(book);
            flag=true;
        }catch(Exception e){
            System.out.println("新增失败!");
        }
        return flag;
    }

    @Override
    public boolean updateBook(Book book) {
        boolean flag=false;
        try{
            bookDao.save(book);
            flag=true;
        }catch(Exception e){
            System.out.println("修改失败!");
        }
        return flag;
    }

    @Override
    public boolean deleteBook(Long id) {
        boolean flag=false;
        try{
            bookDao.deleteById(id);
            flag=true;
        }catch(Exception e){
            System.out.println("删除失败!");
        }
        return flag;
    }

    @Override
    public Book findBookById(Long id) {
        return bookDao.findById(id).get();
    }

    @Override
    public List<Book> findAll() {
        return bookDao.findAll();
    }
}
