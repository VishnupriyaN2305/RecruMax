/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myPackage.classes;


public class Job {
   private int job_id;
   private String jobName;

    public Job(int jID, String jName) {
        this.job_id = jID;
        this.jobName = jName;
    }

    public Job() {
    }
    
    public int getjID() {
        return job_id;
    }
    
    public void setjID(int jID) {
        this.job_id = jID;
    }
    
    public String getjName() {
        return jobName;
    }

    public void setjName(String jName) {
        this.jobName = jName;
    }
}