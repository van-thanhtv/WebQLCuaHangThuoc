package Dao;

import entitys.Shop;

import java.util.List;

public class ShopDao extends AbstractDao<Shop> implements DaoInterface<Shop>{
    @Override
    public Shop findById(Integer id) {
        return super.findById(Shop.class,id);
    }

    @Override
    public List<Shop> findAll() {
        return super.finAll(Shop.class);
    }
}
