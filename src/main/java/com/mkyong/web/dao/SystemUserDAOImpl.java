package com.mkyong.web.dao;

import com.mkyong.web.model.SystemUser;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SystemUserDAOImpl implements SystemUserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public SystemUser findByLogin(String login) {
        return (SystemUser) sessionFactory.getCurrentSession().createCriteria(SystemUser.class)
                .add(Restrictions.eq("login", login)).uniqueResult();
    }
}
