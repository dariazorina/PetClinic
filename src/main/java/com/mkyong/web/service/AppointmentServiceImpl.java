package com.mkyong.web.service;

import com.mkyong.web.dao.AppointmentDAO;
import com.mkyong.web.model.Appointment;
import com.mkyong.web.model.dto.AppointmentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.List;

@Service
public class AppointmentServiceImpl implements AppointmentService {

    @Autowired
    private AppointmentDAO appointmentDAO;


    @PostConstruct
    public void init() {
    }

    @Override
    @Transactional
    public Appointment getById(Integer id) {
        return appointmentDAO.getAppointment(id);
    }

    @Override
    @Transactional
    public void saveOrUpdate(Appointment app) {
        appointmentDAO.addAppointment(app);
    }

    @Override
    @Transactional
    public List<Appointment> getAll(){
        return appointmentDAO.getAllAppointments();
    }

    @Override
    @Transactional
    public void delete(Integer id) {
        appointmentDAO.removeAppointment(id);
    }

    @Override
    @Transactional
    public List<AppointmentDto> getAppointments() {
        return appointmentDAO.getAppointments();
    }
}
