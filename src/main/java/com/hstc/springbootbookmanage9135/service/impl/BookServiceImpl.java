package com.hstc.springbootbookmanage9135.service.impl;

import com.hstc.springbootbookmanage9135.dao.BookMapper;
import com.hstc.springbootbookmanage9135.entity.Book;
import com.hstc.springbootbookmanage9135.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookMapper bookMapper;


    @Override
    public List<Book> queryBookList() {
        return bookMapper.selectBookList();
    }
    @Override
    public int addBook(Book book) {
        return bookMapper.insertBook(book);
    }
    @Override
    public int deleteBookBatch(String[] isbns) {
        int count = 0;
        for (String isbn : isbns) {
            bookMapper.deleteBookByIsbn(isbn); // 使用JPA的删除方法
            count++;
        }
        return count; // 返回删除的数量
    }
    @Override
    public Book queryBookByIsbn(String isbn) {
        return bookMapper.selectBookByIsbn(isbn); // 假设您在代码中有这个方法
    }

    @Override
    public int updateBook(Book book) {
        return bookMapper.updateBook(book); // 更新书籍信息
    }

    @Override
    public List<Book> searchBooks(String title, String typeId) {
        return bookMapper.searchBooks(title, typeId);
    }

    @Override
    public List<Book> queryBookListByTitleOrType_id(String title, int type_id) {
        return bookMapper.selectBookListByTitleOrType_id(title, type_id);
    }
}
