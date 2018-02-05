package com.mkyong.web.controller;

import com.mkyong.web.controller.api.UtilsApi;
import com.mkyong.web.model.Client;
import com.mkyong.web.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
//@SessionAttributes("myRequestObject")
@RequestMapping("/client")
public class ClientController {

    @Autowired
    private ClientService clientService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list() {

        List<Client> all = clientService.getAll();

        ModelAndView model = new ModelAndView();
        model.setViewName("clients/clients");
        model.addObject("clientList", all);
        return model;
    }


    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView clientPage(@RequestParam(value = "id", required = false) Integer id) {
        Client client = clientService.getById(id);

        ModelAndView model = new ModelAndView();
        model.setViewName("clients/mainPage");
        model.addObject("client", client);
        return model;
    }


    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id", required = false) Integer id) {

        Client client;
        if (id == null) { //add a new doctor
            client = new Client();

        } else {
            client = clientService.getById(id);
        }

        ModelAndView model = new ModelAndView();
        model.setViewName("clients/edit");
        model.addObject("client", client);
        return model;
    }


    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ModelAndView edit(Client client) {

        Map<String, String> validationResult = UtilsApi.fieldsValidation(client);
        if (validationResult.size() == 0) {
            clientService.saveOrUpdate(client);
            return new ModelAndView("redirect:/client/list");

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


//
//    @RequestMapping(method = RequestMethod.GET)
//    public @ResponseBody Object read(@RequestParam(value = "id", required = false) Integer id, Model model, HttpServletRequest request, HttpSession session) {
//
//       //-------------------------------------
//        System.out.println("--- Model data ---");
//        Map modelMap = model.asMap();
//        for (Object modelKey : modelMap.keySet()) {
//            Object modelValue = modelMap.get(modelKey);
//            System.out.println(modelKey + " -- " + modelValue);
//        }
//
//        System.out.println("=== Request data ===");
//        java.util.Enumeration<String> reqEnum = request.getAttributeNames();
//        while (reqEnum.hasMoreElements()) {
//            String s = reqEnum.nextElement();
//            System.out.println(s);
//            System.out.println("==" + request.getAttribute(s));
//        }
//
//        System.out.println("*** Session data ***");
//        Enumeration<String> e = session.getAttributeNames();
//        while (e.hasMoreElements()){
//            String s = e.nextElement();
//            System.out.println(s);
//            System.out.println("**" + session.getAttribute(s));
//        }
//
//        System.out.println("SESSION ID  " + session.getId());
//        ///---------------------
//
//        System.out.println("UserController.read");
//        System.out.println("id = [" + id + "]");
//        if (id != null) {
//            return clientService.getById(id);
//        } else {
//            return clientService.getAll();
//        }
//    }
//
//
//    @RequestMapping(method = RequestMethod.POST)
//    public @ResponseBody
//    String update(Client client) {
//        clientService.saveOrUpdate(client);
//        return "{\"status\":\"ok\"}";
//    }
//
//
//    @RequestMapping(method = RequestMethod.PUT)
//    public @ResponseBody
//    Object insert(Client client) {
//        clientService.saveOrUpdate(client);
//
//        Map<String, String> request = new HashMap<String, String>();
//        request.put("status", "ok");
//        return request;
//    }
}