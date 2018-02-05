package com.mkyong.web.controller;


import com.mkyong.web.controller.api.UtilsApi;
import com.mkyong.web.model.Appointment;
import com.mkyong.web.service.AppointmentService;
import com.mkyong.web.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/appointment")
public class AppointmentController {

    @Autowired
    private AppointmentService appointmentService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list() {

        List<Appointment> all = appointmentService.getAll();

        ModelAndView model = new ModelAndView();
        model.setViewName("appointments/appointments");
        model.addObject("appointmentList", all);
        return model;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id", required = false) Integer id) {

        Appointment appointment;
        if (id == null) {
            appointment = new Appointment();

        } else {
            appointment = appointmentService.getById(id);
        }

        ModelAndView model = new ModelAndView();
        model.setViewName("appointments/edit");
        model.addObject("appointment", appointment);
        return model;
    }


    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ModelAndView edit(Appointment appointment) {

        Map<String, String> validationResult = UtilsApi.fieldsValidation(appointment);
        if (validationResult.size() == 0) {
            appointmentService.saveOrUpdate(appointment);
            return new ModelAndView("redirect:/appointment/list");

        } else {
            ModelAndView modelAndView = new ModelAndView("appointment/edit");

            modelAndView.addObject("errorMessages", validationResult);
            modelAndView.addObject("appointment", appointment);
            return modelAndView;
        }



        //TODO - what should I return here? when error occurs.
//        return "{\"status\":\"ok\"}";
//        } else {
//            return "{\"status\":\"Error\", \"message\":\"Invalid Input Data on Server\"}";
//        }

    }

    @RequestMapping(method = RequestMethod.DELETE)
    public @ResponseBody
    String delete(@RequestParam(value = "id") Integer id) {
        appointmentService.delete(id);
        return "{\"status\":\"ok\"}";
    }
}
