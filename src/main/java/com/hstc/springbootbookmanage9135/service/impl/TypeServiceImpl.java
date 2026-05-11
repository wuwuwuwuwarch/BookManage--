package com.hstc.springbootbookmanage9135.service.impl;

import com.hstc.springbootbookmanage9135.dao.TypeMapper;

import com.hstc.springbootbookmanage9135.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hstc.springbootbookmanage9135.entity.Type;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {
    @Autowired
    private TypeMapper typeMapper;
    @Override
    public List<Type> queryTypeList() {
        return typeMapper.queryTypeList();
    }
}
