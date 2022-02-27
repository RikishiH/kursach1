package by.bsuir.web.controller;

import by.bsuir.model.Car;
import by.bsuir.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CarController {

    @Autowired
    CarService carService;

    @GetMapping("/cars")
    public String getCars(
            @RequestParam(value = "pageNumber", defaultValue = "1") String pageNumber,
            Model model) {

        int countDocumentInPage = 5;

        model.addAttribute("carList", carService.getAllCars(pageNumber, countDocumentInPage));

        model.addAttribute("pageCount", carService.getNumberOfPage(countDocumentInPage));

        return "redact-car";
    }

    @GetMapping("/car/add")
    public String getAddPage(){
        return "add-car";
    }


    @PostMapping("/car/add")
    public String addCar(
            @ModelAttribute Car car
    ) {

        carService.saveCars(car);

        return "redirect:/";
    }



}
