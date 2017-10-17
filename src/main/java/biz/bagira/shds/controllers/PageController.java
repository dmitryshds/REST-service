package biz.bagira.shds.controllers;

import biz.bagira.shds.dao.OrderRepository;
import biz.bagira.shds.dao.RoleRepository;
import biz.bagira.shds.dao.UserRepository;
import biz.bagira.shds.entities.Currency;
import biz.bagira.shds.entities.Order;
import biz.bagira.shds.entities.Status;
import biz.bagira.shds.entities.User;
import biz.bagira.shds.service.SecurityService;
import biz.bagira.shds.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;


@Controller
public class PageController {
    private static Logger logger = LoggerFactory.getLogger(PageController.class);

    @Autowired
    private UserService userService;


    @Autowired
    private SecurityService securityService;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;


    @GetMapping({"/", "/index"})
    public String indexPage() {
        return "/index";
    }


    @RequestMapping("/login")
    public String signInPage() {
        return "/login";
    }


    @GetMapping("/signup")
    public ModelAndView signUpPage() {
        ModelAndView modelAndView = new ModelAndView();
        User user = new User();
        modelAndView.addObject("user", user);
        modelAndView.setViewName("signup");

        return modelAndView;
    }

    @PostMapping("/signup")
    public ModelAndView register(@Valid User user, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        User userExists = userService.findUserByUsername(user.getUsername());
        if (userExists != null) {
            bindingResult.rejectValue("username", "error.user",
                    "Login is busy, please select another");
        }
        if (bindingResult.hasErrors()) {

            modelAndView.setViewName("signup");

        } else {
            userService.saveUser(user);
            modelAndView.setViewName("redirect:/index?msg=You has been registered successfully please Sign in");
        }
        return modelAndView;
    }

    @GetMapping("/403")
    public String error403() {
        return "/403";
    }

    @GetMapping("/user")
    public ModelAndView userPage(Pageable pageable) {
        ModelAndView modelAndView = new ModelAndView();
        User currentUser = userService.findUserByUsername(securityService.findLoggedInUsername());
        Order order = new Order();
        order.setUser(currentUser);
        modelAndView.addObject("order", order);
        modelAndView.addObject("orders", orderRepository.findAllByUserId(currentUser.getId(), pageable));
        modelAndView.setViewName("/user");

        return modelAndView;
    }


    @RequestMapping(path = "/user/create", method = RequestMethod.POST)
    public String addOrder(Order order) {
        order.setOrderDate(LocalDateTime.now());
        order.setStatus(Status.NOT_DONE);
        orderRepository.save(order);
        return "redirect:/user";
    }


    @GetMapping("/admin")
    public ModelAndView adminPage() {
        List<User> all = userRepository.findAll();
        Iterable<Order> orders = orderRepository.findAll();
        ModelAndView model = new ModelAndView();
        model.addObject("users", all);
        model.addObject("orders", orders);
        model.setViewName("/admin");
        return model;
    }

    @GetMapping(value = "/admin/details", params = "id")
    public ModelAndView adminDetails(@RequestParam("id") Long userId, ModelAndView model) {
        User user = userRepository.findOne(userId);
        model.addObject("user", user);
        model.setViewName("/details");
        return model;
    }

    @PostMapping(value = "/admin/{id}/details")
    public ModelAndView editUser(@PathVariable("id") Long userId, @RequestParam("enabled") Boolean enabled, @RequestParam("action") String action, ModelAndView model) {
        User user = userRepository.findOne(userId);
        if ("SUBMIT".equalsIgnoreCase(action)) {

            if (user != null) {
                user.setEnabled(enabled);
                userRepository.save(user);
                model.addObject("user", user);
                model.setViewName("redirect:/admin/details?id=" + userId);
            }
        } else if ("DELETE".equalsIgnoreCase(action)) {

            userRepository.delete(user);
            model.setViewName("redirect:/admin");
        }
        return model;
    }
    @PostMapping(value = "/admin/details/edit")
    public ModelAndView editOrder(@RequestParam("id") Long orderId, @RequestParam("userId") Long userId, @RequestParam("action") String action, @RequestParam("stat") Status status, @RequestParam("note") String note, @RequestParam("price") BigDecimal price, @RequestParam("currency")Currency currency,ModelAndView model) {
        logger.info("Action = "+action);
        if("EDIT".equalsIgnoreCase(action)){
            Order order = orderRepository.findOne(orderId);
            order.setStatus(status);
            order.setNote(note);
            order.setPrice(price);
            order.setCurrency(currency);
            orderRepository.save(order);
            model.setViewName("redirect:/admin/details?id=" + userId);
            return model;
        }
        else if("DELETE".equalsIgnoreCase(action)){
            Order order = orderRepository.findOne(orderId);
            orderRepository.delete(order);
            model.setViewName("redirect:/admin/details?id=" + userId);
        }
        return model;
    }

}
