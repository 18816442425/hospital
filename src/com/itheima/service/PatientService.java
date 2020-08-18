package com.itheima.service;


import com.itheima.po.PageInfo;
import com.itheima.po.Account;
import com.itheima.po.Patient;

/**
 * 用户Service层接口
 */
public interface PatientService {

    //分页查询
    public PageInfo<Patient> findPageInfo(String p_name, String p_house,  Integer pageIndex, Integer pageSize);

    public int deletePatient(Integer p_id);   //删除班级信息



    public int updatePatient(Patient patient); //修改班级信息

    public Patient findPatientById(Integer p_id);

    public int patientRegister(Account account);

    public Account searchPatient(Account account);
}
