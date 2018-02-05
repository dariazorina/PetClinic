package com.mkyong.web.dao;

import com.mkyong.web.model.Appointment;
//import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AppointmentDaoImpl implements AppointmentDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Appointment getAppointment(Integer id) {
        Appointment client = (Appointment) getCurrentSession().get(Appointment.class, id);
      ///////////////////////////  Hibernate.initialize(client.getPets());
        return client;
    }

    @Override
    public void addAppointment(Appointment appointment) {
        getCurrentSession().saveOrUpdate(appointment);
    }

    @Override
    public List<Appointment> getAllAppointments() {
        return getCurrentSession().createQuery("from Appointment").list();
    }

    @Override
    public void removeAppointment(Integer id) {
        Appointment appointment = getAppointment(id);
        if (appointment != null) {
            getCurrentSession().delete(appointment);
        }
    }

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

}
