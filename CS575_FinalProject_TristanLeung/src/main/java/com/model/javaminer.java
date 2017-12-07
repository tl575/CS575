package com.model;

import org.json.JSONObject;

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


@WebServlet("/javaminer")
public class javaminer extends HttpServlet{



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String blockchain1 = String.valueOf(request.getParameter("blockchain1"));
        String blockchain1nonce = String.valueOf(request.getParameter("blockchain1nonce"));
        String blockchain1data = String.valueOf(request.getParameter("blockchain1data"));
        String hashvalue = String.valueOf(request.getParameter("hashvalue"));
        String parenthash = String.valueOf(request.getParameter("parenthash"));
        String s = blockchain1 + blockchain1nonce+blockchain1data + parenthash;

        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        md.update(s.getBytes(StandardCharsets.UTF_16));
        byte[] digest = md.digest();
        String temp_string = "";// = String.format("%064x", new BigInteger(1, digest))
        // Change this to UTF-16 if needed
        int count = 0;
        for (int i = 0; i < 500000; i++) {

            s = blockchain1 + String.valueOf(i) + blockchain1data + parenthash;
            md.update(s.getBytes(StandardCharsets.UTF_16));
            digest=md.digest();
            temp_string = String.format("%064x", new BigInteger(1, digest));

            if (temp_string.charAt(0) == '0' && temp_string.charAt(1) == '0'
                    && temp_string.charAt(2) == '0' && temp_string.charAt(3) == '0'){
                count = i;
                break;
            }


        }
        String sum = temp_string + " " + String.valueOf(count);
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(sum);
        response.getWriter().write(count);
        response.getWriter().close();

    }
}
