package com.mkyong.web.dao;

import com.mkyong.web.model.Appointment;
import com.mkyong.web.model.dto.AppointmentDto;

import java.util.List;

public interface AppointmentDAO {

    Appointment getAppointment(Integer id);

    void addAppointment(Appointment app);

    List<Appointment> getAllAppointments();

    void removeAppointment(Integer id);

    List<AppointmentDto> getAppointments();
}
