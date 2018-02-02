package com.mkyong.web.controller.api;

import com.mkyong.web.controller.BeanTestMotherFuckerController;
import com.mkyong.web.model.Client;
import com.mkyong.web.model.Doctor;
import com.mkyong.web.model.Pet;
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


    public static Map<String, String> fieldsValidation(Pet pet) {

        Map<String, String> validationResult = new HashMap<>();

        if (pet.getName().length() < 2){
            validationResult.put("name", "length of this field should be greater than 4 characters");
        }
        if (pet.getSpecies().length() < 2){
            validationResult.put("species", "length of this field should be greater than 4 characters");
        }

        if (pet.getAge() < 0 || pet.getAge() > 350) {
            validationResult.put("age", "value of this field should be in range from 0 to 150");
        }

        if (pet.getMaster().length() < 3){
            validationResult.put("master", "length of this field should be greater than 6 characters");
        }

        if (pet.getDoctor().length() < 3){
            validationResult.put("doctor", "length of this field should be greater than 6 characters");
        }

        if (pet.getIllness().length() < 3){
            validationResult.put("illness", "length of this field should be greater than 6 characters");
        }

        return validationResult;
    }

}

