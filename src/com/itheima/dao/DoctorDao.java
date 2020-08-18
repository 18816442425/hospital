package com.itheima.dao;

import com.itheima.po.Doctor;

import com.itheima.po.DoAccount;
import com.itheima.po.Paiban;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 管理员DAO层接口
 */
public interface DoctorDao {
    /**
     * 进行分页查询
     */

    //获取总条数
    public Integer totalCount(@Param("d_name") String d_name, @Param("d_doctorid") Integer d_doctorid,
                               @Param("d_house") String d_house);

    //获取用户列表
    public List<Doctor> getDoctorList(@Param("d_name") String d_name, @Param("d_doctorid") Integer d_doctorid,
                                       @Param("d_house") String d_house, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    public int deleteDoctor(Integer d_id);   //删除学生信息


    public int updateDoctor(Doctor doctor); //修改学生信息

    public Doctor findDoctorById(Integer d_id);

    public List<Doctor> getAll();

    public List<Paiban> findPaiban();

    public  Paiban editPaiban();

    public  int updatePaiban(Paiban paiban);

    public DoAccount findAccount(DoAccount doAccount);
}
