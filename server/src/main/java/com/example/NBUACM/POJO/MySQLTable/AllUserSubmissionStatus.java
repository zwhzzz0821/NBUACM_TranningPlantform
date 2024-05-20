package com.example.NBUACM.POJO.MySQLTable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AllUserSubmissionStatus {
    int id;
    int maxWeekAC;
    int maxMonthAC;
    double maxWeekAverageACRating;
    double maxMonthAverageACRating;
    double maxTotalAverageACRating;

    double avgWeekAC;
    double avgMonthAC;
    double avgWeekAverageACRating;
    double avgMonthAverageACRating;
    double avgTotalAverageACRating;


}
