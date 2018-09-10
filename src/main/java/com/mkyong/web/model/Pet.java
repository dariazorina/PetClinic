package com.mkyong.web.model;

import javax.persistence.*;
import java.util.Calendar;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "pet")
public class Pet {

    @Id
    @Column(name = "id")
    @GeneratedValue
    private Integer id;
    private String name;
    private String species;
    private Integer age;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "client_id", nullable = false)
    private Client master;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "pet")
    private Set<Appointment> appointments;

    public Pet() {
    }

    public Pet(String name, String species, Integer age, String illness) {
        this.name = name;
        this.species = species;
        this.age = age;
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

    public Client getMaster() {
       // if(LAZY){
        // if(!INITIALIZED){


        //Maseter m = db.getMasster for this particular pet
        // realObj.setMaser(m);
        //INITIALIZED = true;

        // }
        // return realObj.getMaser();
        //
        //
        //
        // } else {
        // return realObj.getMaser();
        //
        // }

        return master;
    }

    public void setMaster(Client master) {
        this.master = master;
    }

    public Set<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(Set<Appointment> appointments) {
        this.appointments = appointments;
    }

}