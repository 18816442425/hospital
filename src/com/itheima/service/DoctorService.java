package com.itheima.service;

import com.itheima.po.*;

import java.util.List;

/**
 * 用户Service层接口
 */
public interface DoctorService {

    //分页查询
    public PageInfo<Doctor> findPageInfo(String d_name, Integer d_doctorid,
                                         String d_house, Integer pageIndex, Integer pageSize);

    public int deleteDoctor(Integer d_id);   //通过id删除学生信息


    public int updateDoctor(Doctor doctor); //修改学生信息

    public Doctor findDoctorById(Integer d_id);

    public List<Doctor> getAll();

    public List<Paiban> findPaiban();

    public  Paiban editPaiban();

    public  int updatePaiban(Paiban paiban);

    public DoAccount findAccount(DoAccount doAccount);



}
