package Dao;

import entitys.Warehouse;

import java.util.List;

public class warehouseDao extends AbstractDao<Warehouse> implements DaoInterface<Warehouse>{
    @Override
    public Warehouse findById(Integer id) {
        return super.findById(Warehouse.class,id);
    }

    @Override
    public List<Warehouse> findAll() {
        return super.finAll(Warehouse.class);
    }
    public List<Warehouse> findByWarehouseCH(Integer id) {
        return super.findMany(Warehouse.class, "SELECT obj from Warehouse obj where obj.status=1 AND obj.idShop.id= ?0", id);
    }
}
