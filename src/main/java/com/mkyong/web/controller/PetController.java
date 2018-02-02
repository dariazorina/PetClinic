package com.mkyong.web.controller;


import com.mkyong.web.controller.api.UtilsApi;
import com.mkyong.web.model.Pet;
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
@RequestMapping("/pet")
public class PetController {

    @Autowired
    private PetService petService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list() { //@PathVariable("name") String name) {

        List<Pet> all = petService.getAll();

        ModelAndView model = new ModelAndView();
        model.setViewName("pets/pets");
        model.addObject("petList", all);
        return model;
    }


    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id", required = false) Integer id) {

        Pet pet;
        if (id == null) {
            pet = new Pet();

        } else {
            pet = petService.getById(id);
        }

        ModelAndView model = new ModelAndView();
        model.setViewName("pets/edit");
        model.addObject("pet", pet);
        return model;
    }


    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ModelAndView edit(Pet pet) {

        Map<String, String> validationResult = UtilsApi.fieldsValidation(pet);
        if (validationResult.size() == 0) {
            petService.saveOrUpdate(pet);
            return new ModelAndView("redirect:/pet/list");

        } else {
            ModelAndView modelAndView = new ModelAndView("pets/edit");

            modelAndView.addObject("errorMessages", validationResult);
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
        petService.delete(id);
        return "{\"status\":\"ok\"}";
    }
}