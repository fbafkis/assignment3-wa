package com.francescobertamini.assignment3.controllers.game;

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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@WebServlet(name = "PlayServlet", value = "/play")
public class PlayServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date dt = new Date();
        String formattedDate = sdf.format(dt);
        String id = UUID.randomUUID().toString();
        Game game = new Game(id, username, formattedDate);

        try {
            Data.games.add(game);
            session.setAttribute("game", game);
            String nextPage = "/game";
            response.sendRedirect(request.getContextPath() + nextPage);
        } catch (Exception e) {
            String nextPage = "/home";
            System.out.println("Failed adding new room!");
            response.sendError(500);
        }
    }
}

