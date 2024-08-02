package com.example.NBUACM.service;

import com.example.NBUACM.POJO.ReceiveCFData.user_info.User_Info_Response;
import com.example.NBUACM.POJO.ReceiveCFData.user_rating.User_Rating_DataBean;
import com.example.NBUACM.POJO.ReceiveCFData.user_rating.User_Rating_Response;
import com.example.NBUACM.POJO.ReturnAppFrontData.GroupedRatingList;
import com.example.NBUACM.entity.User;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface CodeforcesService {

    @Scheduled(fixedRate = 60 * 60 * 1000, initialDelay = 10000)
    void updateUserInfoAndRatingList();


    /*
     * “更新数据库子系统”要用的函数(往数据库存数据要用的函数)
     * */

    /*
    * 调用CodeForces的API，拿到userinfo
    * */
    User_Info_Response getUserInfoByHandle(String handle);

    /*
     * 调用CodeForces的API，拿到ratinglist
     * */
    User_Rating_Response getRatingListByHandle(String handle);

    /*
    * 插入表userandratinglist一条数据，
    * 所需的信息为，从CF拿到的ratinglist
    * */
    void insertTableOneRating(User_Rating_DataBean data);
    /*
    * 查看后端数据库指定用户的rating列表的数量，发生变化就插入最新的
    * */
    void updateTableAllRatingList(User_Rating_Response response);

    void updateUserCodeforcesRatingAndImageURL(int rating, String handle, String url);

    void updateUserListRatingRank(List<User> userlist);

    void updateUserListMonthACRank(List<User> userlist);
    //-------------------------------------------------------------------------------------------分割行
    /*
     * 从数据库库拿数据的函数
     * */

    /*
     * 按照handle来group数据，形成list
     * */
    List<GroupedRatingList> getUserWithRatinglists();


}
