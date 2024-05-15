package com.example.NBUACM.POJO.ReceiveCFData.user_rating;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User_Rating_DataBean {
//      "contestId": 1624,
//      "contestName": "Codeforces Round 764 (Div. 3)",
//      "handle": "Yukim1",
//      "rank": 14899,
//      "ratingUpdateTimeSeconds": 1641833400,
//      "oldRating": 0,
//      "newRating": 382
    private int contestId;
    private String contestName;
    private String handle;
    private int rank;
    private long ratingUpdateTimeSeconds;
    private int oldRating;
    private int newRating;

}
