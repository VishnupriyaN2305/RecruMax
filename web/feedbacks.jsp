
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						RecruMax
					</h2>

					<div class="left-menu">
						<a  href="adm-page.jsp?pgprt=0"><h2>COMPANIES</h2></a>
						<a href="adm-page.jsp?pgprt=1"><h2>CANDIDATES</h2></a>
                                                <a class="active" href="adm-page.jsp?pgprt=2"><h2>FEEDBACKS</h2></a>
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
        	<th scope="col" class="rounded-company">FEEDBACKS</th>
           
        </tr>
    </thead>
        
    <tbody>
        
        <%  
            ArrayList list=pDAO.getAllfeedbacks();
             for(int i=0;i<list.size();i++){
           %>
        <tr>

        <td style="width:200px;"><%=list.get(i)%></td>
            <%
            }
            %>
        </tr>
       
           </tbody>
</table>
        </div>