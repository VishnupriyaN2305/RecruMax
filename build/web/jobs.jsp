
<%@page import="java.util.ArrayList"%>
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
						<a  href="com-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a class="active" href="com-page.jsp?pgprt=1"><h2>Jobs</h2></a>
                                                <a href="com-page.jsp?pgprt=2"><h2>Feedbacks</h2></a>
					</div>
				</div>
			</div>
            <!-- CONTENT AREA -->
			<div class="content-area">
                            
                            <div id="allcourse" class="panel" style="max-width: 933px;float:right;margin-right: -8px;">
                                <div class="title">
                                   All Exams 
                                </div>
                                <table id="one-column-emphasis" style="min-width: 800px;margin: 5px; margin-top: 35px" >
                                    <colgroup>
                                        <col class="oce-first" />
                                    </colgroup>
                                    <thead>
    	<tr>
            <th style="width:200px;" scope="col">Job</th>
            <th style="width:200px;" scope="col">Exam</th>
            <th style="width:80px;" scope="col">T.Marks</th>
            <th style="width:80px;" scope="col">Date</th>
            <th style="width:50px;" scope="col">Start Deadline</th>
            <th style="width:50px;" scope="col">End Deadline</th>
            <th style="width:100px;" scope="col">Exam Time</th>
            <th style="width:100px;" scope="col">Action</th>         
        </tr>
    </thead>                         
        <%  ArrayList list2=pDAO.getAllJobs();
        for(int j=0;j<list2.size();j=j+2){
            ArrayList list=pDAO.getAllExams(Integer.parseInt(list2.get(j).toString()));
            for(int i=0;i<list.size();i=i+9){
           %>
          
           <tr> 
           <td style="width:200px;height:150px;"><%=list2.get(j+1)%></td>
        <td style="width:200px;"><%=list.get(i+1)%></td>
        <td style="width:80px;"><%=list.get(i+2)%></td>
        <td style="width:80px;"><%=list.get(i+3)%></td>
        <td style="width:50px;"><%=list.get(i+4)%></td>
        <td style="width:50px;"><%=list.get(i+5)%></td>
        <td style="width:100px;"><%=list.get(i+6)%></td>
        <td style="width:70px;"><a  href="controller.jsp?page=exams&operation=del&examid=<%=list.get(i+7)%>" 
                onclick="return confirm('Are you sure you want to delete this ?');" class="del">
                <div class="delete-btn" style="max-width: 40px;font-size: 17px; padding: 3px">X</div>
            </a></td>
            <td><button  class="form-button" style="width:90px;margin-bottom: 10px;">
            <a  href="questions.jsp?examid=<%=list.get(i+7)%>&jobid=<%=list.get(i+8)%>">
            <div class="form-button" style="max-width: 140px;font-size: 17px; padding: 3px">Set Questions</div></a>
                </button>
                <button  class="form-button" style="width:90px;">
            <a  href="examresult.jsp?examid=<%=list.get(i+7)%>&jobid=<%=list.get(i+8)%>">
            <div class="form-button" style="max-width: 140px;font-size: 17px; padding: 3px">View Results</div></a>
                </button></td></tr>
           
               
            
            <%
            }
}
            %>
            </table>
        </div>
        <div  id="addnewcourse" class="panel form-style-6" style="max-width: 400px" >
           <div class="title">
                                   Add New Job
                                </div>
            <center>
               <form action="controller.jsp" >
                   <br>
                   <table>
                       <tr>
                           <td><label>Job Name</label></td>
                           <td> <input type="text" name="jobname" class="text" placeholder="Job Name"  style="width: 230px;"></td>
                       </tr>
                       <tr>
                           <td colspan="2"><input type="hidden" name="page" value="jobs">
                    <input type="hidden" name="operation" value="addnew">
                       <center><input type="submit" class="form-button" value="Add" name="submit"></center></td>
                       </tr>
                   </table>

                </form>
            </center>
           
    </div>
            <div  id="addnewcourse" class="panel form-style-6" style="max-width: 400px;margin-top:100px;" >
           <div class="title">
                                   Add New Exam
                                </div>
            <center>
               <form action="controller.jsp" >
                   <br>
                   <table >
                       <tr>
                           <td><label>Job</label></td>
                           <td><select type="text" name="jobid">
                                   <% 
                                    ArrayList list1=pDAO.getAllJobs();
                                    for(int i=1;i<list1.size();i=i+2){
                                    %>
                                   <option value="<%=list1.get(i-1)%>"><%=list1.get(i)%></option>
                                   <%
                                    }
                                    %>
                               </select> 
                       </tr>
                       <tr>
                           <td><label>Exam Name</label></td>
                           <td> <input type="text" name="examname" class="text" placeholder="Exam Name"  style="width: 230px;"></td>
                       </tr>
                       <tr>
                           <td><label>Total Marks</label></td>
                           <td><input type="text" name="totalmarks" class="text" placeholder="Total Marks" style="width: 230px;" ></td>
                       </tr>
                       <tr>
                           <td><label>Date</label></td>
                           <td>
                                <input name="date" type="text" id="datepicker">
                           </td>
                           
                       </tr>
                       <tr>
                           <td><label>Start Deadline</label></td>
                           <td>
                               <select type="text" name="start_deadline">
                                   <option value="00">12:00 AM</option>
                                   <option value="01">01:00 AM</option>
                                   <option value="02">02:00 AM</option>
                                   <option value="03">03:00 AM</option>
                                   <option value="04">04:00 AM</option>
                                   <option value="05">05:00 AM</option>
                                   <option value="06">06:00 AM</option>
                                   <option value="07">07:00 AM</option>
                                   <option value="08">08:00 AM</option>
                                   <option value="09">09:00 AM</option>
                                   <option value="10">10:00 AM</option>
                                   <option value="11">11:00 AM</option>
                                   <option value="12">12:00 PM</option>
                                   <option value="13">01:00 PM</option>
                                   <option value="14">02:00 PM</option>
                                   <option value="15">03:00 PM</option>
                                   <option value="16">04:00 PM</option>
                                   <option value="17">05:00 PM</option>
                                   <option value="18">06:00 PM</option>
                                   <option value="19">07:00 PM</option>
                                   <option value="20">08:00 PM</option>
                                   <option value="21">09:00 PM</option>
                                   <option value="22">10:00 PM</option>
                                   <option value="23">11:00 PM</option>
                               </select>
                           </td>
                           
                       </tr>
                       <tr>
                           <td><label>End Deadline</label></td>
                           <td>
                               <select type="text" name="end_deadline">
                                   <option value="00">12:00 AM</option>
                                   <option value="01">01:00 AM</option>
                                   <option value="02">02:00 AM</option>
                                   <option value="03">03:00 AM</option>
                                   <option value="04">04:00 AM</option>
                                   <option value="05">05:00 AM</option>
                                   <option value="06">06:00 AM</option>
                                   <option value="07">07:00 AM</option>
                                   <option value="08">08:00 AM</option>
                                   <option value="09">09:00 AM</option>
                                   <option value="10">10:00 AM</option>
                                   <option value="11">11:00 AM</option>
                                   <option value="12">12:00 PM</option>
                                   <option value="13">01:00 PM</option>
                                   <option value="14">02:00 PM</option>
                                   <option value="15">03:00 PM</option>
                                   <option value="16">04:00 PM</option>
                                   <option value="17">05:00 PM</option>
                                   <option value="18">06:00 PM</option>
                                   <option value="19">07:00 PM</option>
                                   <option value="20">08:00 PM</option>
                                   <option value="21">09:00 PM</option>
                                   <option value="22">10:00 PM</option>
                                   <option value="23">11:00 PM</option>
                               </select>
                           </td>
                           
                       </tr>
                       <tr>
                           <td><label>Exam Time</label></td>
                           <td>
                                <input type="text" name="time" class="text" placeholder="MM" style="width: 230px;" >
                           </td>
                           
                       </tr>
                       <tr>
                           <td colspan="2"><input type="hidden" name="page" value="exams">
                    <input type="hidden" name="operation" value="addnew">
                       <center><input type="submit" class="form-button" value="Add" name="submit"></center></td>
                       </tr>
                   </table>

                </form>
            </center>
           
    </div>
     </div>
                       