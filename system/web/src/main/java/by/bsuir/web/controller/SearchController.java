package by.bsuir.web.controller;

import by.bsuir.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {

    private String searchValue;

    @Autowired
    SearchService searchService;

    @GetMapping("/order/search")
    public String searchService(
            @RequestParam(name = "searchParam", defaultValue = "") String searchParam,
            @RequestParam(name = "pageNumber", defaultValue = "1") String pageNumber,
            Model model
    ){
        if (!"".equals(searchParam.trim())) {
            searchValue = searchParam;
        } else {
            searchParam = searchValue;
        }

        if (
                searchParam != null
        ) {
            final int countOrderInPage = 5;

            model.addAttribute("orderList", searchService.searchOrder(pageNumber, countOrderInPage, searchParam));

            model.addAttribute("pageCount", searchService.getSearchNumberOfPage(countOrderInPage, searchParam));

            return "order-search-result";
        }

        return "redirect:/";
    }

    @GetMapping("/car/search")
    public String searchOrder(
            @RequestParam(name = "pageNumber", defaultValue = "1") String pageNumber,
            @RequestParam(name = "searchParam", defaultValue = "") String searchParam,
            Model model
    ){
        if (!"".equals(searchParam.trim())) {
            searchValue = searchParam;
        } else {
            searchParam = searchValue;
        }

        if (
                searchParam != null
        ) {
            final int countCarsInPage = 5;

            model.addAttribute("carList", searchService.searchCars(pageNumber, countCarsInPage, searchParam));

            model.addAttribute("pageCount", searchService.getNumberOfPage(countCarsInPage, searchParam));

            return "search-result";
        }


        return "redirect:/";
    }
}
