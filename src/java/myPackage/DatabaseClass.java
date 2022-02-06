
package myPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import myPackage.classes.Answers;
import myPackage.classes.Job;
import myPackage.classes.Exams;
import myPackage.classes.Questions;
import myPackage.classes.User;
import myPackage.classes.Feedback;

public class DatabaseClass {
    private Connection conn;
    public DatabaseClass() throws ClassNotFoundException, SQLException {
        establishConnection();
    }
    
    private void establishConnection() throws ClassNotFoundException, SQLException {
            Class.forName("com.mysql.jdbc.Driver");
            conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/recrumax","root","");
    }
    
    public static void main(String args[]) throws ClassNotFoundException, SQLException {
          DatabaseClass D = new DatabaseClass();
    }
    
    public boolean loginValidate(String userName, String userPass) throws SQLException{
        boolean status=false;
    
    String sql="SELECT * FROM users\n"
            + "WHERE user_name=?";
    PreparedStatement pstm=conn.prepareStatement(sql);
    pstm.setString(1,userName);
    ResultSet rs=pstm.executeQuery();
    String uname;
    String pass;
    while(rs.next()){
        uname=rs.getString("user_name");
        pass=rs.getString("password");
        
            if( pass.equals(userPass)){
                  return true;
             } 
        }//end while
         return false;
          
    }
    public int getUserId(String userName){
        int str=0;
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement("Select * from users where user_name=?");
            pstm.setString(1,userName);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                str= rs.getInt("user_id");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            
        }
        return str;
    }
    public String getUserType(String userId){
        String str="";
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement("Select * from users where user_id=?");
            pstm.setInt(1, Integer.parseInt(userId));
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                str= rs.getString("user_type");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            str= "error";
        }
        return str;
    }
    public void addNewCandidate(String fName,String uName,String email,String pass,
            String utype, String contact,String city,String address){
        try {
            String sql="INSERT into users(first_name,user_name,email,password,user_type,contact_no,city,address) "
                    + "Values(?,?,?,?,?,?,?,?)";
            
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,fName );
            pstm.setString(2,uName );
            pstm.setString(3,email );
            pstm.setString(4,pass );
            pstm.setString(5,utype );
            pstm.setString(6,contact );
            pstm.setString(7,city );
            pstm.setString(8,address );
            pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void addNewCompany(String fName,String uName,String email,String pass,
            String utype, String contact,String city,String address){
        try {
            String sql="INSERT into users(first_name,user_name,email,password,user_type,contact_no,city,address) "
                    + "Values(?,?,?,?,?,?,?,?)";
            
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,fName );
            pstm.setString(2,uName );
            pstm.setString(3,email );
            pstm.setString(4,pass );
            pstm.setString(5,utype );
            pstm.setString(6,contact );
            pstm.setString(7,city );
            pstm.setString(8,address );
            pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public User getUserDetails(String userId){
         User userDetails=null;
         
         try {
            String sql="SELECT * from users where user_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1, userId);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                userDetails=new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)
                                        ,rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)
                                            ,rs.getString(9));
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
         return userDetails;
     }
    public void updateUser(int uId,String fName,String uName,String email,String pass,
            String contact,String city,String address,String userType){
        try {
            String sql="Update users"
                    + " set first_name=? , user_name=? , email=? , password=? , user_type=? , contact_no=? , city=? , address=? "
                    + " where user_id=?";
            
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,fName );
            pstm.setString(2,uName );
            pstm.setString(3,email );
            pstm.setString(4,pass );
            pstm.setString(5,userType );
            pstm.setString(6,contact );
            pstm.setString(7,city );
            pstm.setString(8,address );
            pstm.setInt(9,uId);
            pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList getAllJobs(){
        ArrayList list=new ArrayList();
        try {
            String sql="SELECT * from job";
            PreparedStatement pstm=conn.prepareStatement(sql);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                list.add(rs.getInt(1));
                list.add(rs.getString(2));
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public ArrayList<String> getAllComJobs(){
        ArrayList<String> list=new ArrayList<String>();
        try {
            String sql="SELECT * from job";
            PreparedStatement pstm=conn.prepareStatement(sql);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                list.add(String.valueOf(rs.getInt(1)));
                list.add(rs.getString(2));
                list.add(String.valueOf(rs.getInt(3)));
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public void addNewJob(String jobName, int user_id){
        try {
            String sql="INSERT into job(job_id,job_name,user_id) Values(NULL,?,?)";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1, jobName);
            pstm.setInt(2, user_id);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void addNewExam(int jobid, String examName, String tot_marks, String date, String start_deadline, 
                            String end_deadline, String time){
        try {
            String sql="INSERT into exams(exam_id,exam_name,job_id,total_marks,date,start_deadline,"
                    +"end_deadline,exam_time) Values(NULL,?,?,?,?,?,?,?)";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1, examName);
            pstm.setInt(2, jobid);
            pstm.setString(3, tot_marks);
            pstm.setString(4, date);
            pstm.setString(5, start_deadline);
            pstm.setString(6, end_deadline);
            pstm.setString(7, time);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList getAllExams(int jobid){
        ArrayList list=new ArrayList();
        try {
            String sql="SELECT e.exam_name,e.total_marks,"
                    +"e.date,e.start_deadline,e.end_deadline,e.exam_time,j.job_name,e.exam_id,e.job_id,j.job_id "
                    +"from exams e inner join job j on e.job_id=j.job_id where j.job_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,jobid);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                list.add(rs.getString(7));
                list.add(rs.getString(1));
                list.add(rs.getString(2));
                list.add(rs.getString(3));
                list.add(rs.getString(4));
                list.add(rs.getString(5));
                list.add(rs.getString(6));
                list.add(rs.getInt(8));
                list.add(rs.getInt(9));
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public ArrayList getAllresult(int userid){
        ArrayList list=new ArrayList();
        int jobid;
        try {
            String sql="SELECT c.exam_id,c.job_id,e.exam_id,e.exam_name,e.date,c.sel_status from canexams c inner join exams e on c.exam_id=e.exam_id where c.user_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,userid);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                    list.add(rs.getString(4));
                    list.add(rs.getString(5));
                    list.add(rs.getString(6));
                    jobid = rs.getInt(2);
                    String sql1="SELECT job_name from job where job_id=?";
                    PreparedStatement pstm1=conn.prepareStatement(sql1);
                    pstm1.setInt(1,jobid);
                    ResultSet rs1=pstm1.executeQuery();
                    while(rs1.next()){
                    list.add(rs1.getString(1));
                }
                pstm1.close();
            }
            
            
            pstm.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public String getSelStatus(int examid){
        String res="Pending";
        try {
            String sql="SELECT sel_status from canexams where exam_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,examid);
            ResultSet rs=pstm.executeQuery();
            res = rs.getString(1);
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }
    public void delExam(int exam_id){
        try {
            String sql="DELETE from exams where exam_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,exam_id);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void addQuestion(int jobid, int examid, int domainid, String question,String opt1,String opt2,String opt3
                                ,String opt4,String correct){
        
        try {
            String sql="INSERT into questions( `question`, `opt1`, `opt2`, `opt3`, `opt4`, `correct`,`job_id`,`exam_id`,`domain_id`)"
                    + " VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,question);
            pstm.setString(2,opt1 );
            pstm.setString(3,opt2 );
            pstm.setString(4, opt3);
            pstm.setString(5,opt4 );
            pstm.setString(6,correct );
            pstm.setInt(7,jobid);
            pstm.setInt(8,examid);
            pstm.setInt(9,domainid);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void addFeedback(int examid,String fd){
        
        try {
            String sql="INSERT into feedback( `feedback_id`, `exam_id`, `feedback`) VALUES (NULL,?,?)";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,examid);
            pstm.setString(2,fd);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList getAllQuestions(int jobid, int examid, int domainid){
        ArrayList list=new ArrayList();
        try {            
            String sql="Select question_id,question,opt1,opt2,opt3,opt4,correct from questions where job_id=? and exam_id=? and domain_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,jobid);
            pstm.setInt(2,examid);
            pstm.setInt(3,domainid);
            ResultSet rs=pstm.executeQuery();
            Questions question;
            while(rs.next()){
               question = new Questions(
                       rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),
                       rs.getString(5),rs.getString(6),rs.getString(7)); 
               list.add(question);
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public void delQuestion(int qId){
        try {
            String sql="DELETE from questions where question_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,qId);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public User getUserCom(int userId){
         User userDetails=null;
         
         try {
            String sql="SELECT * from users where user_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1, userId);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                userDetails=new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)
                                        ,rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)
                                            ,rs.getString(9));
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
         return userDetails;
     }
    public void applyExam(int examid,int jobid,int userid){
        try {
         String sql="INSERT into canexams (`canexam_id`,`exam_id`,`user_id`,`job_id`,`obt_marks`,`start_time`,`end_time`,`res_status`,`sel_status`) VALUES (NULL,?,?,?,NULL,NULL,NULL,NULL,NULL)";
         PreparedStatement pstm=conn.prepareStatement(sql);
         pstm.setInt(1,examid);
         pstm.setInt(2,userid);
         pstm.setInt(3,jobid);
         pstm.executeUpdate();
         pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
public ArrayList displayExams(int userid)
{
    ArrayList list=new ArrayList();
        try {
            String sql="SELECT e.exam_id,e.exam_name,c.user_id,c.exam_id "
                    +"from exams e inner join canexams c on e.exam_id=c.exam_id where c.user_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,userid);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                list.add(rs.getInt(1));
                list.add(rs.getString(2));       
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
 public int getRemainingTime(int examId){
        int time=0;
        try {
            
            String sql="SELECT c.start_time,e.exam_time,e.exam_id,c.exam_id from exams e inner join canexams c on e.exam_id=c.exam_id where c.exam_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1, examId);
            ResultSet rs=pstm.executeQuery();
            
            while(rs.next()){
               time=Integer.parseInt(rs.getString(2))-(int)Math.abs((Duration.between(LocalTime.now(),LocalTime.parse(rs.getString(1))).getSeconds()/60));
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(time);
        return time;
    }

 public void startExam(int examid,int userId){
        try {
            String sql="UPDATE canexams set start_time=? "
                    + "where exam_id=? AND user_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,LocalTime.now().toString());
            pstm.setInt(2,examid);
            pstm.setInt(3,userId);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
public ArrayList getQuestions(int examid){
        ArrayList list=new ArrayList();
        try {
            String sql="Select question_id,question,opt1,opt2,opt3,opt4,correct from questions where exam_id=? ORDER BY RAND()";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,examid);
            ResultSet rs=pstm.executeQuery();
            Questions question;
            while(rs.next()){
               question = new Questions(
                       rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),
                       rs.getString(5),rs.getString(6),rs.getString(7)); 
               list.add(question);
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    } 
public int getTotalMarksById(int examid){
     int marks=0;
     try{
         PreparedStatement pstm=conn.prepareStatement("Select total_marks from exams where exam_id=?");
         pstm.setInt(1,examid);
         ResultSet rs=pstm.executeQuery();
         while(rs.next()){
             marks=rs.getInt(1);
             System.out.println(rs.getInt(1));
         }
         pstm.close();  
     }catch(Exception e){
          e.printStackTrace();
     }
     
     return marks;
    }
public ArrayList getResultByExamId(int examId,int userid){
        ArrayList a = new ArrayList();
        try {
            String sql="Select job_name from job";  
            PreparedStatement pstm=conn.prepareStatement(sql);

            pstm.setInt(1, examId);
            pstm.setInt(2, userid);
            ResultSet rs=pstm.executeQuery();
                 a.add(rs.getString(1));
                a.add(rs.getString(1));
                a.add(rs.getString(2));
                a.add(rs.getString(3));
                a.add(rs.getString(4));
                a.add(rs.getString(5));
                a.add(rs.getString(6));
                a.add(rs.getString(7));
                
            
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
        
    }
    public void insertAnswer(int userid,int eId,int qid,String question,String ans){
            try {
                PreparedStatement pstm=conn.prepareStatement("insert into answers(user_id,exam_id,question_id,question,answer,correct_answer,status) "
                        + "Values(?,?,?,?,?,?,?)");
                pstm.setInt(1,userid);
                pstm.setInt(2,eId);
                pstm.setInt(3,  qid);
                pstm.setString(4, question);
                pstm.setString(5,ans);
                String correct=getCorrectAnswer(qid);
                pstm.setString(6, correct);
                pstm.setString(7,getAnswerStatus(ans,correct));
                pstm.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
            }
       } 
    private String getCorrectAnswer(int qid) {
        String ans="";
        
        try {
            PreparedStatement pstm=conn.prepareStatement("Select correct from questions where question_id=?");
            pstm.setInt(1,qid);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                ans=rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return ans;
    }
    private String getAnswerStatus(String ans, String correct) {
        String resp="";
        if(ans.equals(correct)){
            resp="correct";
        }else{
            resp="incorrect";
        }
        return resp;
    }
    public void calculateResult(int userid,int eid,int tMarks,String endTime,int size){
        float percent=0;
        try {
            String sql="update canexams "
                    + "set obt_marks=?, end_time=?,res_status=?,sel_status='Pending' "
                    + "where exam_id=? and user_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            int obt=getObtMarks(userid,eid,tMarks,size);
            pstm.setInt(1,obt );
            pstm.setString(2,endTime);
            percent=((obt*100)/tMarks);
            if(percent>=45.0){
                pstm.setString(3,"Pass");
            }else{
                pstm.setString(3,"Fail");
            }
            pstm.setInt(4, eid);
            pstm.setInt(5,userid);
            pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void updateselstatus(int eid,int userid,String status){
        
        try {
            String sql="update canexams set sel_status=? where exam_id=? and user_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,status);
            pstm.setInt(2,eid);
            pstm.setInt(3,userid);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private int getObtMarks(int userid, int examId,int tMarks,int size) {
    int m=0;
    
        try {
            PreparedStatement pstm=conn.prepareStatement("select count(answer_id) from answers "
                    + "where exam_id=? and status='correct' and user_id=?");
            pstm.setInt(1, examId);
            pstm.setInt(2, userid);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
               m= rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        float rat=(float)tMarks/size;
        System.out.println(rat);
        rat=m*rat;
        System.out.println(rat);
    return m=(int)rat;
    } 
    public ArrayList getObtMarksByDomainId(int userid, int examId) {
    ArrayList<Integer> m = new ArrayList();
    ArrayList<Integer> q = new ArrayList();
    ArrayList<Integer> r = new ArrayList();
    float rat1=0,rat2=0,rat3=0;
        try {
                PreparedStatement pstm=conn.prepareStatement("select q.domain_id,count(a.answer_id),a.question_id,q.question_id,q.exam_id,a.status,a.user_id from answers a inner join questions q on a.question_id=q.question_id "
                        + "where q.exam_id=? and a.status='correct' and a.user_id=? and q.domain_id=1");
                pstm.setInt(1, examId);
                pstm.setInt(2, userid);
                ResultSet rs=pstm.executeQuery();
                while(rs.next()) {
                    PreparedStatement pstm1=conn.prepareStatement("select domain_id,count(question_id) from questions "
                        + "where exam_id=? and domain_id=1");
                    pstm1.setInt(1, examId);
                    ResultSet rs1=pstm1.executeQuery();
                    while(rs1.next()){
                        if(rs1.getInt(2)!=0) {
                            rat1=(float)rs.getInt(2)/rs1.getInt(2);
                        }
                        m.add(1);
                    }
                    pstm1.close();
                }
                pstm.close(); 
                
                PreparedStatement pstm2=conn.prepareStatement("select q.domain_id,count(a.answer_id),a.question_id,q.question_id,q.exam_id,a.status,a.user_id from answers a inner join questions q on a.question_id=q.question_id "
                        + "where q.exam_id=? and a.status='correct' and a.user_id=? and q.domain_id=2");
                pstm2.setInt(1, examId);
                pstm2.setInt(2, userid);
                ResultSet rs2=pstm2.executeQuery();
                while(rs2.next()) {
                    PreparedStatement pstm3=conn.prepareStatement("select domain_id,count(question_id) from questions "
                        + "where exam_id=? and domain_id=2");
                    pstm3.setInt(1, examId);
                    ResultSet rs3=pstm3.executeQuery();
                    while(rs3.next()){
                        if(rs3.getInt(2)!=0) {
                            rat2=(float)rs2.getInt(2)/rs3.getInt(2);
                        }
                        m.add(2);
                    }
                    pstm3.close();
                }
                pstm2.close(); 
                
                PreparedStatement pstm4=conn.prepareStatement("select q.domain_id,count(a.answer_id),a.question_id,q.question_id,q.exam_id,a.status,a.user_id from answers a inner join questions q on a.question_id=q.question_id "
                        + "where q.exam_id=? and a.status='correct' and a.user_id=? and q.domain_id=3");
                pstm4.setInt(1, examId);
                pstm4.setInt(2, userid);
                ResultSet rs5=pstm4.executeQuery();
                while(rs5.next()) {
                    PreparedStatement pstm5=conn.prepareStatement("select domain_id,count(question_id) from questions "
                        + "where exam_id=? and domain_id=3");
                    pstm5.setInt(1, examId);
                    ResultSet rs6=pstm5.executeQuery();
                    while(rs6.next()){
                        if(rs6.getInt(2)!=0) {
                            rat3=(float)rs5.getInt(2)/rs6.getInt(2);
                        }
                        m.add(3);
                    }
                    pstm5.close();
                }
                pstm4.close(); 
                r.add((int)(((rat1*100)/((rat1+rat2+rat3)*100))*360));
                r.add((int)(((rat2*100)/((rat1+rat2+rat3)*100))*360));
                r.add((int)(((rat3*100)/((rat1+rat2+rat3)*100))*360));
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    } 
     public ArrayList getAllfeedbacks(){
        ArrayList list=new ArrayList();
        try {
          
            String sql="Select feedback from feedback";
              PreparedStatement pstm=conn.prepareStatement(sql);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
             list.add(rs.getString(1));
            }
          pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
     }
     public ArrayList getAllexamfeedbacks(int userid){
        ArrayList list=new ArrayList();
        try {          
            String sql;
            sql = "Select job_id,job_name,user_id from job where user_id=?";
            PreparedStatement pstm = conn.prepareStatement(sql); 
                pstm.setInt(1, userid);
                ResultSet rs=pstm.executeQuery();
                while(rs.next()){
                    String sql1="Select e.exam_id,e.exam_name,f.exam_id,f.feedback from exams e inner join feedback f on f.exam_id=e.exam_id where e.job_id=?";
                    PreparedStatement pstm1=conn.prepareStatement(sql1);
                    pstm1.setInt(1, rs.getInt(1));
                    ResultSet rs1=pstm1.executeQuery();
                    while(rs1.next()){
                        list.add(rs.getString(2));
                        list.add(rs1.getString(2));
                        list.add(rs1.getString(4));
                    }
                }
            }
         catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
     }
     public ArrayList getAllCompanies(){
        ArrayList list=new ArrayList();
        try {
          
            String sql="Select first_name,user_name,contact_no,city,address from users WHERE user_type=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,"company");
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
              list.add(rs.getString(1));
              list.add(rs.getString(2));
              list.add(rs.getString(3));
               list.add(rs.getString(4));
                list.add(rs.getString(5));
            }
          pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
     }
       public ArrayList getAllCandidates(){
        ArrayList list=new ArrayList();
        try {
          
            String sql="Select first_name,user_name,contact_no,city,address from users WHERE user_type=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,"candidate");
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
              list.add(rs.getString(1));
              list.add(rs.getString(2));
              list.add(rs.getString(3));
               list.add(rs.getString(4));
                list.add(rs.getString(5));
            }
          pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
     }
       
       public ArrayList getAllCanExams(int examid){
        ArrayList list=new ArrayList();
        try {
          
            String sql="Select u.user_id,u.first_name,u.contact_no,u.city,u.address,c.user_id,c.exam_id,c.obt_marks,c.start_time,c.end_time,c.res_status,u.email from users u inner join canexams c on u.user_id=c.user_id WHERE c.exam_id=? order by c.obt_marks DESC";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,examid);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
              list.add(rs.getString(2));
              list.add(rs.getString(12));
              list.add(rs.getString(3));
              list.add(rs.getString(4));
               list.add(rs.getString(5));
                list.add(rs.getString(8));
                list.add(rs.getString(9));
                list.add(rs.getString(10));
                list.add(rs.getString(11));
                list.add(rs.getInt(1));
            }
          pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
     }
  }
