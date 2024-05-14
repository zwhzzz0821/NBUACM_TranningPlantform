package com.example.NBUACM.POJO.user_rating;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User_Rating_Response {
    private String status;
    private List<User_Rating_DataBean> result;
}
