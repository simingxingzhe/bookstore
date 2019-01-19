package com.excel.bookstore.bookmanageserver.dao;

import com.excel.bookstore.bookmanageserver.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookDao extends JpaRepository<Book,Long> {
}
