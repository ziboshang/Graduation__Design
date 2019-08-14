package com.dhu.controller;


import com.dhu.pojo.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/table")
public class viewController {


    @RequestMapping("/t1")
    @ResponseBody
    public Product[] m1()
    {
        Product p1  =new Product();
        Product p2  =new Product();
        Product p3  =new Product();
        Product p4  =new Product();
        Product p5  =new Product();
        Product p6  =new Product();
        p1.setName("aaa");p1.setNumber(11);
        p2.setName("bbb");p2.setNumber(22);
        p3.setName("ccc");p3.setNumber(33);
        p4.setName("ddd");p4.setNumber(44);
        p5.setName("eee");p5.setNumber(55);
        p6.setName("fff");p6.setNumber(66);
        return new Product[]{p1,p2,p3,p4,p5,p6};
    }
}
