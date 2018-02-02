package com.mkyong.web.model;

import javax.persistence.*;
import java.util.Calendar;
import java.util.List;

@Entity
@Table(name = "Pet")
public class Pet {

    @Id
    @Column(name = "ID")
    @GeneratedValue
    private Integer id;
    private String name;
    private String species;
    private Integer age;
    private String master;
    private String doctor;
    private String illness;


    public Pet() {
    }

    public Pet(Integer id, String name, String species, Integer age, String master, String doctor, String illness) {
        this.id = id;
        this.name = name;
        this.species = species;
        this.age = age;
        this.master = master;
        this.doctor = doctor;
        this.illness = illness;
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

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getMaster() {
        return master;
    }

    public void setMaster(String master) {
        this.master = master;
    }

    public String getDoctor() {
        return doctor;
    }

    public void setDoctor(String doctor) {
        this.doctor = doctor;
    }

    public String getIllness() {
        return illness;
    }

    public void setIllness(String illness) {
        this.illness = illness;
    }

}