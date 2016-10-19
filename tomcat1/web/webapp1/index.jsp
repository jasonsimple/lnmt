<%@ page language="java" %>
<%@ page import="java.util.*" %>
<html>
        <head><title>TomcatA</title></head>
        <body>
                <h1><font color="red">TomcatA.jason-177</font></h1>
                <table align="center" border="1">
                        <tr>
                                <td>Session ID</td>
                        <% session.setAttribute("johnsonxu","johnsonxu"); %>
                                <td><%= session.getId() %></td>
                        </tr>
                        <tr>
                                <td>Created on</td>
                                <td><%= session.getCreationTime() %></td>
                        </tr>
                </table>
        </body>
</html>        
