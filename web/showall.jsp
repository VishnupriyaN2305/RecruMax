
<%@page import="myPackage.classes.Questions"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<link rel="stylesheet" type="text/css" href="style-backend.css">

<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						RecruMax
					</h2>

					<div class="left-menu">
						<a  href="questions.jsp?examid=<%=request.getParameter("examid")%>&jobid=<%=request.getParameter("jobid")%>"><h2>Back</h2></a>
					</div>
				</div>
			</div>
            <!-- CONTENT AREA -->
            <div class="content-area" >
                <center>
        <%
           if(request.getParameter("domainid")!=null){
               ArrayList list=pDAO.getAllQuestions(Integer.parseInt(request.getParameter("jobid")),Integer.parseInt(request.getParameter("examid")),Integer.parseInt(request.getParameter("domainid")));
               for(int i=0;i<list.size();i++){
                   Questions question=(Questions)list.get(i);
                   
                   %>
                   <div class="question-panel">
						<div class="question" >
                                                    <label class="question-label"><%=i+1%></label>
						<%=question.getQuestion()%>	
                    <a href="controller.jsp?page=questions&operation=delQuestion&qid=<%=question.getQuestionId()%>&examid=<%=Integer.parseInt(request.getParameter("examid"))%>&jobid=<%=Integer.parseInt(request.getParameter("jobid"))%>&domainid=<%=Integer.parseInt(request.getParameter("domainid"))%>" 
                        onclick="return confirm('Are you sure you want to delete this ?');">
    <div class="delete-btn" style="position: absolute;right: 10px;top: -20px;">delete</div></a>
                                                </div>
						<div class="answer">
                                                        <label class="show"><%=question.getOpt1() %></label>
							<label class="show"><%=question.getOpt2() %></label>
							<label class="show"><%=question.getOpt3() %></label>
							<label class="show"><%=question.getOpt4() %></label>
                                                        <label class="show-correct"><%=question.getCorrect() %></label>
						</div>
					</div>
                   
                   <%
               }
          } %>
       </center>
            </div>