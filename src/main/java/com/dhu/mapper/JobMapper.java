package com.dhu.mapper;

import com.dhu.pojo.Job;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface JobMapper {
    List<Job> queryall(@Param("pos") int pos);


    List<Job> alledu();
    List<Job> querybytitle(@Param("title") String title,@Param("pos") int pos);
    Job selectbyid(Integer id);

    List<Job> allarea();
    List<Job> allindustry();

    List<Job> add_id_of_categoryid(@Param("id") int id);
}
