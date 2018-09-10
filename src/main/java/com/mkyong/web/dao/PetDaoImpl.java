package com.mkyong.web.dao;

import com.mkyong.web.model.Pet;
import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PetDaoImpl implements PetDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Pet getPet(Integer id) {
        Pet pet = (Pet) getCurrentSession().get(Pet.class, id);
        Hibernate.initialize(pet.getMaster());
        Hibernate.initialize(pet.getAppointments());
        return pet;
    }

    public void addPet(Pet pet) {
        getCurrentSession().saveOrUpdate(pet);
    }

    public List<Pet> getAllPets() {
        return getCurrentSession().createQuery("from Pet").list();
    }

    public void removePet(Integer id) {
        Pet pet = getPet(id);
        if (pet != null) {
            getCurrentSession().delete(pet);
        }
    }

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
}
