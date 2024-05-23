package com.example.NBUACM.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Blog {
    String uid;
    String username;
    String BlogContent;
    int ProblemId;
}
