package com.example.NBUACM.POJO.MySQLTable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProblemListWithProblems {
    int problemListId;
    int problemId;
    int contestId;
    String problemIndex;
    String name;
}
