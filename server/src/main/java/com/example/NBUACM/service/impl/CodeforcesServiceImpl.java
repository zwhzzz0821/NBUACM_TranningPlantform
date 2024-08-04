package com.example.NBUACM.service.impl;

import com.example.NBUACM.Exception.SpecificException;
import com.example.NBUACM.POJO.MySQLTable.UserAndRatingList;
import com.example.NBUACM.POJO.ReceiveCFData.user_info.User_Info_Response;
import com.example.NBUACM.POJO.ReceiveCFData.user_rating.User_Rating_DataBean;
import com.example.NBUACM.POJO.ReceiveCFData.user_rating.User_Rating_Response;
import com.example.NBUACM.POJO.ReturnAppFrontData.GroupedRatingList;
import com.example.NBUACM.entity.User;
import com.example.NBUACM.mapper.UserMapper;
import com.example.NBUACM.mapper.UserRatingMapper;
import com.example.NBUACM.service.ApiClient.CodeforcesApiClient;
import com.example.NBUACM.service.ApiClient.impl.CodeforcesApiClientImpl;
import com.example.NBUACM.service.CodeforcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@Service
public class CodeforcesServiceImpl implements CodeforcesService {

    @Autowired
    private CodeforcesApiClient codeforcesApiClient;
    @Autowired
    private UserRatingMapper userRatingMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    @Scheduled(fixedRate = 60 * 60 * 1000, initialDelay = 10000)
    public void updateUserInfoAndRatingList() {
        List<User> userlist = userMapper.getAllUsers();   // 获取用户列表
        int user_len = userlist.size();

        for(int i=0 ;i < user_len; i++) {  // 遍历用户列表
            String handle = userlist.get(i).getCodeforceshandle();  //把每个用户的CF的用户名拿出来
            /*
            * 更新个人的rating
            * */
            try {
//                System.out.println("the handle is: " + handle);
                User_Info_Response user_info_response = getUserInfoByHandle(handle);  //调用Codeforces的API，根据CF的用户可以获取它们的用户数据
                //把需要的用户数据存入mysql中
                updateUserCodeforcesRatingAndImageURL(user_info_response.getResult().get(0).getRating(),handle, user_info_response.getResult().get(0).getTitlePhoto());


                /*
                 * 更新userandratinglist
                 * */
                User_Rating_Response user_rating_response = getRatingListByHandle(handle); //从CF那获取某个用户的历史rating_list
                updateTableAllRatingList(user_rating_response, handle);  //更新mysql数据。能进入这里，就意味着各种数据的获取是正常的，除非mysql出现问题

                // 更新完毕，代表handle没有问题。虽然用的是update，如果有较多备注的话，一次看不到所有的问题所在，但是至少出问题确实会有提示
            } catch (Exception err) {
                /*
                * 这个用户出现了数据获取或者更新的异常，可以在这里进行后续操作，比如给点提示啥的。
                * 这里的异常可以肯定是Codeforces用户名的问题
                * */
                System.out.println("updateUserInfoAndRatingList_in_for err：" + err.getMessage());  //There is a problem with your codeforcesHandle(CF用户名)
            }

        }

        try {
            /*
             * 更新user表的ratingRank。按照rating进行排名
             * */
            updateUserListRatingRank(userlist);

            /*
             * 更新user表的monthACRank。按照月AC数进行排名
             * */
            updateUserListMonthACRank(userlist);
        } catch (Exception err) {
            System.out.println("updateUserInfoAndRatingList_out_for err updateTheSum：" + err.getMessage());
        }


    }


    @Override
    public User_Info_Response getUserInfoByHandle(String handle) throws SpecificException {

        /*
        * 准备参数
        * */
        Map<String, String> uriVariables = new HashMap<>();
        uriVariables.put("handle", handle); // 替换为实际的handle值

        try {
            User_Info_Response userInfoResponse = codeforcesApiClient.exchangeForResponse(
                    "https://codeforces.com/api/user.info?handles={handle}",
                    uriVariables,
                    User_Info_Response.class
            );
            return userInfoResponse;
        } catch (SpecificException e) {
//            e.printStackTrace();
            throw new SpecificException(e.myGetMessage(e), e);
        }

    }

