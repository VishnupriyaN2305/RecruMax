
<%@page import="myPackage.classes.Answers"%>
<%@page import="myPackage.classes.Exams"%>
<%@page import="myPackage.classes.Questions"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						RecruMax
					</h2>
					<div class="left-menu">
						<a  href="can-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="can-page.jsp?pgprt=1"><h2>Exams</h2></a>
						<a class="active" href="can-page.jsp?pgprt=2"><h2>Results</h2></a>
                                                <a  href="can-page.jsp?pgprt=3"><h2>Explore</h2></a>
                                                <a href="can-page.jsp?pgprt=4"><h2>Feedback</h2></a>
					</div>
				</div>
		
                       </div>
               <!-- CONTENT AREA -->
			<div class="content-area">
                            <div class="panel" style="float: left;max-width: 900px">
                                
        
        <div class="title">All Results</div>
           <table id="rounded-corner">
    <thead>
    	<tr>
        	<th scope="col" class="rounded-company">Job Name</th>
            <th scope="col" class="rounded-q1">Exam name</th>
            <th scope="col" class="rounded-q2">Date</th>
            <th scope="col" class="rounded-q3">Selection Status</th>
        </tr>
    </thead>
        
    <tbody>
        
        <%  
            ArrayList list=pDAO.getAllresult(Integer.parseInt(session.getAttribute("userId").toString()));
            %><%
            for(int i=0;(i+2)<list.size();i=i+3){
           %>
        <tr>
        <td style="width:200px;"><%=list.get(i+3)%></td>
        <td style="width:200px;"><%=list.get(i)%></td>
        <td style="width:100px;"><%=list.get(i+1)%></td>
        <td style="width:100px;"><%=list.get(i+2)%></td>
            <%
            }
            %>
        </tr>
       
           </tbody>
</table>
        </div>