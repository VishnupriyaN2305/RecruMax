
package myPackage.classes;


public class Feedback {
   private int fID,exam_id;
   private String feedback;

   public Feedback(){
       
   }
    public Feedback(int fID, int exam_id, String f) {
        this.fID = fID;
        this.exam_id = exam_id;
        this.feedback = f;
    }

    public int getfID() {
        return fID;
    }

    public void setfID(int fID) {
        this.fID = fID;
    }

    public int getexamID() {
        return exam_id;
    }

    public void setexamID(int exam_id) {
        this.exam_id = exam_id;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String f) {
        this.feedback = f;
    }
}
