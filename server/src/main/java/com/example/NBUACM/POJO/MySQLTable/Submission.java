package com.example.NBUACM.POJO.MySQLTable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Submission {

    private long acsubmissionid;
    private long submissionIdFromCF;
    private long contestId;
    private String ProblemIndex;
    private long actime;
    private String handle;
    private int ProblemId;
    private int ProblemRating;
    private String verdict;
}
