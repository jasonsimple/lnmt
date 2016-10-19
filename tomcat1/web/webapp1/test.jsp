<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<html>
  <head>
    <title>MySQL</title>
  <body>
connect Mysql<br>
<%
String driverClass="com.mysql.jdbc.Driver";
String url="jdbc:mysql://172.17.0.2/javatest";
String username = "javauser";
String password = "javapasswd";
Class.forName(driverClass);
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select * from testdata");
while(rs.next()){
  out.println("<br>foo:"+rs.getString(2)+"bar:"+rs.getString(3));
}
rs.close();
stmt.close();
conn.close();
%>
  </body>
</html>

