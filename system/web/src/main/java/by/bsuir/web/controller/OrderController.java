package by.bsuir.web.controller;

import by.bsuir.model.Order;
import by.bsuir.service.OrderService;
import by.bsuir.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    CarService carService;

    @GetMapping("/order/add")
    public String showAddOrderPage(
            Model model
    ) {

        model.addAttribute("car", carService.getCars());

        return "add-order";
    }

    @PostMapping("/order/add")
    public String addNewPromo(
            @ModelAttribute Order order
    ) {

        orderService.saveOrder(order);

        return "redirect:/";
    }

    @GetMapping("/worker/order")
    public String showOrder(
            @RequestParam(name = "pageNumber", defaultValue = "1") String pageNumber,
            Model model
    ){

        model.addAttribute("orderList", orderService.getAdoptedOrder(pageNumber));

        model.addAttribute("pageCount", orderService.adoptedPageCount());

        return "adopted-order-show";
    }


    @PostMapping("/worker/accept/{id}")
    public String updateAcceptOrder(
            @PathVariable(name = "id") String id
    ){
        orderService.updateAdoptedStatus(id);
        return "redirect:/worker/order";
    }

    @GetMapping("/order/{id}")
    public String getOrder(
            @PathVariable(name = "id") String id,
            Model model
    ){
        model.addAttribute("order",orderService.getOrder(id));

        return "order";
    }

    @GetMapping("/worker/order/progress")
    public String progressOrder(
            @RequestParam(name = "pageNumber", defaultValue = "1") String pageNumber,
            Model model
    ){
        model.addAttribute("orderList", orderService.getProgressOrder(pageNumber));

        model.addAttribute("pageCount", orderService.progressPageCount());

        return "progress-order-show";
    }

    @PostMapping("/worker/progress/{id}")
    public String updateProgressOrder(
            @PathVariable(name = "id") String id
    ){
        orderService.updateProgressStatus(id);

        return "redirect:/worker/order/progress";
    }

    @GetMapping("/status")
    public String getStatusOrder(
            @RequestParam(name = "pageNumber", defaultValue = "1") String pageNumber,
            Model model
    ){

        model.addAttribute("orderList", orderService.getAllOrder(pageNumber));

        model.addAttribute("pageCount", orderService.statusPageCount());
        return "user-order";
    }

    @GetMapping("/order/payed")
    public String getPayedOrder(
            @RequestParam(name = "pageNumber", defaultValue = "1") String pageNumber,
            Model model
    ){
        model.addAttribute("orderList", orderService.getPayedOrder(pageNumber));

        model.addAttribute("pageCount", orderService.payedPageCount());

        return "payed-order-show";
    }

    @GetMapping("/admin/order")
    public String getAdminOrder(
            @RequestParam(name = "pageNumber", defaultValue = "1") String pageNumber,
            Model model
    ){
        model.addAttribute("orderList", orderService.getAllOrder(pageNumber));

        model.addAttribute("pageCount", orderService.statusPageCount());

        return "order-search-result";
    }

//    @PostMapping("/services/delete/{id}")
//    public String deleteServices(
//            @PathVariable(name = "id") String id
//    ){
//        serviceForServices.deleteService(id);
//        return "redirect:/services";
//    }
}