    @Override
    public User_Rating_Response getRatingListByHandle(String handle) throws SpecificException {
        /*
         * 准备参数
         * */
        Map<String, String> uriVariables = new HashMap<>();
        uriVariables.put("handle", handle); // 替换为实际的handle值

        try {
            User_Rating_Response userRatingListResponse = codeforcesApiClient.exchangeForResponse(
                    "https://codeforces.com/api/user.rating?handle={handle}",
                    uriVariables,
                    User_Rating_Response.class
            );
            return userRatingListResponse;
        } catch (SpecificException e) {
//            e.printStackTrace();
            throw new SpecificException(e.myGetMessage(e), e);
        }


    }

    @Override
    public void insertTableOneRating(User_Rating_DataBean data) {
        UserAndRatingList insertdata = new UserAndRatingList();
        insertdata.setHandle(data.getHandle());
        insertdata.setContestid(data.getContestId());
        insertdata.setContestname(data.getContestName());
        insertdata.setOldrating(data.getOldRating());
        insertdata.setNewrating(data.getNewRating());
        insertdata.setRatingupdatetimeseconds(data.getRatingUpdateTimeSeconds());

        userRatingMapper.insertOneRating(insertdata);

    }

    @Override
    public void updateTableAllRatingList(User_Rating_Response response, String handle) {
        try {
            List<User_Rating_DataBean> newlist = response.getResult();
            int newlistcount = newlist.size();
            if(newlistcount == 0) {
                System.out.println("用户 " + handle + " 还未打过cf比赛");
                return;
            }

            int oldlistcount = userRatingMapper.selectCountByHandle(handle);

            for(int i = oldlistcount; i < newlistcount; i++) {  //把新的弄进数据库里
                try {
                    insertTableOneRating(newlist.get(i));
                } catch (Exception err) {
                    System.out.println("insetTabelOneRating err:" + err.getMessage());
                }
            }
        } catch (Exception err) {
            System.out.println("updateTableAllRatingList error：" + err.getMessage());
        }

    }

    @Override
    public void updateUserCodeforcesRatingAndImageURL(int rating, String handle, String url) {
        userMapper.updateUserCodeforcesRatingAndImageURL(rating,handle, url);
    }

    @Override
    public void updateUserListRatingRank(List<User> userlist) {
        // 对 userlist 按照 rating 属性进行降序排序
        Collections.sort(userlist, Comparator.comparingDouble(User::getCodeforcesrating).reversed());
        int len = userlist.size();

        for(int i=0;i<len;i++) {
            String handle = userlist.get(i).getCodeforceshandle();
            userMapper.updateRatingRankByHandle(handle, i+1);
        }


    }

    @Override
    public void updateUserListMonthACRank(List<User> userlist) {
        // 对 userlist 按照 MonthAC 属性进行降序排序
        Collections.sort(userlist, Comparator.comparingDouble(User::getMonthAC).reversed());
        int len = userlist.size();
        for(int i=0;i<len;i++) {
            String handle = userlist.get(i).getCodeforceshandle();
            userMapper.updateMonthACRankByHandle(handle, i+1);
        }
    }


    @Override
    public List<GroupedRatingList> getUserWithRatinglists() throws SpecificException {
        try {
            // 首先，获取所有不同的 handle 值
            List<String> handles = userRatingMapper.selectDistinctHandles(); //本应该从ratinglist表中获得的，但是前端要求显示全部的用户，所以这里从user表中拿了

            List<GroupedRatingList> groupedRatingLists = new ArrayList<>();
            // 然后，为每个 handle 获取 ratingList
            for (String handle : handles) {
                List<UserAndRatingList> ratingList = userRatingMapper.selectRatingsByHandle(handle);
                User user = userMapper.getUserByCodeforcesHandle(handle);
                groupedRatingLists.add(new GroupedRatingList(user, ratingList));
            }
            return groupedRatingLists;
        } catch (Exception e) {
            System.out.println("getUserWithRatinglists Error: " + e.getMessage());
            throw new SpecificException(e.getMessage());
        }
    }


}
