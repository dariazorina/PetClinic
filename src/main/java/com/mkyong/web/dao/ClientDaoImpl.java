package com.mkyong.web.dao;

import com.mkyong.web.model.Appointment;
import com.mkyong.web.model.Client;
import com.mkyong.web.model.Pet;
import com.mkyong.web.model.dto.AppointmentDto;
import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public class ClientDaoImpl implements ClientDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override

    public Client getClient(Integer id) {
        Client client = (Client) getCurrentSession().get(Client.class, id);

        Set<Pet> pets = client.getPets();
        if (client.getPets()!= null) {
            Hibernate.initialize(pets);
            for (Pet pet : client.getPets()) {
                Hibernate.initialize(pet.getAppointments());
                for (Appointment appointment : pet.getAppointments()) {
                    Hibernate.initialize(appointment.getDoctor());    //TODO переделать
                }
            }
        }

        return client;
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

    @Override
    public List<AppointmentDto> getAppointments(Integer clientId) {

        String sql = "SELECT a.id as id, p.name as petName , p.species as species, a.date as date, d.name as doctorName\n " +
//                " " +
                "FROM client c " +
                "LEFT JOIN  pet p ON p.client_id = c.id " +
                "LEFT JOIN appointment a ON p.id = a.pet_id " +
                "LEFT JOIN doctor d ON d.id = a.doctor_id " +
               // "where a.`status` = 'PLANNED';";
                "where c.id = " + clientId + " and a.`status` = 'PLANNED';";


        List<AppointmentDto> appList = getCurrentSession()
                .createSQLQuery(sql)
                .setResultTransformer(Transformers.aliasToBean(AppointmentDto.class))
                .list();


        return appList;
    }

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

}
