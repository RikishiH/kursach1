package by.bsuir.model;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Data
@Entity
@Table(name = "T_PHONE_NUMBER")

public class PhoneNumber {

    @GeneratedValue(generator = "uuid-generator")
    @GenericGenerator(name = "uuid-generator", strategy = "uuid")
    @Id
    @Column(name = "PHONE_ID")
    private String phoneId;

    @Column(name = "PH_NUMBER")
    private String phoneNumber;

//    @ManyToMany
//    @JoinTable(name = "T_PRODUCT_PROMO",
//            joinColumns = {@JoinColumn(name = "PROMO_ID")},
//            inverseJoinColumns = {@JoinColumn(name = "PRODUCT_ID")}
//    )
//    private List<Product> products;
}
