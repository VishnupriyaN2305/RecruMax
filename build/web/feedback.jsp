
<%@page import="myPackage.classes.Exams"%>
<%@page import="myPackage.classes.Questions"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
					RecruMax</h2>
					<div class="left-menu">
						<a  href="can-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="can-page.jsp?pgprt=1"><h2>Exams</h2></a>
						<a  href="can-page.jsp?pgprt=2"><h2>Results</h2></a>
                                                <a  href="can-page.jsp?pgprt=3"><h2>Explore</h2></a>
                                                <a class="active" href="can-page.jsp?pgprt=4"><h2>Feedback</h2></a>
					</div>
				</div>
		
                       </div>
               <!-- CONTENT AREA -->
			<div class="content-area">
                            
            <div class="panel form-style-6" style="float: left;max-width: 900px; padding-top: 40px;">
            <div class="title" style="margin-top: -60px;">Select Exam to give Feedback</div>
       <br/>
           
               <form action="controller.jsp">
                   <br/><br>
                <label>Select Exam</label>
                <input type="hidden" name="page" value="exams">
                <input type="hidden" name="operation" value="feedback">
                <select name="examid" class="text">
        <% 
            ArrayList list1=pDAO.displayExams(Integer.parseInt(session.getAttribute("userId").toString()));
            for(int i=0;i<list1.size();i=i+2){
        %>
        <option value="<%=list1.get(i)%>"><%=list1.get(i+1)%></option>
            <%
                
            }
            %>
            </select>
            <input type="text" name="fd" value="" placeholder="Enter Feedback">
            <input type="submit" value="Submit Feedback" class="form-button">
            </form>
         
        </div>
    
</div>
       