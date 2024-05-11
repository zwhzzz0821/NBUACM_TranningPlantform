package com.example.NBUACM.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Problem {
    int ProblemId;
    int contestId;
    String index;
    String name;
    String type;
    Double points;
    int rating;
    String tags;
}
