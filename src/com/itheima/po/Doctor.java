package com.itheima.po;

public class Doctor {
    private static final long serialVersionUID = 1L;
    private  Integer  d_id;
    private  Integer d_doctorid;
    private  String d_name;
    private  String d_house;
    private String d_phone;
    private  String d_status;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }
    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }

    public Integer getD_doctorid() {
        return d_doctorid;
    }

    public void setD_doctorid(Integer d_doctorid) {
        this.d_doctorid = d_doctorid;
    }

    public String getD_house() {
        return d_house;
    }

    public void setD_house(String d_house) {
        this.d_house = d_house;
    }

    public String getD_phone() {
        return d_phone;
    }

    public void setD_phone(String d_phone) {
        this.d_phone = d_phone;
    }

    public String getD_status() {
        return d_status;
    }

    public void setD_status(String d_status) {
        this.d_status = d_status;
    }

    public Integer getD_id() {
        return d_id;
    }

    public void setD_id(Integer d_id) {
        this.d_id = d_id;
    }
}
