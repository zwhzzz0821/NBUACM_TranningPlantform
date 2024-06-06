package com.example.NBUACM.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class honors {
    int hid;
    String award;
    long acquiredTime;
    String player1;
    String player2;
    String player3;
    String coach;
}
