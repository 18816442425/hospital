package com.itheima.service;

import com.itheima.po.Gua;
import com.itheima.po.PageInfo;

public interface GuaService {
    public int addGua(Gua gua);

    public PageInfo<Gua> findPageInfo(String username,Integer pageIndex, Integer pageSize);

    public PageInfo<Gua> findPaInfo(String d_name,Integer pageIndex, Integer pageSize);

    public int quGua(Integer id);

    public int successGua(Integer id);

    public int failGua(Integer id);
}
