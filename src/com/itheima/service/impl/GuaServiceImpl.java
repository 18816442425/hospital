package com.itheima.service.impl;

import com.itheima.dao.GuaDao;
import com.itheima.po.Gua;
import com.itheima.po.PageInfo;
import com.itheima.service.GuaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("guaService")
@Transactional
public class GuaServiceImpl implements GuaService {
    @Autowired
    private GuaDao guaDao;

    @Override
    public int addGua(Gua gua){
        return guaDao.addGua(gua);
    }

    @Override
    public PageInfo<Gua> findPageInfo(String username,Integer pageIndex, Integer pageSize)
    {
        PageInfo<Gua> gi = new PageInfo<Gua>();
        gi.setPageIndex(pageIndex);
        gi.setPageSize(pageSize);
        Integer totalCount = guaDao.totalCount(username);
        if (totalCount > 0) {
            gi.setTotalCount(totalCount);
            List<Gua> guaList = guaDao.getGuaList(username,(gi.getPageIndex() - 1) * gi.getPageSize(), gi.getPageSize());
            gi.setList(guaList);
        }
        return gi;
    }

    @Override
    public PageInfo<Gua> findPaInfo(String d_name,Integer pageIndex, Integer pageSize)
    {
        PageInfo<Gua> gi = new PageInfo<Gua>();
        gi.setPageIndex(pageIndex);
        gi.setPageSize(pageSize);
        Integer totalCount = guaDao.totalSum(d_name);
        if (totalCount > 0) {
            gi.setTotalCount(totalCount);
            List<Gua> guaList = guaDao.getHaoList(d_name,(gi.getPageIndex() - 1) * gi.getPageSize(), gi.getPageSize());
            gi.setList(guaList);
        }
        return gi;
    }

    @Override
    public int quGua(Integer id){
        return guaDao.quGua(id);
    }

    @Override
    public int successGua(Integer id){
        String status="预约成功";
        return guaDao.successGua(id,status);
    }

    @Override
    public int failGua(Integer id){
        String status="预约失败";
        return guaDao.failGua(id,status);
    }

}
