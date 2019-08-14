package com.dhu.service;


import com.dhu.mapper.JobMapper;
import com.dhu.pojo.Job;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("jobService")
public class JobServiceImpl implements JobService{
    @Autowired
    private JobMapper jobMapper;

    @Override
    public List<Job> queryall(int page) {
        int pos=(page-1)*20;
        return jobMapper.queryall(pos);
    }

    @Override
    public List<Job> querybytitle(String title,int page) {
        int pos=(page-1)*20;
        return jobMapper.querybytitle(title,pos);
    }

    @Override
    public Job selectbyid(Integer id) {
        return jobMapper.selectbyid(id);
    }

    @Override
    public List<Job> allarea() {
        return jobMapper.allarea();
    }

    @Override
    public List<Job> allindustry() {
        return jobMapper.allindustry();
    }

    @Override
    public List<Job> catagory_id_of_ids(int id) {
         return jobMapper.add_id_of_categoryid(id);
    }

    @Override
    public List<Job> alledu() {
        return jobMapper.alledu();
    }
}
