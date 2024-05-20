package com.example.NBUACM.POJO.ReturnAppFrontData;
import com.example.NBUACM.POJO.MySQLTable.UserAndRatingList;
import com.example.NBUACM.entity.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GroupedRatingList {
    User user;
    List<UserAndRatingList> ratinglist;
}
