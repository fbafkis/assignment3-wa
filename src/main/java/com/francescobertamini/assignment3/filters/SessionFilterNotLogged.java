package com.francescobertamini.assignment3.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/home", "/game", "/play", "/updateGameScore", "/getCardPosition"})
public class SessionFilterNotLogged implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException, IOException {

        HttpSession session = ((HttpServletRequest) request).getSession();
        if (session.getAttribute("user") == null) {
            if (!((HttpServletRequest) request).getRequestURL().equals("/") && !((HttpServletRequest) request).getRequestURL().equals("/index")) {
                ((HttpServletResponse) response).sendRedirect(((HttpServletRequest) request).getContextPath() + "/");
            }
        }
        chain.doFilter(request, response);
    }

    public void init(FilterConfig fConfig) throws ServletException {
    }

    public void destroy() {
    }
}
