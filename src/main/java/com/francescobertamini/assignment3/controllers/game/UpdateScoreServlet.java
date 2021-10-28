package com.francescobertamini.assignment3.controllers.game;

import com.francescobertamini.assignment3.data.Data;
import com.francescobertamini.assignment3.dto.Game;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "UpdateScoreServlet", value = "/updateGameScore")
public class UpdateScoreServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String gameId = request.getParameter("gameId");
        int score = Integer.parseInt(request.getParameter("score"));
        try {
            for (int i = 0; i < Data.games.size(); i++) {
                if (Data.games.get(i).getId().equals(gameId)) {
                    Data.games.get(i).setScore(score);
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    Date dt = new Date();
                    String formattedDate = sdf.format(dt);
                    Data.games.get(i).setTime(formattedDate);
                    response.setStatus(200);
                    System.out.println("Score updated");
                }
            }
        } catch (Exception e){
            System.out.println("e");
            response.sendError(500);
        }
        Data.games.sort(new Game.GameComparator());
    }
}
