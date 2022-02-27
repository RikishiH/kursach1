package by.bsuir.service;

import by.bsuir.interfaces.OrderDao;
import by.bsuir.interfaces.CarDao;
import by.bsuir.model.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CarService {

    @Autowired
    CarDao carDao;

    @Autowired
    OrderDao orderDao;

    public List<Car> getAllCars(String pageNumber, int countCarsInPage) {

        Pageable pageable = PageRequest.of(
                Integer.parseInt(pageNumber) - 1,
                countCarsInPage,
                Sort.by("brand")
        );

        return carDao.findAllBy(pageable);
    }

    public List<Car> getCars() {

        return carDao.findAllBy();
    }

    public void saveCars(Car car) {

        carDao.save(car);
    }

    public double getNumberOfPage(int countCarInPage) {

        long allCarsCount = carDao.count();

        if (allCarsCount % countCarInPage == 0) {
            return Math.floor(allCarsCount / countCarInPage);
        } else {
            return Math.floor(allCarsCount / countCarInPage) + 1;
        }

    }
}
