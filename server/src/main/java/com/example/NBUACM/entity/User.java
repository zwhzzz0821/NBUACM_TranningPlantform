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
}
