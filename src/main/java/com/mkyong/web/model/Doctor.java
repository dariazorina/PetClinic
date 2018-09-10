package com.mkyong.web.model;

import javax.persistence.*;
import java.util.Set;


@Entity
@Table(name = "doctor")
public class Doctor extends SystemUser {


    private String name;
    private String specialization;
    private Integer age;
    private String phone;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "doctor")
    private Set<Appointment> appointments;


    public Doctor() {
       // this.name = "";
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


    public Set<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(Set<Appointment> appointments) {
        this.appointments = appointments;
    }
}
