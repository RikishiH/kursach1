package by.bsuir.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "T_CAR")
public class Car {

    @Id
    @Column(name = "CAR_ID")
    @GeneratedValue(generator = "uuid-generator")
    @GenericGenerator(name = "uuid-generator", strategy = "uuid")
    private String carId;

    @Column(name = "C_BRAND")
    private String brand;

    @Column(name = "C_PRICE")
    private BigDecimal carPrice;

    @Column(name = "C_MOTOR")
    private String carMotor;

    @Column(name = "C_EQUIPMENT")
    private String equipment;

}
