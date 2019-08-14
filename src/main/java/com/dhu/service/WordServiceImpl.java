package com.dhu.service;

import com.dhu.mapper.WordMapper;
import com.dhu.pojo.importantword;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("wordService")
public class WordServiceImpl implements WordService {

    @Autowired
    private WordMapper wordMapper;

    @Override
    public importantword selectbyid(int id) {
        return wordMapper.selectbyid(id);
    }
}
