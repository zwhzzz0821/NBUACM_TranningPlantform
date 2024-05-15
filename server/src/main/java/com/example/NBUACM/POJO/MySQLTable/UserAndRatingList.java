package com.example.NBUACM.POJO.MySQLTable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserAndRatingList {
    private String handle;
    private int contestid;
    private String contestname;
    private int oldrating;
    private int newrating;
    private Long ratingupdatetimeseconds;
}
