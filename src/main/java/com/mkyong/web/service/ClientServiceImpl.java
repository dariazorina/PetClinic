package com.mkyong.web.service;


import com.mkyong.web.dao.ClientDAO;
import com.mkyong.web.model.Appointment;
import com.mkyong.web.model.Client;
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
public class ClientServiceImpl implements ClientService {

    @Autowired private ClientDAO clientDAO;

    @PostConstruct
    public void init() {
    }

    @Override
    @Transactional
    public List<Client> getAll() {
        //without pets
        return clientDAO.getAllClients();
    }

    @Override
    @Transactional
    public Client getById(Integer id) {
        //with pet
        return clientDAO.getClient(id);
    }

    @Override
    @Transactional
    public void delete(Integer id) {
        clientDAO.removeClient(id);
    }

    @Override
    @Transactional
    public void saveOrUpdate(Client client) {
        clientDAO.addClient(client);
    }

    @Override
    @Transactional
    public List<AppointmentDto> getAppointments(Integer id) {
        return clientDAO.getAppointments(id);
    }
}
