package com.itheima.controller;
import com.itheima.po.*;
import com.itheima.service.DoctorService;
import com.itheima.service.GuaService;
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
public class GuaController {
    // 依赖注入
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private GuaService guaService;

    @RequestMapping(value = "/guaHao")
    public String findDoctor(String d_name, Integer d_doctorid, String d_house,
                             Integer pageIndex, Integer pageSize, Model model) {

        PageInfo<Doctor> pi = doctorService.findPageInfo( d_name, d_doctorid,  d_house, pageIndex, pageSize);
        model.addAttribute("pi", pi);
        model.addAttribute("d_name", d_name);
        return "gua_list";
    }


    @RequestMapping("/guaBa")
    public String findStudentById(Integer d_id, HttpSession session) {
        Doctor d = doctorService.findDoctorById(d_id);
        session.setAttribute("d", d);
        return "hao_list";
    }

    @RequestMapping(value = "/guaHg", method = RequestMethod.POST)
    public String addGua(Gua gua,HttpSession session) {
        gua.setStatus("挂号中");
        Account ac= (Account) session.getAttribute("sa");
        gua.setUsername(ac.getUsername());
        int s = guaService.addGua(gua);
        return "redirect:/guaHao";
    }

    @RequestMapping(value = "/findGua")
    public String findGua(Integer pageIndex, Integer pageSize, Model model,HttpSession session) {
        Account ag= (Account) session.getAttribute("sa");
        String username=ag.getUsername();
        PageInfo<Gua> gi = guaService.findPageInfo(username,pageIndex, pageSize);
        model.addAttribute("gi", gi);
        return "guh_list";
    }


    @RequestMapping(value = "/doctorGua")
    public String doctorGua(Integer pageIndex, Integer pageSize, Model model,HttpSession session) {
        DoAccount ag= (DoAccount) session.getAttribute("pa");
        String d_name=ag.getD_name();
        PageInfo<Gua> gi = guaService.findPaInfo(d_name,pageIndex, pageSize);
        model.addAttribute("gi", gi);
        return "guho_list";
    }

    @RequestMapping("/quGua")
    @ResponseBody
    public String quGua(Integer id) {
        int s = guaService.quGua(id);
        return "guh_list";
    }

    @RequestMapping("/successGua")
    public String successGua(Integer id, HttpSession session) {
        int s= guaService.successGua(id);
        return "guho_list";
    }

    @RequestMapping("/failGua")
    public String failGua(Integer id, HttpSession session) {
        int s= guaService.failGua(id);
        return "guho_list";
    }

}
