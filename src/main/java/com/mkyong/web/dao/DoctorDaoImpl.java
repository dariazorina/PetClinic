package com.mkyong.web.dao;

import com.mkyong.web.model.Doctor;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DoctorDaoImpl implements DoctorDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Doctor getDoctor(Integer id) {
        return (Doctor) getCurrentSession().get(Doctor.class, id);
    }

    @Override
    public void addDoctor(Doctor doctor) {
        getCurrentSession().saveOrUpdate(doctor);
    }

    @Override
    public List<Doctor> getAllDoctors() {
        return getCurrentSession().createQuery("from Doctor").list();
    }

    @Override
    public void removeDoctor(Integer id) {
        Doctor doctor = getDoctor(id);
        if (doctor != null) {
            getCurrentSession().delete(doctor);
        }
    }

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
}
