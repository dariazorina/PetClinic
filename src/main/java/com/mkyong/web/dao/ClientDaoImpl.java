package com.mkyong.web.dao;

import com.mkyong.web.model.Client;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository


public class ClientDaoImpl implements ClientDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Client getClient(Integer id) {
        return (Client) getCurrentSession().get(Client.class, id);
    }

    @Override
    public void addClient(Client client) {
        getCurrentSession().saveOrUpdate(client);
    }

    @Override
    public List<Client> getAllClients() {
        return getCurrentSession().createQuery("from Client").list();
    }

    @Override
    public void removeClient(Integer id) {
        Client client = getClient(id);
        if (client != null) {
            getCurrentSession().delete(client);
        }
    }

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
}
