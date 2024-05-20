package com.example.NBUACM.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    String uid;
    String username;
    String password;
    String codeforceshandle;
    int codeforcesrating;
    int weekAC;
    int monthAC;
    int weekSubmits;
    int monthSubmits;
    int totalSubmits;
    int totalACSubmits;
    int Difficulty1;
    int Difficulty2;
    int Difficulty3;
    int Difficulty4;
    int Difficulty5;
    int Difficulty6;
    int Difficulty7;
    int ratingRank;
    int monthACRank;
    double weekAverageACRating;
    double monthAverageACRating;
    double totalAverageACRating;
}
