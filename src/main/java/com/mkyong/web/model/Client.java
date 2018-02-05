package com.mkyong.web.model;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "client")
public class Client {
    @Id
    @Column(name = "id")
    @GeneratedValue
    private Integer id;

    private String name;
    private String address;
    private String phone;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "master")
    private Set<Pet> pets;

    public Client() {
    }

    public Client(Integer id, String name, String address, String phone, List<Pet> pet) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.phone = phone;
       // this.pet = pet;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Set<Pet> getPets() {
        return pets;
    }

    public void setPets(Set<Pet> pets) {
        this.pets = pets;
    }
}
