package com.francescobertamini.assignment3.controllers.login;

import com.francescobertamini.assignment3.data.Data;
import com.francescobertamini.assignment3.dto.Game;
import com.francescobertamini.assignment3.dto.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        Boolean userAlreadyExists = false;
        User user = null;
        try {
            for (int i = 0; i < Data.users.size(); i++) {
                if (username.equals(Data.users.get(i).getUsername())) {
                    user = Data.users.get(i);
                    userAlreadyExists = true;
                }
            }
            if (!userAlreadyExists) {
                user = new User(username);
            }
            session.setAttribute("user", user);
            Data.games.sort(new Game.GameComparator());
            session.setAttribute("games", Data.games);
            String nextPage = "/home";
            response.sendRedirect(request.getContextPath() + nextPage);
        } catch (Exception e) {
            response.sendError(500);
            System.out.println(e);
        }
    }
}
