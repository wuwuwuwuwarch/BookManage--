package com.hstc.springbootbookmanage9135.entity;

import lombok.Data;

@Data
public class Type {
    private String typename;
    private int id;

    @Override
    public String toString() {
        return "Type{" +
                "typename='" + typename + '\'' +
                ", id=" + id +
                '}';
    }
}
