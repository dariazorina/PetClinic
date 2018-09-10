package com.mkyong.web.service;

import com.mkyong.web.model.Pet;

import java.util.List;

public interface PetService {

    List<Pet> getAll();

    Pet getById(Integer id);

    void delete(Integer id);

    void saveOrUpdate(Pet client);
}
