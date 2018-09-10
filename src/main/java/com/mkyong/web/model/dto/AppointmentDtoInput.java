package com.mkyong.web.model.dto;

import com.mkyong.web.model.Doctor;
import com.mkyong.web.model.Pet;

public class AppointmentDtoInput {

    private Integer id;
    private Pet pet = new Pet();
    private String date;
    private Doctor doctor = new Doctor();

    public Integer getId() { return id; }

    public void setId(Integer id) { this.id = id; }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Pet getPet() {
        return pet;
    }

    public void setPet(Pet pet) {
        this.pet = pet;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
