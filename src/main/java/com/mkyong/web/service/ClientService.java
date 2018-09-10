package com.mkyong.web.service;

import com.mkyong.web.model.Appointment;
import com.mkyong.web.model.Client;
import com.mkyong.web.model.dto.AppointmentDto;

import java.util.List;


public interface ClientService {

    List<Client> getAll();

    Client getById(Integer id);

    void delete(Integer id);

    void saveOrUpdate(Client client);

    List<AppointmentDto> getAppointments(Integer id);
}
