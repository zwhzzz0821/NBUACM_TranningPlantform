package com.example.NBUACM.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProblemList {

    int id;
    String name;
    String begin;
    String end;
}
