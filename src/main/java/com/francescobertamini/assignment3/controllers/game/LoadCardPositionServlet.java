package com.francescobertamini.assignment3.controllers.game;

import com.francescobertamini.assignment3.data.Data;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoadCardPosistion", value = "/getCardPosition")
public class LoadCardPositionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String gameId = request.getParameter("gameId");
        int cardNumber = Integer.parseInt(request.getParameter("cardNumber"));
        int cardValue;
        try {
            for (int i = 0; i < Data.games.size(); i++) {
                if (Data.games.get(i).getId().equals(gameId)) {
                    cardValue = Data.games.get(i).getValues().get(cardNumber - 1);
                    System.out.println("GameId: " + gameId);
                    System.out.println("Card Number: " + cardNumber);
                    System.out.println("Card Value: " + cardValue);
                    JsonObject result = new JsonObject();
                    result.addProperty("cardValue", cardValue);
                    PrintWriter out = response.getWriter();
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.setHeader("Access-Control-Allow-Origin", "*");
                    response.setHeader("Access-Control-Allow-Methods", "GET");
                    out.print(result);
                    out.close();
                }
            }
        } catch (Exception e) {
            System.out.println(e);
            response.sendError(500);
        }
    }
}
