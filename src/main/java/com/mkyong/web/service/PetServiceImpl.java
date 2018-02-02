package com.mkyong.web.service;

import com.mkyong.web.dao.PetDAO;
import com.mkyong.web.model.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.List;

@Service
public class PetServiceImpl implements PetService {

    @Autowired
    private PetDAO petDao;

    @PostConstruct
    public void init() {
    }

    @Override
    @Transactional
    public List<Pet> getAll() {
        return petDao.getAllPets();
    }

    @Override
    @Transactional
    public Pet getById(Integer id) {
        return petDao.getPet(id);
    }

    @Override
    @Transactional
    public void delete(Integer id) {
        petDao.removePet(id);
    }

    @Override
    @Transactional
    public void saveOrUpdate(Pet pet) {
        petDao.addPet(pet);
    }
}
