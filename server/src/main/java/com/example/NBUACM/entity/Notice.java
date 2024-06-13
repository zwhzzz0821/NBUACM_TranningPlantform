package com.example.NBUACM.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
    int id;
    String author;
    Long date;
    String title;
    String info;
}
