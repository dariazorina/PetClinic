package com.mkyong.web.dao;

import com.mkyong.web.model.Doctor;
import com.mkyong.web.model.dto.AppointmentDto;

import java.util.List;

public interface DoctorDAO {

    Doctor getDoctor(Integer id);

    void addDoctor(Doctor contact);

    List<Doctor> getAllDoctors();

    void removeDoctor(Integer id);

    List<AppointmentDto> getAppointments(Integer doctorId);

}