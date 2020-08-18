package com.itheima.service.impl;

import com.itheima.dao.PatientDao;
import com.itheima.po.PageInfo;
import com.itheima.po.Account;
import com.itheima.po.Patient;
import com.itheima.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户Service接口实现类
 */
@Service("classService")
@Transactional
public class PatientServiceImpl implements PatientService {
    // classDao
    @Autowired
    private PatientDao patientDao;

    //分页查询
    @Override
    public PageInfo<Patient> findPageInfo(String p_name, String p_house, Integer pageIndex, Integer pageSize) {
        PageInfo<Patient> pi = new PageInfo<Patient>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = patientDao.totalCount(p_name,p_house);
        if (totalCount > 0) {
            pi.setTotalCount(totalCount);
            //每一页显示班级信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Patient> patientList = patientDao.getPatientList(p_name,p_house, (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
            pi.setList(patientList);
        }
        return pi;
    }


    //通过id删除班级信息
    @Override
    public int deletePatient(Integer p_id) {
        return patientDao.deletePatient(p_id);
    }




    //修改班级信息
    @Override
    public int updatePatient(Patient patient) {
        return patientDao.updatePatient(patient);
    }

    @Override
    public Patient findPatientById(Integer p_id) {
        Patient d = patientDao.findPatientById(p_id);
        return d;
    }

    @Override
    public int patientRegister(Account account){
        return patientDao.patientRegister(account);
    }

    @Override
    public Account searchPatient(Account account){
        return patientDao.searchPatient(account);
    }


}
