package com.mkyong.web.dao;

import com.mkyong.web.model.SystemUser;

public interface SystemUserDAO {
    SystemUser findByLogin(String login);
}
