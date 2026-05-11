package com.hstc.springbootbookmanage9135.controller;

import com.hstc.springbootbookmanage9135.entity.Book;
import com.hstc.springbootbookmanage9135.entity.Type;
import com.hstc.springbootbookmanage9135.service.BookService;
import com.hstc.springbootbookmanage9135.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class IndexController {
    @Autowired
    private BookService bookService;
    @Autowired
    private TypeService typeService;
    //处理游客查询所有图书
    @RequestMapping("/")
    public String queryBookList(Model model) {
        List<Book> listBooks = bookService.queryBookList();
        List<Type> listTypes=typeService.queryTypeList();
        model.addAttribute("listBooks", listBooks);
        model.addAttribute("listTypes",listTypes);
        return "index";
    }
    //游客根据书名或类型查询
    @RequestMapping("/queryBookListByTitleOrType_id")
    public String queryBookListByTitleOrType_id(String title, int type_id, Model model) {
        System.out.println("正在处理查询...");
        List<Book> listBooks = bookService.queryBookListByTitleOrType_id(title, type_id);
        model.addAttribute("listBooks", listBooks);
        return "index";
    }
}
