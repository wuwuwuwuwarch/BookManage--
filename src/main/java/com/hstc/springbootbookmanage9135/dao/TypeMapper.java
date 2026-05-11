package com.hstc.springbootbookmanage9135.dao;

import com.hstc.springbootbookmanage9135.entity.Type;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TypeMapper {
    @Select("SELECT * FROM type")
    public List<Type> queryTypeList();
}
