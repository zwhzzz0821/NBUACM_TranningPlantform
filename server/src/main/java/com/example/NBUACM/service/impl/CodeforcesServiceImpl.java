package com.example.NBUACM.service.impl;

import com.example.NBUACM.POJO.MySQLTable.UserAndRatingList;
import com.example.NBUACM.POJO.ReceiveCFData.submission_info.Submission_Info_Response;
import com.example.NBUACM.POJO.ReceiveCFData.user_info.User_Info_Response;
import com.example.NBUACM.POJO.ReceiveCFData.user_rating.User_Rating_DataBean;
import com.example.NBUACM.POJO.ReceiveCFData.user_rating.User_Rating_Response;
import com.example.NBUACM.POJO.ReturnAppFrontData.GroupedRatingList;
import com.example.NBUACM.entity.User;
import com.example.NBUACM.mapper.UserMapper;
import com.example.NBUACM.mapper.UserRatingMapper;
import com.example.NBUACM.service.CodeforcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Service
public class CodeforcesServiceImpl implements CodeforcesService {
    @Autowired
    private UserRatingMapper userRatingMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    @Scheduled(fixedRate = 24 * 60 * 60 * 1000, initialDelay = 10000)
    public void updateUserInfoAndRatingList() {
        List<User> userlist = userMapper.getAllUsers();
        int user_len = userlist.size();

        for(int i=0 ;i < user_len; i++) {
            String handle = userlist.get(i).getCodeforceshandle();

            /*
            * 更新个人的rating
            * */
            User_Info_Response user_info_response = getUserInfoByHandle(handle);
            updateUserCodeforcesRatingAndImageURL(user_info_response.getResult().get(0).getRating(),handle, user_info_response.getResult().get(0).getTitlePhoto());


            /*
            * 更新userandratinglist
            * */
            User_Rating_Response user_rating_response = getRatingListByHandle(handle);
            updateTableAllRatingList(user_rating_response);
        }

        /*
         * 更新user表的ratingRank
         * */
        updateUserListRatingRank(userlist);

        /*
        * 更新user表的monthACRank
        * */
        updateUserListMonthACRank(userlist);

    }

    /*
    * “更新数据库子系统”要用的函数(往数据库存数据要用的函数)
    * */
    @Override
    public User_Info_Response getUserInfoByHandle(String handle) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

        String url = "https://codeforces.com/api/user.info?handles=" + handle;
        HttpHeaders headers = new HttpHeaders();
        headers.set("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3");
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        HttpEntity<String> entity = new HttpEntity<>(headers);

        try {
            ResponseEntity<User_Info_Response> responseEntity = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    entity,
                    User_Info_Response.class  // 指定返回类型为Response
            );

            User_Info_Response response = responseEntity.getBody();
//            System.out.println(responseEntity);  // 打印Response对象的详细信息
//            System.out.println("result:"+response);
            return response;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }

    @Override
    public User_Rating_Response getRatingListByHandle(String handle) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

        String url = "https://codeforces.com/api/user.rating?handle=" + handle;
        HttpHeaders headers = new HttpHeaders();
        headers.set("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3");
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        HttpEntity<String> entity = new HttpEntity<>(headers);

        try {
            ResponseEntity<User_Rating_Response> responseEntity = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    entity,
                    User_Rating_Response.class  // 指定返回类型为Response
            );

            User_Rating_Response response = responseEntity.getBody();
//            System.out.println(responseEntity);  // 打印Response对象的详细信息
//            System.out.println("result:"+response);
//            return response.getResult().get(0).getRating();
            return response;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
//            return -1;
            return null;
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
    public void updateTableAllRatingList(User_Rating_Response response) {
        String handle = response.getResult().get(0).getHandle();
        List<User_Rating_DataBean> newlist = response.getResult();
        int newlistcount = newlist.size();
        int oldlistcount = userRatingMapper.selectCountByHandle(handle);

        for(int i = oldlistcount; i < newlistcount; i++) {  //把新的弄进数据库里
            insertTableOneRating(newlist.get(i));
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

    /*
    * 从数据库库拿数据的函数
    * */
    @Override
    public List<GroupedRatingList> getUserWithRatinglists() {
        try {
            // 首先，获取所有不同的 handle 值
            List<String> handles = userRatingMapper.selectDistinctHandles();

            List<GroupedRatingList> groupedRatingLists = new ArrayList<>();
            // 然后，为每个 handle 获取 ratingList
            for (String handle : handles) {
                List<UserAndRatingList> ratingList = userRatingMapper.selectRatingsByHandle(handle);
                User user = userMapper.getUserByCodeforcesHandle(handle);
                groupedRatingLists.add(new GroupedRatingList(user, ratingList));
            }
            return groupedRatingLists;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }


}
