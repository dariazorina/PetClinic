package com.mkyong.web.service;

import com.mkyong.web.model.Client;

import java.util.List;


public interface ClientService {

    List<Client> getAll();

    Client getById(Integer id);

    void delete(Integer id);

    void saveOrUpdate(Client client);
}
