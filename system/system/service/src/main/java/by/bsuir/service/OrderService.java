package by.bsuir.service;

import by.bsuir.interfaces.OrderDao;
import by.bsuir.interfaces.CarDao;
import by.bsuir.model.Order;
import by.bsuir.model.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    OrderDao orderDao;

    @Autowired
    CarDao carDao;

    public void saveOrder(Order order) {

        order.getCar().setCarId(
                carDao.getCarId(
                        order.getCar().getBrand()
                )
        );

        order.setStatus(Status.ADOPTED);
        orderDao.save(order);
    }

    public List<Order> getAdoptedOrder(String pageNumber) {

        Pageable pageable = PageRequest.of(
                Integer.parseInt(pageNumber) - 1,
                5
        );

        final List<Order> orders = orderDao.findAllByStatus(Status.ADOPTED, pageable);
        return orders;

    }


    public List<Order> getProgressOrder(String pageNumber) {

        Pageable pageable = PageRequest.of(
                Integer.parseInt(pageNumber) - 1,
                5
        );

        final List<Order> orderList = orderDao.findAllByStatus(Status.PROGRESS, pageable);
        return orderList;

    }

    public void updateAdoptedStatus(String id) {

        final Order order = orderDao.findAllByOrderId(id);
        order.setStatus(Status.PROGRESS);

        orderDao.save(order);
    }

    public Order getOrder(String id) {
        return orderDao.findAllByOrderId(id);
    }

    public int adoptedPageCount() {
        int countInPage = 5;

        int count = orderDao.statusCount(Status.ADOPTED);

        if (count % countInPage == 0) {
            return (int) Math.floor(count / countInPage);
        } else {
            return (int) (Math.floor(count / countInPage) + 1);
        }
    }

    public int progressPageCount() {
        int countInPage = 5;

        int count = orderDao.statusCount(Status.PROGRESS);

        if (count % countInPage == 0) {
            return (int) Math.floor(count / countInPage);
        } else {
            return (int) (Math.floor(count / countInPage) + 1);
        }
    }

    public void updateProgressStatus(String id) {

        Order order = orderDao.findAllByOrderId(id);
        order.setStatus(Status.PAYED);

        orderDao.save(order);
    }

    public List<Order> getAllOrder(String pageNumber) {

        Pageable pageable = PageRequest.of(
                Integer.parseInt(pageNumber) - 1,
                5
        );

        return orderDao.findAllBy(pageable);
    }

    public int statusPageCount() {
        int countInPage = 5;

        int count = (int) orderDao.count();

        if (count % countInPage == 0) {
            return (int) Math.floor(count / countInPage);
        } else {
            return (int) (Math.floor(count / countInPage) + 1);
        }
    }

    public List<Order> getPayedOrder(String pageNumber) {
        Pageable pageable = PageRequest.of(
                Integer.parseInt(pageNumber) - 1,
                5
        );

        final List<Order> orderList = orderDao.findAllByStatus(Status.PAYED, pageable);
        return orderList;
    }

    public int payedPageCount() {
        int countInPage = 5;

        int count = orderDao.statusCount(Status.PAYED);

        if (count % countInPage == 0) {
            return (int) Math.floor(count / countInPage);
        } else {
            return (int) (Math.floor(count / countInPage) + 1);
        }
    }
}
