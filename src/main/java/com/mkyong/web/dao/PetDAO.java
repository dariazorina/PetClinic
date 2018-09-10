package com.mkyong.web.dao;

import com.mkyong.web.model.Pet;

import java.util.List;

public interface PetDAO {

    Pet getPet(Integer id);

    void addPet(Pet pet);

    List<Pet> getAllPets();

    void removePet(Integer id);
}
