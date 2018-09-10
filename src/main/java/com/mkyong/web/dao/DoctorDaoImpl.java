package com.mkyong.web.dao;

import com.mkyong.web.model.Doctor;
import com.mkyong.web.model.dto.AppointmentDto;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.hibernate.transform.Transformers;
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


    @Override
    public List<AppointmentDto> getAppointments(Integer doctorId) {

        //String sql = "SELECT a.id as id, p.name as petName , p.species as species, a.date as date\n " +
        String sql = "SELECT a.id as id, p.name as petName , a.date as date\n " +
                "FROM appointment a " +
                "LEFT JOIN  pet p ON p.id = a.pet_id " +
//                "LEFT JOIN appointment a ON p.id = a.pet_id " +
//                "LEFT JOIN doctor d ON d.id = a.doctor_id " +
                // "where a.`status` = 'PLANNED';";
                "where a.doctor_id = " + doctorId + " and a.`status` = 'PLANNED';";


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
