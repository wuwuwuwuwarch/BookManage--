package com.hstc.springbootbookmanage9135.dao;

import com.hstc.springbootbookmanage9135.entity.Book;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BookMapper {



    public List<Book> selectBookList() ;
    public int insertBook(Book book) ;

    public int deleteBookByIsbn(String isbn) ;

    public Book selectBookByIsbn(String isbn); // 查询书籍信息

    public int updateBook(Book book); // 更新书籍信息

    List<Book> searchBooks(String title, String typeId);

    public List<Book> selectBookListByTitleOrType_id(@Param("title") String title, @Param("type_id") int type_id);
}
