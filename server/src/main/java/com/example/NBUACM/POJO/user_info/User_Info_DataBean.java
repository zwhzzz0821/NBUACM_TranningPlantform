package com.example.NBUACM.POJO.user_info;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User_Info_DataBean {

    //			"country": "China",
//			"lastOnlineTimeSeconds": 1715237708,
//			"city": "Ningbo",
//			"rating": 1782,
//			"friendOfCount": 33,
//			"titlePhoto": "https://userpic.codeforces.org/2402327/title/5b8aacefdf3beaf9.jpg",
//			"handle": "Yukim1",
//			"avatar": "https://userpic.codeforces.org/2402327/avatar/66022b86168434e3.jpg",
//			"contribution": 0,
//			"organization": "Ningbo University",
//			"rank": "expert",
//			"maxRating": 1820,
//			"registrationTimeSeconds": 1641792204,
//			"maxRank": "expert"
    private String country;
    private long lastOnlineTimeSeconds;
    private String city;
    private int rating;
    private int friendOfCount;
    private String titlePhoto;
    private String handle;
    private String avatar;
    private int contribution;
    private String organization;
    private String rank;
    private int maxRating;
    private long registrationTimeSeconds;
    private String maxRank;
}