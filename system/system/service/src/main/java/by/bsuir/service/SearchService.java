package by.bsuir.service;

import by.bsuir.interfaces.OrderDao;
import by.bsuir.interfaces.CarDao;
import by.bsuir.model.Order;
import by.bsuir.model.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchService {

    @Autowired
    CarDao carDao;

    @Autowired
    OrderDao orderDao;

    public List<Car> searchCars(String pageNumber, int countCarInPage, String searchParam) {

        Pageable pageable = PageRequest.of(
                Integer.parseInt(pageNumber) - 1,
                countCarInPage,
                Sort.by("brand")
        );
        return carDao.searchCar(searchParam, pageable);
    }

    public int getNumberOfPage(int countInPage, String searchParam) {
        long count = carDao.getCount(searchParam);

        if (count % countInPage == 0) {
            return (int) Math.floor(count / countInPage);
        } else {
            return (int) (Math.floor(count / countInPage) + 1);
        }

    }

    public List<Order> searchOrder(String pageNumber, int countInPage, String searchParam) {
        Pageable pageable = PageRequest.of(
                Integer.parseInt(pageNumber) - 1,
                countInPage,
                Sort.by("car.brand")
        );
        return orderDao.searchOrder(searchParam, pageable);

    }

    public int getSearchNumberOfPage(int countInPage, String searchParam) {
        int search = orderDao.countOrderSearch(searchParam);

        if (search % countInPage == 0) {
            return (int) Math.floor(search / countInPage);
        } else {
            return (int) (Math.floor(search / countInPage) + 1);
        }

    }
}
