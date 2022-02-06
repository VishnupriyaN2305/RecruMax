
<%@page import="java.util.ArrayList"%>
<%@page import="myPackage.classes.User"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
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
						<a href="can-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="can-page.jsp?pgprt=1"><h2>Exams</h2></a>
						<a href="can-page.jsp?pgprt=2"><h2>Results</h2></a>
                                                <a class="active" href="can-page.jsp?pgprt=3"><h2>Explore</h2></a>
                                                <a href="can-page.jsp?pgprt=4"><h2>Feedback</h2></a>
					</div>
				</div>
			</div>
            <!-- CONTENT AREA -->
			<div class="content-area">
                            
                            <div id="allcourse" class="panel" style="max-width: 850px;float:leftt;margin-right: 10px;">
                                <div class="title">
                                   All Exams 
                                </div>
                                <table id="one-column-emphasis" style="min-width: 700px;margin: 5px; margin-top: 35px" >
                                    <colgroup>
                                        <col class="oce-first" />
                                    </colgroup>
                                    <thead>
    	<tr>
            <th style="width:200px;" scope="col">Job Name</th>
            <th style="width:200px;" scope="col">Exam Name</th>
            <th style="width:200px;" scope="col">Company Name</th>
            <th style="width:100px;" scope="col">Email Id</th>
            <th style="width:100px;" scope="col">Contact No</th>
            <th style="width:100px;" scope="col">Address</th>
            <th style="width:100px;" scope="col">City</th>         
        </tr>
    </thead>
                                           
        <%  ArrayList<String> list2=pDAO.getAllComJobs();        
            for(int i=0;i<list2.size();i=i+3){
            ArrayList list=pDAO.getAllExams(Integer.parseInt(list2.get(i).toString()));
            User u=pDAO.getUserCom(Integer.parseInt(list2.get(i+2)));
            for(int j=0;j<list.size();j=j+9){   
        %>
           <tr>
        <td style="width:200px;"><%=list2.get(i+1)%></td>
        <td style="width:200px;"><%=list.get(j+1)%></td>
        <td style="width:200px;"><%=u.getFirstName()%></td>
        <td style="width:200px;"><%=u.getEmail()%></td>
        <td style="width:200px;"><%=u.getContact()%></td>
        <td style="width:200px;"><%=u.getAddress()%></td>
        <td style="width:200px;"><%=u.getCity()%></td>
        <td><a  href="controller.jsp?page=explore&examid=<%=list.get(j+7)%>&jobid=<%=list2.get(i)%>&userid=<%=session.getAttribute("userId")%>" 
                onclick="return confirm('Are you sure you want to apply for this exam?');" >
                <div class="form-button" style="max-width: 60px;font-size: 17px; padding: 3px">Apply</div>
            </a></td>
           </tr>
            <%
            }
        }
            %>
            </table>
        </div>
     </div>
                       