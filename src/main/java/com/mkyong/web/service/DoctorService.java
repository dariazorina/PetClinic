package com.mkyong.web.service;

import com.mkyong.web.model.Doctor;
import com.mkyong.web.model.dto.AppointmentDto;

import java.util.List;

public interface DoctorService {

    List<Doctor> getAll();

    Doctor getById(Integer id);

    void delete(Integer id);

    void saveOrUpdate(Doctor doctor);

    List<AppointmentDto> getAppointments(Integer id);
}
