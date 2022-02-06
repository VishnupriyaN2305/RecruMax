
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style-backend.css">
        <meta charset="UTF-8">
    <meta name="viewport" content=
        "width=device-width, initial-scale=1.0">
</head>
<body>
	<div class="top-area">
		<center><h2>Company Panel</h2></center> <a href="controller.jsp?page=logout" class="button" style="float: right;background:crimson;color:white">Logout</a>
	</div>

        <%
            if(session.getAttribute("userStatus")!=null){
            if(session.getAttribute("userStatus").equals("1")){
            
            %>
            
            
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalTime"%>

<%@page import="java.lang.*"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    $(function(){
    $("#datepicker").datepicker();
});
    
</script>
    <li>first</li>
    <li>second</li>
    <li>third</li>
</ul>

<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						RecruMax
					</h2>

					<div class="left-menu">
						<a href="com-page.jsp?pgprt=1"><h2>Back</h2></a>
                                               
					</div>
				</div>
			</div>
            <!-- CONTENT AREA -->
			<div class="content-area">
                            
                            <div id="allcourse" class="panel" style="max-width: 1200px;float:left;margin-right: -50px;">
                                <div class="title">
                                   All Exams 
                                </div>
                                <table id="one-column-emphasis" style="min-width: 700px;margin: 5px; margin-top: 35px" >
                                    <colgroup>
                                        <col class="oce-first" />
                                    </colgroup>
                                    <thead>
                                    <br><div style="float: right"><div class="piechartshowpink"></div><p style="margin: 0px;margin-left: 12px;display: inline;">Mathematical</p><!-- comment -->
                <div class="piechartshoworange"></div><p style="margin: 0px;margin-left: 12px;display: inline;">Logical Reasoning</p>
                <div class="piechartshowblue"></div><p style="margin: 0px;margin-left: 12px;display: inline;">Technical Questions<br></p></div>
    	<tr>
            <th style="width:200px;" scope="col">Name</th>
            <th style="width:200px;" scope="col">Email</th>
            <th style="width:200px;" scope="col">Contact</th>
            <th style="width:100px;" scope="col">City</th>
            <th style="width:100px;" scope="col">Address</th>
            <th style="width:100px;" scope="col">Obt Marks</th>
            <th style="width:100px;" scope="col">Result Status</th>   
            <th style="width:200px;" scope="col">Inference</th>        
        </tr>
    </thead>
        <%  ArrayList list2=pDAO.getAllCanExams(Integer.parseInt(request.getParameter("examid")));
        ArrayList<Integer> a = pDAO.getObtMarksByDomainId(1,Integer.parseInt(request.getParameter("examid")));
            int j=0;
            for(int i=0;(i+9)<=list2.size();i=i+10){
           %>
           
           <tr>
        <td style="width:200px;"><%=list2.get(i)%></td>
        <td style="width:200px;"><%=list2.get(i+1)%></td>
        <td style="width:100px;"><%=list2.get(i+2)%></td>
        <td style="width:100px;"><%=list2.get(i+3)%></td>
        <td style="width:100px;"><%=list2.get(i+4)%></td>
        <td style="width:100px;"><%=list2.get(i+5)%></td>
        
        <td style="width:100px;"><%=list2.get(i+8)%></td>
        <% 
               
            
            String col = "background-image: conic-gradient(pink "+a.get(j)+"deg, orange "+a.get(j)+"deg "+(a.get(j+1)+a.get(j))+"deg, lightblue "+(a.get(j+1)+a.get(j))+"deg);";
                j+=3;
        %>
        <td style="width:200px;">
                        <div class="piechart" id="<%=i%>" style="<%=col%>" type="hidden"></div><!-- comment -->

        </td>
        
        <td style="width:100px;"><button  class="form-button" style="width:90px;margin-bottom: 5px;">
            <a  href="controller.jsp?page=examresult&operation=selection&selstatus=selected&examid=<%=Integer.parseInt(request.getParameter("examid"))%>&userid=<%=list2.get(i+9)%>&jobid=<%=Integer.parseInt(request.getParameter("jobid"))%>">
            <div class="form-button" style="max-width: 140px;font-size: 17px; padding: 3px; ">Select</div></a>
            </button><!-- comment -->
        <button  class="form-button" style="width:90px;margin-top: 5px;">
            <a  href="controller.jsp?page=examresult&operation=selection&selstatus=rejected&examid=<%=Integer.parseInt(request.getParameter("examid"))%>&userid=<%=list2.get(i+9)%>&jobid=<%=Integer.parseInt(request.getParameter("jobid"))%>">
            <div class="form-button" style="max-width: 140px;font-size: 17px; padding: 3px; ">Reject</div></a>
                </button></td>
        
    </tr>
            <%
            }

            %>
            </table>
        </div>
        
     </div>
                       
            
            
          
            <%
            }else response.sendRedirect("login.jsp");
            }else response.sendRedirect("login.jsp");
                %>
              

</body>
</html>