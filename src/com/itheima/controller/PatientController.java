package com.itheima.controller;
import com.itheima.po.Admin;
import com.itheima.po.PageInfo;
import com.itheima.po.Account;
import com.itheima.po.Patient;
import com.itheima.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 用户控制器类
 */
@Controller
public class PatientController {
    // 依赖注入
    @Autowired
    private PatientService patientService;

    /**
     * 分页查询
     * pageIndex 当前页码
     * pageSize  显示条数
     */
    @RequestMapping(value = "/findPatient")
    public String findPatient(String p_name,String p_house,Integer pageIndex, Integer pageSize, Model model) {

        PageInfo<Patient> ci = patientService.findPageInfo(p_name,p_house, pageIndex, pageSize);
        model.addAttribute("ci", ci);
        model.addAttribute("p_name", p_name);
        return "patient_list";
    }



    @RequestMapping("/deletePatient")
    @ResponseBody
    public String deletePatient(Integer p_id) {
        int c = patientService.deletePatient(p_id);
        return "patient_list";
    }



    @RequestMapping("/findPatientById")
    public String findPatientById(Integer p_id, HttpSession session) {
        Patient p = patientService.findPatientById(p_id);
        session.setAttribute("p", p);
        return "patient_edit";
    }


    @RequestMapping(value = "/updatePatient", method = RequestMethod.POST)

    public String updatePatient(Patient patient) {
        int c = patientService.updatePatient(patient);
        return "redirect:/findPatient";
    }

    @RequestMapping("/tzRegister")
    public String tzRegister(){
        return "patient_Register";
    }

    @RequestMapping("/tzLogin")
    public String tzLogin(){
        return "patient_login";
    }

    @RequestMapping(value = "/patientRegister", method = RequestMethod.POST)
    public String patientRegister(Model model, Account account) {
        Account ac=patientService.searchPatient(account);
        if(ac!=null){
            model.addAttribute("msg", "该用户名已被注册,注册失败！");
            return "patient_Register";
        }
        int c=patientService.patientRegister(account);
            model.addAttribute("msg", "注册成功！");
            return "patient_Register";

    }

    @RequestMapping(value = "/brLogin")
    public String brLogin(Account account, Model model, HttpSession session){
        Account sa=patientService.searchPatient(account);
        if(sa!=null){
            session.setAttribute("sa",sa);
            return "patientpage";
        }
        model.addAttribute("msg", "用户名或密码错误，请重新登录！");
        return "patient_login";
    }

    @RequestMapping(value = "/patientOut")
    public String loginOut( HttpSession session) {
        session.invalidate();
        return "patient_login";

    }

}
