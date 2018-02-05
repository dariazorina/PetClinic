package com.mkyong.web.model;

import javax.persistence.*;
import java.util.Calendar;
import java.util.List;


@Entity
@Table(name = "doctor")
public class Doctor {

    @Id
    @Column(name = "id")
    @GeneratedValue
    private Integer id;
    private String name;
    private String specialization;
    private Integer age;
    private String phone;
//    private List <Calendar> calendar;

    public Doctor() {
    }

    public Doctor(Integer id, String name, String specialization, Integer age, String phone, List <Calendar> calendar) {
        this.id = id;
        this.name = name;
        this.specialization = specialization;
        this.age = age;
        this.phone = phone;
        //?
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Doctor{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", phone='" + phone + '\'' +
                '}';
    }
}
