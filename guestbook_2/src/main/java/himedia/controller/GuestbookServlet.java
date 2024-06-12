package himedia.controller;

import java.io.IOException;
import java.util.List;

import himedia.vo.BookListVo;
import himedia.dao.GuestBookDaoOracleImpl;
import himedia.dao.GuestbookDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "guestbook", urlPatterns = "/el")
public class GuestbookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String dbuser = "himedia";
    private String dbpass = "himedia";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String actionName = req.getParameter("a");
        if ("form".equals(actionName)) {
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/guestbook/form.jsp");
            rd.forward(req, resp);
        } else if ("deleteform".equals(actionName)) {
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/guestbook/deleteform.jsp");
            rd.forward(req, resp);
        } else {
            GuestbookDao dao = new GuestBookDaoOracleImpl(dbuser, dbpass);
            List<BookListVo> list = dao.getList();
            req.setAttribute("list", list);
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/guestbook/index.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String actionName = req.getParameter("a");
        if ("insert".equals(actionName)) {
            String name = req.getParameter("name");
            String password = req.getParameter("password");
            String content = req.getParameter("content");

            BookListVo vo = new BookListVo(name, password, content);
            GuestbookDao dao = new GuestBookDaoOracleImpl(dbuser, dbpass);
            boolean success = dao.add(vo);

            if (success) {
                System.out.println("INSERT SUCCESS");
            } else {
                System.out.println("INSERT FAILED");
            }
            resp.sendRedirect(req.getContextPath() + "/guestbook");
        } else if ("delete".equals(actionName)) {
            Long no = Long.parseLong(req.getParameter("no"));
            String password = req.getParameter("password");

            GuestbookDao dao = new GuestBookDaoOracleImpl(dbuser, dbpass);
            boolean success = dao.delete(no, password);

            if (success) {
                System.out.println("DELETE SUCCESS");
            } else {
                System.out.println("DELETE FAILED");
            }
            resp.sendRedirect(req.getContextPath() + "/guestbook");
        }
    }
}