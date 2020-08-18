package com.itheima.service.impl;

import com.itheima.dao.DoctorDao;
import com.itheima.po.*;
import com.itheima.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户Service接口实现类
 */
@Service("studentService")
@Transactional
public class DoctorServiceImpl implements DoctorService {
    // 注入studentDao
    @Autowired
    private DoctorDao doctorDao;

    //分页查询
    @Override
    public PageInfo<Doctor> findPageInfo(String d_name, Integer d_doctorid,  String d_house,
                                          Integer pageIndex, Integer pageSize) {

        PageInfo<Doctor> pi = new PageInfo<Doctor>();
        pi.setPageIndex(pageIndex);//页码
        pi.setPageSize(pageSize);//显示条数
        //获取总条数
        Integer totalCount = doctorDao.totalCount(d_name, d_doctorid, d_house);//里面的参数用作条件查询
        if (totalCount > 0) {
            pi.setTotalCount(totalCount);
            //每一页显示学生信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Doctor> studentList = doctorDao.getDoctorList(d_name, d_doctorid, d_house,
                    (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());//每页显示的数据集合
            pi.setList(studentList);
        }
        return pi;
    }

    @Override
    public List<Doctor> getAll() {
        List<Doctor> doctorsList = doctorDao.getAll();
        return doctorsList;
    }


    //通过id删除学生信息
    @Override
    public int deleteDoctor(Integer d_id) {
        return doctorDao.deleteDoctor(d_id);
    }



    //修改学生信息
    @Override
    public int updateDoctor(Doctor doctor) {
        return doctorDao.updateDoctor(doctor);
    }

    @Override
    public Doctor findDoctorById(Integer d_id) {
        Doctor d = doctorDao.findDoctorById(d_id);
        return d;
    }
    //查询排班
    @Override
    public List<Paiban> findPaiban(){
        return doctorDao.findPaiban();
    }

    @Override
    public  Paiban editPaiban(){
        return doctorDao.editPaiban();
    }

    @Override
    public int updatePaiban(Paiban paiban){
        return doctorDao.updatePaiban(paiban);
    }

    @Override
    public DoAccount findAccount(DoAccount doAccount){
        return doctorDao.findAccount(doAccount);
    }


}
