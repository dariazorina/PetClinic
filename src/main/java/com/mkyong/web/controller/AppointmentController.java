package com.mkyong.web.controller;


import com.mkyong.web.controller.api.UtilsApi;
import com.mkyong.web.model.Appointment;
import com.mkyong.web.model.Client;
import com.mkyong.web.model.Doctor;
import com.mkyong.web.model.Pet;
import com.mkyong.web.service.AppointmentService;
import com.mkyong.web.service.ClientService;
import com.mkyong.web.service.DoctorService;
import com.mkyong.web.service.PetService;
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
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private PetService petService;
    // @Autowired
    //private ClientService clientService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list() {

        List<Appointment> all = appointmentService.getAll();

        ModelAndView model = new ModelAndView();
        model.setViewName("appointments/appointments");
        model.addObject("appointmentList", all);
        return model;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id", required = false) Integer id, @RequestParam(value = "pet_id", required = false) Integer pet_id) {

        Appointment appointment;

        Pet pet = petService.getById(pet_id);
        if (id == null) {
            appointment = new Appointment();
            appointment.setPet(pet);
        } else {
            appointment = appointmentService.getById(id);
        }

        ModelAndView model = new ModelAndView();
        model.setViewName("appointments/edit");
        model.addObject("appointment", appointment);
        model.addObject("doctors", doctorService.getAll());
        model.addObject("pet", pet);
        return model;
    }


    @RequestMapping(value = "/edit", method = RequestMethod.POST)
//    public ModelAndView edit(@RequestParam(value = "client_id", required = false) Integer client_id, @RequestParam(value="pet_id", required=false) Integer pet_id) {
    public ModelAndView edit(Appointment appointment) {

//        Doctor d = doctorService.getById(appointment.getDoctor().getId());
        Pet pet = petService.getById(appointment.getPet().getId());

        Map<String, String> validationResult = UtilsApi.fieldsValidation(appointment);
        if (validationResult.size() == 0) {
            if (appointment.getId() == null) { //this means we want to save a new appointment
                appointment.setStatus("PLANNED");
            }
            appointmentService.saveOrUpdate(appointment);
            return new ModelAndView("redirect:/client?id=" + pet.getMaster().getId()); ///appointment/list");

        } else {
            ModelAndView modelAndView = new ModelAndView("appointments/edit");

            modelAndView.addObject("errorMessages", validationResult);
            modelAndView.addObject("appointment", appointment);
            modelAndView.addObject("doctors", doctorService.getAll());
            modelAndView.addObject("pet", pet);

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
