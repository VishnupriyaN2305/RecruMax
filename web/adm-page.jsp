
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style-backend.css">
</head>
<body>
	<div class="top-area">
		<center><h2>Admin Panel</h2></center> <a href="controller.jsp?page=logout" class="button" style="float: right;background:crimson;color:white">Logout</a>
	</div>

        <%
            if(session.getAttribute("userStatus")!=null){
            if(session.getAttribute("userStatus").equals("1")){
            
            %>
            
            
            
            
            
            <% 
            //pgprt = pagepart, jobs=1, questions=2 and profile is default
            if(request.getParameter("pgprt").equals("0")){
                
            %>
            
                <jsp:include page="companies.jsp"/>
            
            <%
           } else if(request.getParameter("pgprt").equals("1")){
                %>
            
                <jsp:include page="candidates.jsp"/>
            
            <%
            } else if(request.getParameter("pgprt").equals("2")){
                %>
            
                <jsp:include page="feedbacks.jsp"/>
            
            <%
            }
 }
                 else response.sendRedirect("login.jsp");
            }
                else response.sendRedirect("login.jsp");
                %>
              

</body>
</html>