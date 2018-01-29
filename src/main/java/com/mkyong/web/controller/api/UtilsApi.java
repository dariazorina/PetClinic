package com.mkyong.web.controller.api;

import com.mkyong.web.controller.BeanTestMotherFuckerController;
import com.mkyong.web.model.Client;
import com.mkyong.web.model.Doctor;
import com.mkyong.web.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("api/doctor") // /doctors*") ///
public class UtilsApi {

    @Autowired
    private DoctorService doctorService;
    private BeanTestMotherFuckerController test;

    public static Map<String, String> fieldsValidation(Doctor doctor) {

        Map<String, String> validationResult = new HashMap<>();

        if (doctor.getName().length() < 4){
            validationResult.put("name", "length of this field should be greater than 4 characters");
        }
        if (doctor.getSpecialization().length() < 4){
            validationResult.put("specialization", "length of this field should be greater than 4 characters");
        }
        if (doctor.getPhone().length() < 6){
            validationResult.put("phone", "length of this field should be greater than 6 characters");
        }
        if (doctor.getAge() < 0 || doctor.getAge() > 150) {
            validationResult.put("age", "value of this field should be in range from 0 to 150");
        }
        return validationResult;
    }

    public static Map<String, String> fieldsValidation(Client client) {

        Map<String, String> validationResult = new HashMap<>();

        if (client.getName().length() < 2){
            validationResult.put("name", "length of this field should be greater than 4 characters");
        }
        if (client.getAddress().length() < 4){
            validationResult.put("address", "length of this field should be greater than 4 characters");
        }
        if (client.getPhone().length() < 6){
            validationResult.put("phone", "length of this field should be greater than 6 characters");
        }
        return validationResult;
    }


//    //current -- http://localhost:8080/dasha/resources/editDoctor.html?id=1
//
//    //    localhost:8080/dasha/api/doctor?id=5&name=anton
//    @RequestMapping(method = RequestMethod.GET)
//    public @ResponseBody
//    Object get(@RequestParam(value = "id", required = false) Integer id, @RequestParam(value = "name") String name) {
//        System.out.println("id = [" + id + "], name = [" + name + "]");
//
//        if (id == null) {
//            return doctorService.getAll();
//        } else {
//            return doctorService.getById(id);
//        }
//
//    }
//
//    @RequestMapping(method = RequestMethod.POST)
//    public @ResponseBody
//    Object edit(Doctor doctor) {
//
//        if (fieldsValidation(doctor)) {
//
//            doctorService.saveOrUpdate(doctor);
//            System.out.println("POST  " + doctor);
//            return "{\"status\":\"ok\"}";
//
//        } else {
//            return "{\"status\":\"Error\", \"message\":\"Invalid Input Data on Server\"}";
//        }
//    }
//
//    @RequestMapping(method = RequestMethod.DELETE)
//    public @ResponseBody
//    String delete(@RequestParam(value = "id") Integer id) {
//        doctorService.delete(id);
//        return "{\"status\":\"ok\"}";
//    }


}

