package com.hstc.springbootbookmanage9135.service;

import com.hstc.springbootbookmanage9135.entity.Book;

import java.util.List;

public interface BookService {

    public List<Book> queryBookListByTitleOrType_id(String title,int type_id);

     List<Book> queryBookList();

    int addBook(Book book);

    public int deleteBookBatch(String[] isbns);
    public Book queryBookByIsbn(String isbn); // 查询书籍信息

    public int updateBook(Book book); // 更新书籍信息

    List<Book> searchBooks(String title, String typeId);
}
