package biz.bagira.shds.controllers;

import biz.bagira.shds.dao.OrderRepository;
import biz.bagira.shds.dao.UserRepository;
import biz.bagira.shds.entities.Order;
import biz.bagira.shds.entities.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CRUDController {
    private static Logger logger = LoggerFactory.getLogger(CRUDController.class);

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    UserRepository userRepository;


    @RequestMapping(path = "/user/{userName}/all", method = RequestMethod.GET)
    public Page<Order> getAllorders(@PathVariable("userName") String userName, Pageable pageable) {
        User user = userRepository.findByUsername(userName);
        return orderRepository.findAllByUserId(user.getId(), pageable);
    }

    @RequestMapping(value = "/user/{userName}/allXML", method = RequestMethod.GET, produces={MediaType.APPLICATION_XML_VALUE},headers = "Accept=application/xml")
    public Page<Order> getAllordersByXML(@PathVariable("userName") String userName, Pageable pageable) {
        User user = userRepository.findByUsername(userName);
        return orderRepository.findAllByUserId(user.getId(), pageable);
    }


}
