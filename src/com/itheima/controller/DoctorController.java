package com.itheima.controller;

import com.itheima.po.*;
import com.itheima.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 用户控制器类
 */
@Controller
public class DoctorController {
    // 依赖注入
    @Autowired
    private DoctorService doctorService;

    /**
     * 分页查询
     * pageIndex 当前页码
     * pageSize  显示条数
     */
    @RequestMapping(value = "/findDoctor")
    public String findDoctor(String d_name, Integer d_doctorid, String d_house,
                                       Integer pageIndex, Integer pageSize, Model model) {

        PageInfo<Doctor> pi = doctorService.findPageInfo( d_name, d_doctorid,  d_house, pageIndex, pageSize);
        model.addAttribute("pi", pi);
        model.addAttribute("d_name", d_name);
        return "doctor_list";
    }




    /**
     * 删除学生信息
     */
    @RequestMapping("/deleteDoctor")
    @ResponseBody
    public String deleteStudent(Integer d_id) {
        int s = doctorService.deleteDoctor(d_id);
        return "doctor_list";
    }

    /**
     * 添加学生信息
     */
    @RequestMapping(value = "/manageDoctor")
    public String manageDoctor(Model model){
        List<Paiban> pb=doctorService.findPaiban();
        model.addAttribute("pb", pb);
        return "paiban_list";
    }


    /**
     * 修改学生信息
     */
    @RequestMapping(value = "/updateDoctor", method = RequestMethod.POST)
    public String updateStudent(Doctor doctor) {
        int s = doctorService.updateDoctor(doctor);
        return "redirect:/findDoctor";
    }

    @RequestMapping("/findDoctorById")
    public String findStudentById(Integer d_id, HttpSession session) {

        Doctor d = doctorService.findDoctorById(d_id);
        session.setAttribute("d", d);
        return "doctor_edit";
    }

    @RequestMapping("/editPaiban")
    public String editPaiban(HttpSession session) {

        Paiban p = doctorService.editPaiban();
        session.setAttribute("p", p);
        return "paiban_edit";
    }

    @RequestMapping(value = "/updatePaiban", method = RequestMethod.POST)
    public String updatePaiban(Paiban paiban) {
        int s = doctorService.updatePaiban(paiban);
        return "redirect:/manageDoctor";
    }

    @RequestMapping(value="/doctorLogin")
     public String doctorLogin(){
        return "doctor_login";
    }

    @RequestMapping(value = "/doLogin")
    public String login(DoAccount doAccount, Model model, HttpSession session) {
        // 通过账号和密码查询用户
        DoAccount pa = doctorService.findAccount(doAccount);
        if (pa != null) {
            session.setAttribute("pa", pa);
            return "doctorpage";
        }
        model.addAttribute("msg", "用户名或密码错误，请重新登录！");
        return "doctor_login";
    }

    @RequestMapping(value = "/doctorOut")
    public String loginOut(HttpSession session) {
        session.invalidate();
        return "doctor_login";

    }


}
