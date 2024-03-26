<%@ page import="java.util.Calendar" %> <% Calendar cal =
Calendar.getInstance(); int hour = cal.get(Calendar.HOUR_OF_DAY); String
greeting = (hour < 12) ? "Good morning" : "Good afternoon"; String name =
"COMP367"; %>

<!DOCTYPE html>
<html>
  <head>
    <title>Welcome</title>
  </head>
  <body>
    <h1><%= greeting %>, <%= name %>, Welcome to COMP367-Lab2</h1>
  </body>
</html>
