package entitys;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", length = 50)
    private String name;

    @Column(name = "email", length = 50)
    private String email;

    @Column(name = "password", length = 200)
    private String password;

    @Column(name = "sex")
    private Boolean sex;

    @Column(name = "birthday")
    private LocalDate birthday;

    @Column(name = "sdt", length = 15)
    private String sdt;

    @Column(name = "isAdmin")
    private Integer isAdmin;

    @Column(name = "status")
    private Integer status;

}