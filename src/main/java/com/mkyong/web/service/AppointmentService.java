package com.mkyong.web.service;

import com.mkyong.web.model.Appointment;

import java.util.List;

public interface AppointmentService {

    Appointment getById(Integer id);

    void saveOrUpdate(Appointment app);

    List<Appointment> getAll();

    void delete(Integer id);
}
