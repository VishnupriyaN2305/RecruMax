
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
						<a  href="com-page.jsp?pgprt=1"><h2>Back</h2></a>
					</div>
				</div>
			</div>
            <!-- CONTENT AREA -->
            <div class="content-area" >
                            <div class="panel form-style-6" style="min-width: 300px;max-width: 390px;float: left">
            <form action="showall.jsp">
                <input type="hidden"    name="examid" value="<%=request.getParameter("examid")%>">
                <input type="hidden" name="jobid" value="<%=request.getParameter("jobid")%>">
                <div class="title">Show All Questions for</div>
                <br><br>
                <label>Select Domain</label>
                <select name="domainid" class="text">
                    <option value="1">Mathematics</option>
                    <option value="2">Logical Reasoning</option>      
                    <option value="3">Technical Questions</option>
            </select>
            <input type="submit" value="Show" class="form-button">
            </form>
                            </div>
        
        <div class="panel form-style-6" style="margin-right:200px; max-width: 620px;float: right">   
               <form action="controller.jsp">
                   <div class="title">Add New Question</div>
                   <table >
                       <input type="hidden" name="examid" value="<%=request.getParameter("examid")%>">
                       <input type="hidden" name="jobid" value="<%=request.getParameter("jobid")%>">
                       <tr>
                           <td><label>Domain Name</label></td>
                           <td colspan="3"> 
                               <select name="domainid" class="text">
                                <option value="1">Mathematics</option>      
                                <option value="2">Logical Reasoning</option>      
                                <option value="3">Technical Questions</option>      
                               </select>
                           </td>
                       </tr>
                       <tr>
                           <td><label>Your Question:</label></td>
                           <td colspan="4"><input type="text" name="question" class="text" placeholder="Type your question here" style="width: 420px;" ></td><br>
                       </tr>
                       <tr>
                           <td><label>Options</label></td>
                           <td><input type="text" name="opt1" class="text" placeholder="First Option" style="width: 130px;" ></td>
                           <td><input type="text" name="opt2" class="text" placeholder="Second Option" style="width: 130px;" ></td>
                           <td><input type="text" name="opt3" class="text" placeholder="Third Option" style="width: 130px;" ></td>
                           <td><input type="text" name="opt4" class="text" placeholder="Fourth Option" style="width: 130px;" ></td>
                       </tr>
                       <tr>
                           <td><label>Correct Answer</label></td>
                           <td colspan="4"><center><input type="text" name="correct" class="text" placeholder="Correct Answer" style="width: 130px;" ></center></td>
                       <tr>
                           <td colspan="5"><input type="hidden" name="page" value="questions">
                    <input type="hidden" name="operation" value="addnew">
                       <center><input type="submit" class="form-button" value="Add" name="submit"></center></td>
                           
                   </tr>
                   </table>

                </form>
           
    
     </div>
                        </div>