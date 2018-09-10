package com.mkyong.web.controller;

import com.mkyong.web.controller.api.UtilsApi;
import com.mkyong.web.model.Client;
import com.mkyong.web.model.CurrentUser;
import com.mkyong.web.model.dto.AppointmentDto;
import com.mkyong.web.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/client")
public class ClientController {

    @Autowired
    private ClientService clientService;

//    @Autowired
//    private PetService petService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list() {

        List<Client> all = clientService.getAll();

        ModelAndView model = new ModelAndView();
        model.setViewName("clients/clients");
        model.addObject("clientList", all);
        return model;
    }


    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView clientPage(@RequestParam(value = "id", required = false) Integer id, Principal principal) {
        Client client = clientService.getById(id);
        List<AppointmentDto> appointments = clientService.getAppointments(id);

        ModelAndView model = new ModelAndView();
        model.setViewName("clients/mainPage");
        model.addObject("client", client);
        model.addObject("appointments", appointments);
        return model;
    }


//    @RequestMapping(value = "/edit", method = RequestMethod.GET)
//    public ModelAndView edit(@RequestParam(value = "id", required = false) Integer id) {
//
//        Client client;
//        if (id == null) {
//            client = new Client();
//
//        } else {
//            client = clientService.getById(id);
//        }
//
//        ModelAndView model = new ModelAndView();
//        model.setViewName("clients/edit");
//        model.addObject("client", client);
//        return model;
//    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)  //for admin and client both
    public ModelAndView adminEdit(@RequestParam(value = "id", required = false) Integer id) {

        ModelAndView model = new ModelAndView();
        Client client;

        if (id == null) {
            client = new Client();

        } else {
            client = clientService.getById(id);
            List<AppointmentDto> appointments = clientService.getAppointments(id);
            model.addObject("appointments", appointments);
        }

        model.setViewName("clients/edit");
        model.addObject("client", client);
        return model;
    }


    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ModelAndView edit(Client client, HttpServletRequest request, Principal principal) {

        UsernamePasswordAuthenticationToken upat = (UsernamePasswordAuthenticationToken) principal;
        CurrentUser currentUser = (CurrentUser) upat.getPrincipal();
        Integer currentUserId = currentUser.getId();
        if (client.getId() != currentUserId) {
            //todo redirect to hell
//            return new ModelAndView("redirect:../");
        }


        Map<String, String> validationResult = UtilsApi.fieldsValidation(client);
        if (validationResult.size() == 0) {
            clientService.saveOrUpdate(client);

//            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//            if (!(auth instanceof AnonymousAuthenticationToken)) {
//                userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//            }

            if (request.isUserInRole("ROLE_ADMIN")) {
                return new ModelAndView("redirect:/client/list");
            } else {
                return new ModelAndView("redirect:../");
            }

        } else {
            ModelAndView modelAndView = new ModelAndView("clients/edit");

            modelAndView.addObject("errorMessages", validationResult);
            modelAndView.addObject("client", client);
            return modelAndView;
        }
    }


    @RequestMapping(method = RequestMethod.DELETE)
    public @ResponseBody
    String delete(@RequestParam(value = "id") Integer id) {
        clientService.delete(id);
        return "{\"status\":\"ok\"}";
    }
}