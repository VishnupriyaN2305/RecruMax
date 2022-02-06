
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						RecruMax
					</h2>

					<div class="left-menu">
						<a  href="com-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="com-page.jsp?pgprt=1"><h2>Jobs</h2></a>
                                                <a class="active" href="com-page.jsp?pgprt=2"><h2>Feedbacks</h2></a>
					</div>
				</div>
			</div>
               <!-- CONTENT AREA -->
			<div class="content-area">
                            <div class="panel" style="float: left;max-width: 900px">
                                
        
        <div class="title">All Feedbacks</div>
           <table id="rounded-corner">
    <thead>
    	<tr>
        	<th scope="col" class="rounded-company">JOB NAME</th>
                <th scope="col" class="rounded-company">EXAM NAME</th>
                <th scope="col" class="rounded-company">FEEDBACKS</th>
        </tr>
    </thead>
        
    <tbody>
        
        <%  
            ArrayList list=pDAO.getAllexamfeedbacks(Integer.parseInt(session.getAttribute("userId").toString()));
            %><%
             for(int i=0;(i+2)<=list.size();i=i+3){
           %>
        <tr>
            <td style="width:200px;"><%=list.get(i)%></td><!-- comment -->
            <td style="width:200px;"><%=list.get(i+1)%></td>
        <td style="width:200px;"><%=list.get(i+2)%></td>
            <%
            }
            %>
        </tr>
       
           </tbody>
</table>
        </div>