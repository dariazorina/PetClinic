package com.mkyong.web.service;

import com.mkyong.web.dao.DoctorDAO;
import com.mkyong.web.model.Doctor;
import com.mkyong.web.model.dto.AppointmentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import javax.annotation.PostConstruct;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class DoctorServiceImpl implements DoctorService {

    @Autowired
    DoctorDAO doctorDao;

    @PostConstruct
    public void init() {
    }

    @Override
    @Transactional
    public List<Doctor> getAll() {
        return doctorDao.getAllDoctors();
    }

    @Override
    @Transactional
    public Doctor getById(Integer id) {
        return doctorDao.getDoctor(id);
    }

    @Override
    @Transactional
    public void delete(Integer id) {
        doctorDao.removeDoctor(id);
    }

    @Override
    @Transactional
    public void saveOrUpdate(Doctor doctor) {

        System.out.println("doctor = " + doctor);
        doctorDao.addDoctor(doctor);
        System.out.println("doctor = " + doctor);
    }

    @Override
    @Transactional
    public List<AppointmentDto> getAppointments(Integer id) {
        return doctorDao.getAppointments(id);
    }
}
