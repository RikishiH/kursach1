package by.bsuir.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Data
@Entity
@Table(name = "T_ORDER")
@NoArgsConstructor
public class Order {

    @GeneratedValue(generator = "uuid-generator")
    @GenericGenerator(name = "uuid-generator", strategy = "uuid")
    @Id
    @Column(name = "ORDER_ID")
    private String orderId;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "O_PRODUCT")
    private Product product;

    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "O_CAR")
    private Car car;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "O_PERSON")
    private Person person;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "O_PHONE_NUMBER")
    private PhoneNumber phoneNumber;

    @Column(name = "O_STATUS")
    @Enumerated(EnumType.STRING)
    private Status status;

}

