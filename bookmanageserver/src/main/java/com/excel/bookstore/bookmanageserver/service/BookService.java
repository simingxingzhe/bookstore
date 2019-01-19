package com.excel.bookstore.bookmanageserver.service;

import com.excel.bookstore.bookmanageserver.model.Book;

import java.util.List;

public interface BookService {
    /**
     * 新增用户
     * @param Book
     * @return
     */
    boolean addBook(Book Book);

    /**
     * 修改用户
     * @param Book
     * @return
     */
    boolean updateBook(Book Book);


    /**
     * 删除用户
     * @param id
     * @return
     */
    boolean deleteBook(Long id);

    /**
     * 根据用户名字查询用户信息
     * @param id
     */
    Book findBookById(Long id);
    /**
     * 查询所有
     * @return
     */
    List<Book> findAll();
}
