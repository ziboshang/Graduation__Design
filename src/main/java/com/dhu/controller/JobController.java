package com.dhu.controller;


import com.dhu.pojo.Job;
import com.dhu.pojo.importantword;
import com.dhu.service.JobService;
import com.dhu.service.WordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
@RequestMapping("/jobs")
public class JobController {

    @Autowired
    private JobService jobService;
    @Autowired
    private WordService wordService;



    //首页跳转X //查询所有新闻
    @RequestMapping("/main")
    public  String main(Model model,int page)
    {
        List<Job> jobs = jobService.queryall(page);
        model.addAttribute("nowpage",page);
        model.addAttribute("jobs",jobs);
        return "main";
    }

    @ResponseBody
    @RequestMapping("/all")
    public  List<Job> all(Model model,int nowpage)
    {
        List<Job> jobs = jobService.queryall(nowpage);
        return jobs;
    }
    @RequestMapping("query/title")
    public String querybytitle(@RequestParam("title")String title,@RequestParam("nowpage")int nowpage,Model model)
    {
        //System.out.println(nowpage);
        model.addAttribute("title",title);
        List<Job> list = jobService.querybytitle(title,nowpage);
        model.addAttribute("jobs",list);
        model.addAttribute("nowpage",nowpage);
        return "main";
    }

    @RequestMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id,Model model)
    {
        System.out.println(id);
        Job j = jobService.selectbyid(id);
        model.addAttribute("job",j);
        return "main2";
    }

    @RequestMapping("/view")
    public String toView()
    {
        return "city";
    }

    @ResponseBody
    @RequestMapping("/area")
    public Map<String, Integer> analyseArea(Model model)
    {
        List<Job> jobs = jobService.allarea();
        Map<String,Integer> result = new HashMap();
        for(int i=0;i<jobs.size();i++)
        {
            String temp = jobs.get(i).getArea();
            if(temp.length()<2) continue;
            temp = temp.substring(0,2);
            if(result.containsKey(temp))
            {
                int next = result.get(temp)+1;
                result.put(temp,next);
            }
            else{
                result.put(temp,1);
            }
        }
        //清理小于20的数据
        int allelse=0;
        Iterator<Map.Entry<String,Integer>> it = result.entrySet().iterator();
        while(it.hasNext()) {
            Map.Entry<String,Integer> entry=it.next();
            if(entry.getValue()<20)
            {
                allelse+=entry.getValue();
                it.remove();
            }
        }
        result.put("其他",allelse);
        return result;
    }

    @ResponseBody
    @RequestMapping("/industry")
    public Map<String,Integer> analyseIndustry()
    {
        List<Job> jobs = jobService.allindustry();
        Map<String,Integer> result = new HashMap();
        Set<String> companyname = new HashSet();
        for(int i=0;i<jobs.size();i++)
        {
            String now = jobs.get(i).getCompanyname();
            if(companyname.contains(now)) continue;
            else companyname.add(now);

            String temp = jobs.get(i).getIndustry();
            if (temp.length()==0) temp="其他";
            if(result.containsKey(temp))
            {
                int next = result.get(temp)+1;
                result.put(temp,next);
            }
            else{
                result.put(temp,1);
            }
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/importantword")
    public Map<String,Integer> analyseword(@RequestParam("id") int id)
    {

        List<Job> jobs = jobService.catagory_id_of_ids(id);
        System.out.println(jobs.size());
        Map<String,Integer> result = new HashMap();

        for(int i=0;i<jobs.size();i++)
        {
            importantword a = wordService.selectbyid(jobs.get(i).getId());
            String words[] = a.getImportantword().split(" ");
            for(int j=0;j<words.length;j++)
            {
                if(result.containsKey(words[j]))
                {
                    int temp = result.get(words[j])+1;
                    result.put(words[j],temp);
                }
                else{
                    result.put(words[j],1);
                }
            }
        }
        Iterator<Map.Entry<String,Integer>> it = result.entrySet().iterator();
        while(it.hasNext()) {
            Map.Entry<String,Integer> entry=it.next();
            if(entry.getValue()<50)
            {
                it.remove();
            }
        }
        return result;
    }


    @ResponseBody
    @RequestMapping("/edu")
    public Map<String,Integer> analyseedu()
    {
        List<Job> jobs = jobService.alledu();
        Map<String,Integer> result = new HashMap();

        for(int i=0;i<jobs.size();i++)
        {
            String temp = jobs.get(i).getEducation();
            if(result.containsKey(temp))
            {
                int next = result.get(temp)+1;
                result.put(temp,next);
            }
            else{
                result.put(temp,1);
            }
        }
        return result;
    }


}
