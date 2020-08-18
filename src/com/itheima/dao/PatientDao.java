package com.itheima.dao;


import com.itheima.po.Account;
import com.itheima.po.Patient;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 管理员DAO层接口
 */
public interface PatientDao {
    /**
     * 进行分页查询
     */

    //获取总条数
    public Integer totalCount(@Param("p_name") String p_name, @Param("p_house") String p_house);

    //获取用户列表
    public List<Patient> getPatientList(@Param("p_name") String p_name, @Param("p_house") String p_house ,@Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    public int deletePatient(Integer p_id);   //删除班级信息


    public int updatePatient(Patient patient); //修改班级信息

    public Patient findPatientById(Integer p_id);

    public int patientRegister(Account account);

    public Account searchPatient(Account account);

}
