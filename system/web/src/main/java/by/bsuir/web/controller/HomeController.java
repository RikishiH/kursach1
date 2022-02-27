package by.bsuir.web.controller;

import by.bsuir.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    CarService carService;

    @GetMapping("/")
    public String home(
            @RequestParam(value = "pageNumber", defaultValue = "1") String pageNumber,
            Model model) {

        int countCarInPage = 5;

        model.addAttribute("carList", carService.getAllCars(pageNumber, countCarInPage));

        model.addAttribute("pageCount", carService.getNumberOfPage(countCarInPage));

        return "index";
    }
}
