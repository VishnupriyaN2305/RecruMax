
<%@page import="java.time.LocalTime"%>
<%@page import="myPackage.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<%
if(request.getParameter("page").toString().equals("login")){
if(request.getParameter("username").equals("admin")){
         if(request.getParameter("password").equals("admin")){
         session.setAttribute("userStatus", "1");
         session.setAttribute("userId",1);
         response.sendRedirect("adm-page.jsp?pgprt=0");
        }
    }
    else if(pDAO.loginValidate(request.getParameter("username").toString(), request.getParameter("password").toString())){
    session.setAttribute("userStatus", "1");
    session.setAttribute("userId",pDAO.getUserId(request.getParameter("username")));
    response.sendRedirect("dashboard.jsp");

}else{
    request.getSession().setAttribute("userStatus", "-1");
    response.sendRedirect("login.jsp");
   }
}
else if(request.getParameter("page").toString().equals("register")){
        
        String fName =request.getParameter("fname");
        String uName=request.getParameter("uname");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String utype=request.getParameter("utype");
        String contactNo =request.getParameter("contactno");
        String city =request.getParameter("city");
        String address =request.getParameter("address");
    
        if(utype.equals("candidate")) {
            pDAO.addNewCandidate(fName,uName,email,pass,utype, contactNo,city,address);
            response.sendRedirect("login.jsp");
        }
        else if(utype.equals("company")) {
            pDAO.addNewCompany(fName,uName,email,pass,utype, contactNo,city,address);
            response.sendRedirect("login.jsp");
        } 
    }
    else if(request.getParameter("page").toString().equals("profile")){
        
        String fName =request.getParameter("fname");
        String uName=request.getParameter("uname");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String contactNo =request.getParameter("contactno");
        String city =request.getParameter("city");
        String address =request.getParameter("address");
        String uType =request.getParameter("utype");
        int uid=Integer.parseInt(session.getAttribute("userId").toString());         
        pDAO.updateUser(uid,fName,uName,email,pass,contactNo,city,address,uType);
        response.sendRedirect("dashboard.jsp");
    }
    else if(request.getParameter("page").toString().equals("jobs")){
            if(request.getParameter("operation").toString().equals("addnew")){
                String job_name = request.getParameter("jobname");
                pDAO.addNewJob(job_name,Integer.parseInt(session.getAttribute("userId").toString()));
                response.sendRedirect("com-page.jsp?pgprt=1");
            }
    }
    else if(request.getParameter("page").toString().equals("exams")){
            if(request.getParameter("operation").toString().equals("addnew")){
                int job_id = Integer.parseInt(request.getParameter("jobid"));
                String exam_name = request.getParameter("examname");
                String total_marks = request.getParameter("totalmarks");
                String date = request.getParameter("date");
                String start_deadline = request.getParameter("start_deadline");
                String end_deadline = request.getParameter("end_deadline");
                String exam_time = request.getParameter("time");
                pDAO.addNewExam(job_id,exam_name,total_marks,date,start_deadline,end_deadline,exam_time);
                response.sendRedirect("com-page.jsp?pgprt=1");
            }
            else if(request.getParameter("operation").toString().equals("del")) {
                pDAO.delExam(Integer.parseInt(request.getParameter("examid")));
                response.sendRedirect("com-page.jsp?pgprt=1");
            }
            else if(request.getParameter("operation").toString().equals("startexam")){
            int examid=Integer.parseInt(request.getParameter("examid"));
            int userId=Integer.parseInt(session.getAttribute("userId").toString());

            pDAO.startExam(examid,userId);
            session.setAttribute("examId",examid);
            session.setAttribute("examStarted","1");
            response.sendRedirect("can-page.jsp?pgprt=1&examid="+examid);
        }
            else if(request.getParameter("operation").toString().equals("submitted")){
            try{
            String time=LocalTime.now().toString();
            int size=Integer.parseInt(request.getParameter("size"));
            int eId=Integer.parseInt(session.getAttribute("examId").toString());
            int tMarks=Integer.parseInt(request.getParameter("totalmarks"));
            session.removeAttribute("examId");
            session.removeAttribute("examStarted");
            for(int i=0;i<size;i++){
                String question=request.getParameter("question"+i);
                String ans=request.getParameter("ans"+i);

                int qid=Integer.parseInt(request.getParameter("qid"+i));

                pDAO.insertAnswer(Integer.parseInt(session.getAttribute("userId").toString()),eId,qid,question,ans);
            }
            System.out.println(tMarks+" conn\t Size: "+size);
            pDAO.calculateResult(Integer.parseInt(session.getAttribute("userId").toString()),eId,tMarks,time,size);

            response.sendRedirect("can-page.jsp?pgprt=0");
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        else if(request.getParameter("operation").toString().equals("feedback")) {
                pDAO.addFeedback(Integer.parseInt(request.getParameter("examid")),request.getParameter("fd"));
                response.sendRedirect("can-page.jsp?pgprt=4");
            }
    }
    else if(request.getParameter("page").toString().equals("questions")){
        if(request.getParameter("operation").toString().equals("addnew")){
            pDAO.addQuestion(Integer.parseInt(request.getParameter("jobid")),Integer.parseInt(request.getParameter("examid")),Integer.parseInt(request.getParameter("domainid")),request.getParameter("question"),request.getParameter("opt1"), request.getParameter("opt2"),request.getParameter("opt3"),
            request.getParameter("opt4"), request.getParameter("correct"));
            response.sendRedirect("questions.jsp?examid="+request.getParameter("examid")+"&jobid="+request.getParameter("jobid"));
        }else if(request.getParameter("operation").toString().equals("delQuestion")){
            pDAO.delQuestion(Integer.parseInt(request.getParameter("qid")));
            response.sendRedirect("showall.jsp?examid="+request.getParameter("examid")+"&jobid="+request.getParameter("jobid")+"&domainid="+request.getParameter("domainid"));   
        }
    }
    else if(request.getParameter("page").toString().equals("explore")){
            pDAO.applyExam(Integer.parseInt(request.getParameter("examid")),Integer.parseInt(request.getParameter("jobid")),Integer.parseInt(request.getParameter("userid")));
              response.sendRedirect("can-page.jsp?pgprt=3");
    } 
    else if(request.getParameter("page").toString().equals("examresult")){
    if(request.getParameter("operation").toString().equals("selection")){
        if(request.getParameter("selstatus").toString().equals("selected"))
            pDAO.updateselstatus(Integer.parseInt(request.getParameter("examid").toString()),Integer.parseInt(request.getParameter("userid").toString()),"Selected".toString());
        else if(request.getParameter("selstatus").toString().equals("rejected"))
            pDAO.updateselstatus(Integer.parseInt(request.getParameter("examid").toString()),Integer.parseInt(request.getParameter("userid").toString()),"Rejected".toString());
    }        
        response.sendRedirect("examresult.jsp?examid="+request.getParameter("examid")+"&jobid="+request.getParameter("jobid"));
           
    } 
    else if(request.getParameter("page").toString().equals("logout")){
        session.setAttribute("userStatus","0");
        session.removeAttribute("examId");
        session.removeAttribute("examStarted");
        response.sendRedirect("index.jsp");
    }
%>