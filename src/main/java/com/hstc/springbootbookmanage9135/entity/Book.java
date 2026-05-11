package com.hstc.springbootbookmanage9135.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import lombok.Data;
@Data
public class Book{
    private String isbn;
    private String title;
    private int type_id;
    private String author;
    private String introduction;
    private Double price;
    private String publisher;
    private String photo;
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date publishcationDate;

    @Override
    public String toString() {
        return "Book{" +
                "isbn='" + isbn + '\'' +
                ", title='" + title + '\'' +
                ", type_id=" + type_id +
                ", author='" + author + '\'' +
                ", introduction='" + introduction + '\'' +
                ", price=" + price +
                ", publisher='" + publisher + '\'' +
                ", photo='" + photo + '\'' +
                ", publishcationDate=" + publishcationDate +
                '}';
    }
}
