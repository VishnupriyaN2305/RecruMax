
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						RecruMax
					</h2>

					<div class="left-menu">
						<a  class="active" href="adm-page.jsp?pgprt=0"><h2>COMPANIES</h2></a>
						<a  href="adm-page.jsp?pgprt=1"><h2>CANDIDATES</h2></a>
                                                <a  href="adm-page.jsp?pgprt=2"><h2>FEEDBACKS</h2></a>
					</div>
				</div>
			</div>
               <!-- CONTENT AREA -->
			<div class="content-area">
                            <div class="panel" style="float: left;max-width: 900px">
                                
        
        <div class="title">All Companies</div>
           <table id="rounded-corner">
    <thead>
    	<tr>
        	<th scope="col" class="rounded-company">JOB NAME</th>
                 <th scope="col" class="rounded-company">USER NAME</th>
                <th scope="col" class="rounded-company">CONTACT NO</th>
                <th scope="col" class="rounded-company">CITY</th>
                <th scope="col" class="rounded-company">ADDRESS</th>
           
        </tr>
    </thead>
        
    <tbody>
        
        <%  
            ArrayList list=pDAO.getAllCompanies();
             for(int i=0;(i+4)<=list.size();i=i+5){
           %>
        <tr>
        <td style="width:200px;"><%=list.get(i)%></td>
        <td style="width:200px;"><%=list.get(i+1)%></td>
        <td style="width:200px;"><%=list.get(i+2)%></td>
        <td style="width:200px;"><%=list.get(i+3)%></td>
        <td style="width:200px;"><%=list.get(i+4)%></td>

            <%
            }
            %>
        </tr>
       
           </tbody>
</table>
        </div>