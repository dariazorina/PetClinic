package com.mkyong.web.dao;

import com.mkyong.web.model.Client;
import java.util.List;

public interface ClientDAO {

    Client getClient(Integer id);

    void addClient(Client contact);

    List<Client> getAllClients();

    void removeClient(Integer id);
}
