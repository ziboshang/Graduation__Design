package com.dhu.service;


import com.dhu.pojo.Job;
import org.apache.ibatis.annotations.Param;


import java.util.List;


public interface  JobService {

    List<Job> queryall(int page);

    List<Job> querybytitle(@Param("title") String title,@Param("page") int page);

    Job selectbyid(Integer id);

    List<Job> allarea();
    List<Job> alledu();

    List<Job> allindustry();

    List<Job> catagory_id_of_ids(@Param("id") int id);
}
