package by.bsuir.model;

import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Data
@Entity
@Table(name = "T_PERSON")
@NoArgsConstructor
@AllArgsConstructor
public class Person {

    @Id
    @Column(name = "PERSON_ID")
    @GeneratedValue(generator = "uuid-generator")
    @GenericGenerator(name = "uuid-generator", strategy = "uuid")
    private String personId;

    @Column(name = "P_NAME", length = 1000)
    private String name;

    @Column(name = "P_SEC_NAME", length = 1000)
    private String secondName;

    @Column(name = "P_MID_NAME", length = 1000)
    private String middleName;

//    @OneToOne(cascade = CascadeType.ALL)
//    @JoinColumn(name = "P_PHONE_NAME")
//    private PhoneNumber phoneNumber;

//    @Enumerated(EnumType.STRING)
//    private Status status;

//    @ElementCollection
//    @OrderColumn(name = "C_ORDER")
//    private String[] comments;
//
//    @OneToOne
//    @JoinColumn(name = "SHOP_USER_ID")
//    private ShopUser shopUser;

}

//enum Status{
//    NEW, UPDATE, DELETE
//}
