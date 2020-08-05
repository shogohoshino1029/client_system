package controllers.associates;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Associate;
import models.validators.AssociateValidator;
import utils.DBUtil;
import utils.EncryptUtil;

/**
 * Servlet implementation class EmployeesUpdateServlet
 */
@WebServlet("/associates/update")
public class AssociatesUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssociatesUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em =DBUtil.createEntityManager();

            Associate a = em.find(Associate.class, (Integer)(request.getSession().getAttribute("associate_id")));

            // 現在の値と異なる社員番号が入力されていたら
            // 重複チェックを行う指定をする
            Boolean code_duplicate_check = true;
            if(a.getCode().equals(request.getParameter("code"))) {
                code_duplicate_check = false;
            } else {
                a.setCode(request.getParameter("code"));
            }

            // パスワード欄に入力があったら
            // パスワードの入力値チェックを行う指定をする
            Boolean password_check_flag = true;
            String password = request.getParameter("password");
            if(password == null || password.equals("")) {
                password_check_flag = false;
            } else {
                a.setPassword(
                        EncryptUtil.getPasswordEncrypt(
                                password,
                                (String)this.getServletContext().getAttribute("salt")
                                )
                        );
            }

            a.setName(request.getParameter("name"));
            a.setAdmin_flag(Integer.parseInt(request.getParameter("admin_flag")));
            a.setUpdated_at(new Timestamp(System.currentTimeMillis()));
            a.setDelete_flag(0);

            List<String> errors = AssociateValidator.validate(a, code_duplicate_check, password_check_flag);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("associate", a);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/associates/edit.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "Success");

                request.getSession().removeAttribute("associate_id");

                response.sendRedirect(request.getContextPath() + "/associates/index");





            }
        }
    }

}
