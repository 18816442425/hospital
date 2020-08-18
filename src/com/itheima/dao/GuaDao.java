package com.itheima.dao;

import com.itheima.po.Gua;
import org.apache.ibatis.annotations.Param;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public interface GuaDao {
    public int addGua(Gua gua);

    public List<Gua> getGuaList(@Param("username") String username,@Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    public List<Gua> getHaoList(@Param("d_name") String d_name,@Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    public Integer totalCount(@Param("username") String username);

    public Integer totalSum(@Param("d_name") String d_name);

    public int quGua(Integer id);

    public  int successGua(@Param("id") Integer id,@Param("status") String status);

    public  int failGua(@Param("id") Integer id,@Param("status") String status);

}
