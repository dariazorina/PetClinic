package com.mkyong.web.model;

import javax.persistence.*;

@javax.persistence.Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "system_user")
public class SystemUser {

    @Id
    @Column(name = "id")
    @GeneratedValue
    protected Integer id;


    private String login;
    private String password;
    private String logo;
    private boolean deleted;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}

