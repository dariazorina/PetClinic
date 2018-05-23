package com.mkyong.web.dao;

import com.mkyong.web.model.Appointment;
//import org.hibernate.Hibernate;
import com.mkyong.web.model.dto.AppointmentDto;
import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AppointmentDaoImpl implements AppointmentDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Appointment getAppointment(Integer id) {
        Appointment appointment = (Appointment) getCurrentSession().get(Appointment.class, id);
        Hibernate.initialize(appointment.getDoctor());
        Hibernate.initialize(appointment.getPet());
        return appointment;
    }

    @Override
    public void addAppointment(Appointment appointment) {

//        Hibernate.initialize(appointment.getDoctor());
//        Hibernate.initialize(appointment.getPet());

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

    @Override
    public List<AppointmentDto> getAppointments() {

        //String sql = "SELECT a.id as id, p.name as petName , p.species as species, a.date as date\n " +
        String sql = "SELECT a.id as id, p.name as petName, d.name as doctorName , a.date as date\n " +
                "FROM appointment a " +
                "LEFT JOIN  pet p ON p.id = a.pet_id " +
//                "LEFT JOIN appointment a ON p.id = a.pet_id " +
                "LEFT JOIN doctor d ON d.id = a.doctor_id " +
                "where a.`status` = 'PLANNED';";


        List<AppointmentDto> appList = getCurrentSession()
                .createSQLQuery(sql)
                .setResultTransformer(Transformers.aliasToBean(AppointmentDto.class))
                .list();


        return appList;
    }

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

}
