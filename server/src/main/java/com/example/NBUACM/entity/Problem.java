package com.example.NBUACM.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Problem {
    private long contestId;
    private String index;
    private String name;
    private String type;
    private Double points;
    private int rating;
    private String tags;
}
