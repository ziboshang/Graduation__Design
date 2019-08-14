package com.dhu.mapper;

import com.dhu.pojo.importantword;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface WordMapper {
    importantword selectbyid(int id);
}
