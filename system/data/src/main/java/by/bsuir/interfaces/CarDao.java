package by.bsuir.interfaces;

import by.bsuir.model.Car;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CarDao extends JpaRepository<Car, String> {

    List<Car> findAllBy(Pageable pageable);

    @Query("select s from Car s " +
            "where s.brand like %?1%")
    List<Car> searchCar(String searchParam, Pageable pageable);

    @Query("select count(c.carId) from Car c " +
            "where c.carId like %?1%")
    int getCount(String searchParam);

    List<Car> findAllBy();

    @Query("select c.carId from Car c " +
            "where c.brand=?1")
    String getCarId(String name);

}
