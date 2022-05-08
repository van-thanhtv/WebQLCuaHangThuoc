package Dao;

import entitys.User;

import java.util.List;

public class UserDao extends AbstractDao<User> implements DaoInterface<User>{

    @Override
    public User findById(Integer id) {
        return super.findById(User.class,id);
    }

    @Override
    public List<User> findAll() {
        return super.finAll(User.class);
    }
    public User findByEmail(String email){
        String jpql = "SELECT o FROM User o Where o.email =?0";
        return super.findOne(User.class,jpql,email);
    }
}
