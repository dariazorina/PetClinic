package com.mkyong.web.controller;


import com.mkyong.web.model.Appointment;
import com.mkyong.web.model.Client;
import com.mkyong.web.service.AppointmentService;
import com.mkyong.web.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/appointment")
public class AppointmentController {

    @Autowired
    private AppointmentService appointmentService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list() {

        List<Appointment> all = appointmentService.getAll();

        ModelAndView model = new ModelAndView();
        model.setViewName("appointments/appoinments");
        model.addObject("appointmentList", all);
        return model;
    }
}
