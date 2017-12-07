package com.model;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


@WebServlet("/getHash")
public class getHash extends HttpServlet{



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String blockchain1 = String.valueOf(request.getParameter("blockchain1"));
        String blockchain1nonce = String.valueOf(request.getParameter("blockchain1nonce"));
        String blockchain1data = String.valueOf(request.getParameter("blockchain1data"));
        String parenthash = String.valueOf(request.getParameter("parenthash"));
        String s = blockchain1 + blockchain1nonce+blockchain1data + parenthash;

        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        // Change this to UTF-16 if needed
        md.update(s.getBytes(StandardCharsets.UTF_16));
        byte[] digest = md.digest();
        String sum = String.format("%064x", new BigInteger(1, digest));


        //   if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
        // Ajax request.
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().append(sum);
        response.getWriter().close();


        //  } else {
        // Normal request.
        // request.setAttribute("sum", sum);
        //   request.getRequestDispatcher("index.jsp").forward(request, response);
        // }

    }
}
