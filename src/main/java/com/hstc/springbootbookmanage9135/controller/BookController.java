package com.hstc.springbootbookmanage9135.controller;

import com.hstc.springbootbookmanage9135.entity.Book;
import com.hstc.springbootbookmanage9135.service.BookService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/admin")
public class BookController {

    private final BookService bookservice; // 使用 final 修饰，确保必须在构造时注入

    @Autowired // Spring 将自动注入 BookService 实现
    public BookController(BookService bookservice) {
        this.bookservice = bookservice;
    }
    @RequestMapping("login")
    public String login(String username, String password, HttpSession session, Model model) {
        List<Book> ListBooks = bookservice.queryBookList();
        model.addAttribute("listBooks", ListBooks);

        if ("admin".equals(username) && "admin".equals(password)) {
            session.setAttribute("loggedIn", true);
            // 登录成功后，调用 queryBookList 方法获取书籍信息
            return "redirect:queryBookList"; // 重定向到书籍列表
        }
        else {
            model.addAttribute("message", "用户名或密码错误");
            return "login";
        }
    }
    @RequestMapping("loginPage") // 映射用于显示登录页面
    public String showLoginPage() {
        return "GlyLogin"; // 返回jsp页面路径
    }
    @RequestMapping("editBook")
    public String editBook(String isbn, Model model) {
        if (isbn != null) {
            isbn = isbn.replaceAll("\\s+", "");
        }
        Book book = bookservice.queryBookByIsbn(isbn);
        if (book != null) {
            System.out.println("Found book: " + book); // 日志信息
            model.addAttribute("book", book);
        } else {
            System.out.println("Book not found for ISBN: " + isbn); // 日志信息
        }
        return "editBook";
    }

    @RequestMapping(value = "saveBookChanges", method = RequestMethod.POST)
    public String saveBookChanges(MultipartFile uploadFile, Book book, Model model, HttpServletRequest request) {
        // 封面文件上传逻辑
        if (!uploadFile.isEmpty()) {
            String originalFileName = uploadFile.getOriginalFilename();
            String suffixName = originalFileName.substring(originalFileName.lastIndexOf("."));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
            Random r = new Random();
            String tempName = sdf.format(new Date()) + r.nextInt(10000) + suffixName;

            String pathString = request.getServletContext().getRealPath("/cover");
            File filepath = new File(pathString);
            if (!filepath.exists()) {
                filepath.mkdir();
            }

            String fullFileName = filepath + "/" + tempName;

            try {
                uploadFile.transferTo(new File(fullFileName));
                book.setPhoto("/cover/" + tempName); // 设置书籍的封面图路径
            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("message", "上传失败");
                return "success"; // 返回结果页面
            }
        }

        int result = bookservice.updateBook(book); // 更新书籍信息
        if (result != 0) {
            model.addAttribute("message", "更新成功");
            return "success";
        } else {
            model.addAttribute("message", "更新失败");
            return "fail";
        }
    }

    @RequestMapping("queryBookList")
    public String queryBookList(Model model, HttpSession session) {
        if (session.getAttribute("loggedIn") == null) {
            return "redirect:login"; // 未登录跳转到登录页面
        }
        List<Book> ListBooks = bookservice.queryBookList();
        model.addAttribute("listBooks", ListBooks);
        return "admin/admin";
    }

    @RequestMapping(value="deleteBookBatch", method = RequestMethod.POST) // 确保使用POST方法
    public String deleteBookBatch(@RequestParam("isbns") String[] isbns, Model model) {
        if (isbns == null || isbns.length == 0) {
            model.addAttribute("message", "没有选择任何书籍！"); // 提示没有选择书籍
            return "fail"; // 响应失败状态
        }
        int deletedCount = bookservice.deleteBookBatch(isbns);

        if (deletedCount > 0) {
            model.addAttribute("message", "成功删除了" + deletedCount + "本书籍");
            return "redirect:queryBookList"; // 成功删除，重定向到书籍列表
        } else {
            model.addAttribute("message", "删除失败");
            return "fail"; // 删除失败返回失败状态
        }
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping("toAddBook")
    public String toAddBook() {
        System.out.println("Navigating to add book page");
        return "admin/addBook"; // 返回视图
    }

    @RequestMapping(value = "addBook", produces = "text/html;charset=UTF-8")
    public String addBook(MultipartFile uploadFile, HttpServletRequest request, Book book, Model model) {
        if (uploadFile.isEmpty()) {
            model.addAttribute("message", "请选选择文件");
            return "success";
        }

        String originalFileName = uploadFile.getOriginalFilename();
        String suffixName = originalFileName.substring(originalFileName.lastIndexOf("."));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
        Random r = new Random();
        String tempName = sdf.format(new Date()) + r.nextInt(10000) + suffixName;
        System.out.println("tempName: " + tempName);

        String pathString = request.getServletContext().getRealPath("/cover");
        System.out.println(pathString);
        File filepath = new File(pathString);
        if (!filepath.exists()) {
            filepath.mkdir();
        }

        String fullFileName = filepath + "/" + tempName;

        try {
            uploadFile.transferTo(new File(fullFileName));
            book.setPhoto("/cover/" + tempName); // 设置照片路径为可访问的 URL
            int result = bookservice.addBook(book);
            if (result != 0) {
                model.addAttribute("message", "添加成功");
                model.addAttribute("book", book); // 将书籍对象传递给视图以显示封面
                return "success"; // 返回结果页面
            } else {
                model.addAttribute("message", "添加失败");
                return "success"; // 返回结果页面
            }
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("message", "上传失败");
            return "success"; // 返回结果页面
        }
    }
    @RequestMapping(value = "searchBooks", method = RequestMethod.GET)
    public String searchBooks(String title, String typeId, Model model, HttpSession session) {

        List<Book> listBooks = bookservice.searchBooks(title, typeId); // 根据标题和类型查询书籍
        model.addAttribute("listBooks", listBooks);

        return "search"; // 返回查询结果页面
    }
    @RequestMapping("/bookDetails")
    public String bookDetails(@RequestParam("isbn") String isbn, Model model) {
        // 查询书籍信息并添加到模型
        BookService bookService = null;
        Book book = bookService.queryBookByIsbn(isbn);
        model.addAttribute("book", book);
        return "bookDetails"; // 返回书籍详情页面
    }
    @RequestMapping("logout")
    public String logout(HttpSession session) {
        // 清除登录状态
        session.invalidate(); // 销毁会话，强制用户登出
        return "redirect:login"; // 重定向到登录页面
    }
}