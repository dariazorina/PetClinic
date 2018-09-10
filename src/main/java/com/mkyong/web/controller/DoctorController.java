package com.mkyong.web.controller;

import com.mkyong.web.controller.api.UtilsApi;
import com.mkyong.web.model.Client;
import com.mkyong.web.model.Doctor;
import com.mkyong.web.model.dto.AppointmentDto;
import com.mkyong.web.service.DoctorService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/doctor")
public class DoctorController {

    @Autowired private DoctorService doctorService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list() { //@PathVariable("name") String name) {

        List<Doctor> all = doctorService.getAll();

        ModelAndView model = new ModelAndView();
        model.setViewName("doctors/doctors");
        model.addObject("msg", "TEST_NAME");
        model.addObject("doctorList", all);
        return model;
    }


    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView clientPage(@RequestParam(value = "id", required = false) Integer id) {
        Doctor doctor = doctorService.getById(id);
        List<AppointmentDto> appointments = doctorService.getAppointments(id);

        ModelAndView model = new ModelAndView();
        model.setViewName("doctors/mainPage");
        model.addObject("doctor", doctor);
        model.addObject("appointments", appointments);
        return model;
    }


    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id", required = false) Integer id) {

        Doctor doctor;
        if (id == null) { //add a new doctor
            doctor = new Doctor();

        } else {
            doctor = doctorService.getById(id);
        }

        ModelAndView model = new ModelAndView();
        model.setViewName("doctors/edit");
        model.addObject("doctor", doctor);
        return model;
    }


    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ModelAndView edit(Doctor doctor, HttpServletRequest request, Principal principal) {

        Map<String, String> validationResult = UtilsApi.fieldsValidation(doctor);
        if (validationResult.size() == 0) {
            doctorService.saveOrUpdate(doctor);
//            return new ModelAndView("redirect:/doctor/list");

            if (request.isUserInRole("ROLE_ADMIN")) {
                return new ModelAndView("redirect:/doctor/list");
            } else {
                return new ModelAndView("redirect:../");
            }


        } else {
            ModelAndView modelAndView = new ModelAndView("doctors/edit");

            modelAndView.addObject("errorMessages", validationResult);
            modelAndView.addObject("doctor", doctor);
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
        doctorService.delete(id);
        return "{\"status\":\"ok\"}";
    }
}
