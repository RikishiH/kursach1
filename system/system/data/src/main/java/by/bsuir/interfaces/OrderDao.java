package by.bsuir.interfaces;

import by.bsuir.model.Order;
import by.bsuir.model.Status;
import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderDao extends JpaRepository<Order, String> {

  List<Order> findAllByStatus(Status status, Pageable pageable);

  Order findAllByOrderId(String id);

  @Query("select count(o.orderId) from Order o " +
      "where o.status=?1")
  int statusCount(Status status);

  @Query("select o from Order o ")
  List<Order> findAllBy(Pageable pageable);

  @Query("select o from Order o " +
      "where o.person.name like %?1% or " +
      "o.person.middleName like %?1% or " +
      "o.person.secondName like %?1% or " +
      "o.phoneNumber.phoneNumber like %?1% or " +
      "o.product.productName like %?1% or " +
      "o.product.description like %?1% or " +
      "o.car.brand like %?1%")
  List<Order> searchOrder(String searchParam, Pageable pageable);

  @Query("select count(o) from Order o " +
      "where o.person.name like %?1% or " +
      "o.person.middleName like %?1% or " +
      "o.person.secondName like %?1% or " +
      "o.phoneNumber.phoneNumber like %?1% or " +
      "o.product.productName like %?1% or " +
      "o.product.description like %?1% or " +
      "o.car.brand like %?1%")
  int countOrderSearch(String searchParam);

}
