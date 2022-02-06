
package myPackage.classes;


public class CanExams {
    
    private int examId,job_id;
    private String examName,tMarks,date,startDeadline,endDeadline,examTime;

    public CanExams() {
    }

    public CanExams(int examId,int jID, String examName, String tMarks, String date, String startDeadline, String endDeadline, String examTime) {
        this.examId = examId;
        this.job_id=jID;
        this.examName = examName;
        this.tMarks = tMarks;
        this.date = date;
        this.startDeadline = startDeadline;
        this.endDeadline = endDeadline;
        this.examTime = examTime;
    }

    public int getjID() {
        return job_id;
    }

    public void setjID(int jID) {
        this.job_id = jID;
    }

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public String getexamname() {
        return examName;
    }

    public void setexamname(String examName) {
        this.examName = examName;
    }
    
    public String gettMarks() {
        return tMarks;
    }

    public void settMarks(String tMarks) {
        this.tMarks = tMarks;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStartDeadline() {
        return startDeadline;
    }

    public void setStartDeadline(String startDeadline) {
        this.startDeadline = startDeadline;
    }

    public String getEndDeadline() {
        return endDeadline;
    }

    public void setEndDeadline(String endDeadline) {
        this.endDeadline = endDeadline;
    }

    public String getExamTime() {
        return examTime;
    }

    public void setExamTime(String examTime) {
        this.examTime = examTime;
    }
    
}
