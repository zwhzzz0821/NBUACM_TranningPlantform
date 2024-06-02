package com.example.NBUACM.POJO.ReturnAppFrontData;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserWithACNumber_In_ProblemList {
    String uid;
    String username;
    int acnumber;

}
