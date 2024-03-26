<%@ page import="java.util.Calendar" %> <% Calendar cal =
Calendar.getInstance(); int hour = cal.get(Calendar.HOUR_OF_DAY); String
greeting; if(hour < 12){ greeting = "Good morning"; } else { greeting = "Good
afternoon"; } String name = "COMP367";

<!DOCTYPE html>
<html>
  <head>
    <title>Welcome</title>
  </head>
  <body>
    <h1><%= greeting %>, <%= name %>, Welcome to COMP367</h1>
  </body>
</html>
