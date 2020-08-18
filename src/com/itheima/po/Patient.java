package com.itheima.po;

public class Patient {
    private static final long serialVersionUID = 1L;
    private Integer p_id;
    private String p_name;
    private String p_phone;
    private String p_age;
    private String p_address;
    private String p_matter;
    private String p_house;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }
    public Integer getP_id() {
        return p_id;
    }

    public void setP_id(Integer p_id) {
        this.p_id = p_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_phone() {
        return p_phone;
    }

    public void setP_phone(String p_phone) {
        this.p_phone = p_phone;
    }

    public String getP_age() {
        return p_age;
    }

    public void setP_age(String p_age) {
        this.p_age = p_age;
    }

    public String getP_address() {
        return p_address;
    }

    public void setP_address(String p_address) {
        this.p_address = p_address;
    }

    public String getP_matter() {
        return p_matter;
    }

    public void setP_matter(String p_matter) {
        this.p_matter = p_matter;
    }

    public String getP_house() {
        return p_house;
    }

    public void setP_house(String p_house) {
        this.p_house = p_house;
    }



}
